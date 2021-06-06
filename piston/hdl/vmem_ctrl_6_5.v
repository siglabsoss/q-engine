
module vmem_ctrl_6_5
  (
   input wire                          t_idma_0_req,
   output wire                        t_idma_0_ack,
   input wire                          t_idma_1_req,
   output wire                        t_idma_1_ack,
   input wire                          t_idma_2_req,
   output wire                        t_idma_2_ack,
   input wire                          t_idma_3_req,
   output wire                        t_idma_3_ack,

   output wire                        i_odma_0_req,
   input wire                          i_odma_0_ack,
   output wire                        i_odma_1_req,
   input wire                          i_odma_1_ack,
   output wire                        i_odma_2_req,
   input wire                          i_odma_2_ack,
   output wire                        i_odma_3_req,
   input wire                          i_odma_3_ack,

   input wire                          t_ka_req,
   output wire                         t_ka_ack,

   input wire                          t_ivs_req,
   output wire                        t_ivs_ack,

   output wire                        i_ovs_req,
   input wire                          i_ovs_ack,

   //exports
   output wire [3:0]    idma_valid,
   input wire [3:0]      idma_ready,

   input wire [3:0]      odma_valid,
   output wire [3:0]    odma_ready,

   output wire                        tvs_valid,
   input wire                          tvs_ready,

   input wire                          ivs_valid,
   output wire                        ivs_ready,

   input wire [3:0] k_ctrl,

   input wire                          clk, reset_n
   );

  assign idma_valid={t_idma_3_req,t_idma_2_req,t_idma_1_req,t_idma_0_req};
   assign t_idma_0_ack=idma_ready[0];
   assign t_idma_1_ack=idma_ready[1];
   assign t_idma_2_ack=idma_ready[2];
   assign t_idma_3_ack=idma_ready[3];   

   assign i_odma_0_req=odma_valid[0];
   assign i_odma_1_req=odma_valid[1];
   assign i_odma_2_req=odma_valid[2];
   assign i_odma_3_req=odma_valid[3];
   assign odma_ready={i_odma_3_ack,i_odma_2_ack,i_odma_1_ack,i_odma_0_ack};

  //assign t_ka_ack=(k_ctrl<8)?tvs_ready&t_ivs_req:ivs_valid&ivs_ready;
   assign t_ka_ack=(k_ctrl<8)?tvs_ready&t_ivs_req:ivs_ready;

   assign tvs_valid=(t_ivs_req&t_ka_req)|(k_ctrl>=8 && t_ka_req);
   assign t_ivs_ack=(k_ctrl<8)?tvs_ready&tvs_valid:0;

   assign i_ovs_req=ivs_valid;
//&t_ka_req;
   assign ivs_ready=(k_ctrl<8)?1'b1:i_ovs_ack;
   //assign ivs_ready=i_ovs_ack;

endmodule
