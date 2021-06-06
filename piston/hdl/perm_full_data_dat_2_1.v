
module perm_full_data_dat_2_1 (
    input  [511:0] t_data_dat,
    input  [ 63:0] t_addr_dat,
    output [511:0] i_data_dat,
    input clk, reset_n
);

wire [31:0] t_data0, t_data1, t_data2, t_data3, t_data4, t_data5, t_data6, t_data7, t_data8, t_data9, t_data10, t_data11, t_data12, t_data13, t_data14, t_data15;

assign {t_data15, t_data14, t_data13, t_data12, t_data11, t_data10, t_data9, t_data8, t_data7, t_data6, t_data5, t_data4, t_data3, t_data2, t_data1, t_data0} = t_data_dat;

wire [3:0] t_addr0, t_addr1, t_addr2, t_addr3, t_addr4, t_addr5, t_addr6, t_addr7, t_addr8, t_addr9, t_addr10, t_addr11, t_addr12, t_addr13, t_addr14, t_addr15;

assign {t_addr15, t_addr14, t_addr13, t_addr12, t_addr11, t_addr10, t_addr9, t_addr8, t_addr7, t_addr6, t_addr5, t_addr4, t_addr3, t_addr2, t_addr1, t_addr0} = t_addr_dat;

wire [31:0] i_data0, i_data1, i_data2, i_data3, i_data4, i_data5, i_data6, i_data7, i_data8, i_data9, i_data10, i_data11, i_data12, i_data13, i_data14, i_data15;


assign i_data0 = (
    (t_addr0 == 4'h0) ? t_data0 :
    (t_addr0 == 4'h1) ? t_data1 :
    (t_addr0 == 4'h2) ? t_data2 :
    (t_addr0 == 4'h3) ? t_data3 :
    (t_addr0 == 4'h4) ? t_data4 :
    (t_addr0 == 4'h5) ? t_data5 :
    (t_addr0 == 4'h6) ? t_data6 :
    (t_addr0 == 4'h7) ? t_data7 :
    (t_addr0 == 4'h8) ? t_data8 :
    (t_addr0 == 4'h9) ? t_data9 :
    (t_addr0 == 4'ha) ? t_data10 :
    (t_addr0 == 4'hb) ? t_data11 :
    (t_addr0 == 4'hc) ? t_data12 :
    (t_addr0 == 4'hd) ? t_data13 :
    (t_addr0 == 4'he) ? t_data14 :
    (t_addr0 == 4'hf) ? t_data15 :
    t_data0
);
assign i_data1 = (
    (t_addr1 == 4'h0) ? t_data1 :
    (t_addr1 == 4'h1) ? t_data2 :
    (t_addr1 == 4'h2) ? t_data3 :
    (t_addr1 == 4'h3) ? t_data4 :
    (t_addr1 == 4'h4) ? t_data5 :
    (t_addr1 == 4'h5) ? t_data6 :
    (t_addr1 == 4'h6) ? t_data7 :
    (t_addr1 == 4'h7) ? t_data8 :
    (t_addr1 == 4'h8) ? t_data9 :
    (t_addr1 == 4'h9) ? t_data10 :
    (t_addr1 == 4'ha) ? t_data11 :
    (t_addr1 == 4'hb) ? t_data12 :
    (t_addr1 == 4'hc) ? t_data13 :
    (t_addr1 == 4'hd) ? t_data14 :
    (t_addr1 == 4'he) ? t_data15 :
    (t_addr1 == 4'hf) ? t_data0 :
    t_data0
);
assign i_data2 = (
    (t_addr2 == 4'h0) ? t_data2 :
    (t_addr2 == 4'h1) ? t_data3 :
    (t_addr2 == 4'h2) ? t_data4 :
    (t_addr2 == 4'h3) ? t_data5 :
    (t_addr2 == 4'h4) ? t_data6 :
    (t_addr2 == 4'h5) ? t_data7 :
    (t_addr2 == 4'h6) ? t_data8 :
    (t_addr2 == 4'h7) ? t_data9 :
    (t_addr2 == 4'h8) ? t_data10 :
    (t_addr2 == 4'h9) ? t_data11 :
    (t_addr2 == 4'ha) ? t_data12 :
    (t_addr2 == 4'hb) ? t_data13 :
    (t_addr2 == 4'hc) ? t_data14 :
    (t_addr2 == 4'hd) ? t_data15 :
    (t_addr2 == 4'he) ? t_data0 :
    (t_addr2 == 4'hf) ? t_data1 :
    t_data0
);
assign i_data3 = (
    (t_addr3 == 4'h0) ? t_data3 :
    (t_addr3 == 4'h1) ? t_data4 :
    (t_addr3 == 4'h2) ? t_data5 :
    (t_addr3 == 4'h3) ? t_data6 :
    (t_addr3 == 4'h4) ? t_data7 :
    (t_addr3 == 4'h5) ? t_data8 :
    (t_addr3 == 4'h6) ? t_data9 :
    (t_addr3 == 4'h7) ? t_data10 :
    (t_addr3 == 4'h8) ? t_data11 :
    (t_addr3 == 4'h9) ? t_data12 :
    (t_addr3 == 4'ha) ? t_data13 :
    (t_addr3 == 4'hb) ? t_data14 :
    (t_addr3 == 4'hc) ? t_data15 :
    (t_addr3 == 4'hd) ? t_data0 :
    (t_addr3 == 4'he) ? t_data1 :
    (t_addr3 == 4'hf) ? t_data2 :
    t_data0
);
assign i_data4 = (
    (t_addr4 == 4'h0) ? t_data4 :
    (t_addr4 == 4'h1) ? t_data5 :
    (t_addr4 == 4'h2) ? t_data6 :
    (t_addr4 == 4'h3) ? t_data7 :
    (t_addr4 == 4'h4) ? t_data8 :
    (t_addr4 == 4'h5) ? t_data9 :
    (t_addr4 == 4'h6) ? t_data10 :
    (t_addr4 == 4'h7) ? t_data11 :
    (t_addr4 == 4'h8) ? t_data12 :
    (t_addr4 == 4'h9) ? t_data13 :
    (t_addr4 == 4'ha) ? t_data14 :
    (t_addr4 == 4'hb) ? t_data15 :
    (t_addr4 == 4'hc) ? t_data0 :
    (t_addr4 == 4'hd) ? t_data1 :
    (t_addr4 == 4'he) ? t_data2 :
    (t_addr4 == 4'hf) ? t_data3 :
    t_data0
);
assign i_data5 = (
    (t_addr5 == 4'h0) ? t_data5 :
    (t_addr5 == 4'h1) ? t_data6 :
    (t_addr5 == 4'h2) ? t_data7 :
    (t_addr5 == 4'h3) ? t_data8 :
    (t_addr5 == 4'h4) ? t_data9 :
    (t_addr5 == 4'h5) ? t_data10 :
    (t_addr5 == 4'h6) ? t_data11 :
    (t_addr5 == 4'h7) ? t_data12 :
    (t_addr5 == 4'h8) ? t_data13 :
    (t_addr5 == 4'h9) ? t_data14 :
    (t_addr5 == 4'ha) ? t_data15 :
    (t_addr5 == 4'hb) ? t_data0 :
    (t_addr5 == 4'hc) ? t_data1 :
    (t_addr5 == 4'hd) ? t_data2 :
    (t_addr5 == 4'he) ? t_data3 :
    (t_addr5 == 4'hf) ? t_data4 :
    t_data0
);
assign i_data6 = (
    (t_addr6 == 4'h0) ? t_data6 :
    (t_addr6 == 4'h1) ? t_data7 :
    (t_addr6 == 4'h2) ? t_data8 :
    (t_addr6 == 4'h3) ? t_data9 :
    (t_addr6 == 4'h4) ? t_data10 :
    (t_addr6 == 4'h5) ? t_data11 :
    (t_addr6 == 4'h6) ? t_data12 :
    (t_addr6 == 4'h7) ? t_data13 :
    (t_addr6 == 4'h8) ? t_data14 :
    (t_addr6 == 4'h9) ? t_data15 :
    (t_addr6 == 4'ha) ? t_data0 :
    (t_addr6 == 4'hb) ? t_data1 :
    (t_addr6 == 4'hc) ? t_data2 :
    (t_addr6 == 4'hd) ? t_data3 :
    (t_addr6 == 4'he) ? t_data4 :
    (t_addr6 == 4'hf) ? t_data5 :
    t_data0
);
assign i_data7 = (
    (t_addr7 == 4'h0) ? t_data7 :
    (t_addr7 == 4'h1) ? t_data8 :
    (t_addr7 == 4'h2) ? t_data9 :
    (t_addr7 == 4'h3) ? t_data10 :
    (t_addr7 == 4'h4) ? t_data11 :
    (t_addr7 == 4'h5) ? t_data12 :
    (t_addr7 == 4'h6) ? t_data13 :
    (t_addr7 == 4'h7) ? t_data14 :
    (t_addr7 == 4'h8) ? t_data15 :
    (t_addr7 == 4'h9) ? t_data0 :
    (t_addr7 == 4'ha) ? t_data1 :
    (t_addr7 == 4'hb) ? t_data2 :
    (t_addr7 == 4'hc) ? t_data3 :
    (t_addr7 == 4'hd) ? t_data4 :
    (t_addr7 == 4'he) ? t_data5 :
    (t_addr7 == 4'hf) ? t_data6 :
    t_data0
);
assign i_data8 = (
    (t_addr8 == 4'h0) ? t_data8 :
    (t_addr8 == 4'h1) ? t_data9 :
    (t_addr8 == 4'h2) ? t_data10 :
    (t_addr8 == 4'h3) ? t_data11 :
    (t_addr8 == 4'h4) ? t_data12 :
    (t_addr8 == 4'h5) ? t_data13 :
    (t_addr8 == 4'h6) ? t_data14 :
    (t_addr8 == 4'h7) ? t_data15 :
    (t_addr8 == 4'h8) ? t_data0 :
    (t_addr8 == 4'h9) ? t_data1 :
    (t_addr8 == 4'ha) ? t_data2 :
    (t_addr8 == 4'hb) ? t_data3 :
    (t_addr8 == 4'hc) ? t_data4 :
    (t_addr8 == 4'hd) ? t_data5 :
    (t_addr8 == 4'he) ? t_data6 :
    (t_addr8 == 4'hf) ? t_data7 :
    t_data0
);
assign i_data9 = (
    (t_addr9 == 4'h0) ? t_data9 :
    (t_addr9 == 4'h1) ? t_data10 :
    (t_addr9 == 4'h2) ? t_data11 :
    (t_addr9 == 4'h3) ? t_data12 :
    (t_addr9 == 4'h4) ? t_data13 :
    (t_addr9 == 4'h5) ? t_data14 :
    (t_addr9 == 4'h6) ? t_data15 :
    (t_addr9 == 4'h7) ? t_data0 :
    (t_addr9 == 4'h8) ? t_data1 :
    (t_addr9 == 4'h9) ? t_data2 :
    (t_addr9 == 4'ha) ? t_data3 :
    (t_addr9 == 4'hb) ? t_data4 :
    (t_addr9 == 4'hc) ? t_data5 :
    (t_addr9 == 4'hd) ? t_data6 :
    (t_addr9 == 4'he) ? t_data7 :
    (t_addr9 == 4'hf) ? t_data8 :
    t_data0
);
assign i_data10 = (
    (t_addr10 == 4'h0) ? t_data10 :
    (t_addr10 == 4'h1) ? t_data11 :
    (t_addr10 == 4'h2) ? t_data12 :
    (t_addr10 == 4'h3) ? t_data13 :
    (t_addr10 == 4'h4) ? t_data14 :
    (t_addr10 == 4'h5) ? t_data15 :
    (t_addr10 == 4'h6) ? t_data0 :
    (t_addr10 == 4'h7) ? t_data1 :
    (t_addr10 == 4'h8) ? t_data2 :
    (t_addr10 == 4'h9) ? t_data3 :
    (t_addr10 == 4'ha) ? t_data4 :
    (t_addr10 == 4'hb) ? t_data5 :
    (t_addr10 == 4'hc) ? t_data6 :
    (t_addr10 == 4'hd) ? t_data7 :
    (t_addr10 == 4'he) ? t_data8 :
    (t_addr10 == 4'hf) ? t_data9 :
    t_data0
);
assign i_data11 = (
    (t_addr11 == 4'h0) ? t_data11 :
    (t_addr11 == 4'h1) ? t_data12 :
    (t_addr11 == 4'h2) ? t_data13 :
    (t_addr11 == 4'h3) ? t_data14 :
    (t_addr11 == 4'h4) ? t_data15 :
    (t_addr11 == 4'h5) ? t_data0 :
    (t_addr11 == 4'h6) ? t_data1 :
    (t_addr11 == 4'h7) ? t_data2 :
    (t_addr11 == 4'h8) ? t_data3 :
    (t_addr11 == 4'h9) ? t_data4 :
    (t_addr11 == 4'ha) ? t_data5 :
    (t_addr11 == 4'hb) ? t_data6 :
    (t_addr11 == 4'hc) ? t_data7 :
    (t_addr11 == 4'hd) ? t_data8 :
    (t_addr11 == 4'he) ? t_data9 :
    (t_addr11 == 4'hf) ? t_data10 :
    t_data0
);
assign i_data12 = (
    (t_addr12 == 4'h0) ? t_data12 :
    (t_addr12 == 4'h1) ? t_data13 :
    (t_addr12 == 4'h2) ? t_data14 :
    (t_addr12 == 4'h3) ? t_data15 :
    (t_addr12 == 4'h4) ? t_data0 :
    (t_addr12 == 4'h5) ? t_data1 :
    (t_addr12 == 4'h6) ? t_data2 :
    (t_addr12 == 4'h7) ? t_data3 :
    (t_addr12 == 4'h8) ? t_data4 :
    (t_addr12 == 4'h9) ? t_data5 :
    (t_addr12 == 4'ha) ? t_data6 :
    (t_addr12 == 4'hb) ? t_data7 :
    (t_addr12 == 4'hc) ? t_data8 :
    (t_addr12 == 4'hd) ? t_data9 :
    (t_addr12 == 4'he) ? t_data10 :
    (t_addr12 == 4'hf) ? t_data11 :
    t_data0
);
assign i_data13 = (
    (t_addr13 == 4'h0) ? t_data13 :
    (t_addr13 == 4'h1) ? t_data14 :
    (t_addr13 == 4'h2) ? t_data15 :
    (t_addr13 == 4'h3) ? t_data0 :
    (t_addr13 == 4'h4) ? t_data1 :
    (t_addr13 == 4'h5) ? t_data2 :
    (t_addr13 == 4'h6) ? t_data3 :
    (t_addr13 == 4'h7) ? t_data4 :
    (t_addr13 == 4'h8) ? t_data5 :
    (t_addr13 == 4'h9) ? t_data6 :
    (t_addr13 == 4'ha) ? t_data7 :
    (t_addr13 == 4'hb) ? t_data8 :
    (t_addr13 == 4'hc) ? t_data9 :
    (t_addr13 == 4'hd) ? t_data10 :
    (t_addr13 == 4'he) ? t_data11 :
    (t_addr13 == 4'hf) ? t_data12 :
    t_data0
);
assign i_data14 = (
    (t_addr14 == 4'h0) ? t_data14 :
    (t_addr14 == 4'h1) ? t_data15 :
    (t_addr14 == 4'h2) ? t_data0 :
    (t_addr14 == 4'h3) ? t_data1 :
    (t_addr14 == 4'h4) ? t_data2 :
    (t_addr14 == 4'h5) ? t_data3 :
    (t_addr14 == 4'h6) ? t_data4 :
    (t_addr14 == 4'h7) ? t_data5 :
    (t_addr14 == 4'h8) ? t_data6 :
    (t_addr14 == 4'h9) ? t_data7 :
    (t_addr14 == 4'ha) ? t_data8 :
    (t_addr14 == 4'hb) ? t_data9 :
    (t_addr14 == 4'hc) ? t_data10 :
    (t_addr14 == 4'hd) ? t_data11 :
    (t_addr14 == 4'he) ? t_data12 :
    (t_addr14 == 4'hf) ? t_data13 :
    t_data0
);
assign i_data15 = (
    (t_addr15 == 4'h0) ? t_data15 :
    (t_addr15 == 4'h1) ? t_data0 :
    (t_addr15 == 4'h2) ? t_data1 :
    (t_addr15 == 4'h3) ? t_data2 :
    (t_addr15 == 4'h4) ? t_data3 :
    (t_addr15 == 4'h5) ? t_data4 :
    (t_addr15 == 4'h6) ? t_data5 :
    (t_addr15 == 4'h7) ? t_data6 :
    (t_addr15 == 4'h8) ? t_data7 :
    (t_addr15 == 4'h9) ? t_data8 :
    (t_addr15 == 4'ha) ? t_data9 :
    (t_addr15 == 4'hb) ? t_data10 :
    (t_addr15 == 4'hc) ? t_data11 :
    (t_addr15 == 4'hd) ? t_data12 :
    (t_addr15 == 4'he) ? t_data13 :
    (t_addr15 == 4'hf) ? t_data14 :
    t_data0
);

assign i_data_dat = {i_data15, i_data14, i_data13, i_data12, i_data11, i_data10, i_data9, i_data8, i_data7, i_data6, i_data5, i_data4, i_data3, i_data2, i_data1, i_data0};

endmodule
