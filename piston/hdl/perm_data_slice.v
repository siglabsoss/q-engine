
module perm_data_slice (

    // stage 0
    input        [31:0] t0_dat,
    output wire [31:0] i0_dat,

    // stage 1
    input        [31:0] t1_dat,
    output wire [31:0] i1_dat,

    // stage 2
    input        [31:0] t2_dat,
    output wire [31:0] i2_dat,

    // stage 3
    input        [31:0] t3_dat,
    output wire [31:0] i3_dat,

    // stage 4
    input        [31:0] t4_dat,
    output wire [31:0] i4_dat,

    input sel1, sel2, sel3, sel4
);


    assign i0_dat = t0_dat;

    assign i1_dat = sel1 ? t1_dat : i0_dat;

    assign i2_dat = sel2 ? t2_dat : i1_dat;

    assign i3_dat = sel3 ? t3_dat : i2_dat;

    assign i4_dat = sel4 ? t4_dat : i3_dat;


endmodule
