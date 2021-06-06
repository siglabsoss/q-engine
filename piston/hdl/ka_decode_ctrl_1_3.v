
module ka_decode_ctrl_1_3 (
    input 	t_ka_req,
    output wire t_ka_ack,
    output wire	  i_k_sk_req,
    input         i_k_sk_ack,					     
    output wire   i_k_lk_req,
    input         i_k_lk_ack,					     
    output wire   i_ka_req,
    input wire    i_ka_ack,
    input wire [3:0] k_ctrl,					     
    input 	clk, reset_n
);

   reg 		q_k_sk_ack;
   reg 		q_k_lk_ack;
   reg 		q_ka_ack;

   assign t_ka_ack=(i_k_sk_ack | ~i_k_sk_req) & (i_k_lk_ack | ~i_k_lk_req) & (i_ka_ack | ~i_ka_req);

   assign i_k_sk_req= t_ka_req & (k_ctrl<8) & ~q_k_sk_ack;
   assign i_k_lk_req= t_ka_req & (k_ctrl>=8) & ~q_k_lk_ack;
   assign i_ka_req=    t_ka_req & ~q_ka_ack;

   always @(posedge clk)
     q_k_sk_ack<=(i_k_sk_ack | ~i_k_sk_req) & ~t_ka_ack;
   always @(posedge clk)
     q_k_lk_ack<=(i_k_lk_ack | ~i_k_lk_req) & ~t_ka_ack;
   always @(posedge clk)
     q_ka_ack<=(i_ka_ack | ~i_ka_req) & ~t_ka_ack;

endmodule
