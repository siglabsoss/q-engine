

module vector_ctrl_17_2
  (
   
   input wire   t_instr_0_req,
   output wire t_instr_0_ack,
   
   input wire   t_instr_1_req,
   output wire t_instr_1_ack,
   
   input wire   t_instr_2_req,
   output wire t_instr_2_ack,
   
   input wire   t_instr_3_req,
   output wire t_instr_3_ack,
   
   input wire   t_instr_4_req,
   output wire t_instr_4_ack,
   
   input wire   t_instr_5_req,
   output wire t_instr_5_ack,
   
   input wire   t_instr_6_req,
   output wire t_instr_6_ack,
   
   input wire   t_instr_7_req,
   output wire t_instr_7_ack,
   
   input wire   t_instr_8_req,
   output wire t_instr_8_ack,
   
   input wire   t_instr_9_req,
   output wire t_instr_9_ack,
   
   input wire   t_instr_10_req,
   output wire t_instr_10_ack,
   
   input wire   t_instr_11_req,
   output wire t_instr_11_ack,
   
   input wire   t_instr_12_req,
   output wire t_instr_12_ack,
   
   input wire   t_instr_13_req,
   output wire t_instr_13_ack,
   
   input wire   t_instr_14_req,
   output wire t_instr_14_ack,
   
   input wire   t_instr_15_req,
   output wire t_instr_15_ack,
   
   input wire   t_k15_req,
   output wire t_k15_ack,
   //initiators
   output wire i_k15_req,
   input wire   i_k15_ack,
   output wire i_kap_req,
   input wire   i_kap_ack,
   //exports
   
   output wire instr_0_valid,
   input wire   instr_0_ready,
   
   output wire instr_1_valid,
   input wire   instr_1_ready,
   
   output wire instr_2_valid,
   input wire   instr_2_ready,
   
   output wire instr_3_valid,
   input wire   instr_3_ready,
   
   output wire instr_4_valid,
   input wire   instr_4_ready,
   
   output wire instr_5_valid,
   input wire   instr_5_ready,
   
   output wire instr_6_valid,
   input wire   instr_6_ready,
   
   output wire instr_7_valid,
   input wire   instr_7_ready,
   
   output wire instr_8_valid,
   input wire   instr_8_ready,
   
   output wire instr_9_valid,
   input wire   instr_9_ready,
   
   output wire instr_10_valid,
   input wire   instr_10_ready,
   
   output wire instr_11_valid,
   input wire   instr_11_ready,
   
   output wire instr_12_valid,
   input wire   instr_12_ready,
   
   output wire instr_13_valid,
   input wire   instr_13_ready,
   
   output wire instr_14_valid,
   input wire   instr_14_ready,
   
   output wire instr_15_valid,
   input wire   instr_15_ready,
   
                               
   output wire tk15_valid,
   input wire   tk15_ready,
   
   input wire   ik15_valid,
   output wire ik15_ready,

   input wire   kap_valid,
   output wire kap_ready,
   
   input wire   clk, reset_n
   );

   
   assign instr_0_valid=t_instr_0_req;
`ifndef QENGINE_LITE
   assign t_instr_0_ack=instr_0_ready;
`else
   assign t_instr_0_ack=1;
`endif

   assign instr_1_valid=t_instr_1_req;
`ifndef QENGINE_LITE
   assign t_instr_1_ack=instr_1_ready;
`else
   assign t_instr_1_ack=1;
`endif

   assign instr_2_valid=t_instr_2_req;
`ifndef QENGINE_LITE
   assign t_instr_2_ack=instr_2_ready;
`else
   assign t_instr_2_ack=1;
`endif

   assign instr_3_valid=t_instr_3_req;
`ifndef QENGINE_LITE
   assign t_instr_3_ack=instr_3_ready;
`else
   assign t_instr_3_ack=1;
`endif

   assign instr_4_valid=t_instr_4_req;
`ifndef QENGINE_LITE
   assign t_instr_4_ack=instr_4_ready;
`else
   assign t_instr_4_ack=1;
`endif

   assign instr_5_valid=t_instr_5_req;
`ifndef QENGINE_LITE
   assign t_instr_5_ack=instr_5_ready;
`else
   assign t_instr_5_ack=1;
`endif

   assign instr_6_valid=t_instr_6_req;
`ifndef QENGINE_LITE
   assign t_instr_6_ack=instr_6_ready;
`else
   assign t_instr_6_ack=1;
`endif

   assign instr_7_valid=t_instr_7_req;
`ifndef QENGINE_LITE
   assign t_instr_7_ack=instr_7_ready;
`else
   assign t_instr_7_ack=1;
`endif

   assign instr_8_valid=t_instr_8_req;
`ifndef QENGINE_LITE
   assign t_instr_8_ack=instr_8_ready;
`else
   assign t_instr_8_ack=1;
`endif

   assign instr_9_valid=t_instr_9_req;
`ifndef QENGINE_LITE
   assign t_instr_9_ack=instr_9_ready;
`else
   assign t_instr_9_ack=1;
`endif

   assign instr_10_valid=t_instr_10_req;
`ifndef QENGINE_LITE
   assign t_instr_10_ack=instr_10_ready;
`else
   assign t_instr_10_ack=1;
`endif

   assign instr_11_valid=t_instr_11_req;
`ifndef QENGINE_LITE
   assign t_instr_11_ack=instr_11_ready;
`else
   assign t_instr_11_ack=1;
`endif

   assign instr_12_valid=t_instr_12_req;
`ifndef QENGINE_LITE
   assign t_instr_12_ack=instr_12_ready;
`else
   assign t_instr_12_ack=1;
`endif

   assign instr_13_valid=t_instr_13_req;
`ifndef QENGINE_LITE
   assign t_instr_13_ack=instr_13_ready;
`else
   assign t_instr_13_ack=1;
`endif

   assign instr_14_valid=t_instr_14_req;
`ifndef QENGINE_LITE
   assign t_instr_14_ack=instr_14_ready;
`else
   assign t_instr_14_ack=1;
`endif

   assign instr_15_valid=t_instr_15_req;
`ifndef QENGINE_LITE
   assign t_instr_15_ack=instr_15_ready;
`else
   assign t_instr_15_ack=1;
`endif

   assign tk15_valid=t_k15_req;
   assign t_k15_ack=tk15_ready;
   
   assign i_k15_req=ik15_valid;
   assign ik15_ready=i_k15_ack;

   assign i_kap_req=kap_valid;
   assign kap_ready=i_kap_ack;
   
endmodule
   
