
module ka_decode_dat_1_3 (
    input [195:0]       t_ka_dat,
    output wire [3:0] 		      i_k_sk_dat,
    output wire [3:0] 		      i_k_lk_dat,
    output wire [195:0] i_ka_dat,
    output wire [3:0]                       k_ctrl,
    input 						      clk, reset_n
);

   assign i_k_sk_dat=t_ka_dat[195:192];
   assign i_k_lk_dat=t_ka_dat[195:192];
   assign i_ka_dat=t_ka_dat;
   
   assign k_ctrl=t_ka_dat[195:192];
   
endmodule
