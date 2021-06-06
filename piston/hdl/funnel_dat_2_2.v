

module funnel_dat_2_2 (
    input        [511:0] t_0_dat,
    input        [7:0] t_cfg_dat, // config

    output       [127:0] i_0_dat,
    output       [127:0] i_1_dat,
    input        [7:0] sel,
    output       [7:0] mode,
    input clk, reset_n
);

// controller
assign mode = t_cfg_dat;

// initial assignment

wire [127:0] dat0_0; assign dat0_0 = t_0_dat[127:0];
wire [127:0] dat0_1; assign dat0_1 = t_0_dat[255:128];
wire [127:0] dat0_2; assign dat0_2 = t_0_dat[383:256];
wire [127:0] dat0_3; assign dat0_3 = t_0_dat[511:384];


wire [127:0] dat1_0; assign dat1_0 = sel[0] ? dat0_2 : dat0_0;
wire [127:0] dat1_1; assign dat1_1 = sel[0] ? dat0_3 : dat0_1; assign i_1_dat = dat1_1;
wire [127:0] dat2_0; assign dat2_0 = sel[1] ? dat1_1 : dat1_0;

assign i_0_dat = dat2_0;

endmodule
