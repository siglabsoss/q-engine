module scalar_memory #(
		       parameter AWIDTH = 13,
		       parameter DEPTH = 8192,
		       parameter SCALAR_MEM_0 = "scalar0.mif",
		       parameter SCALAR_MEM_1 = "scalar1.mif",
		       parameter SCALAR_MEM_2 = "scalar2.mif",
		       parameter SCALAR_MEM_3 = "scalar3.mif"

		       ) (
			  input wire 	    clk,
			  input wire 	    srst,
			  input wire 	    t0_valid,
			  output wire 	    t0_ready,
			  input wire 	    t0_we,
			  input wire [3:0]  t0_mask,
			  input wire [31:0] t0_addr,
			  input wire [31:0] t0_data,

			  output reg 	    i0_valid,
			  input wire 	    i0_ready,
			  output wire [31:0] i0_data,

			  input wire 	    t1_valid,
			  output wire 	    t1_ready,
			  input wire 	    t1_we,
			  input wire [3:0]  t1_mask,
			  input wire [31:0] t1_addr,
			  input wire [31:0] t1_data,

			  output reg 	    i1_valid,
			  input wire 	    i1_ready,
			  output wire [31:0] i1_data
			  );
`ifdef VERILATOR_PUBLIC
  reg [7:0] 				      mem0 [DEPTH-1:0] /* synthesis syn_ramstyle = "block_ram" */ /* verilator public */;
  reg [7:0] 				      mem1 [DEPTH-1:0] /* synthesis syn_ramstyle = "block_ram" */ /* verilator public */;
  reg [7:0] 				      mem2 [DEPTH-1:0] /* synthesis syn_ramstyle = "block_ram" */ /* verilator public */;
  reg [7:0] 				      mem3 [DEPTH-1:0] /* synthesis syn_ramstyle = "block_ram" */ /* verilator public */;
`else
   reg [7:0] 				      mem0 [DEPTH-1:0] /* synthesis syn_ramstyle = "block_ram" */;
   reg [7:0] 				      mem1 [DEPTH-1:0] /* synthesis syn_ramstyle = "block_ram" */;
   reg [7:0] 				      mem2 [DEPTH-1:0] /* synthesis syn_ramstyle = "block_ram" */;
   reg [7:0] 				      mem3 [DEPTH-1:0] /* synthesis syn_ramstyle = "block_ram" */;
`endif


`ifdef VERILATE_DEF
function[31:0] get_imem;
   //verilator public
   input [31:0]    index;
   begin
      get_imem = {mem3[index],mem2[index],mem1[index],mem0[index]};
   end
endfunction
`endif




`ifndef NO_SCALAR_MIF
   initial begin
      $readmemh(SCALAR_MEM_0, mem0);
      $readmemh(SCALAR_MEM_1, mem1);
      $readmemh(SCALAR_MEM_2, mem2);
      $readmemh(SCALAR_MEM_3, mem3);
   end
`endif
   // Port 0
   wire [AWIDTH-1:0] t0_addr_word;
   assign t0_ready = 1'b1;
   /* verilator lint_off WIDTH */
   assign t0_addr_word = t0_addr[AWIDTH+2:2];

   reg [7:0] 	     i0_data0;
   reg [7:0] 	     i0_data1;
   reg [7:0] 	     i0_data2;
   reg [7:0] 	     i0_data3;

   wire [7:0] 	     t0_data0;
   wire [7:0] 	     t0_data1;
   wire [7:0] 	     t0_data2;
   wire [7:0] 	     t0_data3;
   
   assign t0_data0 = t0_data[7 : 0];
   assign t0_data1 = t0_data[15: 8];
   assign t0_data2 = t0_data[23:16];
   assign t0_data3 = t0_data[31:24];

`ifdef verilator
   function[31:0] inspect_scalar;
      //verilator public
      input [31:0]    index;
      begin
         inspect_scalar = {mem3[index],mem2[index],mem1[index],mem0[index]};
      end
   endfunction
`endif

   always @(posedge clk) begin
      i0_data0 <= mem0[t0_addr_word];
      if (t0_mask[0] && t0_valid && t0_we) begin
         mem0[t0_addr_word] <= t0_data0;
         i0_data0 <= t0_data0;
      end
   end

   always @(posedge clk) begin
      i0_data1 <= mem1[t0_addr_word];
      if (t0_mask[1] && t0_valid && t0_we) begin
         mem1[t0_addr_word] <= t0_data1;
         i0_data1 <= t0_data1;
      end
   end

   always @(posedge clk) begin
      i0_data2 <= mem2[t0_addr_word];
      if (t0_mask[2] && t0_valid && t0_we) begin
         mem2[t0_addr_word] <= t0_data2;
         i0_data2 <= t0_data2;
      end
   end

   always @(posedge clk) begin
      i0_data3 <= mem3[t0_addr_word];
      if (t0_mask[3] && t0_valid && t0_we) begin
         mem3[t0_addr_word] <= t0_data3;
         i0_data3 <= t0_data3;
      end
   end

   always @(posedge clk) i0_valid <= ~t0_we && t0_valid;

   assign i0_data = {
		     i0_data3,
		     i0_data2,
		     i0_data1,
		     i0_data0
		     };

   // Port 1

   wire [AWIDTH-1:0] t1_addr_word;
   assign t1_ready = 1'b1;
   assign t1_addr_word = t1_addr[AWIDTH+1:2];

   reg [7:0] 	     i1_data0;
   reg [7:0] 	     i1_data1;
   reg [7:0] 	     i1_data2;
   reg [7:0] 	     i1_data3;

   wire [7:0] 	     t1_data0;
   wire [7:0] 	      t1_data1;
   wire [7:0] 	      t1_data2;
   wire [7:0] 	      t1_data3;

   assign t1_data0 = t1_data[7 : 0];
   assign t1_data1 = t1_data[15: 8];
   assign t1_data2 = t1_data[23:16];
   assign t1_data3 = t1_data[31:24];



   always @(posedge clk) begin
      i1_data0 <= mem0[t1_addr_word];
      if (t1_mask[0] && t1_valid && t1_we) begin
         mem0[t1_addr_word] <= t1_data0;
         i1_data0 <= t1_data0;
      end
   end

   always @(posedge clk) begin
      i1_data1 <= mem1[t1_addr_word];
      if (t1_mask[1] && t1_valid && t1_we) begin
         mem1[t1_addr_word] <= t1_data1;
         i1_data1 <= t1_data1;
      end
   end

   always @(posedge clk) begin
      i1_data2 <= mem2[t1_addr_word];
      if (t1_mask[2] && t1_valid && t1_we) begin
         mem2[t1_addr_word] <= t1_data2;
         i1_data2 <= t1_data2;
      end
   end

   always @(posedge clk) begin
      i1_data3 <= mem3[t1_addr_word];
      if (t1_mask[3] && t1_valid && t1_we) begin
         mem3[t1_addr_word] <= t1_data3;
         i1_data3 <= t1_data3;
      end
   end

   reg i1_mem_valid;

   always @(posedge clk) i1_valid <= ~t1_we && t1_valid;
   
   assign i1_data = {i1_data3,
		     i1_data2,
		     i1_data1,
		     i1_data0
		     };

endmodule
