<% const range = require('lodash.range'); %>
  module vmem_dat_${local[0]}_${local[1]}
    #(parameter VMEM_SIZE = 4096,
      parameter VMEM0 = "vmem0.mif",
    parameter VMEM1 = "vmem1.mif",
    parameter VMEM2 = "vmem2.mif",
    parameter VMEM3 = "vmem3.mif",
    parameter VMEM4 = "vmem4.mif",
    parameter VMEM5 = "vmem5.mif",
    parameter VMEM6 = "vmem6.mif",
    parameter VMEM7 = "vmem7.mif",
    parameter VMEM8 = "vmem8.mif",
    parameter VMEM9 = "vmem9.mif",
    parameter VMEM10 = "vmem10.mif",
    parameter VMEM11 = "vmem11.mif",
    parameter VMEM12 = "vmem12.mif",
    parameter VMEM13 = "vmem13.mif",
    parameter VMEM14 = "vmem14.mif",
    parameter VMEM15 = "vmem15.mif",
    parameter VMEM16 = "vmem16.mif",
    parameter VMEM17 = "vmem17.mif",
    parameter VMEM18 = "vmem18.mif",
    parameter VMEM19 = "vmem19.mif",
    parameter VMEM20 = "vmem20.mif",
    parameter VMEM21 = "vmem21.mif",
    parameter VMEM22 = "vmem22.mif",
    parameter VMEM23 = "vmem23.mif",
    parameter VMEM24 = "vmem24.mif",
    parameter VMEM25 = "vmem25.mif",
    parameter VMEM26 = "vmem26.mif",
    parameter VMEM27 = "vmem27.mif",
    parameter VMEM28 = "vmem28.mif",
    parameter VMEM29 = "vmem29.mif",
    parameter VMEM30 = "vmem30.mif",
    parameter VMEM31 = "vmem31.mif"
      )

  (input wire [<%= (iAddrWidth + dataWidth) + 1 -1  %>:0]    t_idma_0_dat,
   input wire [<%= (iAddrWidth + dataWidth) + 1 -1 %>:0]   t_idma_1_dat,
   input wire [<%= (iAddrWidth + dataWidth) + 1 -1 %>:0]   t_idma_2_dat,
   input wire [<%= (iAddrWidth + dataWidth) + 1 -1 %>:0]   t_idma_3_dat,

   input wire [<%= inputs-1 %>:0]                          idma_valid,
   output reg [<%= inputs-1 %>:0]                          idma_ready,

   output wire [<%= dataWidth - 1 %>:0]                    i_odma_0_dat,
   output wire [<%= dataWidth - 1 %>:0]                    i_odma_1_dat,
   output wire [<%= dataWidth - 1 %>:0]                    i_odma_2_dat,
   output wire [<%= dataWidth - 1 %>:0]                    i_odma_3_dat,

   output reg [<%= inputs-1 %>:0]                          odma_valid,
   input wire [<%= inputs-1 %>:0]                          odma_ready,


   input wire [<%= slices*dataWidth - 1 %>:0]              t_ivs_dat,

   input wire [<%= law.selin + slices * law.baddr -1 %>:0] t_ka_dat,
   //exports
   input wire                                              tvs_valid,
   output wire                                             tvs_ready,

   output wire [<%= slices*dataWidth - 1 %>:0]             i_ovs_dat,
   //exports
   output wire                                             ivs_valid,
   input wire                                              ivs_ready,

   output wire [<%= law.selin -1 %>:0]                     k_ctrl,

   input wire                                              clk, reset_n
   );


   reg [<%= oAddrWidth - 1 %>:0]              n_mem_payload_addr[<%= slices - 1%>: 0];
   reg [<%= dataWidth - 1 %>:0]               n_mem_payload_data[<%= slices - 1%>: 0];
   reg                                        n_mem_payload_we[<%= slices - 1 %>:0];
   reg                                        n_mem_valid[<%= slices -1%>:0];

   reg [<%= oAddrWidth - 1 %>:0]              q_mem_payload_addr[<%= slices - 1%>: 0];
   reg [<%= dataWidth - 1 %>:0]               q_mem_payload_data[<%= slices - 1%>: 0];
   reg                                        q_mem_payload_we[<%= slices - 1 %>:0];
   reg                                        q_mem_valid[<%= slices -1%>:0];
   wire                                       q_mem_ready[<%= slices -1%>:0];
   
   wire [<%= oAddrWidth - 1 %>:0]              t_mem_payload_addr[<%= slices - 1 %>:0];
   wire [<%= dataWidth - 1 %>:0]               t_mem_payload_data[<%= slices - 1 %>:0];
   wire                                        t_mem_valid[<%= slices -1%>:0];
   wire                                                t_mem_ready[<%= slices -1%>:0];


   reg [<%=inputs-1%>:0]                 n_ready_matrix[<%= inputs -1%>:0];
   reg                                   n_ready[<%= inputs -1%>:0];
   reg [<%=inputs-1%>:0]                 q_ready_matrix[<%= inputs -1%>:0];
   reg                                   q_ready[<%= inputs -1%>:0];

   reg [31:0]                                 ii,jj,i,j;

   wire [<%= dataWidth - 1 %>:0] idma_data[<%= inputs-1 %>:0];
   wire [<%= iAddrWidth - 1 %>:0] idma_addr[<%= inputs-1 %>:0];
   wire                           idma_we[<%= inputs-1 %>:0];
   reg [<%= dataWidth - 1 %>:0] q_idma_data[<%= inputs-1 %>:0];
   reg [<%= iAddrWidth - 1 %>:0] q_idma_addr[<%= inputs-1 %>:0];
   reg                           q_idma_we[<%= inputs-1 %>:0];
   reg                           q_idma_valid[<%= inputs-1 %>:0];
   
   reg [<%= dataWidth - 1 %>:0] odma_dat[<%= inputs-1 %>:0];


   <% range(inputs).map(e => { %>
   assign idma_addr[<%= e %>]=t_idma_<%= e %>_dat[<%= (iAddrWidth + dataWidth) -1 %>:<%= dataWidth %>];
   assign idma_data[<%= e %>]=t_idma_<%= e %>_dat[<%= dataWidth -1 %>:0];
   assign idma_we[<%= e %>]=t_idma_<%= e %>_dat[<%= (iAddrWidth + dataWidth) %>];

   assign i_odma_<%= e %>_dat=odma_dat[<%= e %>]; <% }) %>

   always @(posedge clk) begin
      for(i=0;i<<%= inputs %>;i = i + 1) begin
         q_idma_addr[i]<=idma_addr[i];
         q_idma_data[i]<=idma_data[i];
         q_idma_we[i]<=idma_we[i];
         q_idma_valid[i]<=idma_valid[i];
         q_ready_matrix[i]<=n_ready_matrix[i];
         q_ready[i]<=n_ready[i];
      end
   end

   always @(posedge clk) begin
            for(j=0;j<<%= slices %>;j = j + 1) begin
         q_mem_valid[j]<=n_mem_valid[j];
         q_mem_payload_addr[j]<=n_mem_payload_addr[j];
         q_mem_payload_data[j]<=n_mem_payload_data[j];
         q_mem_payload_we[j]<=n_mem_payload_we[j];
      end
   end

   always @(*) begin
      for(i=0;i<<%= inputs %>;i = i + 1) begin
         for(j=0;j<<%= inputs %>;j = j + 1) begin
            if(j<i)
              n_ready_matrix[i][j]=(idma_addr[i][<%= iAddrWidth - oAddrWidth %>-1:0]==idma_addr[j][<%= iAddrWidth - oAddrWidth -1 %>:0] && idma_valid[j])?0:1;
            else
              n_ready_matrix[i][j]=1;
         end
         n_ready[i]=&n_ready_matrix[i];
      end

      for(ii=0;ii<<%= inputs %>;ii= ii + 1) begin
         idma_ready[ii]=n_ready[ii];//0;
      end
      for(ii=0;ii<<%= slices %>;ii= ii + 1) begin
         n_mem_valid[ii]=0;
         n_mem_payload_addr[ii]=0;
         n_mem_payload_data[ii]=0;
         n_mem_payload_we[ii]=0;
      end
      for(ii=0;ii<<%= slices %>;ii= ii + 1) begin
         for(jj=0;jj<<%= inputs %>;jj = jj + 1) begin
            if(q_idma_addr[jj][<%= iAddrWidth - oAddrWidth %>-1:0]==ii && q_ready[jj] && q_idma_valid[jj]) begin
               n_mem_valid[ii]=q_idma_valid[jj];
               n_mem_payload_addr[ii]=q_idma_addr[jj][<%= iAddrWidth - 1%>:<%= iAddrWidth - oAddrWidth %>];
               n_mem_payload_data[ii]=q_idma_data[jj];
               n_mem_payload_we[ii]=q_idma_we[jj];
//               idma_ready[jj]=i_mem_ready[ii];
            end
//            if(n_ready[jj])
         end
      end
   end // always_comb


   //dma out mux logic
   reg [<%= iAddrWidth - oAddrWidth -1 %>:0] n_bank[<%= inputs-1 %>:0][<%= dmaOutStages-1 %>:0];
   reg [<%= iAddrWidth - oAddrWidth -1 %>:0] q_bank[<%= inputs-1 %>:0][<%= dmaOutStages-1 %>:0];
   reg                                       n_bank_valid[<%= inputs-1 %>:0][<%= dmaOutStages-1 %>:0];
   reg                                       q_bank_valid[<%= inputs-1 %>:0][<%= dmaOutStages-1 %>:0];

   reg [<%= iAddrWidth - oAddrWidth -1 %>:0] n_bank_quarter[<%= inputs-1 %>:0];
   reg [<%= iAddrWidth - oAddrWidth -1 %>:0] q_bank_quarter[<%= inputs-1 %>:0];
   reg [<%= dataWidth - 1 %>:0]              n_odma_dat_quarter[3:0][<%=inputs-1 %>:0];
   reg [<%= dataWidth - 1 %>:0]              q_odma_dat_quarter[3:0][<%=inputs-1 %>:0];
   reg                                       n_odma_valid_quarter[3:0][<%=inputs-1 %>:0];
   reg                                       q_odma_valid_quarter[3:0][<%=inputs-1 %>:0];

   reg [<%= iAddrWidth - oAddrWidth -1 %>:0] n_bank_half[<%= inputs-1 %>:0];
   reg [<%= iAddrWidth - oAddrWidth -1 %>:0] q_bank_half[<%= inputs-1 %>:0];
   reg [<%= dataWidth - 1 %>:0]              n_odma_dat_half[1:0][<%=inputs-1 %>:0];
   reg [<%= dataWidth - 1 %>:0]              q_odma_dat_half[1:0][<%=inputs-1 %>:0];
   reg                                       n_odma_valid_half[1:0][<%=inputs-1 %>:0];
   reg                                       q_odma_valid_half[1:0][<%=inputs-1 %>:0];
   
   always @(*) begin
      for(ii=0;ii<<%= inputs %>;ii = ii + 1) begin
         n_bank[ii][0]=(q_idma_valid[ii]&q_ready[ii])?q_idma_addr[ii]:0;
         n_bank_valid[ii][0]=(q_idma_valid[ii]&q_ready[ii])?1:0;
      end

      /* verilator lint_off UNSIGNED */
      for(ii=0;ii<<%= inputs %>;ii = ii + 1) begin
         for(jj=0;jj<<%= dmaOutStages-1 %>;jj = jj + 1) begin
            n_bank[ii][jj+1]=q_bank[ii][jj];
            n_bank_valid[ii][jj+1]=q_bank_valid[ii][jj];
         end
      end
      /* verilator lint_on UNSIGNED */
      for(jj=0;jj<4;jj = jj + 1) begin
         for(ii=0;ii<<%= inputs %>;ii = ii + 1) begin
            n_odma_dat_quarter[jj][ii]=t_mem_payload_data[{jj[1:0],q_bank[ii][<%= dmaOutStages -1%>][1:0]}];
            n_odma_valid_quarter[jj][ii]=q_bank_valid[ii][<%= dmaOutStages -1%>]&t_mem_valid[{jj[1:0],q_bank[ii][<%= dmaOutStages -1%>][1:0]}];
         end
      end

      for(ii=0;ii<<%= inputs %>;ii = ii + 1) begin
         n_bank_quarter[ii]=q_bank[ii][<%= dmaOutStages -1 %>];
      end

      for(ii=0;ii<<%= inputs %>;ii = ii + 1) begin      
         n_odma_dat_half[0][ii]=(~q_bank_quarter[ii][2] & q_odma_valid_quarter[0][ii])?q_odma_dat_quarter[0][ii]:q_odma_dat_quarter[1][ii];
         n_odma_valid_half[0][ii]=(~q_bank_quarter[ii][2] & q_odma_valid_quarter[0][ii])|(q_bank_quarter[ii][2] & q_odma_valid_quarter[1][ii]);

         n_odma_dat_half[1][ii]=(~q_bank_quarter[ii][2] & q_odma_valid_quarter[2][ii])?q_odma_dat_quarter[2][ii]:q_odma_dat_quarter[3][ii];
         n_odma_valid_half[1][ii]=(~q_bank_quarter[ii][2] & q_odma_valid_quarter[2][ii])|(q_bank_quarter[ii][2] & q_odma_valid_quarter[3][ii]);
      end

      for(ii=0;ii<<%= inputs %>;ii = ii + 1) begin
         n_bank_half[ii]=q_bank_quarter[ii];
      end

      for(ii=0;ii<<%= inputs %>;ii = ii + 1) begin
         odma_dat[ii]=(~q_bank_half[ii][3] & q_odma_valid_half[0][ii])?q_odma_dat_half[0][ii]:q_odma_dat_half[1][ii];
         odma_valid[ii]=(~q_bank_half[ii][3] & q_odma_valid_half[0][ii])|(q_bank_half[ii][3] & q_odma_valid_half[1][ii]);
      end
   end // always_comb

   always @(posedge clk) begin
      for(ii=0;ii<<%= inputs %>;ii = ii + 1) begin
         q_odma_dat_half[0][ii]<=n_odma_dat_half[0][ii];
         q_odma_valid_half[0][ii]<=n_odma_valid_half[0][ii];
         q_odma_dat_half[1][ii]<=n_odma_dat_half[1][ii];
         q_odma_valid_half[1][ii]<=n_odma_valid_half[1][ii];
         q_odma_dat_quarter[0][ii]<=n_odma_dat_quarter[0][ii];
         q_odma_valid_quarter[0][ii]<=n_odma_valid_quarter[0][ii];
         q_odma_dat_quarter[1][ii]<=n_odma_dat_quarter[1][ii];
         q_odma_valid_quarter[1][ii]<=n_odma_valid_quarter[1][ii];
         q_odma_dat_quarter[2][ii]<=n_odma_dat_quarter[2][ii];
         q_odma_valid_quarter[2][ii]<=n_odma_valid_quarter[2][ii];
         q_odma_dat_quarter[3][ii]<=n_odma_dat_quarter[3][ii];
         q_odma_valid_quarter[3][ii]<=n_odma_valid_quarter[3][ii];
         q_bank_quarter[ii]<=n_bank_quarter[ii];
         q_bank_half[ii]<=n_bank_half[ii];
    for(jj=0;jj<<%= dmaOutStages %>;jj = jj + 1) begin
       q_bank[ii][jj]<=n_bank[ii][jj];
       q_bank_valid[ii][jj]<=n_bank_valid[ii][jj];
    end
      end
   end

   wire [<%= law.baddr-1 %>:0] t_vs_payload_addr[<%= slices-1 %>:0];
   wire [<%= law.baddr-1 %>:0] i_vs_payload_addr[<%= slices-1 %>:0];
   wire [<%= dataWidth-1 %>:0] t_vs_payload_data[<%= slices-1 %>:0];
   wire [<%= dataWidth-1 %>:0] i_vs_payload_data[<%= slices-1 %>:0];
   wire vs_we;
   wire [<%= law.selin -1 %>:0] s_k;

   assign s_k=t_ka_dat[<%= law.selin + slices * law.baddr -1 %>:<%= slices * law.baddr %>];
   assign vs_we=(tvs_valid && s_k<8)?1:0;
   <% range(slices).map(e => { %>
   assign t_vs_payload_addr[<%= e %>]=t_ka_dat[<%= ((e+1) * (law.baddr)) -1 %>:<%= e * law.baddr %>];
   assign t_vs_payload_data[<%= e %>]=t_ivs_dat[<%= ((e+1) * dataWidth) -1 %>:<%= e * dataWidth %>];
   <% }) %>
   assign k_ctrl=s_k;

//[<%= (slices * dataWidth) -1 %>:0];

   <% range(slices).map(e => { %>
memory_slice
#(.MEMINIT(VMEM<%= e %>))
mem_slice_<%= e %>
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[<%= e %>]),
 .t0_data(t_vs_payload_data[<%= e %>]),
 .t0_we(vs_we),//[<%= e %>]),
 .t0_valid(tvs_valid),
 <% if(e==0) { %>
 .t0_ready(tvs_ready),
      <% } else { %>
 .t0_ready(),
  <% } %>

 .i0_addr(i_vs_payload_addr[<%= e %>]),
 .i0_data(i_ovs_dat[<%= (e+1)*dataWidth-1 %>:<%= e*dataWidth %>]),
 <% if(e==0) { %>
 .i0_valid(ivs_valid),
      <% } else { %>
 .i0_valid(),
  <% } %>

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[<%= e %>]),
 .t1_data(q_mem_payload_data[<%= e %>]),
 .t1_we(q_mem_payload_we[<%= e %>]),
 .t1_valid(q_mem_valid[<%= e %>]),
 .t1_ready(q_mem_ready[<%= e %>]),
 .i1_addr(t_mem_payload_addr[<%= e %>]),
 .i1_data(t_mem_payload_data[<%= e %>]),
 .i1_valid(t_mem_valid[<%= e %>]),
 .i1_ready(1'b1)//t_mem_ready[<%= e %>])
 );
 <% }) %>


endmodule
