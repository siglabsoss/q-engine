module crossbar
  #(parameter INPUTS=4,
    parameter OUTPUTS=32,
    parameter IADDR_WIDTH=16,
    parameter OADDR_WIDTH=11,
    parameter DATA_WIDTH=32,
    parameter DMA_OUT_STAGES=1)
   (input wire clk,
    input wire 			   srst,
    //dma input ports
    input wire [IADDR_WIDTH-1:0]   t_addr[INPUTS],
    input wire [DATA_WIDTH-1:0]    t_data[INPUTS],
    input wire 			   t_we[INPUTS],
    input wire 			   t_valid[INPUTS],
    output logic 		   t_ready[INPUTS],
    //dma output ports
    output logic [DATA_WIDTH-1:0]  i_dma_out_data[INPUTS],
    output logic 		   i_dma_out_valid[INPUTS],
    input logic 		   i_dma_out_ready[INPUTS],
    //mem ports
    output logic [OADDR_WIDTH-1:0] i_addr[OUTPUTS],
    output logic [DATA_WIDTH-1:0]  i_data[OUTPUTS],
    output logic 		   i_we[OUTPUTS],
    output logic 		   i_valid[OUTPUTS],
    input wire 			   i_ready[OUTPUTS],
    //mem read data
    input [DATA_WIDTH-1:0] 	   t_mem_data[OUTPUTS],
    input 			   t_mem_valid[OUTPUTS],
    output 			   t_mem_ready
    );
   
   
   //genvar 			   i,j;
   logic [INPUTS-1:0] 		   n_ready_matrix[INPUTS];
   logic 			   n_ready[INPUTS];

   //test logic
   logic [31:0] 		   sel_addr[INPUTS];
   

   /*generate
      for(i=0;i<INPUTS;i++) begin
	 for(j=0;j<INPUTS;j++) begin
	    if(j<i) 
	      assign n_ready_matrix[i][j]=(t_addr[i]==t_addr[j] && t_valid[j])?0:1;
	    else
	      assign n_ready_matrix[i][j]=1;
	 end
	 assign n_ready[i]=&n_ready_matrix[i];
      end
   endgenerate*/

   integer 	ii,jj,i,j;
   
   always_comb begin
      for(i=0;i<INPUTS;i++) begin
	 for(j=0;j<INPUTS;j++) begin
	    if(j<i) 
	      n_ready_matrix[i][j]=(t_addr[i][IADDR_WIDTH-OADDR_WIDTH-1:0]==t_addr[j][IADDR_WIDTH-OADDR_WIDTH-1:0] && t_valid[j])?0:1;
	    else
	      n_ready_matrix[i][j]=1;
	 end
	 n_ready[i]=&n_ready_matrix[i];
      end
      
      for(ii=0;ii<INPUTS;ii++) begin
	 sel_addr[ii]=0;
	 t_ready[ii]=0;
      end
      for(ii=0;ii<OUTPUTS;ii++) begin
	 i_valid[ii]=0;
	 i_addr[ii]=0;
	 i_data[ii]=0;
	 i_we[ii]=0;
      end
      for(ii=0;ii<OUTPUTS;ii++) begin
	 for(jj=0;jj<INPUTS;jj++) begin
	    if(t_addr[jj][IADDR_WIDTH-OADDR_WIDTH-1:0]==ii && n_ready[jj] && t_valid[jj]) begin
	       i_valid[ii]=t_valid[jj];
	       i_addr[ii]=t_addr[jj][IADDR_WIDTH-1:IADDR_WIDTH-OADDR_WIDTH];
	       i_data[ii]=t_data[jj];
	       i_we[ii]=t_we[jj];
	       t_ready[jj]=i_ready[ii];
	       sel_addr[jj]=t_addr[jj][15:5];
	    end
	 end
      end
   end // always_comb


   //dma out mux logic
   logic [IADDR_WIDTH-OADDR_WIDTH-1:0] n_bank[INPUTS][DMA_OUT_STAGES];
   logic [IADDR_WIDTH-OADDR_WIDTH-1:0] q_bank[INPUTS][DMA_OUT_STAGES];
   logic 			       n_bank_valid[INPUTS][DMA_OUT_STAGES];
   logic 			       q_bank_valid[INPUTS][DMA_OUT_STAGES];
   always_comb begin
      for(ii=0;ii<INPUTS;ii++) begin
	 n_bank[ii][0]=(t_valid[ii]&t_ready[ii])?t_addr[ii]:0;
	 n_bank_valid[ii][0]=(t_valid[ii]&t_ready[ii])?1:0;
      end
      
      for(ii=0;ii<INPUTS;ii++) begin
	for(jj=1;jj<DMA_OUT_STAGES;jj++) begin
	   n_bank[ii][jj+1]=q_bank[ii][jj];
	   n_bank_valid[ii][jj+1]=q_bank_valid[ii][jj];
	end
      end

      for(ii=0;ii<INPUTS;ii++) begin
	 i_dma_out_data[ii]=t_mem_data[q_bank[ii][DMA_OUT_STAGES-1]];
	 i_dma_out_valid[ii]=q_bank_valid[ii][DMA_OUT_STAGES-1]&t_mem_valid[q_bank[ii][DMA_OUT_STAGES-1]];
      end
	 
   end // always_comb

   always_ff @(posedge clk) begin
      q_bank<=n_bank;
      q_bank_valid<=n_bank_valid;
   end
endmodule

