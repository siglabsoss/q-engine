

module funnel_dat_2_1 (
    input        [255:0] t_0_dat,
    input        [7:0] t_cfg_dat, // config

    output       [127:0] i_0_dat,
    input        [7:0] sel,
    output       [7:0] mode,
    input clk, reset_n
);

// controller
assign mode = t_cfg_dat;

// initial assignment

wire [127:0] dat0_0; assign dat0_0 = t_0_dat[127:0];
wire [127:0] dat0_1; assign dat0_1 = t_0_dat[255:128];


wire [127:0] dat1_0; assign dat1_0 = sel[0] ? dat0_1 : dat0_0;

assign i_0_dat = dat1_0;

endmodule
