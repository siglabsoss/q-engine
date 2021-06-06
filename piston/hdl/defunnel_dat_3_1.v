

// 2

module defunnel_dat_3_1 (

    input        [127:0] t_0_dat,
    input        [127:0] t_1_dat,
    input        [7:0] t_cfg_dat, // config
    output       [511:0] i_0_dat,
    input        [7:0] enable,
    output       [7:0] mode,
    input clk, reset_n
);

assign mode = t_cfg_dat;

wire [1:0] reduct; assign reduct = mode[1:0];

// form reduct  sel
// 4:8  4       011
// 2:8  2       001
// 1:8  1       000

wire [1:0] sel; assign sel = reduct - 2'b1;


wire [127:0] dat0_0; assign dat0_0 = t_0_dat;
wire [127:0] dat0_1; assign dat0_1 = t_1_dat;
wire [127:0] dat0_2; assign dat0_2 = 0;
wire [127:0] dat0_3; assign dat0_3 = 0;


wire [127:0] dat1_0; assign dat1_0 = dat0_0;
wire [127:0] dat1_1; assign dat1_1 = sel[0] ? dat0_1 : dat0_0;
wire [127:0] dat1_2; assign dat1_2 = dat0_2;
wire [127:0] dat1_3; assign dat1_3 = dat0_3;
wire [127:0] dat2_0; assign dat2_0 = dat1_0;
wire [127:0] dat2_1; assign dat2_1 = dat1_1;
wire [127:0] dat2_2; assign dat2_2 = sel[1] ? dat1_2 : dat1_0;
wire [127:0] dat2_3; assign dat2_3 = sel[1] ? dat1_3 : dat1_1;


// final flops

reg [127:0] dat0; always @(posedge clk) if (enable[0]) dat0 <= dat2_0;
reg [127:0] dat1; always @(posedge clk) if (enable[1]) dat1 <= dat2_1;
reg [127:0] dat2; always @(posedge clk) if (enable[2]) dat2 <= dat2_2;
reg [127:0] dat3; always @(posedge clk) if (enable[3]) dat3 <= dat2_3;
//

// final concatination
assign i_0_dat = {dat3, dat2, dat1, dat0};

endmodule
