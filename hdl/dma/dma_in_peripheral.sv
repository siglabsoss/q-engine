module dma_in_peripheral
  #(
    parameter addrWidth = 32,
    parameter dataWidth = 32
    )
  (
   input 			clk,
   input 			srst,
   input [addrWidth-1:0] 	paddr,
   input 			pwrite,
   input 			psel,
   input 			penable,
   input [dataWidth-1:0] 	pwdata,
   output logic [dataWidth-1:0] prdata,
   output logic 		pready,
   output logic 		pslverr,
   input [31:0] 		ctimer,
   //t0 stream
   input [31:0] 		t0_data,
   input 			t0_valid,
   output 			t0_ready,
   //mem port
   output logic [31:0] 		i0_addr,
   output logic [31:0] 		i0_data,
   output 			i0_valid,
   input 			i0_ready,
   output wire 			strobe_complete
   );

  logic [dataWidth-1:0] 	mem [256];

  logic [1:0] 			apb_st;
  const logic [1:0] 		SETUP = 0;
  const logic [1:0] 		W_ENABLE = 1;
  const logic [1:0] 		R_ENABLE = 2;

  const bit [31:0] 		C_TIMER_INIT_ADDR=0;
  const bit [31:0] 		C_START_ADDR_ADDR=1;
  const bit [31:0] 		C_LENGTH_ADDR=2;
  
  logic [31:0] 			q_timer_init_reg;
  logic [31:0] 			q_start_addr_reg;
  logic [31:0] 			q_length_reg;
  wire 				s_busy;
  wire 				s_strobe_complete;

   assign strobe_complete=s_strobe_complete;

  dma_in dma_in_inst
    (.clk(clk),
     .srst(srst),
     .ctimer(ctimer),
     .timer_init(q_timer_init_reg & ~s_strobe_complete),
     .start_addr(q_start_addr_reg),
     .length(q_length_reg),
     .busy(s_busy),
     .strobe_complete(s_strobe_complete),
     //t0 stream
     .t0_data(t0_data),
     .t0_valid(t0_valid),
     .t0_ready(t0_ready),
     //mem port
     .i0_addr(i0_addr),
     .i0_data(i0_data),
     .i0_valid(i0_valid),
     .i0_ready(i0_ready)
     );
  

  // SETUP -> ENABLE
  always @(posedge clk) begin
    if (srst) begin
      apb_st <= 0;
      prdata <= 0;
      pready <= 0;
      q_timer_init_reg <= 0;
    end
    else begin
      pready<=0;
      q_timer_init_reg <= (s_strobe_complete) ? 0 : q_timer_init_reg;
      case (apb_st)
	SETUP : begin
          // clear the prdata
          prdata <= 0;

          // Move to ENABLE when the psel is asserted
          if (psel && !penable) begin
	    if (pwrite) begin
	      apb_st <= W_ENABLE;
	    end

	    else begin
	      apb_st <= R_ENABLE;
	    end
          end
	end

	W_ENABLE : begin
          // write pwdata to memory
          if (psel && penable && pwrite) begin //&& paddr<256) begin
	    q_timer_init_reg<=(paddr[7:0]==C_TIMER_INIT_ADDR)?pwdata:q_timer_init_reg;
	    q_start_addr_reg<=(paddr[7:0]==C_START_ADDR_ADDR)?pwdata:q_start_addr_reg;
	    q_length_reg<=(paddr[7:0]==C_LENGTH_ADDR)?pwdata:q_length_reg;
	    pready<=1;
          end
	  // return to SETUP
	  apb_st <= SETUP;
	end

	R_ENABLE : begin
	  // read prdata from memory
	  if (psel && penable && !pwrite) begin
	    prdata <= (paddr[7:0]==C_TIMER_INIT_ADDR)?q_timer_init_reg:
		      (paddr[7:0]==C_START_ADDR_ADDR)?q_start_addr_reg:
		      (paddr[7:0]==C_LENGTH_ADDR)?q_length_reg:'hDEADBEEF;
	    
	    pready<=1;
	    pslverr<= (paddr==C_TIMER_INIT_ADDR)?0:
		      (paddr==C_START_ADDR_ADDR)?0:
		      (paddr==C_LENGTH_ADDR)?0:1;
	  end
	  
	  // return to SETUP
	  apb_st <= SETUP;
	end
      endcase
    end
  end 


endmodule
