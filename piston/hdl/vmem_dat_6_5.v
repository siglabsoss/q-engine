
  module vmem_dat_6_5
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

  (input wire [48:0]    t_idma_0_dat,
   input wire [48:0]   t_idma_1_dat,
   input wire [48:0]   t_idma_2_dat,
   input wire [48:0]   t_idma_3_dat,

   input wire [3:0]                          idma_valid,
   output reg [3:0]                          idma_ready,

   output wire [31:0]                    i_odma_0_dat,
   output wire [31:0]                    i_odma_1_dat,
   output wire [31:0]                    i_odma_2_dat,
   output wire [31:0]                    i_odma_3_dat,

   output reg [3:0]                          odma_valid,
   input wire [3:0]                          odma_ready,


   input wire [511:0]              t_ivs_dat,

   input wire [195:0] t_ka_dat,
   //exports
   input wire                                              tvs_valid,
   output wire                                             tvs_ready,

   output wire [511:0]             i_ovs_dat,
   //exports
   output wire                                             ivs_valid,
   input wire                                              ivs_ready,

   output wire [3:0]                     k_ctrl,

   input wire                                              clk, reset_n
   );


   reg [11:0]              n_mem_payload_addr[15: 0];
   reg [31:0]               n_mem_payload_data[15: 0];
   reg                                        n_mem_payload_we[15:0];
   reg                                        n_mem_valid[15:0];

   reg [11:0]              q_mem_payload_addr[15: 0];
   reg [31:0]               q_mem_payload_data[15: 0];
   reg                                        q_mem_payload_we[15:0];
   reg                                        q_mem_valid[15:0];
   wire                                       q_mem_ready[15:0];
   
   wire [11:0]              t_mem_payload_addr[15:0];
   wire [31:0]               t_mem_payload_data[15:0];
   wire                                        t_mem_valid[15:0];
   wire                                                t_mem_ready[15:0];


   reg [3:0]                 n_ready_matrix[3:0];
   reg                                   n_ready[3:0];
   reg [3:0]                 q_ready_matrix[3:0];
   reg                                   q_ready[3:0];

   reg [31:0]                                 ii,jj,i,j;

   wire [31:0] idma_data[3:0];
   wire [15:0] idma_addr[3:0];
   wire                           idma_we[3:0];
   reg [31:0] q_idma_data[3:0];
   reg [15:0] q_idma_addr[3:0];
   reg                           q_idma_we[3:0];
   reg                           q_idma_valid[3:0];
   
   reg [31:0] odma_dat[3:0];


   
   assign idma_addr[0]=t_idma_0_dat[47:32];
   assign idma_data[0]=t_idma_0_dat[31:0];
   assign idma_we[0]=t_idma_0_dat[48];

   assign i_odma_0_dat=odma_dat[0]; 
   assign idma_addr[1]=t_idma_1_dat[47:32];
   assign idma_data[1]=t_idma_1_dat[31:0];
   assign idma_we[1]=t_idma_1_dat[48];

   assign i_odma_1_dat=odma_dat[1]; 
   assign idma_addr[2]=t_idma_2_dat[47:32];
   assign idma_data[2]=t_idma_2_dat[31:0];
   assign idma_we[2]=t_idma_2_dat[48];

   assign i_odma_2_dat=odma_dat[2]; 
   assign idma_addr[3]=t_idma_3_dat[47:32];
   assign idma_data[3]=t_idma_3_dat[31:0];
   assign idma_we[3]=t_idma_3_dat[48];

   assign i_odma_3_dat=odma_dat[3]; 

   always @(posedge clk) begin
      for(i=0;i<4;i = i + 1) begin
         q_idma_addr[i]<=idma_addr[i];
         q_idma_data[i]<=idma_data[i];
         q_idma_we[i]<=idma_we[i];
         q_idma_valid[i]<=idma_valid[i];
         q_ready_matrix[i]<=n_ready_matrix[i];
         q_ready[i]<=n_ready[i];
      end
   end

   always @(posedge clk) begin
            for(j=0;j<16;j = j + 1) begin
         q_mem_valid[j]<=n_mem_valid[j];
         q_mem_payload_addr[j]<=n_mem_payload_addr[j];
         q_mem_payload_data[j]<=n_mem_payload_data[j];
         q_mem_payload_we[j]<=n_mem_payload_we[j];
      end
   end

   always @(*) begin
      for(i=0;i<4;i = i + 1) begin
         for(j=0;j<4;j = j + 1) begin
            if(j<i)
              n_ready_matrix[i][j]=(idma_addr[i][4-1:0]==idma_addr[j][3:0] && idma_valid[j])?0:1;
            else
              n_ready_matrix[i][j]=1;
         end
         n_ready[i]=&n_ready_matrix[i];
      end

      for(ii=0;ii<4;ii= ii + 1) begin
         idma_ready[ii]=n_ready[ii];//0;
      end
      for(ii=0;ii<16;ii= ii + 1) begin
         n_mem_valid[ii]=0;
         n_mem_payload_addr[ii]=0;
         n_mem_payload_data[ii]=0;
         n_mem_payload_we[ii]=0;
      end
      for(ii=0;ii<16;ii= ii + 1) begin
         for(jj=0;jj<4;jj = jj + 1) begin
            if(q_idma_addr[jj][4-1:0]==ii && q_ready[jj] && q_idma_valid[jj]) begin
               n_mem_valid[ii]=q_idma_valid[jj];
               n_mem_payload_addr[ii]=q_idma_addr[jj][15:4];
               n_mem_payload_data[ii]=q_idma_data[jj];
               n_mem_payload_we[ii]=q_idma_we[jj];
//               idma_ready[jj]=i_mem_ready[ii];
            end
//            if(n_ready[jj])
         end
      end
   end // always_comb


   //dma out mux logic
   reg [3:0] n_bank[3:0][2:0];
   reg [3:0] q_bank[3:0][2:0];
   reg                                       n_bank_valid[3:0][2:0];
   reg                                       q_bank_valid[3:0][2:0];

   reg [3:0] n_bank_quarter[3:0];
   reg [3:0] q_bank_quarter[3:0];
   reg [31:0]              n_odma_dat_quarter[3:0][3:0];
   reg [31:0]              q_odma_dat_quarter[3:0][3:0];
   reg                                       n_odma_valid_quarter[3:0][3:0];
   reg                                       q_odma_valid_quarter[3:0][3:0];

   reg [3:0] n_bank_half[3:0];
   reg [3:0] q_bank_half[3:0];
   reg [31:0]              n_odma_dat_half[1:0][3:0];
   reg [31:0]              q_odma_dat_half[1:0][3:0];
   reg                                       n_odma_valid_half[1:0][3:0];
   reg                                       q_odma_valid_half[1:0][3:0];
   
   always @(*) begin
      for(ii=0;ii<4;ii = ii + 1) begin
         n_bank[ii][0]=(q_idma_valid[ii]&q_ready[ii])?q_idma_addr[ii]:0;
         n_bank_valid[ii][0]=(q_idma_valid[ii]&q_ready[ii])?1:0;
      end

      /* verilator lint_off UNSIGNED */
      for(ii=0;ii<4;ii = ii + 1) begin
         for(jj=0;jj<2;jj = jj + 1) begin
            n_bank[ii][jj+1]=q_bank[ii][jj];
            n_bank_valid[ii][jj+1]=q_bank_valid[ii][jj];
         end
      end
      /* verilator lint_on UNSIGNED */
      for(jj=0;jj<4;jj = jj + 1) begin
         for(ii=0;ii<4;ii = ii + 1) begin
            n_odma_dat_quarter[jj][ii]=t_mem_payload_data[{jj[1:0],q_bank[ii][2][1:0]}];
            n_odma_valid_quarter[jj][ii]=q_bank_valid[ii][2]&t_mem_valid[{jj[1:0],q_bank[ii][2][1:0]}];
         end
      end

      for(ii=0;ii<4;ii = ii + 1) begin
         n_bank_quarter[ii]=q_bank[ii][2];
      end

      for(ii=0;ii<4;ii = ii + 1) begin      
         n_odma_dat_half[0][ii]=(~q_bank_quarter[ii][2] & q_odma_valid_quarter[0][ii])?q_odma_dat_quarter[0][ii]:q_odma_dat_quarter[1][ii];
         n_odma_valid_half[0][ii]=(~q_bank_quarter[ii][2] & q_odma_valid_quarter[0][ii])|(q_bank_quarter[ii][2] & q_odma_valid_quarter[1][ii]);

         n_odma_dat_half[1][ii]=(~q_bank_quarter[ii][2] & q_odma_valid_quarter[2][ii])?q_odma_dat_quarter[2][ii]:q_odma_dat_quarter[3][ii];
         n_odma_valid_half[1][ii]=(~q_bank_quarter[ii][2] & q_odma_valid_quarter[2][ii])|(q_bank_quarter[ii][2] & q_odma_valid_quarter[3][ii]);
      end

      for(ii=0;ii<4;ii = ii + 1) begin
         n_bank_half[ii]=q_bank_quarter[ii];
      end

      for(ii=0;ii<4;ii = ii + 1) begin
         odma_dat[ii]=(~q_bank_half[ii][3] & q_odma_valid_half[0][ii])?q_odma_dat_half[0][ii]:q_odma_dat_half[1][ii];
         odma_valid[ii]=(~q_bank_half[ii][3] & q_odma_valid_half[0][ii])|(q_bank_half[ii][3] & q_odma_valid_half[1][ii]);
      end
   end // always_comb

   always @(posedge clk) begin
      for(ii=0;ii<4;ii = ii + 1) begin
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
    for(jj=0;jj<3;jj = jj + 1) begin
       q_bank[ii][jj]<=n_bank[ii][jj];
       q_bank_valid[ii][jj]<=n_bank_valid[ii][jj];
    end
      end
   end

   wire [11:0] t_vs_payload_addr[15:0];
   wire [11:0] i_vs_payload_addr[15:0];
   wire [31:0] t_vs_payload_data[15:0];
   wire [31:0] i_vs_payload_data[15:0];
   wire vs_we;
   wire [3:0] s_k;

   assign s_k=t_ka_dat[195:192];
   assign vs_we=(tvs_valid && s_k<8)?1:0;
   
   assign t_vs_payload_addr[0]=t_ka_dat[11:0];
   assign t_vs_payload_data[0]=t_ivs_dat[31:0];
   
   assign t_vs_payload_addr[1]=t_ka_dat[23:12];
   assign t_vs_payload_data[1]=t_ivs_dat[63:32];
   
   assign t_vs_payload_addr[2]=t_ka_dat[35:24];
   assign t_vs_payload_data[2]=t_ivs_dat[95:64];
   
   assign t_vs_payload_addr[3]=t_ka_dat[47:36];
   assign t_vs_payload_data[3]=t_ivs_dat[127:96];
   
   assign t_vs_payload_addr[4]=t_ka_dat[59:48];
   assign t_vs_payload_data[4]=t_ivs_dat[159:128];
   
   assign t_vs_payload_addr[5]=t_ka_dat[71:60];
   assign t_vs_payload_data[5]=t_ivs_dat[191:160];
   
   assign t_vs_payload_addr[6]=t_ka_dat[83:72];
   assign t_vs_payload_data[6]=t_ivs_dat[223:192];
   
   assign t_vs_payload_addr[7]=t_ka_dat[95:84];
   assign t_vs_payload_data[7]=t_ivs_dat[255:224];
   
   assign t_vs_payload_addr[8]=t_ka_dat[107:96];
   assign t_vs_payload_data[8]=t_ivs_dat[287:256];
   
   assign t_vs_payload_addr[9]=t_ka_dat[119:108];
   assign t_vs_payload_data[9]=t_ivs_dat[319:288];
   
   assign t_vs_payload_addr[10]=t_ka_dat[131:120];
   assign t_vs_payload_data[10]=t_ivs_dat[351:320];
   
   assign t_vs_payload_addr[11]=t_ka_dat[143:132];
   assign t_vs_payload_data[11]=t_ivs_dat[383:352];
   
   assign t_vs_payload_addr[12]=t_ka_dat[155:144];
   assign t_vs_payload_data[12]=t_ivs_dat[415:384];
   
   assign t_vs_payload_addr[13]=t_ka_dat[167:156];
   assign t_vs_payload_data[13]=t_ivs_dat[447:416];
   
   assign t_vs_payload_addr[14]=t_ka_dat[179:168];
   assign t_vs_payload_data[14]=t_ivs_dat[479:448];
   
   assign t_vs_payload_addr[15]=t_ka_dat[191:180];
   assign t_vs_payload_data[15]=t_ivs_dat[511:480];
   
   assign k_ctrl=s_k;

//[511:0];

   
memory_slice
#(.MEMINIT(VMEM0))
mem_slice_0
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[0]),
 .t0_data(t_vs_payload_data[0]),
 .t0_we(vs_we),//[0]),
 .t0_valid(tvs_valid),
 
 .t0_ready(tvs_ready),
      

 .i0_addr(i_vs_payload_addr[0]),
 .i0_data(i_ovs_dat[31:0]),
 
 .i0_valid(ivs_valid),
      

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[0]),
 .t1_data(q_mem_payload_data[0]),
 .t1_we(q_mem_payload_we[0]),
 .t1_valid(q_mem_valid[0]),
 .t1_ready(q_mem_ready[0]),
 .i1_addr(t_mem_payload_addr[0]),
 .i1_data(t_mem_payload_data[0]),
 .i1_valid(t_mem_valid[0]),
 .i1_ready(1'b1)//t_mem_ready[0])
 );
 
memory_slice
#(.MEMINIT(VMEM1))
mem_slice_1
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[1]),
 .t0_data(t_vs_payload_data[1]),
 .t0_we(vs_we),//[1]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[1]),
 .i0_data(i_ovs_dat[63:32]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[1]),
 .t1_data(q_mem_payload_data[1]),
 .t1_we(q_mem_payload_we[1]),
 .t1_valid(q_mem_valid[1]),
 .t1_ready(q_mem_ready[1]),
 .i1_addr(t_mem_payload_addr[1]),
 .i1_data(t_mem_payload_data[1]),
 .i1_valid(t_mem_valid[1]),
 .i1_ready(1'b1)//t_mem_ready[1])
 );
 
memory_slice
#(.MEMINIT(VMEM2))
mem_slice_2
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[2]),
 .t0_data(t_vs_payload_data[2]),
 .t0_we(vs_we),//[2]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[2]),
 .i0_data(i_ovs_dat[95:64]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[2]),
 .t1_data(q_mem_payload_data[2]),
 .t1_we(q_mem_payload_we[2]),
 .t1_valid(q_mem_valid[2]),
 .t1_ready(q_mem_ready[2]),
 .i1_addr(t_mem_payload_addr[2]),
 .i1_data(t_mem_payload_data[2]),
 .i1_valid(t_mem_valid[2]),
 .i1_ready(1'b1)//t_mem_ready[2])
 );
 
memory_slice
#(.MEMINIT(VMEM3))
mem_slice_3
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[3]),
 .t0_data(t_vs_payload_data[3]),
 .t0_we(vs_we),//[3]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[3]),
 .i0_data(i_ovs_dat[127:96]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[3]),
 .t1_data(q_mem_payload_data[3]),
 .t1_we(q_mem_payload_we[3]),
 .t1_valid(q_mem_valid[3]),
 .t1_ready(q_mem_ready[3]),
 .i1_addr(t_mem_payload_addr[3]),
 .i1_data(t_mem_payload_data[3]),
 .i1_valid(t_mem_valid[3]),
 .i1_ready(1'b1)//t_mem_ready[3])
 );
 
memory_slice
#(.MEMINIT(VMEM4))
mem_slice_4
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[4]),
 .t0_data(t_vs_payload_data[4]),
 .t0_we(vs_we),//[4]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[4]),
 .i0_data(i_ovs_dat[159:128]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[4]),
 .t1_data(q_mem_payload_data[4]),
 .t1_we(q_mem_payload_we[4]),
 .t1_valid(q_mem_valid[4]),
 .t1_ready(q_mem_ready[4]),
 .i1_addr(t_mem_payload_addr[4]),
 .i1_data(t_mem_payload_data[4]),
 .i1_valid(t_mem_valid[4]),
 .i1_ready(1'b1)//t_mem_ready[4])
 );
 
memory_slice
#(.MEMINIT(VMEM5))
mem_slice_5
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[5]),
 .t0_data(t_vs_payload_data[5]),
 .t0_we(vs_we),//[5]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[5]),
 .i0_data(i_ovs_dat[191:160]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[5]),
 .t1_data(q_mem_payload_data[5]),
 .t1_we(q_mem_payload_we[5]),
 .t1_valid(q_mem_valid[5]),
 .t1_ready(q_mem_ready[5]),
 .i1_addr(t_mem_payload_addr[5]),
 .i1_data(t_mem_payload_data[5]),
 .i1_valid(t_mem_valid[5]),
 .i1_ready(1'b1)//t_mem_ready[5])
 );
 
memory_slice
#(.MEMINIT(VMEM6))
mem_slice_6
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[6]),
 .t0_data(t_vs_payload_data[6]),
 .t0_we(vs_we),//[6]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[6]),
 .i0_data(i_ovs_dat[223:192]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[6]),
 .t1_data(q_mem_payload_data[6]),
 .t1_we(q_mem_payload_we[6]),
 .t1_valid(q_mem_valid[6]),
 .t1_ready(q_mem_ready[6]),
 .i1_addr(t_mem_payload_addr[6]),
 .i1_data(t_mem_payload_data[6]),
 .i1_valid(t_mem_valid[6]),
 .i1_ready(1'b1)//t_mem_ready[6])
 );
 
memory_slice
#(.MEMINIT(VMEM7))
mem_slice_7
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[7]),
 .t0_data(t_vs_payload_data[7]),
 .t0_we(vs_we),//[7]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[7]),
 .i0_data(i_ovs_dat[255:224]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[7]),
 .t1_data(q_mem_payload_data[7]),
 .t1_we(q_mem_payload_we[7]),
 .t1_valid(q_mem_valid[7]),
 .t1_ready(q_mem_ready[7]),
 .i1_addr(t_mem_payload_addr[7]),
 .i1_data(t_mem_payload_data[7]),
 .i1_valid(t_mem_valid[7]),
 .i1_ready(1'b1)//t_mem_ready[7])
 );
 
memory_slice
#(.MEMINIT(VMEM8))
mem_slice_8
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[8]),
 .t0_data(t_vs_payload_data[8]),
 .t0_we(vs_we),//[8]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[8]),
 .i0_data(i_ovs_dat[287:256]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[8]),
 .t1_data(q_mem_payload_data[8]),
 .t1_we(q_mem_payload_we[8]),
 .t1_valid(q_mem_valid[8]),
 .t1_ready(q_mem_ready[8]),
 .i1_addr(t_mem_payload_addr[8]),
 .i1_data(t_mem_payload_data[8]),
 .i1_valid(t_mem_valid[8]),
 .i1_ready(1'b1)//t_mem_ready[8])
 );
 
memory_slice
#(.MEMINIT(VMEM9))
mem_slice_9
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[9]),
 .t0_data(t_vs_payload_data[9]),
 .t0_we(vs_we),//[9]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[9]),
 .i0_data(i_ovs_dat[319:288]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[9]),
 .t1_data(q_mem_payload_data[9]),
 .t1_we(q_mem_payload_we[9]),
 .t1_valid(q_mem_valid[9]),
 .t1_ready(q_mem_ready[9]),
 .i1_addr(t_mem_payload_addr[9]),
 .i1_data(t_mem_payload_data[9]),
 .i1_valid(t_mem_valid[9]),
 .i1_ready(1'b1)//t_mem_ready[9])
 );
 
memory_slice
#(.MEMINIT(VMEM10))
mem_slice_10
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[10]),
 .t0_data(t_vs_payload_data[10]),
 .t0_we(vs_we),//[10]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[10]),
 .i0_data(i_ovs_dat[351:320]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[10]),
 .t1_data(q_mem_payload_data[10]),
 .t1_we(q_mem_payload_we[10]),
 .t1_valid(q_mem_valid[10]),
 .t1_ready(q_mem_ready[10]),
 .i1_addr(t_mem_payload_addr[10]),
 .i1_data(t_mem_payload_data[10]),
 .i1_valid(t_mem_valid[10]),
 .i1_ready(1'b1)//t_mem_ready[10])
 );
 
memory_slice
#(.MEMINIT(VMEM11))
mem_slice_11
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[11]),
 .t0_data(t_vs_payload_data[11]),
 .t0_we(vs_we),//[11]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[11]),
 .i0_data(i_ovs_dat[383:352]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[11]),
 .t1_data(q_mem_payload_data[11]),
 .t1_we(q_mem_payload_we[11]),
 .t1_valid(q_mem_valid[11]),
 .t1_ready(q_mem_ready[11]),
 .i1_addr(t_mem_payload_addr[11]),
 .i1_data(t_mem_payload_data[11]),
 .i1_valid(t_mem_valid[11]),
 .i1_ready(1'b1)//t_mem_ready[11])
 );
 
memory_slice
#(.MEMINIT(VMEM12))
mem_slice_12
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[12]),
 .t0_data(t_vs_payload_data[12]),
 .t0_we(vs_we),//[12]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[12]),
 .i0_data(i_ovs_dat[415:384]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[12]),
 .t1_data(q_mem_payload_data[12]),
 .t1_we(q_mem_payload_we[12]),
 .t1_valid(q_mem_valid[12]),
 .t1_ready(q_mem_ready[12]),
 .i1_addr(t_mem_payload_addr[12]),
 .i1_data(t_mem_payload_data[12]),
 .i1_valid(t_mem_valid[12]),
 .i1_ready(1'b1)//t_mem_ready[12])
 );
 
memory_slice
#(.MEMINIT(VMEM13))
mem_slice_13
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[13]),
 .t0_data(t_vs_payload_data[13]),
 .t0_we(vs_we),//[13]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[13]),
 .i0_data(i_ovs_dat[447:416]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[13]),
 .t1_data(q_mem_payload_data[13]),
 .t1_we(q_mem_payload_we[13]),
 .t1_valid(q_mem_valid[13]),
 .t1_ready(q_mem_ready[13]),
 .i1_addr(t_mem_payload_addr[13]),
 .i1_data(t_mem_payload_data[13]),
 .i1_valid(t_mem_valid[13]),
 .i1_ready(1'b1)//t_mem_ready[13])
 );
 
memory_slice
#(.MEMINIT(VMEM14))
mem_slice_14
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[14]),
 .t0_data(t_vs_payload_data[14]),
 .t0_we(vs_we),//[14]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[14]),
 .i0_data(i_ovs_dat[479:448]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[14]),
 .t1_data(q_mem_payload_data[14]),
 .t1_we(q_mem_payload_we[14]),
 .t1_valid(q_mem_valid[14]),
 .t1_ready(q_mem_ready[14]),
 .i1_addr(t_mem_payload_addr[14]),
 .i1_data(t_mem_payload_data[14]),
 .i1_valid(t_mem_valid[14]),
 .i1_ready(1'b1)//t_mem_ready[14])
 );
 
memory_slice
#(.MEMINIT(VMEM15))
mem_slice_15
(.clk(clk),
 .reset_n(reset_n),
 //port 0
 .t0_addr(t_vs_payload_addr[15]),
 .t0_data(t_vs_payload_data[15]),
 .t0_we(vs_we),//[15]),
 .t0_valid(tvs_valid),
 
 .t0_ready(),
  

 .i0_addr(i_vs_payload_addr[15]),
 .i0_data(i_ovs_dat[511:480]),
 
 .i0_valid(),
  

 .i0_ready(ivs_ready),
 //port 1
 .t1_addr(q_mem_payload_addr[15]),
 .t1_data(q_mem_payload_data[15]),
 .t1_we(q_mem_payload_we[15]),
 .t1_valid(q_mem_valid[15]),
 .t1_ready(q_mem_ready[15]),
 .i1_addr(t_mem_payload_addr[15]),
 .i1_data(t_mem_payload_data[15]),
 .i1_valid(t_mem_valid[15]),
 .i1_ready(1'b1)//t_mem_ready[15])
 );
 


endmodule
