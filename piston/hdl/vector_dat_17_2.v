

    module vector_dat_17_2 
      (
       
       input [63:0]                           t_instr_0_dat,
       input                                  instr_0_valid,
       output wire                           instr_0_ready,
       
       input [63:0]                           t_instr_1_dat,
       input                                  instr_1_valid,
       output wire                           instr_1_ready,
       
       input [63:0]                           t_instr_2_dat,
       input                                  instr_2_valid,
       output wire                           instr_2_ready,
       
       input [63:0]                           t_instr_3_dat,
       input                                  instr_3_valid,
       output wire                           instr_3_ready,
       
       input [63:0]                           t_instr_4_dat,
       input                                  instr_4_valid,
       output wire                           instr_4_ready,
       
       input [63:0]                           t_instr_5_dat,
       input                                  instr_5_valid,
       output wire                           instr_5_ready,
       
       input [63:0]                           t_instr_6_dat,
       input                                  instr_6_valid,
       output wire                           instr_6_ready,
       
       input [63:0]                           t_instr_7_dat,
       input                                  instr_7_valid,
       output wire                           instr_7_ready,
       
       input [63:0]                           t_instr_8_dat,
       input                                  instr_8_valid,
       output wire                           instr_8_ready,
       
       input [63:0]                           t_instr_9_dat,
       input                                  instr_9_valid,
       output wire                           instr_9_ready,
       
       input [63:0]                           t_instr_10_dat,
       input                                  instr_10_valid,
       output wire                           instr_10_ready,
       
       input [63:0]                           t_instr_11_dat,
       input                                  instr_11_valid,
       output wire                           instr_11_ready,
       
       input [63:0]                           t_instr_12_dat,
       input                                  instr_12_valid,
       output wire                           instr_12_ready,
       
       input [63:0]                           t_instr_13_dat,
       input                                  instr_13_valid,
       output wire                           instr_13_ready,
       
       input [63:0]                           t_instr_14_dat,
       input                                  instr_14_valid,
       output wire                           instr_14_ready,
       
       input [63:0]                           t_instr_15_dat,
       input                                  instr_15_valid,
       output wire                           instr_15_ready,
       
                                                      
       input [511:0]        t_k15_dat,
       input                                          tk15_valid,
       output wire                                   tk15_ready,
                                                      
                                                      
       output wire [511:0] i_k15_dat,
       output wire                                   ik15_valid,
       input                                          ik15_ready,
                                                      
       output wire [263:0] i_kap_dat,
       output wire                                   kap_valid,
       input wire                                    kap_ready,
/*                                                    
       output wire [3:0] i_selin_dat,
       output wire                                   i_selin_valid,
       input                                          i_selin_ready,
                                                      
       output wire [3:0] i_selou_dat,
       output wire                                   i_selou_valid,
       input                                          i_selou_ready,
                                                      
                                                      
       output wire [63:0] i_perin_dat,
       output wire                                   i_perin_valid,
       input                                          i_perin_ready,
                                                      
       output wire [63:0] i_perou_dat,
       output wire                                   i_perou_valid,
       input                                          i_perou_ready,
                                                      
       output wire [191:0] i_baddr_dat,
       output wire                                   i_baddr_valid,
       input                                          i_baddr_ready,
                                                      */
       input                                          clk, reset_n
       );

   
                               wire [15:0]slice_0_data;

                               wire [15:0]slice_1_data;

                               wire [15:0]slice_2_data;

                               wire [15:0]slice_3_data;

                               wire [15:0]slice_4_data;

                               wire [15:0]slice_5_data;

                               wire [15:0]slice_6_data;

                               wire [15:0]slice_7_data;

                               wire [15:0]slice_8_data;

                               wire [15:0]slice_9_data;

                               wire [15:0]slice_10_data;

                               wire [15:0]slice_11_data;

                               wire [15:0]slice_12_data;

                               wire [15:0]slice_13_data;

                               wire [15:0]slice_14_data;

                               wire [15:0]slice_15_data;

   wire [3:0] s_k1,s_k2;
   wire       s_valid;
   wire       s_k_ready;
   wire [255:0]       s_slice_addr;
   
   wire [63:0] selin_data;
   wire [63:0] perin_data;
   wire [191:0] baddr_data;

   assign i_kap_dat={s_k1,baddr_data,s_k1,perin_data};
   assign kap_valid=s_valid;
   
   
   assign selin_data=s_k1;


   
//   assign i_selou_data=s_k;
   
`ifndef QENGINE_LITE                              
   

   assign perin_data[3:0]=s_slice_addr[15:12];
   assign baddr_data[11:0]=s_slice_addr[11:0];

       vector_slice#(.PREDICATOR(0)) vector_slice_0
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_0_dat),
        .t_instr_valid(instr_0_valid),
        .t_instr_ready(instr_0_ready),
//      .t_instr_ready(),


        .r_data(slice_1_data),
        .l_data(slice_15_data),
        .o_data(slice_0_data),

        .i0_data(s_slice_addr[15:0]),
        
        .i0_k(s_k1),
        .i0_valid(s_valid),                   
                      

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[31:0]),
        .t_k15_valid(tk15_valid),//t_k15_valid[0]),.i0_k(s_k),   
        
        .t_k15_ready(tk15_ready),//t_k15_ready[0]),                    
        

        .i_k15_data(i_k15_dat[31:0]),
        .i_k15_ready(ik15_ready),//t_k15_ready[0]),                      
        
        .i_k15_valid(ik15_valid)//t_k15_valid[0]),.i0_k(s_k),
        
        );
   

   assign perin_data[7:4]=s_slice_addr[31:28];
   assign baddr_data[23:12]=s_slice_addr[27:16];

       vector_slice#(.PREDICATOR(1)) vector_slice_1
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_1_dat),
        .t_instr_valid(instr_1_valid),
        .t_instr_ready(instr_1_ready),
//      .t_instr_ready(),


        .r_data(slice_2_data),
        .l_data(slice_0_data),
        .o_data(slice_1_data),

        .i0_data(s_slice_addr[31:16]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[63:32]),
        .t_k15_valid(tk15_valid),//t_k15_valid[1]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[1]),                          
        

        .i_k15_data(i_k15_dat[63:32]),
        .i_k15_ready(ik15_ready),//t_k15_ready[1]),                      
        
        .i_k15_valid()//t_k15_valid[1]),.i0_k(s_k),
        
        );
   

   assign perin_data[11:8]=s_slice_addr[47:44];
   assign baddr_data[35:24]=s_slice_addr[43:32];

       vector_slice#(.PREDICATOR(2)) vector_slice_2
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_2_dat),
        .t_instr_valid(instr_2_valid),
        .t_instr_ready(instr_2_ready),
//      .t_instr_ready(),


        .r_data(slice_3_data),
        .l_data(slice_1_data),
        .o_data(slice_2_data),

        .i0_data(s_slice_addr[47:32]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[95:64]),
        .t_k15_valid(tk15_valid),//t_k15_valid[2]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[2]),                          
        

        .i_k15_data(i_k15_dat[95:64]),
        .i_k15_ready(ik15_ready),//t_k15_ready[2]),                      
        
        .i_k15_valid()//t_k15_valid[2]),.i0_k(s_k),
        
        );
   

   assign perin_data[15:12]=s_slice_addr[63:60];
   assign baddr_data[47:36]=s_slice_addr[59:48];

       vector_slice#(.PREDICATOR(3)) vector_slice_3
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_3_dat),
        .t_instr_valid(instr_3_valid),
        .t_instr_ready(instr_3_ready),
//      .t_instr_ready(),


        .r_data(slice_4_data),
        .l_data(slice_2_data),
        .o_data(slice_3_data),

        .i0_data(s_slice_addr[63:48]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[127:96]),
        .t_k15_valid(tk15_valid),//t_k15_valid[3]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[3]),                          
        

        .i_k15_data(i_k15_dat[127:96]),
        .i_k15_ready(ik15_ready),//t_k15_ready[3]),                      
        
        .i_k15_valid()//t_k15_valid[3]),.i0_k(s_k),
        
        );
   

   assign perin_data[19:16]=s_slice_addr[79:76];
   assign baddr_data[59:48]=s_slice_addr[75:64];

       vector_slice#(.PREDICATOR(4)) vector_slice_4
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_4_dat),
        .t_instr_valid(instr_4_valid),
        .t_instr_ready(instr_4_ready),
//      .t_instr_ready(),


        .r_data(slice_5_data),
        .l_data(slice_3_data),
        .o_data(slice_4_data),

        .i0_data(s_slice_addr[79:64]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[159:128]),
        .t_k15_valid(tk15_valid),//t_k15_valid[4]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[4]),                          
        

        .i_k15_data(i_k15_dat[159:128]),
        .i_k15_ready(ik15_ready),//t_k15_ready[4]),                      
        
        .i_k15_valid()//t_k15_valid[4]),.i0_k(s_k),
        
        );
   

   assign perin_data[23:20]=s_slice_addr[95:92];
   assign baddr_data[71:60]=s_slice_addr[91:80];

       vector_slice#(.PREDICATOR(5)) vector_slice_5
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_5_dat),
        .t_instr_valid(instr_5_valid),
        .t_instr_ready(instr_5_ready),
//      .t_instr_ready(),


        .r_data(slice_6_data),
        .l_data(slice_4_data),
        .o_data(slice_5_data),

        .i0_data(s_slice_addr[95:80]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[191:160]),
        .t_k15_valid(tk15_valid),//t_k15_valid[5]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[5]),                          
        

        .i_k15_data(i_k15_dat[191:160]),
        .i_k15_ready(ik15_ready),//t_k15_ready[5]),                      
        
        .i_k15_valid()//t_k15_valid[5]),.i0_k(s_k),
        
        );
   

   assign perin_data[27:24]=s_slice_addr[111:108];
   assign baddr_data[83:72]=s_slice_addr[107:96];

       vector_slice#(.PREDICATOR(6)) vector_slice_6
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_6_dat),
        .t_instr_valid(instr_6_valid),
        .t_instr_ready(instr_6_ready),
//      .t_instr_ready(),


        .r_data(slice_7_data),
        .l_data(slice_5_data),
        .o_data(slice_6_data),

        .i0_data(s_slice_addr[111:96]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[223:192]),
        .t_k15_valid(tk15_valid),//t_k15_valid[6]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[6]),                          
        

        .i_k15_data(i_k15_dat[223:192]),
        .i_k15_ready(ik15_ready),//t_k15_ready[6]),                      
        
        .i_k15_valid()//t_k15_valid[6]),.i0_k(s_k),
        
        );
   

   assign perin_data[31:28]=s_slice_addr[127:124];
   assign baddr_data[95:84]=s_slice_addr[123:112];

       vector_slice#(.PREDICATOR(7)) vector_slice_7
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_7_dat),
        .t_instr_valid(instr_7_valid),
        .t_instr_ready(instr_7_ready),
//      .t_instr_ready(),


        .r_data(slice_8_data),
        .l_data(slice_6_data),
        .o_data(slice_7_data),

        .i0_data(s_slice_addr[127:112]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[255:224]),
        .t_k15_valid(tk15_valid),//t_k15_valid[7]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[7]),                          
        

        .i_k15_data(i_k15_dat[255:224]),
        .i_k15_ready(ik15_ready),//t_k15_ready[7]),                      
        
        .i_k15_valid()//t_k15_valid[7]),.i0_k(s_k),
        
        );
   

   assign perin_data[35:32]=s_slice_addr[143:140];
   assign baddr_data[107:96]=s_slice_addr[139:128];

       vector_slice#(.PREDICATOR(8)) vector_slice_8
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_8_dat),
        .t_instr_valid(instr_8_valid),
        .t_instr_ready(instr_8_ready),
//      .t_instr_ready(),


        .r_data(slice_9_data),
        .l_data(slice_7_data),
        .o_data(slice_8_data),

        .i0_data(s_slice_addr[143:128]),
        
        .i0_k(s_k2),
        .i0_valid(),
                      

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[287:256]),
        .t_k15_valid(tk15_valid),//t_k15_valid[8]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[8]),                          
        

        .i_k15_data(i_k15_dat[287:256]),
        .i_k15_ready(ik15_ready),//t_k15_ready[8]),                      
        
        .i_k15_valid()//t_k15_valid[8]),.i0_k(s_k),
        
        );
   

   assign perin_data[39:36]=s_slice_addr[159:156];
   assign baddr_data[119:108]=s_slice_addr[155:144];

       vector_slice#(.PREDICATOR(9)) vector_slice_9
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_9_dat),
        .t_instr_valid(instr_9_valid),
        .t_instr_ready(instr_9_ready),
//      .t_instr_ready(),


        .r_data(slice_10_data),
        .l_data(slice_8_data),
        .o_data(slice_9_data),

        .i0_data(s_slice_addr[159:144]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[319:288]),
        .t_k15_valid(tk15_valid),//t_k15_valid[9]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[9]),                          
        

        .i_k15_data(i_k15_dat[319:288]),
        .i_k15_ready(ik15_ready),//t_k15_ready[9]),                      
        
        .i_k15_valid()//t_k15_valid[9]),.i0_k(s_k),
        
        );
   

   assign perin_data[43:40]=s_slice_addr[175:172];
   assign baddr_data[131:120]=s_slice_addr[171:160];

       vector_slice#(.PREDICATOR(10)) vector_slice_10
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_10_dat),
        .t_instr_valid(instr_10_valid),
        .t_instr_ready(instr_10_ready),
//      .t_instr_ready(),


        .r_data(slice_11_data),
        .l_data(slice_9_data),
        .o_data(slice_10_data),

        .i0_data(s_slice_addr[175:160]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[351:320]),
        .t_k15_valid(tk15_valid),//t_k15_valid[10]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[10]),                          
        

        .i_k15_data(i_k15_dat[351:320]),
        .i_k15_ready(ik15_ready),//t_k15_ready[10]),                      
        
        .i_k15_valid()//t_k15_valid[10]),.i0_k(s_k),
        
        );
   

   assign perin_data[47:44]=s_slice_addr[191:188];
   assign baddr_data[143:132]=s_slice_addr[187:176];

       vector_slice#(.PREDICATOR(11)) vector_slice_11
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_11_dat),
        .t_instr_valid(instr_11_valid),
        .t_instr_ready(instr_11_ready),
//      .t_instr_ready(),


        .r_data(slice_12_data),
        .l_data(slice_10_data),
        .o_data(slice_11_data),

        .i0_data(s_slice_addr[191:176]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[383:352]),
        .t_k15_valid(tk15_valid),//t_k15_valid[11]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[11]),                          
        

        .i_k15_data(i_k15_dat[383:352]),
        .i_k15_ready(ik15_ready),//t_k15_ready[11]),                      
        
        .i_k15_valid()//t_k15_valid[11]),.i0_k(s_k),
        
        );
   

   assign perin_data[51:48]=s_slice_addr[207:204];
   assign baddr_data[155:144]=s_slice_addr[203:192];

       vector_slice#(.PREDICATOR(12)) vector_slice_12
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_12_dat),
        .t_instr_valid(instr_12_valid),
        .t_instr_ready(instr_12_ready),
//      .t_instr_ready(),


        .r_data(slice_13_data),
        .l_data(slice_11_data),
        .o_data(slice_12_data),

        .i0_data(s_slice_addr[207:192]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[415:384]),
        .t_k15_valid(tk15_valid),//t_k15_valid[12]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[12]),                          
        

        .i_k15_data(i_k15_dat[415:384]),
        .i_k15_ready(ik15_ready),//t_k15_ready[12]),                      
        
        .i_k15_valid()//t_k15_valid[12]),.i0_k(s_k),
        
        );
   

   assign perin_data[55:52]=s_slice_addr[223:220];
   assign baddr_data[167:156]=s_slice_addr[219:208];

       vector_slice#(.PREDICATOR(13)) vector_slice_13
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_13_dat),
        .t_instr_valid(instr_13_valid),
        .t_instr_ready(instr_13_ready),
//      .t_instr_ready(),


        .r_data(slice_14_data),
        .l_data(slice_12_data),
        .o_data(slice_13_data),

        .i0_data(s_slice_addr[223:208]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[447:416]),
        .t_k15_valid(tk15_valid),//t_k15_valid[13]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[13]),                          
        

        .i_k15_data(i_k15_dat[447:416]),
        .i_k15_ready(ik15_ready),//t_k15_ready[13]),                      
        
        .i_k15_valid()//t_k15_valid[13]),.i0_k(s_k),
        
        );
   

   assign perin_data[59:56]=s_slice_addr[239:236];
   assign baddr_data[179:168]=s_slice_addr[235:224];

       vector_slice#(.PREDICATOR(14)) vector_slice_14
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_14_dat),
        .t_instr_valid(instr_14_valid),
        .t_instr_ready(instr_14_ready),
//      .t_instr_ready(),


        .r_data(slice_15_data),
        .l_data(slice_13_data),
        .o_data(slice_14_data),

        .i0_data(s_slice_addr[239:224]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[479:448]),
        .t_k15_valid(tk15_valid),//t_k15_valid[14]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[14]),                          
        

        .i_k15_data(i_k15_dat[479:448]),
        .i_k15_ready(ik15_ready),//t_k15_ready[14]),                      
        
        .i_k15_valid()//t_k15_valid[14]),.i0_k(s_k),
        
        );
   

   assign perin_data[63:60]=s_slice_addr[255:252];
   assign baddr_data[191:180]=s_slice_addr[251:240];

       vector_slice#(.PREDICATOR(15)) vector_slice_15
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_15_dat),
        .t_instr_valid(instr_15_valid),
        .t_instr_ready(instr_15_ready),
//      .t_instr_ready(),


        .r_data(slice_0_data),
        .l_data(slice_14_data),
        .o_data(slice_15_data),

        .i0_data(s_slice_addr[255:240]),
                                                   
        .i0_k(),
        .i0_valid(),                              
                  

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[511:480]),
        .t_k15_valid(tk15_valid),//t_k15_valid[15]),.i0_k(s_k),   
        
        .t_k15_ready(),//t_k15_ready[15]),                          
        

        .i_k15_data(i_k15_dat[511:480]),
        .i_k15_ready(ik15_ready),//t_k15_ready[15]),                      
        
        .i_k15_valid()//t_k15_valid[15]),.i0_k(s_k),
        
        );
   
`endif
endmodule
