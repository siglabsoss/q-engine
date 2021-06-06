

module iperm_dat_2_1 (
    input  wire      [511:0] t_dat_dat,

    input  wire      [  67:0] t_kp_dat,

    output wire [511:0] i_dat_dat,

    output wire [3:0] k_ctrl,

    input wire clk, reset_n
);

  assign k_ctrl=t_kp_dat[67:64];


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


wire [0:0] adr_0_4;
wire [1:0] adr_0_2;
wire [2:0] adr_0_1;
wire [0:0] adr_1_5;
wire [1:0] adr_1_3;
wire [2:0] adr_1_0;
wire [0:0] adr_2_6;
wire [1:0] adr_2_0;
wire [2:0] adr_2_3;
wire [0:0] adr_3_7;
wire [1:0] adr_3_1;
wire [2:0] adr_3_2;
wire [0:0] adr_4_0;
wire [1:0] adr_4_6;
wire [2:0] adr_4_5;
wire [0:0] adr_5_1;
wire [1:0] adr_5_7;
wire [2:0] adr_5_4;
wire [0:0] adr_6_2;
wire [1:0] adr_6_4;
wire [2:0] adr_6_7;
wire [0:0] adr_7_3;
wire [1:0] adr_7_5;
wire [2:0] adr_7_6;
wire [0:0] adr_8_12;
wire [1:0] adr_8_10;
wire [2:0] adr_8_9;
wire [0:0] adr_9_13;
wire [1:0] adr_9_11;
wire [2:0] adr_9_8;
wire [0:0] adr_10_14;
wire [1:0] adr_10_8;
wire [2:0] adr_10_11;
wire [0:0] adr_11_15;
wire [1:0] adr_11_9;
wire [2:0] adr_11_10;
wire [0:0] adr_12_8;
wire [1:0] adr_12_14;
wire [2:0] adr_12_13;
wire [0:0] adr_13_9;
wire [1:0] adr_13_15;
wire [2:0] adr_13_12;
wire [0:0] adr_14_10;
wire [1:0] adr_14_12;
wire [2:0] adr_14_15;
wire [0:0] adr_15_11;
wire [1:0] adr_15_13;
wire [2:0] adr_15_14;


// Slice 0
permutator_slice u0 (


    .i0_dat(dat_0_8),
    .i1_dat(dat_0_4),
    .i2_dat(dat_0_2),
    .i3_dat(dat_0_1),
    .i4_dat(res0),

    .t0_dat(t_dat_dat[31:0]),

    .t1_dat(dat_8_0),
    .t2_dat(dat_4_0),
    .t3_dat(dat_2_0),
    .t4_dat(dat_1_0),


    .i1_adr(adr_0_4),
    .i2_adr(adr_0_2),
    .i3_adr(adr_0_1),
    .i4_adr(t_kp_dat[3:0]),


    .t2_adr(adr_4_0),
    .t3_adr(adr_2_0),
    .t4_adr(adr_1_0),


    .cfg(4'd0)
);

// Slice 1
permutator_slice u1 (


    .i0_dat(dat_1_9),
    .i1_dat(dat_1_5),
    .i2_dat(dat_1_3),
    .i3_dat(dat_1_0),
    .i4_dat(res1),

    .t0_dat(t_dat_dat[63:32]),

    .t1_dat(dat_9_1),
    .t2_dat(dat_5_1),
    .t3_dat(dat_3_1),
    .t4_dat(dat_0_1),


    .i1_adr(adr_1_5),
    .i2_adr(adr_1_3),
    .i3_adr(adr_1_0),
    .i4_adr(t_kp_dat[7:4]),


    .t2_adr(adr_5_1),
    .t3_adr(adr_3_1),
    .t4_adr(adr_0_1),


    .cfg(4'd1)
);

// Slice 2
permutator_slice u2 (


    .i0_dat(dat_2_10),
    .i1_dat(dat_2_6),
    .i2_dat(dat_2_0),
    .i3_dat(dat_2_3),
    .i4_dat(res2),

    .t0_dat(t_dat_dat[95:64]),

    .t1_dat(dat_10_2),
    .t2_dat(dat_6_2),
    .t3_dat(dat_0_2),
    .t4_dat(dat_3_2),


    .i1_adr(adr_2_6),
    .i2_adr(adr_2_0),
    .i3_adr(adr_2_3),
    .i4_adr(t_kp_dat[11:8]),


    .t2_adr(adr_6_2),
    .t3_adr(adr_0_2),
    .t4_adr(adr_3_2),


    .cfg(4'd2)
);

// Slice 3
permutator_slice u3 (


    .i0_dat(dat_3_11),
    .i1_dat(dat_3_7),
    .i2_dat(dat_3_1),
    .i3_dat(dat_3_2),
    .i4_dat(res3),

    .t0_dat(t_dat_dat[127:96]),

    .t1_dat(dat_11_3),
    .t2_dat(dat_7_3),
    .t3_dat(dat_1_3),
    .t4_dat(dat_2_3),


    .i1_adr(adr_3_7),
    .i2_adr(adr_3_1),
    .i3_adr(adr_3_2),
    .i4_adr(t_kp_dat[15:12]),


    .t2_adr(adr_7_3),
    .t3_adr(adr_1_3),
    .t4_adr(adr_2_3),


    .cfg(4'd3)
);

// Slice 4
permutator_slice u4 (


    .i0_dat(dat_4_12),
    .i1_dat(dat_4_0),
    .i2_dat(dat_4_6),
    .i3_dat(dat_4_5),
    .i4_dat(res4),

    .t0_dat(t_dat_dat[159:128]),

    .t1_dat(dat_12_4),
    .t2_dat(dat_0_4),
    .t3_dat(dat_6_4),
    .t4_dat(dat_5_4),


    .i1_adr(adr_4_0),
    .i2_adr(adr_4_6),
    .i3_adr(adr_4_5),
    .i4_adr(t_kp_dat[19:16]),


    .t2_adr(adr_0_4),
    .t3_adr(adr_6_4),
    .t4_adr(adr_5_4),


    .cfg(4'd4)
);

// Slice 5
permutator_slice u5 (


    .i0_dat(dat_5_13),
    .i1_dat(dat_5_1),
    .i2_dat(dat_5_7),
    .i3_dat(dat_5_4),
    .i4_dat(res5),

    .t0_dat(t_dat_dat[191:160]),

    .t1_dat(dat_13_5),
    .t2_dat(dat_1_5),
    .t3_dat(dat_7_5),
    .t4_dat(dat_4_5),


    .i1_adr(adr_5_1),
    .i2_adr(adr_5_7),
    .i3_adr(adr_5_4),
    .i4_adr(t_kp_dat[23:20]),


    .t2_adr(adr_1_5),
    .t3_adr(adr_7_5),
    .t4_adr(adr_4_5),


    .cfg(4'd5)
);

// Slice 6
permutator_slice u6 (


    .i0_dat(dat_6_14),
    .i1_dat(dat_6_2),
    .i2_dat(dat_6_4),
    .i3_dat(dat_6_7),
    .i4_dat(res6),

    .t0_dat(t_dat_dat[223:192]),

    .t1_dat(dat_14_6),
    .t2_dat(dat_2_6),
    .t3_dat(dat_4_6),
    .t4_dat(dat_7_6),


    .i1_adr(adr_6_2),
    .i2_adr(adr_6_4),
    .i3_adr(adr_6_7),
    .i4_adr(t_kp_dat[27:24]),


    .t2_adr(adr_2_6),
    .t3_adr(adr_4_6),
    .t4_adr(adr_7_6),


    .cfg(4'd6)
);

// Slice 7
permutator_slice u7 (


    .i0_dat(dat_7_15),
    .i1_dat(dat_7_3),
    .i2_dat(dat_7_5),
    .i3_dat(dat_7_6),
    .i4_dat(res7),

    .t0_dat(t_dat_dat[255:224]),

    .t1_dat(dat_15_7),
    .t2_dat(dat_3_7),
    .t3_dat(dat_5_7),
    .t4_dat(dat_6_7),


    .i1_adr(adr_7_3),
    .i2_adr(adr_7_5),
    .i3_adr(adr_7_6),
    .i4_adr(t_kp_dat[31:28]),


    .t2_adr(adr_3_7),
    .t3_adr(adr_5_7),
    .t4_adr(adr_6_7),


    .cfg(4'd7)
);

// Slice 8
permutator_slice u8 (


    .i0_dat(dat_8_0),
    .i1_dat(dat_8_12),
    .i2_dat(dat_8_10),
    .i3_dat(dat_8_9),
    .i4_dat(res8),

    .t0_dat(t_dat_dat[287:256]),

    .t1_dat(dat_0_8),
    .t2_dat(dat_12_8),
    .t3_dat(dat_10_8),
    .t4_dat(dat_9_8),


    .i1_adr(adr_8_12),
    .i2_adr(adr_8_10),
    .i3_adr(adr_8_9),
    .i4_adr(t_kp_dat[35:32]),


    .t2_adr(adr_12_8),
    .t3_adr(adr_10_8),
    .t4_adr(adr_9_8),


    .cfg(4'd8)
);

// Slice 9
permutator_slice u9 (


    .i0_dat(dat_9_1),
    .i1_dat(dat_9_13),
    .i2_dat(dat_9_11),
    .i3_dat(dat_9_8),
    .i4_dat(res9),

    .t0_dat(t_dat_dat[319:288]),

    .t1_dat(dat_1_9),
    .t2_dat(dat_13_9),
    .t3_dat(dat_11_9),
    .t4_dat(dat_8_9),


    .i1_adr(adr_9_13),
    .i2_adr(adr_9_11),
    .i3_adr(adr_9_8),
    .i4_adr(t_kp_dat[39:36]),


    .t2_adr(adr_13_9),
    .t3_adr(adr_11_9),
    .t4_adr(adr_8_9),


    .cfg(4'd9)
);

// Slice 10
permutator_slice u10 (


    .i0_dat(dat_10_2),
    .i1_dat(dat_10_14),
    .i2_dat(dat_10_8),
    .i3_dat(dat_10_11),
    .i4_dat(res10),

    .t0_dat(t_dat_dat[351:320]),

    .t1_dat(dat_2_10),
    .t2_dat(dat_14_10),
    .t3_dat(dat_8_10),
    .t4_dat(dat_11_10),


    .i1_adr(adr_10_14),
    .i2_adr(adr_10_8),
    .i3_adr(adr_10_11),
    .i4_adr(t_kp_dat[43:40]),


    .t2_adr(adr_14_10),
    .t3_adr(adr_8_10),
    .t4_adr(adr_11_10),


    .cfg(4'd10)
);

// Slice 11
permutator_slice u11 (


    .i0_dat(dat_11_3),
    .i1_dat(dat_11_15),
    .i2_dat(dat_11_9),
    .i3_dat(dat_11_10),
    .i4_dat(res11),

    .t0_dat(t_dat_dat[383:352]),

    .t1_dat(dat_3_11),
    .t2_dat(dat_15_11),
    .t3_dat(dat_9_11),
    .t4_dat(dat_10_11),


    .i1_adr(adr_11_15),
    .i2_adr(adr_11_9),
    .i3_adr(adr_11_10),
    .i4_adr(t_kp_dat[47:44]),


    .t2_adr(adr_15_11),
    .t3_adr(adr_9_11),
    .t4_adr(adr_10_11),


    .cfg(4'd11)
);

// Slice 12
permutator_slice u12 (


    .i0_dat(dat_12_4),
    .i1_dat(dat_12_8),
    .i2_dat(dat_12_14),
    .i3_dat(dat_12_13),
    .i4_dat(res12),

    .t0_dat(t_dat_dat[415:384]),

    .t1_dat(dat_4_12),
    .t2_dat(dat_8_12),
    .t3_dat(dat_14_12),
    .t4_dat(dat_13_12),


    .i1_adr(adr_12_8),
    .i2_adr(adr_12_14),
    .i3_adr(adr_12_13),
    .i4_adr(t_kp_dat[51:48]),


    .t2_adr(adr_8_12),
    .t3_adr(adr_14_12),
    .t4_adr(adr_13_12),


    .cfg(4'd12)
);

// Slice 13
permutator_slice u13 (


    .i0_dat(dat_13_5),
    .i1_dat(dat_13_9),
    .i2_dat(dat_13_15),
    .i3_dat(dat_13_12),
    .i4_dat(res13),

    .t0_dat(t_dat_dat[447:416]),

    .t1_dat(dat_5_13),
    .t2_dat(dat_9_13),
    .t3_dat(dat_15_13),
    .t4_dat(dat_12_13),


    .i1_adr(adr_13_9),
    .i2_adr(adr_13_15),
    .i3_adr(adr_13_12),
    .i4_adr(t_kp_dat[55:52]),


    .t2_adr(adr_9_13),
    .t3_adr(adr_15_13),
    .t4_adr(adr_12_13),


    .cfg(4'd13)
);

// Slice 14
permutator_slice u14 (


    .i0_dat(dat_14_6),
    .i1_dat(dat_14_10),
    .i2_dat(dat_14_12),
    .i3_dat(dat_14_15),
    .i4_dat(res14),

    .t0_dat(t_dat_dat[479:448]),

    .t1_dat(dat_6_14),
    .t2_dat(dat_10_14),
    .t3_dat(dat_12_14),
    .t4_dat(dat_15_14),


    .i1_adr(adr_14_10),
    .i2_adr(adr_14_12),
    .i3_adr(adr_14_15),
    .i4_adr(t_kp_dat[59:56]),


    .t2_adr(adr_10_14),
    .t3_adr(adr_12_14),
    .t4_adr(adr_15_14),


    .cfg(4'd14)
);

// Slice 15
permutator_slice u15 (


    .i0_dat(dat_15_7),
    .i1_dat(dat_15_11),
    .i2_dat(dat_15_13),
    .i3_dat(dat_15_14),
    .i4_dat(res15),

    .t0_dat(t_dat_dat[511:480]),

    .t1_dat(dat_7_15),
    .t2_dat(dat_11_15),
    .t3_dat(dat_13_15),
    .t4_dat(dat_14_15),


    .i1_adr(adr_15_11),
    .i2_adr(adr_15_13),
    .i3_adr(adr_15_14),
    .i4_adr(t_kp_dat[63:60]),


    .t2_adr(adr_11_15),
    .t3_adr(adr_13_15),
    .t4_adr(adr_14_15),


    .cfg(4'd15)
);


assign i_dat_dat = {res15, res14, res13, res12, res11, res10, res9, res8, res7, res6, res5, res4, res3, res2, res1, res0};

endmodule
