

module funnel_dat_2_4 (
    input        [1023:0] t_0_dat,
    input        [7:0] t_cfg_dat, // config

    output       [127:0] i_0_dat,
    output       [127:0] i_1_dat,
    output       [127:0] i_2_dat,
    output       [127:0] i_3_dat,
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
wire [127:0] dat0_4; assign dat0_4 = t_0_dat[639:512];
wire [127:0] dat0_5; assign dat0_5 = t_0_dat[767:640];
wire [127:0] dat0_6; assign dat0_6 = t_0_dat[895:768];
wire [127:0] dat0_7; assign dat0_7 = t_0_dat[1023:896];


wire [127:0] dat1_0; assign dat1_0 = sel[0] ? dat0_4 : dat0_0;
wire [127:0] dat1_1; assign dat1_1 = sel[0] ? dat0_5 : dat0_1;
wire [127:0] dat1_2; assign dat1_2 = sel[0] ? dat0_6 : dat0_2; assign i_2_dat = dat1_2;
wire [127:0] dat1_3; assign dat1_3 = sel[0] ? dat0_7 : dat0_3; assign i_3_dat = dat1_3;
wire [127:0] dat2_0; assign dat2_0 = sel[1] ? dat1_2 : dat1_0;
wire [127:0] dat2_1; assign dat2_1 = sel[1] ? dat1_3 : dat1_1; assign i_1_dat = dat2_1;
wire [127:0] dat3_0; assign dat3_0 = sel[2] ? dat2_1 : dat2_0;

assign i_0_dat = dat3_0;

endmodule
