
module p_decode_dat_1_2 (
    input [67:0] t_kp_dat,
    output wire [63:0] 	i_p_sk_dat,
    output wire [63:0] 	i_p_lk_dat,
    output wire [3:0] 			k_ctrl,
    input 						clk, reset_n
);

   assign i_p_sk_dat=t_kp_dat[63:0];
   assign i_p_lk_dat=t_kp_dat[63:0];

   assign k_ctrl=t_kp_dat[67:64];

endmodule
