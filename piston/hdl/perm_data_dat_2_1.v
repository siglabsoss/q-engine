

module perm_data_dat_2_1 (
    input        [511:0] t_data_dat,

    input        [ 63:0] t_addr_dat,

    output wire [511:0] i_data_dat,

    input clk, reset_n
);

// cross links

wire [31:0] dat_0_8;
wire [31:0] dat_0_4;
wire [31:0] dat_0_2;
wire [31:0] dat_0_1;
wire [31:0] dat_1_9;
wire [31:0] dat_1_5;
wire [31:0] dat_1_3;
wire [31:0] dat_1_0;
wire [31:0] dat_2_10;
wire [31:0] dat_2_6;
wire [31:0] dat_2_0;
wire [31:0] dat_2_3;
wire [31:0] dat_3_11;
wire [31:0] dat_3_7;
wire [31:0] dat_3_1;
wire [31:0] dat_3_2;
wire [31:0] dat_4_12;
wire [31:0] dat_4_0;
wire [31:0] dat_4_6;
wire [31:0] dat_4_5;
wire [31:0] dat_5_13;
wire [31:0] dat_5_1;
wire [31:0] dat_5_7;
wire [31:0] dat_5_4;
wire [31:0] dat_6_14;
wire [31:0] dat_6_2;
wire [31:0] dat_6_4;
wire [31:0] dat_6_7;
wire [31:0] dat_7_15;
wire [31:0] dat_7_3;
wire [31:0] dat_7_5;
wire [31:0] dat_7_6;
wire [31:0] dat_8_0;
wire [31:0] dat_8_12;
wire [31:0] dat_8_10;
wire [31:0] dat_8_9;
wire [31:0] dat_9_1;
wire [31:0] dat_9_13;
wire [31:0] dat_9_11;
wire [31:0] dat_9_8;
wire [31:0] dat_10_2;
wire [31:0] dat_10_14;
wire [31:0] dat_10_8;
wire [31:0] dat_10_11;
wire [31:0] dat_11_3;
wire [31:0] dat_11_15;
wire [31:0] dat_11_9;
wire [31:0] dat_11_10;
wire [31:0] dat_12_4;
wire [31:0] dat_12_8;
wire [31:0] dat_12_14;
wire [31:0] dat_12_13;
wire [31:0] dat_13_5;
wire [31:0] dat_13_9;
wire [31:0] dat_13_15;
wire [31:0] dat_13_12;
wire [31:0] dat_14_6;
wire [31:0] dat_14_10;
wire [31:0] dat_14_12;
wire [31:0] dat_14_15;
wire [31:0] dat_15_7;
wire [31:0] dat_15_11;
wire [31:0] dat_15_13;
wire [31:0] dat_15_14;


wire [31:0] res0;
wire [31:0] res1;
wire [31:0] res2;
wire [31:0] res3;
wire [31:0] res4;
wire [31:0] res5;
wire [31:0] res6;
wire [31:0] res7;
wire [31:0] res8;
wire [31:0] res9;
wire [31:0] res10;
wire [31:0] res11;
wire [31:0] res12;
wire [31:0] res13;
wire [31:0] res14;
wire [31:0] res15;


// Slice 0
perm_data_slice u0 (


    .i0_dat(dat_0_8),
    .i1_dat(dat_0_4),
    .i2_dat(dat_0_2),
    .i3_dat(dat_0_1),
    .i4_dat(res0),


    .t1_dat(dat_8_0),
    .t2_dat(dat_4_0),
    .t3_dat(dat_2_0),
    .t4_dat(dat_1_0),

    .sel1(t_addr_dat[0]),
    .sel2(t_addr_dat[1]),
    .sel3(t_addr_dat[2]),
    .sel4(t_addr_dat[3]),

    .t0_dat(t_data_dat[31:0])
);

// Slice 1
perm_data_slice u1 (


    .i0_dat(dat_1_9),
    .i1_dat(dat_1_5),
    .i2_dat(dat_1_3),
    .i3_dat(dat_1_0),
    .i4_dat(res1),


    .t1_dat(dat_9_1),
    .t2_dat(dat_5_1),
    .t3_dat(dat_3_1),
    .t4_dat(dat_0_1),

    .sel1(t_addr_dat[4]),
    .sel2(t_addr_dat[5]),
    .sel3(t_addr_dat[6]),
    .sel4(t_addr_dat[7]),

    .t0_dat(t_data_dat[63:32])
);

// Slice 2
perm_data_slice u2 (


    .i0_dat(dat_2_10),
    .i1_dat(dat_2_6),
    .i2_dat(dat_2_0),
    .i3_dat(dat_2_3),
    .i4_dat(res2),


    .t1_dat(dat_10_2),
    .t2_dat(dat_6_2),
    .t3_dat(dat_0_2),
    .t4_dat(dat_3_2),

    .sel1(t_addr_dat[8]),
    .sel2(t_addr_dat[9]),
    .sel3(t_addr_dat[10]),
    .sel4(t_addr_dat[11]),

    .t0_dat(t_data_dat[95:64])
);

// Slice 3
perm_data_slice u3 (


    .i0_dat(dat_3_11),
    .i1_dat(dat_3_7),
    .i2_dat(dat_3_1),
    .i3_dat(dat_3_2),
    .i4_dat(res3),


    .t1_dat(dat_11_3),
    .t2_dat(dat_7_3),
    .t3_dat(dat_1_3),
    .t4_dat(dat_2_3),

    .sel1(t_addr_dat[12]),
    .sel2(t_addr_dat[13]),
    .sel3(t_addr_dat[14]),
    .sel4(t_addr_dat[15]),

    .t0_dat(t_data_dat[127:96])
);

// Slice 4
perm_data_slice u4 (


    .i0_dat(dat_4_12),
    .i1_dat(dat_4_0),
    .i2_dat(dat_4_6),
    .i3_dat(dat_4_5),
    .i4_dat(res4),


    .t1_dat(dat_12_4),
    .t2_dat(dat_0_4),
    .t3_dat(dat_6_4),
    .t4_dat(dat_5_4),

    .sel1(t_addr_dat[16]),
    .sel2(t_addr_dat[17]),
    .sel3(t_addr_dat[18]),
    .sel4(t_addr_dat[19]),

    .t0_dat(t_data_dat[159:128])
);

// Slice 5
perm_data_slice u5 (


    .i0_dat(dat_5_13),
    .i1_dat(dat_5_1),
    .i2_dat(dat_5_7),
    .i3_dat(dat_5_4),
    .i4_dat(res5),


    .t1_dat(dat_13_5),
    .t2_dat(dat_1_5),
    .t3_dat(dat_7_5),
    .t4_dat(dat_4_5),

    .sel1(t_addr_dat[20]),
    .sel2(t_addr_dat[21]),
    .sel3(t_addr_dat[22]),
    .sel4(t_addr_dat[23]),

    .t0_dat(t_data_dat[191:160])
);

// Slice 6
perm_data_slice u6 (


    .i0_dat(dat_6_14),
    .i1_dat(dat_6_2),
    .i2_dat(dat_6_4),
    .i3_dat(dat_6_7),
    .i4_dat(res6),


    .t1_dat(dat_14_6),
    .t2_dat(dat_2_6),
    .t3_dat(dat_4_6),
    .t4_dat(dat_7_6),

    .sel1(t_addr_dat[24]),
    .sel2(t_addr_dat[25]),
    .sel3(t_addr_dat[26]),
    .sel4(t_addr_dat[27]),

    .t0_dat(t_data_dat[223:192])
);

// Slice 7
perm_data_slice u7 (


    .i0_dat(dat_7_15),
    .i1_dat(dat_7_3),
    .i2_dat(dat_7_5),
    .i3_dat(dat_7_6),
    .i4_dat(res7),


    .t1_dat(dat_15_7),
    .t2_dat(dat_3_7),
    .t3_dat(dat_5_7),
    .t4_dat(dat_6_7),

    .sel1(t_addr_dat[28]),
    .sel2(t_addr_dat[29]),
    .sel3(t_addr_dat[30]),
    .sel4(t_addr_dat[31]),

    .t0_dat(t_data_dat[255:224])
);

// Slice 8
perm_data_slice u8 (


    .i0_dat(dat_8_0),
    .i1_dat(dat_8_12),
    .i2_dat(dat_8_10),
    .i3_dat(dat_8_9),
    .i4_dat(res8),


    .t1_dat(dat_0_8),
    .t2_dat(dat_12_8),
    .t3_dat(dat_10_8),
    .t4_dat(dat_9_8),

    .sel1(t_addr_dat[32]),
    .sel2(t_addr_dat[33]),
    .sel3(t_addr_dat[34]),
    .sel4(t_addr_dat[35]),

    .t0_dat(t_data_dat[287:256])
);

// Slice 9
perm_data_slice u9 (


    .i0_dat(dat_9_1),
    .i1_dat(dat_9_13),
    .i2_dat(dat_9_11),
    .i3_dat(dat_9_8),
    .i4_dat(res9),


    .t1_dat(dat_1_9),
    .t2_dat(dat_13_9),
    .t3_dat(dat_11_9),
    .t4_dat(dat_8_9),

    .sel1(t_addr_dat[36]),
    .sel2(t_addr_dat[37]),
    .sel3(t_addr_dat[38]),
    .sel4(t_addr_dat[39]),

    .t0_dat(t_data_dat[319:288])
);

// Slice 10
perm_data_slice u10 (


    .i0_dat(dat_10_2),
    .i1_dat(dat_10_14),
    .i2_dat(dat_10_8),
    .i3_dat(dat_10_11),
    .i4_dat(res10),


    .t1_dat(dat_2_10),
    .t2_dat(dat_14_10),
    .t3_dat(dat_8_10),
    .t4_dat(dat_11_10),

    .sel1(t_addr_dat[40]),
    .sel2(t_addr_dat[41]),
    .sel3(t_addr_dat[42]),
    .sel4(t_addr_dat[43]),

    .t0_dat(t_data_dat[351:320])
);

// Slice 11
perm_data_slice u11 (


    .i0_dat(dat_11_3),
    .i1_dat(dat_11_15),
    .i2_dat(dat_11_9),
    .i3_dat(dat_11_10),
    .i4_dat(res11),


    .t1_dat(dat_3_11),
    .t2_dat(dat_15_11),
    .t3_dat(dat_9_11),
    .t4_dat(dat_10_11),

    .sel1(t_addr_dat[44]),
    .sel2(t_addr_dat[45]),
    .sel3(t_addr_dat[46]),
    .sel4(t_addr_dat[47]),

    .t0_dat(t_data_dat[383:352])
);

// Slice 12
perm_data_slice u12 (


    .i0_dat(dat_12_4),
    .i1_dat(dat_12_8),
    .i2_dat(dat_12_14),
    .i3_dat(dat_12_13),
    .i4_dat(res12),


    .t1_dat(dat_4_12),
    .t2_dat(dat_8_12),
    .t3_dat(dat_14_12),
    .t4_dat(dat_13_12),

    .sel1(t_addr_dat[48]),
    .sel2(t_addr_dat[49]),
    .sel3(t_addr_dat[50]),
    .sel4(t_addr_dat[51]),

    .t0_dat(t_data_dat[415:384])
);

// Slice 13
perm_data_slice u13 (


    .i0_dat(dat_13_5),
    .i1_dat(dat_13_9),
    .i2_dat(dat_13_15),
    .i3_dat(dat_13_12),
    .i4_dat(res13),


    .t1_dat(dat_5_13),
    .t2_dat(dat_9_13),
    .t3_dat(dat_15_13),
    .t4_dat(dat_12_13),

    .sel1(t_addr_dat[52]),
    .sel2(t_addr_dat[53]),
    .sel3(t_addr_dat[54]),
    .sel4(t_addr_dat[55]),

    .t0_dat(t_data_dat[447:416])
);

// Slice 14
perm_data_slice u14 (


    .i0_dat(dat_14_6),
    .i1_dat(dat_14_10),
    .i2_dat(dat_14_12),
    .i3_dat(dat_14_15),
    .i4_dat(res14),


    .t1_dat(dat_6_14),
    .t2_dat(dat_10_14),
    .t3_dat(dat_12_14),
    .t4_dat(dat_15_14),

    .sel1(t_addr_dat[56]),
    .sel2(t_addr_dat[57]),
    .sel3(t_addr_dat[58]),
    .sel4(t_addr_dat[59]),

    .t0_dat(t_data_dat[479:448])
);

// Slice 15
perm_data_slice u15 (


    .i0_dat(dat_15_7),
    .i1_dat(dat_15_11),
    .i2_dat(dat_15_13),
    .i3_dat(dat_15_14),
    .i4_dat(res15),


    .t1_dat(dat_7_15),
    .t2_dat(dat_11_15),
    .t3_dat(dat_13_15),
    .t4_dat(dat_14_15),

    .sel1(t_addr_dat[60]),
    .sel2(t_addr_dat[61]),
    .sel3(t_addr_dat[62]),
    .sel4(t_addr_dat[63]),

    .t0_dat(t_data_dat[511:480])
);


assign i_data_dat = {res15, res14, res13, res12, res11, res10, res9, res8, res7, res6, res5, res4, res3, res2, res1, res0};

endmodule
