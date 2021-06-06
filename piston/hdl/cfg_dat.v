

module cfg_dat_ (
    input        [511:0] t_0_dat,

    output       [7:0] i_0_dat,

    output       [7:0] i_1_dat,

    output       [7:0] i_2_dat,

    output       [7:0] i_3_dat,

    output       [7:0] i_4_dat,

    output       [7:0] i_5_dat,

    output       [7:0] i_6_dat,

    output       [7:0] i_7_dat,

    output       [7:0] i_8_dat,

    output       [7:0] i_9_dat,

    output       [7:0] i_10_dat,

    input clk, reset_n
);

assign {i_0_dat, i_1_dat, i_2_dat, i_3_dat, i_4_dat, i_5_dat, i_6_dat, i_7_dat, i_8_dat, i_9_dat, i_10_dat} = t_0_dat;

endmodule
