module inmux_dat_4_1 (

    input wire       [511:0] t_k1_dat,

    input wire       [511:0] t_k13_dat,

    input wire       [511:0] t_k15_dat,


    input wire          [3:0] t_c_dat,

    output reg [511:0] i_inmux_dat,

    output wire [3:0] sel,
    input  wire               clk, reset_n
);

  assign sel=t_c_dat;

// data
always @(*)
    case(t_c_dat) 
        1 :     i_inmux_dat = t_k1_dat;
        5 :     i_inmux_dat = t_k13_dat;
        7 :     i_inmux_dat = t_k15_dat;
        default i_inmux_dat = 'bx;
    endcase

endmodule
