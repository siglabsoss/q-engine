module rdp_systolic_dat_5_2 (

    input        [511:0] t_k8_dat,

    input        [511:0] t_k9_dat,

    input        [511:0] t_k10_dat,

    input        [511:0] t_k11_dat,

    input        [511:0] t_c_dat,


    output wire [511:0] i_k1_dat,

    output wire [511:0] i_k2_dat,

    input  clk, reset_n
);

// data
assign i_k1_dat = t_k8_dat ^ t_k9_dat ^ t_c_dat;
assign i_k2_dat = t_k10_dat ^ t_k11_dat ^ t_c_dat;

endmodule
