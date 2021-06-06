// address decoder for the permutation network
// consumes destination address and produces source address

module perm_addr_dat_1_1 (
    input        [67:0] t_0_dat,
    output wire [67:0] i_0_dat,
    input clk, reset_n
);

   assign i_0_dat[67:64]=t_0_dat[67:64];
   

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
perm_addr_slice u0 (


    .i1(adr_0_4),
    .i2(adr_0_2),
    .i3(adr_0_1),
    .i4(t_0_dat[3:0]),


    .t2(adr_4_0),
    .t3(adr_2_0),
    .t4(adr_1_0),


    .sel1(i_0_dat[0]),
    .sel2(i_0_dat[1]),
    .sel3(i_0_dat[2]),
    .sel4(i_0_dat[3]),


    .cfg(4'd0)
);

// Slice 1
perm_addr_slice u1 (


    .i1(adr_1_5),
    .i2(adr_1_3),
    .i3(adr_1_0),
    .i4(t_0_dat[7:4]),


    .t2(adr_5_1),
    .t3(adr_3_1),
    .t4(adr_0_1),


    .sel1(i_0_dat[4]),
    .sel2(i_0_dat[5]),
    .sel3(i_0_dat[6]),
    .sel4(i_0_dat[7]),


    .cfg(4'd1)
);

// Slice 2
perm_addr_slice u2 (


    .i1(adr_2_6),
    .i2(adr_2_0),
    .i3(adr_2_3),
    .i4(t_0_dat[11:8]),


    .t2(adr_6_2),
    .t3(adr_0_2),
    .t4(adr_3_2),


    .sel1(i_0_dat[8]),
    .sel2(i_0_dat[9]),
    .sel3(i_0_dat[10]),
    .sel4(i_0_dat[11]),


    .cfg(4'd2)
);

// Slice 3
perm_addr_slice u3 (


    .i1(adr_3_7),
    .i2(adr_3_1),
    .i3(adr_3_2),
    .i4(t_0_dat[15:12]),


    .t2(adr_7_3),
    .t3(adr_1_3),
    .t4(adr_2_3),


    .sel1(i_0_dat[12]),
    .sel2(i_0_dat[13]),
    .sel3(i_0_dat[14]),
    .sel4(i_0_dat[15]),


    .cfg(4'd3)
);

// Slice 4
perm_addr_slice u4 (


    .i1(adr_4_0),
    .i2(adr_4_6),
    .i3(adr_4_5),
    .i4(t_0_dat[19:16]),


    .t2(adr_0_4),
    .t3(adr_6_4),
    .t4(adr_5_4),


    .sel1(i_0_dat[16]),
    .sel2(i_0_dat[17]),
    .sel3(i_0_dat[18]),
    .sel4(i_0_dat[19]),


    .cfg(4'd4)
);

// Slice 5
perm_addr_slice u5 (


    .i1(adr_5_1),
    .i2(adr_5_7),
    .i3(adr_5_4),
    .i4(t_0_dat[23:20]),


    .t2(adr_1_5),
    .t3(adr_7_5),
    .t4(adr_4_5),


    .sel1(i_0_dat[20]),
    .sel2(i_0_dat[21]),
    .sel3(i_0_dat[22]),
    .sel4(i_0_dat[23]),


    .cfg(4'd5)
);

// Slice 6
perm_addr_slice u6 (


    .i1(adr_6_2),
    .i2(adr_6_4),
    .i3(adr_6_7),
    .i4(t_0_dat[27:24]),


    .t2(adr_2_6),
    .t3(adr_4_6),
    .t4(adr_7_6),


    .sel1(i_0_dat[24]),
    .sel2(i_0_dat[25]),
    .sel3(i_0_dat[26]),
    .sel4(i_0_dat[27]),


    .cfg(4'd6)
);

// Slice 7
perm_addr_slice u7 (


    .i1(adr_7_3),
    .i2(adr_7_5),
    .i3(adr_7_6),
    .i4(t_0_dat[31:28]),


    .t2(adr_3_7),
    .t3(adr_5_7),
    .t4(adr_6_7),


    .sel1(i_0_dat[28]),
    .sel2(i_0_dat[29]),
    .sel3(i_0_dat[30]),
    .sel4(i_0_dat[31]),


    .cfg(4'd7)
);

// Slice 8
perm_addr_slice u8 (


    .i1(adr_8_12),
    .i2(adr_8_10),
    .i3(adr_8_9),
    .i4(t_0_dat[35:32]),


    .t2(adr_12_8),
    .t3(adr_10_8),
    .t4(adr_9_8),


    .sel1(i_0_dat[32]),
    .sel2(i_0_dat[33]),
    .sel3(i_0_dat[34]),
    .sel4(i_0_dat[35]),


    .cfg(4'd8)
);

// Slice 9
perm_addr_slice u9 (


    .i1(adr_9_13),
    .i2(adr_9_11),
    .i3(adr_9_8),
    .i4(t_0_dat[39:36]),


    .t2(adr_13_9),
    .t3(adr_11_9),
    .t4(adr_8_9),


    .sel1(i_0_dat[36]),
    .sel2(i_0_dat[37]),
    .sel3(i_0_dat[38]),
    .sel4(i_0_dat[39]),


    .cfg(4'd9)
);

// Slice 10
perm_addr_slice u10 (


    .i1(adr_10_14),
    .i2(adr_10_8),
    .i3(adr_10_11),
    .i4(t_0_dat[43:40]),


    .t2(adr_14_10),
    .t3(adr_8_10),
    .t4(adr_11_10),


    .sel1(i_0_dat[40]),
    .sel2(i_0_dat[41]),
    .sel3(i_0_dat[42]),
    .sel4(i_0_dat[43]),


    .cfg(4'd10)
);

// Slice 11
perm_addr_slice u11 (


    .i1(adr_11_15),
    .i2(adr_11_9),
    .i3(adr_11_10),
    .i4(t_0_dat[47:44]),


    .t2(adr_15_11),
    .t3(adr_9_11),
    .t4(adr_10_11),


    .sel1(i_0_dat[44]),
    .sel2(i_0_dat[45]),
    .sel3(i_0_dat[46]),
    .sel4(i_0_dat[47]),


    .cfg(4'd11)
);

// Slice 12
perm_addr_slice u12 (


    .i1(adr_12_8),
    .i2(adr_12_14),
    .i3(adr_12_13),
    .i4(t_0_dat[51:48]),


    .t2(adr_8_12),
    .t3(adr_14_12),
    .t4(adr_13_12),


    .sel1(i_0_dat[48]),
    .sel2(i_0_dat[49]),
    .sel3(i_0_dat[50]),
    .sel4(i_0_dat[51]),


    .cfg(4'd12)
);

// Slice 13
perm_addr_slice u13 (


    .i1(adr_13_9),
    .i2(adr_13_15),
    .i3(adr_13_12),
    .i4(t_0_dat[55:52]),


    .t2(adr_9_13),
    .t3(adr_15_13),
    .t4(adr_12_13),


    .sel1(i_0_dat[52]),
    .sel2(i_0_dat[53]),
    .sel3(i_0_dat[54]),
    .sel4(i_0_dat[55]),


    .cfg(4'd13)
);

// Slice 14
perm_addr_slice u14 (


    .i1(adr_14_10),
    .i2(adr_14_12),
    .i3(adr_14_15),
    .i4(t_0_dat[59:56]),


    .t2(adr_10_14),
    .t3(adr_12_14),
    .t4(adr_15_14),


    .sel1(i_0_dat[56]),
    .sel2(i_0_dat[57]),
    .sel3(i_0_dat[58]),
    .sel4(i_0_dat[59]),


    .cfg(4'd14)
);

// Slice 15
perm_addr_slice u15 (


    .i1(adr_15_11),
    .i2(adr_15_13),
    .i3(adr_15_14),
    .i4(t_0_dat[63:60]),


    .t2(adr_11_15),
    .t3(adr_13_15),
    .t4(adr_14_15),


    .sel1(i_0_dat[60]),
    .sel2(i_0_dat[61]),
    .sel3(i_0_dat[62]),
    .sel4(i_0_dat[63]),


    .cfg(4'd15)
);


endmodule
