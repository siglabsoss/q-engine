
module round_sat_dat_1_1 #(
    parameter T_0_DAT_WIDTH = 20,
    parameter I_0_DAT_WIDTH = 16
) (
    input        [T_0_DAT_WIDTH - 1 : 0] t_0_dat,
    output reg [I_0_DAT_WIDTH - 1 : 0] i_0_dat,
    input clk, reset_n
);

// Data processing
wire    [15:0] shift_data;   // shifted data
wire           pre_sat;      // preliminary saturation detection
wire           round_flag;   // rounding detection
wire    [16:0] rounded_data; // rounded data


wire  t_0_dat_sign;
assign t_0_dat_sign = t_0_dat[T_0_DAT_WIDTH-4];

wire  negative_flag; // if the number is negative and the saturation is positive
assign negative_flag = t_0_dat[T_0_DAT_WIDTH-1];

assign shift_data = t_0_dat[T_0_DAT_WIDTH-5:0];

assign pre_sat = t_0_dat[T_0_DAT_WIDTH-2];

assign round_flag = t_0_dat[T_0_DAT_WIDTH-3];

// Rounding process
assign rounded_data = {shift_data[15], shift_data} + { 16'h0000, round_flag};

// Saturation process
always @*
    if(negative_flag)
        i_0_dat = 0;
    else
        if ((pre_sat == 1'b1) || (rounded_data[16] != rounded_data[15]))
            i_0_dat = { {I_0_DAT_WIDTH - 15{t_0_dat_sign}}, {15{~t_0_dat_sign}} };
        else
            i_0_dat = { {I_0_DAT_WIDTH - 16{rounded_data[15]}}, rounded_data[15:0]};
   

endmodule
