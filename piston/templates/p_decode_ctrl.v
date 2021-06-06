<%
const range = require('lodash.range');
%>
module p_decode_ctrl_${local[0]}_${local[1]} (
    input 	t_kp_req,
    output wire t_kp_ack,
    output wire	i_p_sk_req,
    input wire  i_p_sk_ack, 
    output wire	i_p_lk_req,
    input wire  i_p_lk_ack, 

    input wire [<%= law.selou-1 %>:0] k_ctrl,
    input 	clk, reset_n
);

   reg 		q_p_sk_ack;
   reg 		q_p_lk_ack;

   assign t_kp_ack= (i_p_sk_ack | ~i_p_sk_req) & (i_p_lk_ack | ~i_p_lk_req);

   assign i_p_sk_req= t_kp_req & (k_ctrl<8) & ~q_p_sk_ack;
   assign i_p_lk_req= t_kp_req & (k_ctrl>=8) & ~q_p_lk_ack;

   always @(posedge clk)
     q_p_sk_ack<=(i_p_sk_ack | ~i_p_sk_req) & ~t_kp_ack;
   always @(posedge clk)
     q_p_lk_ack<=(i_p_lk_ack | ~i_p_lk_req) & ~t_kp_ack;
			 

endmodule
