

// 1

module defunnel_dat_2_1 (

    input        [127:0] t_0_dat,
    input        [7:0] t_cfg_dat, // config
    output       [255:0] i_0_dat,
    input        [7:0] enable,
    output       [7:0] mode,
    input clk, reset_n
);

assign mode = t_cfg_dat;

wire [0:0] reduct; assign reduct = mode[0:0];

// form reduct  sel
// 4:8  4       011
// 2:8  2       001
// 1:8  1       000

wire [0:0] sel; assign sel = reduct - 1'b1;


wire [127:0] dat0_0; assign dat0_0 = t_0_dat;
wire [127:0] dat0_1; assign dat0_1 = 0;


wire [127:0] dat1_0; assign dat1_0 = dat0_0;
wire [127:0] dat1_1; assign dat1_1 = sel[0] ? dat0_1 : dat0_0;


// final flops

reg [127:0] dat0; always @(posedge clk) if (enable[0]) dat0 <= dat1_0;
reg [127:0] dat1; always @(posedge clk) if (enable[1]) dat1 <= dat1_1;
//

// final concatination
assign i_0_dat = {dat1, dat0};

endmodule
