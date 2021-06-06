module interrupt_controller
  #(
    addrWidth = 32,
    dataWidth = 32
    )
   (
    input 	      clk,
    input 	      srst,

    //CSR
    input [31:0]      interrupt_mask,
    input 	      interrupt_clear,
    output [31:0]     interrupt_interruptVector,
    output [31:0]     interrupt_serviceInterrupt,
    
    input wire [31:0] interrupt_vector,
    output wire       proc_interrupt
    );


   const bit [7:0] 		 INTERRUPT_VECTOR_ADDR='h0;
   const bit [7:0] 		 CLEAR_INTERRUPT_ADDR='h1;
   const bit [7:0] 		 SERVICE_INTERRUPT_ADDR='h2;

   logic 			 q_proc_interrupt,n_proc_interrupt;
   logic [31:0] 		 q_interrupt_vector,n_interrupt_vector;
   logic 			 q_clear_flag,n_clear_flag;
   logic [31:0]			 q_service_interrupt,n_service_interrupt;
   logic 			 q_proc_interrupt_pulse,n_proc_interrupt_pulse;
   logic [7:0] 			 q_pulse_cnt,n_pulse_cnt;
   
   integer 			 i,j;
   
   logic [1:0] 			 apb_st;
   const logic [1:0] 		 SETUP = 0;
   const logic [1:0] 		 W_ENABLE = 1;
   const logic [1:0] 		 R_ENABLE = 2;
   logic [31:0] 			 n_calc_mask;
   logic [31:0] 			 n_calc_mask_matrix[32];

   assign proc_interrupt=q_proc_interrupt_pulse;
   genvar 			 ii,jj;

   //assign s_calc_mask[0]=q_interrupt_vector[0];
/*   generate
      for(ii=0;ii<32;i++) begin
	 for(jj=0;jj<32;jj++) begin
	 assign s_calc_mask[ii]=&s_cal_mask
      end
   endgenerate*/

   assign interrupt_interruptVector=q_interrupt_vector;
   assign interrupt_serviceInterrupt=q_service_interrupt;
   
   always_comb begin

   	for(i=0;i<32;i++) begin
   		for(j=0;j<32;j++) begin
   			if(j<i)
   				n_calc_mask_matrix[i][j]=!q_interrupt_vector[j];
   			else
   				n_calc_mask_matrix[i][j]=q_interrupt_vector[i];
   		end
   		n_calc_mask[i]=&n_calc_mask_matrix[i];
      end
      
      n_interrupt_vector=interrupt_clear?interrupt_mask&((q_interrupt_vector|interrupt_vector)^q_service_interrupt):interrupt_mask&(q_interrupt_vector|interrupt_vector);
      n_proc_interrupt=interrupt_clear?0:(|q_service_interrupt);
      if(q_service_interrupt==0) begin
	 n_service_interrupt=n_calc_mask&q_interrupt_vector;
	 /*for(i=1;i<32;i++) 
	    n_service_interrupt[i]=!(|q_interrupt_vector[i-1:0]);*/
      end
      else
	n_service_interrupt=interrupt_clear?0:q_service_interrupt;
      n_proc_interrupt_pulse=(q_proc_interrupt==0 && n_proc_interrupt==1)?1:
			     (q_pulse_cnt<6 && q_proc_interrupt)?1:0;
      n_pulse_cnt=interrupt_clear?0:
	    q_proc_interrupt_pulse?q_pulse_cnt+1:
	    q_pulse_cnt;
      
   end

   
   always_ff @(posedge clk) begin
      if(srst) begin
	 q_interrupt_vector<=0;
	 q_proc_interrupt<=0;
	 q_service_interrupt<=0;
	 q_proc_interrupt_pulse<=0;
	 q_pulse_cnt<=0;
      end
      else begin
	 q_interrupt_vector<=n_interrupt_vector;
	 q_proc_interrupt<=n_proc_interrupt;
	 q_service_interrupt<=n_service_interrupt;
   q_proc_interrupt_pulse<=n_proc_interrupt_pulse;
	 q_pulse_cnt<=n_pulse_cnt;
      end
   end
   



endmodule

