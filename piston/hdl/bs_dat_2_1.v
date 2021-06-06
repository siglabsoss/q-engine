
module bs_dat_2_1 #(
    parameter T_0_DAT_WIDTH = 36,
    parameter I_0_DAT_WIDTH = 20
) (
    input        [T_0_DAT_WIDTH - 1 : 0] t_0_dat,
    input         [7:0] t_cfg_dat,
    output wire [I_0_DAT_WIDTH - 1 : 0] i_0_dat,
    input clk, reset_n
);

// Data processing
wire    [15:0] shift_data;   // shifted data
reg           pre_sat;      // preliminary saturation detection
reg           round_flag;   // rounding detection

wire  t_0_dat_sign;
assign t_0_dat_sign = t_0_dat[T_0_DAT_WIDTH-1];

wire  negative_flag; // if the number is negative and the saturation is positive
assign negative_flag = t_cfg_dat[6] & t_0_dat_sign;

assign shift_data = $signed(t_0_dat) >> t_cfg_dat[5:0];

always @*
    casez(t_cfg_dat[5:0])

        0    : pre_sat = ( ((t_0_dat[35:15] == 0) || (t_0_dat[35:15] == {21{1'b1}})) ? 1'b0 : 1'b1 );
        1    : pre_sat = ( ((t_0_dat[35:16] == 0) || (t_0_dat[35:16] == {20{1'b1}})) ? 1'b0 : 1'b1 );
        2    : pre_sat = ( ((t_0_dat[35:17] == 0) || (t_0_dat[35:17] == {19{1'b1}})) ? 1'b0 : 1'b1 );
        3    : pre_sat = ( ((t_0_dat[35:18] == 0) || (t_0_dat[35:18] == {18{1'b1}})) ? 1'b0 : 1'b1 );
        4    : pre_sat = ( ((t_0_dat[35:19] == 0) || (t_0_dat[35:19] == {17{1'b1}})) ? 1'b0 : 1'b1 );
        5    : pre_sat = ( ((t_0_dat[35:20] == 0) || (t_0_dat[35:20] == {16{1'b1}})) ? 1'b0 : 1'b1 );
        6    : pre_sat = ( ((t_0_dat[35:21] == 0) || (t_0_dat[35:21] == {15{1'b1}})) ? 1'b0 : 1'b1 );
        7    : pre_sat = ( ((t_0_dat[35:22] == 0) || (t_0_dat[35:22] == {14{1'b1}})) ? 1'b0 : 1'b1 );
        8    : pre_sat = ( ((t_0_dat[35:23] == 0) || (t_0_dat[35:23] == {13{1'b1}})) ? 1'b0 : 1'b1 );
        9    : pre_sat = ( ((t_0_dat[35:24] == 0) || (t_0_dat[35:24] == {12{1'b1}})) ? 1'b0 : 1'b1 );
        10    : pre_sat = ( ((t_0_dat[35:25] == 0) || (t_0_dat[35:25] == {11{1'b1}})) ? 1'b0 : 1'b1 );
        11    : pre_sat = ( ((t_0_dat[35:26] == 0) || (t_0_dat[35:26] == {10{1'b1}})) ? 1'b0 : 1'b1 );
        12    : pre_sat = ( ((t_0_dat[35:27] == 0) || (t_0_dat[35:27] == {9{1'b1}})) ? 1'b0 : 1'b1 );
        13    : pre_sat = ( ((t_0_dat[35:28] == 0) || (t_0_dat[35:28] == {8{1'b1}})) ? 1'b0 : 1'b1 );
        14    : pre_sat = ( ((t_0_dat[35:29] == 0) || (t_0_dat[35:29] == {7{1'b1}})) ? 1'b0 : 1'b1 );
        15    : pre_sat = ( ((t_0_dat[35:30] == 0) || (t_0_dat[35:30] == {6{1'b1}})) ? 1'b0 : 1'b1 );
        16    : pre_sat = ( ((t_0_dat[35:31] == 0) || (t_0_dat[35:31] == {5{1'b1}})) ? 1'b0 : 1'b1 );
        17    : pre_sat = ( ((t_0_dat[35:32] == 0) || (t_0_dat[35:32] == {4{1'b1}})) ? 1'b0 : 1'b1 );
        18    : pre_sat = ( ((t_0_dat[35:33] == 0) || (t_0_dat[35:33] == {3{1'b1}})) ? 1'b0 : 1'b1 );
        19    : pre_sat = ( ((t_0_dat[35:34] == 0) || (t_0_dat[35:34] == {2{1'b1}})) ? 1'b0 : 1'b1 );
        20-39 : pre_sat = 1'b0; // No saturation is possible becase of most significant part is in use
        default pre_sat = 1'bx; // Incorrect/unsupported control value
    endcase

// Rounding detection
always @*
    casez(t_cfg_dat[5:0])
        0     : round_flag = 1'b0;

        1     : round_flag = t_0_dat[0];
        2     : round_flag = t_0_dat[1];
        3     : round_flag = t_0_dat[2];
        4     : round_flag = t_0_dat[3];
        5     : round_flag = t_0_dat[4];
        6     : round_flag = t_0_dat[5];
        7     : round_flag = t_0_dat[6];
        8     : round_flag = t_0_dat[7];
        9     : round_flag = t_0_dat[8];
        10     : round_flag = t_0_dat[9];
        11     : round_flag = t_0_dat[10];
        12     : round_flag = t_0_dat[11];
        13     : round_flag = t_0_dat[12];
        14     : round_flag = t_0_dat[13];
        15     : round_flag = t_0_dat[14];
        16     : round_flag = t_0_dat[15];
        17     : round_flag = t_0_dat[16];
        18     : round_flag = t_0_dat[17];
        19     : round_flag = t_0_dat[18];
        20     : round_flag = t_0_dat[19];
        21     : round_flag = t_0_dat[20];
        22     : round_flag = t_0_dat[21];
        23     : round_flag = t_0_dat[22];
        24     : round_flag = t_0_dat[23];
        25     : round_flag = t_0_dat[24];
        26     : round_flag = t_0_dat[25];
        27     : round_flag = t_0_dat[26];
        28     : round_flag = t_0_dat[27];
        29     : round_flag = t_0_dat[28];
        30     : round_flag = t_0_dat[29];
        31     : round_flag = t_0_dat[30];
        32     : round_flag = t_0_dat[31];
        33     : round_flag = t_0_dat[32];
        34     : round_flag = t_0_dat[33];
        35    : round_flag = 1'b0;
        default round_flag = 1'bx; // Incorrect/unsupported control value
    endcase

   assign i_0_dat = {negative_flag,pre_sat,round_flag,t_0_dat_sign,shift_data};
   
   
endmodule
