module kap_ctrl_ctrl_${local[0]}_${local[1]}
  (
   input wire   t_kap_req,
   output wire t_kap_ack,

   output wire i_selin_req,
   input wire   i_selin_ack,

   output wire i_perin_req,
   input wire   i_perin_ack,

   output wire i_vmemc_req,
   input wire   i_vmemc_ack,

   output wire i_perou_req,
   input wire   i_perou_ack,

   output wire i_selou_req,
   input wire   i_selou_ack,

   input wire   clk, reset_n
   );

   reg        q_selin_ack;
   reg        q_perin_ack;
   reg        q_vmemc_ack;
   reg        q_perou_ack;
   reg        q_selou_ack;

   assign t_kap_ack=(i_selin_ack | ~i_selin_req) & (i_perin_ack | ~i_perin_req) & (i_vmemc_ack | ~i_vmemc_req) & (i_perou_ack | ~i_perou_req) & (i_selou_ack | ~i_selou_req);

   assign i_selin_req= t_kap_req & ~q_selin_ack;
   assign i_perin_req= t_kap_req & ~q_perin_ack;
   assign i_vmemc_req= t_kap_req & ~q_vmemc_ack;
   assign i_perou_req= t_kap_req & ~q_perou_ack;
   assign i_selou_req= t_kap_req & ~q_selou_ack;

   always @(posedge clk)
     q_selin_ack<=(i_selin_ack | ~i_selin_req) & ~t_kap_ack;
   always @(posedge clk)
     q_perin_ack<=(i_perin_ack | ~i_perin_req) & ~t_kap_ack;
   always @(posedge clk)
     q_vmemc_ack<=(i_vmemc_ack | ~i_vmemc_req) & ~t_kap_ack;
   always @(posedge clk)
     q_perou_ack<=(i_perou_ack | ~i_perou_req) & ~t_kap_ack;
   always @(posedge clk)
     q_selou_ack<=(i_selou_ack | ~i_selou_req) & ~t_kap_ack;

endmodule
