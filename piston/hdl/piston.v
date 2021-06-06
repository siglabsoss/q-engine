module piston #(
    parameter NODE28_VMEM_SIZE = 4096,
    parameter NODE28_VMEM0 = "vmem0.mif",
    parameter NODE28_VMEM1 = "vmem1.mif",
    parameter NODE28_VMEM2 = "vmem2.mif",
    parameter NODE28_VMEM3 = "vmem3.mif",
    parameter NODE28_VMEM4 = "vmem4.mif",
    parameter NODE28_VMEM5 = "vmem5.mif",
    parameter NODE28_VMEM6 = "vmem6.mif",
    parameter NODE28_VMEM7 = "vmem7.mif",
    parameter NODE28_VMEM8 = "vmem8.mif",
    parameter NODE28_VMEM9 = "vmem9.mif",
    parameter NODE28_VMEM10 = "vmem10.mif",
    parameter NODE28_VMEM11 = "vmem11.mif",
    parameter NODE28_VMEM12 = "vmem12.mif",
    parameter NODE28_VMEM13 = "vmem13.mif",
    parameter NODE28_VMEM14 = "vmem14.mif",
    parameter NODE28_VMEM15 = "vmem15.mif",
    parameter NODE28_VMEM16 = "vmem16.mif",
    parameter NODE28_VMEM17 = "vmem17.mif",
    parameter NODE28_VMEM18 = "vmem18.mif",
    parameter NODE28_VMEM19 = "vmem19.mif",
    parameter NODE28_VMEM20 = "vmem20.mif",
    parameter NODE28_VMEM21 = "vmem21.mif",
    parameter NODE28_VMEM22 = "vmem22.mif",
    parameter NODE28_VMEM23 = "vmem23.mif",
    parameter NODE28_VMEM24 = "vmem24.mif",
    parameter NODE28_VMEM25 = "vmem25.mif",
    parameter NODE28_VMEM26 = "vmem26.mif",
    parameter NODE28_VMEM27 = "vmem27.mif",
    parameter NODE28_VMEM28 = "vmem28.mif",
    parameter NODE28_VMEM29 = "vmem29.mif",
    parameter NODE28_VMEM30 = "vmem30.mif",
    parameter NODE28_VMEM31 = "vmem31.mif"
) (
    // per node (target / initiator)
    input              clk,
    input              reset_n,
    input       [63:0] t_instr_dat,
    input              t_instr_req,
    output             t_instr_ack,
    input       [48:0] t_idma_0_dat,
    input              t_idma_0_req,
    output             t_idma_0_ack,
    input       [48:0] t_idma_1_dat,
    input              t_idma_1_req,
    output             t_idma_1_ack,
    input       [48:0] t_idma_2_dat,
    input              t_idma_2_req,
    output             t_idma_2_ack,
    input       [48:0] t_idma_3_dat,
    input              t_idma_3_req,
    output             t_idma_3_ack,
    output      [31:0] i_odma_0_dat,
    output             i_odma_0_req,
    input              i_odma_0_ack,
    output      [31:0] i_odma_1_dat,
    output             i_odma_1_req,
    input              i_odma_1_ack,
    output      [31:0] i_odma_2_dat,
    output             i_odma_2_req,
    input              i_odma_2_ack,
    output      [31:0] i_odma_3_dat,
    output             i_odma_3_req,
    input              i_odma_3_ack
);
// per edge
wire      [63:0] dat0, dat0_nxt;
wire      [63:0] dat1, dat1_nxt;
wire      [63:0] dat2, dat2_nxt;
wire      [63:0] dat3, dat3_nxt;
wire      [63:0] dat4, dat4_nxt;
wire      [63:0] dat5, dat5_nxt;
wire      [63:0] dat6, dat6_nxt;
wire      [63:0] dat7, dat7_nxt;
wire      [63:0] dat8, dat8_nxt;
wire      [63:0] dat9, dat9_nxt;
wire      [63:0] dat10, dat10_nxt;
wire      [63:0] dat11, dat11_nxt;
wire      [63:0] dat12, dat12_nxt;
wire      [63:0] dat13, dat13_nxt;
wire      [63:0] dat14, dat14_nxt;
wire      [63:0] dat15, dat15_nxt;
wire      [63:0] dat16, dat16_nxt;
wire      [63:0] dat17, dat17_nxt;
wire      [63:0] dat18, dat18_nxt;
wire      [63:0] dat19, dat19_nxt;
wire      [63:0] dat20, dat20_nxt;
wire      [63:0] dat21, dat21_nxt;
wire      [63:0] dat22, dat22_nxt;
wire      [63:0] dat23, dat23_nxt;
wire      [63:0] dat24, dat24_nxt;
wire      [63:0] dat25, dat25_nxt;
wire      [63:0] dat26, dat26_nxt;
wire      [63:0] dat27, dat27_nxt;
wire      [63:0] dat28, dat28_nxt;
wire      [63:0] dat29, dat29_nxt;
wire      [63:0] dat30, dat30_nxt;
wire     [511:0] dat31, dat31_nxt;
wire     [511:0] dat32, dat32_nxt;
wire     [511:0] dat33, dat33_nxt;
wire     [511:0] dat34;
wire     [511:0] dat35, dat35_nxt;
wire     [511:0] dat36, dat36_nxt;
wire     [511:0] dat37, dat37_nxt;
wire     [511:0] dat38, dat38_nxt;
wire     [511:0] dat39, dat39_nxt;
wire     [511:0] dat40, dat40_nxt;
wire     [511:0] dat41, dat41_nxt;
wire     [511:0] dat42, dat42_nxt;
wire     [127:0] dat43, dat43_nxt;
wire     [127:0] dat44, dat44_nxt;
wire      [17:0] dat45;
wire      [17:0] dat46;
wire      [17:0] dat47;
wire      [17:0] dat48;
wire      [17:0] dat49;
wire      [17:0] dat50;
wire      [17:0] dat51;
wire      [17:0] dat52;
wire      [17:0] dat53;
wire      [17:0] dat54;
wire      [17:0] dat55;
wire      [17:0] dat56;
wire      [17:0] dat57;
wire      [17:0] dat58;
wire      [17:0] dat59;
wire      [17:0] dat60;
wire       [1:0] dat61;
wire      [17:0] dat62;
wire       [1:0] dat63;
wire      [17:0] dat64;
wire       [1:0] dat65;
wire      [17:0] dat66;
wire       [1:0] dat67;
wire      [17:0] dat68;
wire       [1:0] dat69;
wire      [17:0] dat70;
wire       [1:0] dat71;
wire      [17:0] dat72;
wire      [71:0] dat73, dat73_nxt;
wire      [71:0] dat74, dat74_nxt;
wire       [1:0] dat75;
wire      [35:0] dat76;
wire       [1:0] dat77;
wire      [35:0] dat78;
wire       [1:0] dat79;
wire      [17:0] dat80;
wire       [1:0] dat81;
wire      [17:0] dat82;
wire       [1:0] dat83;
wire      [17:0] dat84;
wire       [1:0] dat85;
wire      [17:0] dat86;
wire       [1:0] dat87;
wire      [17:0] dat88;
wire       [1:0] dat89;
wire      [17:0] dat90;
wire      [71:0] dat91, dat91_nxt;
wire      [71:0] dat92, dat92_nxt;
wire       [1:0] dat93;
wire      [35:0] dat94;
wire       [1:0] dat95;
wire      [35:0] dat96;
wire       [1:0] dat97;
wire      [17:0] dat98;
wire       [1:0] dat99;
wire      [17:0] dat100;
wire       [1:0] dat101;
wire      [17:0] dat102;
wire       [1:0] dat103;
wire      [17:0] dat104;
wire       [1:0] dat105;
wire      [17:0] dat106;
wire       [1:0] dat107;
wire      [17:0] dat108;
wire      [71:0] dat109, dat109_nxt;
wire      [71:0] dat110, dat110_nxt;
wire       [1:0] dat111;
wire      [35:0] dat112;
wire       [1:0] dat113;
wire      [35:0] dat114;
wire       [1:0] dat115;
wire      [17:0] dat116;
wire       [1:0] dat117;
wire      [17:0] dat118;
wire       [1:0] dat119;
wire      [17:0] dat120;
wire       [1:0] dat121;
wire      [17:0] dat122;
wire       [1:0] dat123;
wire      [17:0] dat124;
wire       [1:0] dat125;
wire      [17:0] dat126;
wire      [71:0] dat127, dat127_nxt;
wire      [71:0] dat128, dat128_nxt;
wire       [1:0] dat129;
wire      [35:0] dat130;
wire       [1:0] dat131;
wire      [35:0] dat132;
wire     [127:0] dat133, dat133_nxt;
wire     [127:0] dat134, dat134_nxt;
wire      [17:0] dat135;
wire      [17:0] dat136;
wire      [17:0] dat137;
wire      [17:0] dat138;
wire      [17:0] dat139;
wire      [17:0] dat140;
wire      [17:0] dat141;
wire      [17:0] dat142;
wire      [17:0] dat143;
wire      [17:0] dat144;
wire      [17:0] dat145;
wire      [17:0] dat146;
wire      [17:0] dat147;
wire      [17:0] dat148;
wire      [17:0] dat149;
wire      [17:0] dat150;
wire       [1:0] dat151;
wire      [17:0] dat152;
wire       [1:0] dat153;
wire      [17:0] dat154;
wire       [1:0] dat155;
wire      [17:0] dat156;
wire       [1:0] dat157;
wire      [17:0] dat158;
wire       [1:0] dat159;
wire      [17:0] dat160;
wire       [1:0] dat161;
wire      [17:0] dat162;
wire      [71:0] dat163, dat163_nxt;
wire      [71:0] dat164, dat164_nxt;
wire       [1:0] dat165;
wire      [35:0] dat166;
wire       [1:0] dat167;
wire      [35:0] dat168;
wire       [1:0] dat169;
wire      [17:0] dat170;
wire       [1:0] dat171;
wire      [17:0] dat172;
wire       [1:0] dat173;
wire      [17:0] dat174;
wire       [1:0] dat175;
wire      [17:0] dat176;
wire       [1:0] dat177;
wire      [17:0] dat178;
wire       [1:0] dat179;
wire      [17:0] dat180;
wire      [71:0] dat181, dat181_nxt;
wire      [71:0] dat182, dat182_nxt;
wire       [1:0] dat183;
wire      [35:0] dat184;
wire       [1:0] dat185;
wire      [35:0] dat186;
wire       [1:0] dat187;
wire      [17:0] dat188;
wire       [1:0] dat189;
wire      [17:0] dat190;
wire       [1:0] dat191;
wire      [17:0] dat192;
wire       [1:0] dat193;
wire      [17:0] dat194;
wire       [1:0] dat195;
wire      [17:0] dat196;
wire       [1:0] dat197;
wire      [17:0] dat198;
wire      [71:0] dat199, dat199_nxt;
wire      [71:0] dat200, dat200_nxt;
wire       [1:0] dat201;
wire      [35:0] dat202;
wire       [1:0] dat203;
wire      [35:0] dat204;
wire       [1:0] dat205;
wire      [17:0] dat206;
wire       [1:0] dat207;
wire      [17:0] dat208;
wire       [1:0] dat209;
wire      [17:0] dat210;
wire       [1:0] dat211;
wire      [17:0] dat212;
wire       [1:0] dat213;
wire      [17:0] dat214;
wire       [1:0] dat215;
wire      [17:0] dat216;
wire      [71:0] dat217, dat217_nxt;
wire      [71:0] dat218, dat218_nxt;
wire       [1:0] dat219;
wire      [35:0] dat220;
wire       [1:0] dat221;
wire      [35:0] dat222;
wire      [35:0] dat223, dat223_nxt;
wire      [35:0] dat224, dat224_nxt;
wire      [35:0] dat225, dat225_nxt;
wire      [35:0] dat226, dat226_nxt;
wire      [35:0] dat227, dat227_nxt;
wire      [35:0] dat228, dat228_nxt;
wire      [35:0] dat229, dat229_nxt;
wire      [35:0] dat230, dat230_nxt;
wire      [35:0] dat231;
wire      [35:0] dat232;
wire      [35:0] dat233;
wire      [35:0] dat234;
wire      [35:0] dat235;
wire      [35:0] dat236;
wire      [35:0] dat237;
wire      [35:0] dat238;
wire       [1:0] dat239;
wire       [1:0] dat240;
wire      [35:0] dat241, dat241_nxt;
wire      [35:0] dat242, dat242_nxt;
wire       [1:0] dat243;
wire       [1:0] dat244;
wire      [35:0] dat245, dat245_nxt;
wire      [35:0] dat246, dat246_nxt;
wire       [1:0] dat247;
wire       [1:0] dat248;
wire      [35:0] dat249, dat249_nxt;
wire      [35:0] dat250, dat250_nxt;
wire       [1:0] dat251;
wire       [1:0] dat252;
wire      [35:0] dat253, dat253_nxt;
wire      [35:0] dat254, dat254_nxt;
wire      [35:0] dat255, dat255_nxt;
wire      [35:0] dat256, dat256_nxt;
wire      [35:0] dat257, dat257_nxt;
wire      [35:0] dat258, dat258_nxt;
wire      [35:0] dat259, dat259_nxt;
wire      [35:0] dat260, dat260_nxt;
wire      [35:0] dat261, dat261_nxt;
wire      [35:0] dat262, dat262_nxt;
wire      [35:0] dat263;
wire      [35:0] dat264;
wire      [35:0] dat265;
wire      [35:0] dat266;
wire      [35:0] dat267;
wire      [35:0] dat268;
wire      [35:0] dat269;
wire      [35:0] dat270;
wire       [1:0] dat271;
wire       [1:0] dat272;
wire      [35:0] dat273, dat273_nxt;
wire      [35:0] dat274, dat274_nxt;
wire       [1:0] dat275;
wire       [1:0] dat276;
wire      [35:0] dat277, dat277_nxt;
wire      [35:0] dat278, dat278_nxt;
wire       [1:0] dat279;
wire       [1:0] dat280;
wire      [35:0] dat281, dat281_nxt;
wire      [35:0] dat282, dat282_nxt;
wire       [1:0] dat283;
wire       [1:0] dat284;
wire      [35:0] dat285, dat285_nxt;
wire      [35:0] dat286, dat286_nxt;
wire     [127:0] dat287;
wire       [7:0] dat288;
wire       [7:0] dat289;
wire      [19:0] dat290, dat290_nxt;
wire      [19:0] dat291, dat291_nxt;
wire      [15:0] dat292, dat292_nxt;
wire      [15:0] dat293, dat293_nxt;
wire       [7:0] dat294;
wire       [7:0] dat295;
wire      [19:0] dat296, dat296_nxt;
wire      [19:0] dat297, dat297_nxt;
wire      [15:0] dat298, dat298_nxt;
wire      [15:0] dat299, dat299_nxt;
wire       [7:0] dat300;
wire       [7:0] dat301;
wire      [19:0] dat302, dat302_nxt;
wire      [19:0] dat303, dat303_nxt;
wire      [15:0] dat304, dat304_nxt;
wire      [15:0] dat305, dat305_nxt;
wire       [7:0] dat306;
wire       [7:0] dat307;
wire      [19:0] dat308, dat308_nxt;
wire      [19:0] dat309, dat309_nxt;
wire      [15:0] dat310, dat310_nxt;
wire      [15:0] dat311, dat311_nxt;
wire     [127:0] dat312;
wire       [7:0] dat313;
wire       [7:0] dat314;
wire      [19:0] dat315, dat315_nxt;
wire      [19:0] dat316, dat316_nxt;
wire      [15:0] dat317, dat317_nxt;
wire      [15:0] dat318, dat318_nxt;
wire       [7:0] dat319;
wire       [7:0] dat320;
wire      [19:0] dat321, dat321_nxt;
wire      [19:0] dat322, dat322_nxt;
wire      [15:0] dat323, dat323_nxt;
wire      [15:0] dat324, dat324_nxt;
wire       [7:0] dat325;
wire       [7:0] dat326;
wire      [19:0] dat327, dat327_nxt;
wire      [19:0] dat328, dat328_nxt;
wire      [15:0] dat329, dat329_nxt;
wire      [15:0] dat330, dat330_nxt;
wire       [7:0] dat331;
wire       [7:0] dat332;
wire      [19:0] dat333, dat333_nxt;
wire      [19:0] dat334, dat334_nxt;
wire      [15:0] dat335, dat335_nxt;
wire      [15:0] dat336, dat336_nxt;
wire       [7:0] dat337;
wire       [7:0] dat338;
wire       [7:0] dat339;
wire     [263:0] dat340, dat340_nxt;
wire      [67:0] dat341, dat341_nxt;
wire     [195:0] dat342, dat342_nxt;
wire     [195:0] dat343, dat343_nxt;
wire       [3:0] dat344, dat344_nxt;
wire      [67:0] dat345, dat345_nxt;
wire       [3:0] dat346, dat346_nxt;
wire      [67:0] dat347, dat347_nxt;
wire      [67:0] dat348, dat348_nxt;
wire      [48:0] dat349, dat349_nxt;
wire      [48:0] dat350, dat350_nxt;
wire      [48:0] dat351, dat351_nxt;
wire      [48:0] dat352, dat352_nxt;
wire      [48:0] dat353, dat353_nxt;
wire      [31:0] dat354, dat354_nxt;
wire      [31:0] dat355, dat355_nxt;
wire      [31:0] dat356, dat356_nxt;
wire      [31:0] dat357, dat357_nxt;
wire      [31:0] dat358, dat358_nxt;
wire      [31:0] dat359, dat359_nxt;
// per node
// node:0 is target port
assign dat0_nxt = t_instr_dat;

// node:1 equality
assign dat1_nxt = dat0;

// node:2 equality
assign dat2_nxt = dat0;

// node:3 equality
assign dat3_nxt = dat1;

// node:4 equality
assign dat4_nxt = dat1;

// node:5 equality
assign dat5_nxt = dat2;

// node:6 equality
assign dat6_nxt = dat2;

// node:7 equality
assign dat7_nxt = dat3;

// node:8 equality
assign dat10_nxt = dat3;

// node:9 equality
assign dat13_nxt = dat4;

// node:10 equality
assign dat16_nxt = dat4;

// node:11 equality
assign dat19_nxt = dat5;

// node:12 equality
assign dat22_nxt = dat5;

// node:13 equality
assign dat25_nxt = dat6;

// node:14 equality
assign dat28_nxt = dat6;

// node:15 is target port
assign dat349_nxt = t_idma_0_dat;

// node:16 is target port
assign dat350_nxt = t_idma_1_dat;

// node:17 equality
assign dat351_nxt = dat350;

// node:18 is target port
assign dat352_nxt = t_idma_2_dat;

// node:19 is target port
assign dat353_nxt = t_idma_3_dat;

// node:20 is initiator port
assign i_odma_0_dat = dat354;

// node:21 is initiator port
assign i_odma_1_dat = dat356;

// node:22 equality
assign dat356_nxt = dat355;

// node:23 is initiator port
assign i_odma_2_dat = dat358;

// node:24 equality
assign dat358_nxt = dat357;

// node:25 is initiator port
assign i_odma_3_dat = dat359;

// node:26 macro vector
wire             instr_0_valid26;
wire             instr_0_ready26;
wire             instr_1_valid26;
wire             instr_1_ready26;
wire             instr_2_valid26;
wire             instr_2_ready26;
wire             instr_3_valid26;
wire             instr_3_ready26;
wire             instr_4_valid26;
wire             instr_4_ready26;
wire             instr_5_valid26;
wire             instr_5_ready26;
wire             instr_6_valid26;
wire             instr_6_ready26;
wire             instr_7_valid26;
wire             instr_7_ready26;
wire             instr_8_valid26;
wire             instr_8_ready26;
wire             instr_9_valid26;
wire             instr_9_ready26;
wire             instr_10_valid26;
wire             instr_10_ready26;
wire             instr_11_valid26;
wire             instr_11_ready26;
wire             instr_12_valid26;
wire             instr_12_ready26;
wire             instr_13_valid26;
wire             instr_13_ready26;
wire             instr_14_valid26;
wire             instr_14_ready26;
wire             instr_15_valid26;
wire             instr_15_ready26;
wire             tk15_valid26;
wire             tk15_ready26;
wire             ik15_valid26;
wire             ik15_ready26;
wire             kap_valid26;
wire             kap_ready26;
vector_dat_17_2 unode26 (
    .t_instr_0_dat(dat8),
    .t_instr_1_dat(dat9),
    .t_instr_2_dat(dat11),
    .t_instr_3_dat(dat12),
    .t_instr_4_dat(dat14),
    .t_instr_5_dat(dat15),
    .t_instr_6_dat(dat17),
    .t_instr_7_dat(dat18),
    .t_instr_8_dat(dat20),
    .t_instr_9_dat(dat21),
    .t_instr_10_dat(dat23),
    .t_instr_11_dat(dat24),
    .t_instr_12_dat(dat26),
    .t_instr_13_dat(dat27),
    .t_instr_14_dat(dat29),
    .t_instr_15_dat(dat30),
    .t_k15_dat(dat37),
    .i_k15_dat(dat31_nxt),
    .i_kap_dat(dat340_nxt),
    .instr_0_valid(instr_0_valid26),
    .instr_0_ready(instr_0_ready26),
    .instr_1_valid(instr_1_valid26),
    .instr_1_ready(instr_1_ready26),
    .instr_2_valid(instr_2_valid26),
    .instr_2_ready(instr_2_ready26),
    .instr_3_valid(instr_3_valid26),
    .instr_3_ready(instr_3_ready26),
    .instr_4_valid(instr_4_valid26),
    .instr_4_ready(instr_4_ready26),
    .instr_5_valid(instr_5_valid26),
    .instr_5_ready(instr_5_ready26),
    .instr_6_valid(instr_6_valid26),
    .instr_6_ready(instr_6_ready26),
    .instr_7_valid(instr_7_valid26),
    .instr_7_ready(instr_7_ready26),
    .instr_8_valid(instr_8_valid26),
    .instr_8_ready(instr_8_ready26),
    .instr_9_valid(instr_9_valid26),
    .instr_9_ready(instr_9_ready26),
    .instr_10_valid(instr_10_valid26),
    .instr_10_ready(instr_10_ready26),
    .instr_11_valid(instr_11_valid26),
    .instr_11_ready(instr_11_ready26),
    .instr_12_valid(instr_12_valid26),
    .instr_12_ready(instr_12_ready26),
    .instr_13_valid(instr_13_valid26),
    .instr_13_ready(instr_13_ready26),
    .instr_14_valid(instr_14_valid26),
    .instr_14_ready(instr_14_ready26),
    .instr_15_valid(instr_15_valid26),
    .instr_15_ready(instr_15_ready26),
    .tk15_valid(tk15_valid26),
    .tk15_ready(tk15_ready26),
    .ik15_valid(ik15_valid26),
    .ik15_ready(ik15_ready26),
    .kap_valid(kap_valid26),
    .kap_ready(kap_ready26),
    .clk(clk),
    .reset_n(reset_n)
);
// node:27 macro inmux
wire       [3:0] sel2750;
inmux_dat_4_1 unode27 (
    .t_k15_dat(dat31),
    .t_k13_dat(dat41),
    .t_k1_dat(dat42),
    .t_c_dat(dat344),
    .i_inmux_dat(dat32_nxt),
    .sel(sel2750),
    .clk(clk),
    .reset_n(reset_n)
);
// node:28 macro vmem
wire       [3:0] idma_valid28;
wire       [3:0] idma_ready28;
wire       [3:0] odma_valid28;
wire       [3:0] odma_ready28;
wire             tvs_valid28;
wire             tvs_ready28;
wire             ivs_valid28;
wire             ivs_ready28;
wire       [3:0] k_ctrl28;
vmem_dat_6_5 #(
    .VMEM_SIZE(NODE28_VMEM_SIZE),
    .VMEM0(NODE28_VMEM0),
    .VMEM1(NODE28_VMEM1),
    .VMEM2(NODE28_VMEM2),
    .VMEM3(NODE28_VMEM3),
    .VMEM4(NODE28_VMEM4),
    .VMEM5(NODE28_VMEM5),
    .VMEM6(NODE28_VMEM6),
    .VMEM7(NODE28_VMEM7),
    .VMEM8(NODE28_VMEM8),
    .VMEM9(NODE28_VMEM9),
    .VMEM10(NODE28_VMEM10),
    .VMEM11(NODE28_VMEM11),
    .VMEM12(NODE28_VMEM12),
    .VMEM13(NODE28_VMEM13),
    .VMEM14(NODE28_VMEM14),
    .VMEM15(NODE28_VMEM15),
    .VMEM16(NODE28_VMEM16),
    .VMEM17(NODE28_VMEM17),
    .VMEM18(NODE28_VMEM18),
    .VMEM19(NODE28_VMEM19),
    .VMEM20(NODE28_VMEM20),
    .VMEM21(NODE28_VMEM21),
    .VMEM22(NODE28_VMEM22),
    .VMEM23(NODE28_VMEM23),
    .VMEM24(NODE28_VMEM24),
    .VMEM25(NODE28_VMEM25),
    .VMEM26(NODE28_VMEM26),
    .VMEM27(NODE28_VMEM27),
    .VMEM28(NODE28_VMEM28),
    .VMEM29(NODE28_VMEM29),
    .VMEM30(NODE28_VMEM30),
    .VMEM31(NODE28_VMEM31)
) unode28 (
    .t_ivs_dat(dat33),
    .t_ka_dat(dat343),
    .t_idma_0_dat(dat349),
    .t_idma_1_dat(dat351),
    .t_idma_2_dat(dat352),
    .t_idma_3_dat(dat353),
    .i_ovs_dat(dat34),
    .i_odma_0_dat(dat354_nxt),
    .i_odma_1_dat(dat355_nxt),
    .i_odma_2_dat(dat357_nxt),
    .i_odma_3_dat(dat359_nxt),
    .idma_valid(idma_valid28),
    .idma_ready(idma_ready28),
    .odma_valid(odma_valid28),
    .odma_ready(odma_ready28),
    .tvs_valid(tvs_valid28),
    .tvs_ready(tvs_ready28),
    .ivs_valid(ivs_valid28),
    .ivs_ready(ivs_ready28),
    .k_ctrl(k_ctrl28),
    .clk(clk),
    .reset_n(reset_n)
);
// node:29 macro oumux
wire       [3:0] sel2950;
oumux_dat_2_5 unode29 (
    .t_oumux_dat(dat36),
    .t_c_dat(dat346),
    .i_k15_dat(dat37_nxt),
    .i_k8_dat(dat38_nxt),
    .i_k9_dat(dat39_nxt),
    .i_k14_dat(dat40_nxt),
    .i_k13_dat(dat41_nxt),
    .sel(sel2950),
    .clk(clk),
    .reset_n(reset_n)
);
// node:30 macro deconcat
assign {dat342_nxt, dat341_nxt} = dat340[263:0];
// node:31 macro perm_full_addr

perm_full_addr_dat_1_1 unode31 (
    .t_0_dat(dat341),
    .i_0_dat(dat345_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:32 macro perm_full_data

perm_full_data_dat_2_1 unode32 (
    .t_data_dat(dat32),
    .t_addr_dat(dat347),
    .i_data_dat(dat33_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:33 macro perm_full_data

perm_full_data_dat_2_1 unode33 (
    .t_data_dat(dat35),
    .t_addr_dat(dat348),
    .i_data_dat(dat36_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:34 macro ka_decode
wire       [3:0] k_ctrl34;
ka_decode_dat_1_3 unode34 (
    .t_ka_dat(dat342),
    .i_ka_dat(dat343_nxt),
    .i_k_sk_dat(dat344_nxt),
    .i_k_lk_dat(dat346_nxt),
    .k_ctrl(k_ctrl34),
    .clk(clk),
    .reset_n(reset_n)
);
// node:35 macro p_decode
wire       [3:0] k_ctrl35;
p_decode_dat_1_2 unode35 (
    .t_kp_dat(dat345),
    .i_p_sk_dat(dat347_nxt),
    .i_p_lk_dat(dat348_nxt),
    .k_ctrl(k_ctrl35),
    .clk(clk),
    .reset_n(reset_n)
);
// node:36 equality
assign dat35_nxt = dat34;

// node:37 equality
assign dat8_nxt = dat7;

// node:38 equality
assign dat9_nxt = dat7;

// node:39 equality
assign dat11_nxt = dat10;

// node:40 equality
assign dat12_nxt = dat10;

// node:41 equality
assign dat14_nxt = dat13;

// node:42 equality
assign dat15_nxt = dat13;

// node:43 equality
assign dat17_nxt = dat16;

// node:44 equality
assign dat18_nxt = dat16;

// node:45 equality
assign dat20_nxt = dat19;

// node:46 equality
assign dat21_nxt = dat19;

// node:47 equality
assign dat23_nxt = dat22;

// node:48 equality
assign dat24_nxt = dat22;

// node:49 equality
assign dat26_nxt = dat25;

// node:50 equality
assign dat27_nxt = dat25;

// node:51 equality
assign dat29_nxt = dat28;

// node:52 equality
assign dat30_nxt = dat28;

// node:53 macro funnel
wire       [7:0] nsel53;
wire       [7:0] nmode53;
funnel_dat_2_2 unode53 (
    .t_0_dat(dat38),
    .t_cfg_dat(dat337),
    .i_0_dat(dat43_nxt),
    .i_1_dat(dat133_nxt),
    .sel(nsel53),
    .mode(nmode53),
    .clk(clk),
    .reset_n(reset_n)
);
// node:54 macro funnel
wire       [7:0] nsel54;
wire       [7:0] nmode54;
funnel_dat_2_2 unode54 (
    .t_0_dat(dat39),
    .t_cfg_dat(dat338),
    .i_0_dat(dat44_nxt),
    .i_1_dat(dat134_nxt),
    .sel(nsel54),
    .mode(nmode54),
    .clk(clk),
    .reset_n(reset_n)
);
// node:55 macro defunnel
wire       [7:0] enable55;
wire       [7:0] mode55;
defunnel_dat_3_1 unode55 (
    .t_0_dat(dat287),
    .t_1_dat(dat312),
    .t_cfg_dat(dat339),
    .i_0_dat(dat42_nxt),
    .enable(enable55),
    .mode(mode55),
    .clk(clk),
    .reset_n(reset_n)
);
// node:56 macro deconcat
assign {dat339, dat338, dat337, dat332, dat331, dat326, dat325, dat320, dat319, dat314, dat313, dat307, dat306, dat301, dat300, dat295, dat294, dat289, dat288, dat284, dat283, dat280, dat279, dat276, dat275, dat272, dat271, dat252, dat251, dat248, dat247, dat244, dat243, dat240, dat239, dat221, dat219, dat215, dat213, dat211, dat209, dat207, dat205, dat203, dat201, dat197, dat195, dat193, dat191, dat189, dat187, dat185, dat183, dat179, dat177, dat175, dat173, dat171, dat169, dat167, dat165, dat161, dat159, dat157, dat155, dat153, dat151, dat131, dat129, dat125, dat123, dat121, dat119, dat117, dat115, dat113, dat111, dat107, dat105, dat103, dat101, dat99, dat97, dat95, dat93, dat89, dat87, dat85, dat83, dat81, dat79, dat77, dat75, dat71, dat69, dat67, dat65, dat63, dat61} = dat40[311:0];
// node:57 macro slice16
assign dat45 = {{3{dat43[15]}}, dat43[14:0]};
assign dat46 = {{3{dat43[31]}}, dat43[30:16]};
assign dat49 = {{3{dat43[47]}}, dat43[46:32]};
assign dat50 = {{3{dat43[63]}}, dat43[62:48]};
assign dat53 = {{3{dat43[79]}}, dat43[78:64]};
assign dat54 = {{3{dat43[95]}}, dat43[94:80]};
assign dat57 = {{3{dat43[111]}}, dat43[110:96]};
assign dat58 = {{3{dat43[127]}}, dat43[126:112]};
// node:58 macro slice16
assign dat47 = {{3{dat44[15]}}, dat44[14:0]};
assign dat48 = {{3{dat44[31]}}, dat44[30:16]};
assign dat51 = {{3{dat44[47]}}, dat44[46:32]};
assign dat52 = {{3{dat44[63]}}, dat44[62:48]};
assign dat55 = {{3{dat44[79]}}, dat44[78:64]};
assign dat56 = {{3{dat44[95]}}, dat44[94:80]};
assign dat59 = {{3{dat44[111]}}, dat44[110:96]};
assign dat60 = {{3{dat44[127]}}, dat44[126:112]};
// node:59 macro m2c

wire [1:0] n59sel; assign n59sel = dat61;
assign dat62 =
    (n59sel == 2'b00) ? dat45 :
    (n59sel == 2'b01) ? dat47 :
    (n59sel == 2'b10) ? 1 : 1;

// node:60 macro m2c

wire [1:0] n60sel; assign n60sel = dat63;
assign dat64 =
    (n60sel == 2'b00) ? dat46 :
    (n60sel == 2'b01) ? dat47 :
    (n60sel == 2'b10) ? 1 : 1;

// node:61 macro m2c

wire [1:0] n61sel; assign n61sel = dat65;
assign dat66 =
    (n61sel == 2'b00) ? dat46 :
    (n61sel == 2'b01) ? dat48 :
    (n61sel == 2'b10) ? 1 : 1;

// node:62 macro m2c

wire [1:0] n62sel; assign n62sel = dat67;
assign dat68 =
    (n62sel == 2'b00) ? dat47 :
    (n62sel == 2'b01) ? dat46 :
    (n62sel == 2'b10) ? 1 : 1;

// node:63 macro m2c

wire [1:0] n63sel; assign n63sel = dat69;
assign dat70 =
    (n63sel == 2'b00) ? dat47 :
    (n63sel == 2'b01) ? dat48 :
    (n63sel == 2'b10) ? 1 : 1;

// node:64 macro m2c

wire [1:0] n64sel; assign n64sel = dat71;
assign dat72 =
    (n64sel == 2'b00) ? dat48 :
    (n64sel == 2'b01) ? dat45 :
    (n64sel == 2'b10) ? 1 : 1;

// node:65 operator concat
assign dat73_nxt = {dat66, dat64, dat62, dat45};

// node:66 operator concat
assign dat74_nxt = {dat72, dat48, dat70, dat68};

// node:67 macro muladdsub

wire n67s1_en;
wire n67s2_en;
wire n67s3_en;

wire [17:0] n67_a0, n67_b0, n67_a1, n67_b1;
assign {n67_b1, n67_b0, n67_a1, n67_a0} = dat73;

reg[3:0] addsub_shiftreg_67;
reg[3:0] addsub_detect_67;

wire n67s1_ce;
wire n67s2_ce;
wire n67s3_ce;

always @(posedge clk) addsub_shiftreg_67<={addsub_shiftreg_67[2:0],dat75[0]};
always @(posedge clk) 
if(addsub_shiftreg_67[3]^addsub_shiftreg_67[2]) addsub_detect_67<=4'hF;
else addsub_detect_67 <=addsub_detect_67>>1;

assign n67s1_ce=n67s1_en|addsub_detect_67[0];
assign n67s2_ce=n67s2_en|addsub_detect_67[0];
assign n67s3_ce=n67s3_en|addsub_detect_67[0];

muladdsub muladdsub67 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n67s1_en),
    .CE1(n67s2_en),
    .CE2(n67s3_en),
    .ADDNSUB(dat75[0]),
    .A0(n67_a0),
    .A1(n67_b0),
    .B0(n67_a1),
    .B1(n67_b1),
    .SUM(dat76)
);

// node:68 macro muladdsub

wire n68s1_en;
wire n68s2_en;
wire n68s3_en;

wire [17:0] n68_a0, n68_b0, n68_a1, n68_b1;
assign {n68_b1, n68_b0, n68_a1, n68_a0} = dat74;

reg[3:0] addsub_shiftreg_68;
reg[3:0] addsub_detect_68;

wire n68s1_ce;
wire n68s2_ce;
wire n68s3_ce;

always @(posedge clk) addsub_shiftreg_68<={addsub_shiftreg_68[2:0],dat77[0]};
always @(posedge clk) 
if(addsub_shiftreg_68[3]^addsub_shiftreg_68[2]) addsub_detect_68<=4'hF;
else addsub_detect_68 <=addsub_detect_68>>1;

assign n68s1_ce=n68s1_en|addsub_detect_68[0];
assign n68s2_ce=n68s2_en|addsub_detect_68[0];
assign n68s3_ce=n68s3_en|addsub_detect_68[0];

muladdsub muladdsub68 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n68s1_en),
    .CE1(n68s2_en),
    .CE2(n68s3_en),
    .ADDNSUB(dat77[0]),
    .A0(n68_a0),
    .A1(n68_b0),
    .B0(n68_a1),
    .B1(n68_b1),
    .SUM(dat78)
);

// node:69 macro m2c

wire [1:0] n69sel; assign n69sel = dat79;
assign dat80 =
    (n69sel == 2'b00) ? dat49 :
    (n69sel == 2'b01) ? dat51 :
    (n69sel == 2'b10) ? 1 : 1;

// node:70 macro m2c

wire [1:0] n70sel; assign n70sel = dat81;
assign dat82 =
    (n70sel == 2'b00) ? dat50 :
    (n70sel == 2'b01) ? dat51 :
    (n70sel == 2'b10) ? 1 : 1;

// node:71 macro m2c

wire [1:0] n71sel; assign n71sel = dat83;
assign dat84 =
    (n71sel == 2'b00) ? dat50 :
    (n71sel == 2'b01) ? dat52 :
    (n71sel == 2'b10) ? 1 : 1;

// node:72 macro m2c

wire [1:0] n72sel; assign n72sel = dat85;
assign dat86 =
    (n72sel == 2'b00) ? dat51 :
    (n72sel == 2'b01) ? dat50 :
    (n72sel == 2'b10) ? 1 : 1;

// node:73 macro m2c

wire [1:0] n73sel; assign n73sel = dat87;
assign dat88 =
    (n73sel == 2'b00) ? dat51 :
    (n73sel == 2'b01) ? dat52 :
    (n73sel == 2'b10) ? 1 : 1;

// node:74 macro m2c

wire [1:0] n74sel; assign n74sel = dat89;
assign dat90 =
    (n74sel == 2'b00) ? dat52 :
    (n74sel == 2'b01) ? dat49 :
    (n74sel == 2'b10) ? 1 : 1;

// node:75 operator concat
assign dat91_nxt = {dat84, dat82, dat80, dat49};

// node:76 operator concat
assign dat92_nxt = {dat90, dat52, dat88, dat86};

// node:77 macro muladdsub

wire n77s1_en;
wire n77s2_en;
wire n77s3_en;

wire [17:0] n77_a0, n77_b0, n77_a1, n77_b1;
assign {n77_b1, n77_b0, n77_a1, n77_a0} = dat91;

reg[3:0] addsub_shiftreg_77;
reg[3:0] addsub_detect_77;

wire n77s1_ce;
wire n77s2_ce;
wire n77s3_ce;

always @(posedge clk) addsub_shiftreg_77<={addsub_shiftreg_77[2:0],dat93[0]};
always @(posedge clk) 
if(addsub_shiftreg_77[3]^addsub_shiftreg_77[2]) addsub_detect_77<=4'hF;
else addsub_detect_77 <=addsub_detect_77>>1;

assign n77s1_ce=n77s1_en|addsub_detect_77[0];
assign n77s2_ce=n77s2_en|addsub_detect_77[0];
assign n77s3_ce=n77s3_en|addsub_detect_77[0];

muladdsub muladdsub77 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n77s1_en),
    .CE1(n77s2_en),
    .CE2(n77s3_en),
    .ADDNSUB(dat93[0]),
    .A0(n77_a0),
    .A1(n77_b0),
    .B0(n77_a1),
    .B1(n77_b1),
    .SUM(dat94)
);

// node:78 macro muladdsub

wire n78s1_en;
wire n78s2_en;
wire n78s3_en;

wire [17:0] n78_a0, n78_b0, n78_a1, n78_b1;
assign {n78_b1, n78_b0, n78_a1, n78_a0} = dat92;

reg[3:0] addsub_shiftreg_78;
reg[3:0] addsub_detect_78;

wire n78s1_ce;
wire n78s2_ce;
wire n78s3_ce;

always @(posedge clk) addsub_shiftreg_78<={addsub_shiftreg_78[2:0],dat95[0]};
always @(posedge clk) 
if(addsub_shiftreg_78[3]^addsub_shiftreg_78[2]) addsub_detect_78<=4'hF;
else addsub_detect_78 <=addsub_detect_78>>1;

assign n78s1_ce=n78s1_en|addsub_detect_78[0];
assign n78s2_ce=n78s2_en|addsub_detect_78[0];
assign n78s3_ce=n78s3_en|addsub_detect_78[0];

muladdsub muladdsub78 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n78s1_en),
    .CE1(n78s2_en),
    .CE2(n78s3_en),
    .ADDNSUB(dat95[0]),
    .A0(n78_a0),
    .A1(n78_b0),
    .B0(n78_a1),
    .B1(n78_b1),
    .SUM(dat96)
);

// node:79 macro m2c

wire [1:0] n79sel; assign n79sel = dat97;
assign dat98 =
    (n79sel == 2'b00) ? dat53 :
    (n79sel == 2'b01) ? dat55 :
    (n79sel == 2'b10) ? 1 : 1;

// node:80 macro m2c

wire [1:0] n80sel; assign n80sel = dat99;
assign dat100 =
    (n80sel == 2'b00) ? dat54 :
    (n80sel == 2'b01) ? dat55 :
    (n80sel == 2'b10) ? 1 : 1;

// node:81 macro m2c

wire [1:0] n81sel; assign n81sel = dat101;
assign dat102 =
    (n81sel == 2'b00) ? dat54 :
    (n81sel == 2'b01) ? dat56 :
    (n81sel == 2'b10) ? 1 : 1;

// node:82 macro m2c

wire [1:0] n82sel; assign n82sel = dat103;
assign dat104 =
    (n82sel == 2'b00) ? dat55 :
    (n82sel == 2'b01) ? dat54 :
    (n82sel == 2'b10) ? 1 : 1;

// node:83 macro m2c

wire [1:0] n83sel; assign n83sel = dat105;
assign dat106 =
    (n83sel == 2'b00) ? dat55 :
    (n83sel == 2'b01) ? dat56 :
    (n83sel == 2'b10) ? 1 : 1;

// node:84 macro m2c

wire [1:0] n84sel; assign n84sel = dat107;
assign dat108 =
    (n84sel == 2'b00) ? dat56 :
    (n84sel == 2'b01) ? dat53 :
    (n84sel == 2'b10) ? 1 : 1;

// node:85 operator concat
assign dat109_nxt = {dat102, dat100, dat98, dat53};

// node:86 operator concat
assign dat110_nxt = {dat108, dat56, dat106, dat104};

// node:87 macro muladdsub

wire n87s1_en;
wire n87s2_en;
wire n87s3_en;

wire [17:0] n87_a0, n87_b0, n87_a1, n87_b1;
assign {n87_b1, n87_b0, n87_a1, n87_a0} = dat109;

reg[3:0] addsub_shiftreg_87;
reg[3:0] addsub_detect_87;

wire n87s1_ce;
wire n87s2_ce;
wire n87s3_ce;

always @(posedge clk) addsub_shiftreg_87<={addsub_shiftreg_87[2:0],dat111[0]};
always @(posedge clk) 
if(addsub_shiftreg_87[3]^addsub_shiftreg_87[2]) addsub_detect_87<=4'hF;
else addsub_detect_87 <=addsub_detect_87>>1;

assign n87s1_ce=n87s1_en|addsub_detect_87[0];
assign n87s2_ce=n87s2_en|addsub_detect_87[0];
assign n87s3_ce=n87s3_en|addsub_detect_87[0];

muladdsub muladdsub87 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n87s1_en),
    .CE1(n87s2_en),
    .CE2(n87s3_en),
    .ADDNSUB(dat111[0]),
    .A0(n87_a0),
    .A1(n87_b0),
    .B0(n87_a1),
    .B1(n87_b1),
    .SUM(dat112)
);

// node:88 macro muladdsub

wire n88s1_en;
wire n88s2_en;
wire n88s3_en;

wire [17:0] n88_a0, n88_b0, n88_a1, n88_b1;
assign {n88_b1, n88_b0, n88_a1, n88_a0} = dat110;

reg[3:0] addsub_shiftreg_88;
reg[3:0] addsub_detect_88;

wire n88s1_ce;
wire n88s2_ce;
wire n88s3_ce;

always @(posedge clk) addsub_shiftreg_88<={addsub_shiftreg_88[2:0],dat113[0]};
always @(posedge clk) 
if(addsub_shiftreg_88[3]^addsub_shiftreg_88[2]) addsub_detect_88<=4'hF;
else addsub_detect_88 <=addsub_detect_88>>1;

assign n88s1_ce=n88s1_en|addsub_detect_88[0];
assign n88s2_ce=n88s2_en|addsub_detect_88[0];
assign n88s3_ce=n88s3_en|addsub_detect_88[0];

muladdsub muladdsub88 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n88s1_en),
    .CE1(n88s2_en),
    .CE2(n88s3_en),
    .ADDNSUB(dat113[0]),
    .A0(n88_a0),
    .A1(n88_b0),
    .B0(n88_a1),
    .B1(n88_b1),
    .SUM(dat114)
);

// node:89 macro m2c

wire [1:0] n89sel; assign n89sel = dat115;
assign dat116 =
    (n89sel == 2'b00) ? dat57 :
    (n89sel == 2'b01) ? dat59 :
    (n89sel == 2'b10) ? 1 : 1;

// node:90 macro m2c

wire [1:0] n90sel; assign n90sel = dat117;
assign dat118 =
    (n90sel == 2'b00) ? dat58 :
    (n90sel == 2'b01) ? dat59 :
    (n90sel == 2'b10) ? 1 : 1;

// node:91 macro m2c

wire [1:0] n91sel; assign n91sel = dat119;
assign dat120 =
    (n91sel == 2'b00) ? dat58 :
    (n91sel == 2'b01) ? dat60 :
    (n91sel == 2'b10) ? 1 : 1;

// node:92 macro m2c

wire [1:0] n92sel; assign n92sel = dat121;
assign dat122 =
    (n92sel == 2'b00) ? dat59 :
    (n92sel == 2'b01) ? dat58 :
    (n92sel == 2'b10) ? 1 : 1;

// node:93 macro m2c

wire [1:0] n93sel; assign n93sel = dat123;
assign dat124 =
    (n93sel == 2'b00) ? dat59 :
    (n93sel == 2'b01) ? dat60 :
    (n93sel == 2'b10) ? 1 : 1;

// node:94 macro m2c

wire [1:0] n94sel; assign n94sel = dat125;
assign dat126 =
    (n94sel == 2'b00) ? dat60 :
    (n94sel == 2'b01) ? dat57 :
    (n94sel == 2'b10) ? 1 : 1;

// node:95 operator concat
assign dat127_nxt = {dat120, dat118, dat116, dat57};

// node:96 operator concat
assign dat128_nxt = {dat126, dat60, dat124, dat122};

// node:97 macro muladdsub

wire n97s1_en;
wire n97s2_en;
wire n97s3_en;

wire [17:0] n97_a0, n97_b0, n97_a1, n97_b1;
assign {n97_b1, n97_b0, n97_a1, n97_a0} = dat127;

reg[3:0] addsub_shiftreg_97;
reg[3:0] addsub_detect_97;

wire n97s1_ce;
wire n97s2_ce;
wire n97s3_ce;

always @(posedge clk) addsub_shiftreg_97<={addsub_shiftreg_97[2:0],dat129[0]};
always @(posedge clk) 
if(addsub_shiftreg_97[3]^addsub_shiftreg_97[2]) addsub_detect_97<=4'hF;
else addsub_detect_97 <=addsub_detect_97>>1;

assign n97s1_ce=n97s1_en|addsub_detect_97[0];
assign n97s2_ce=n97s2_en|addsub_detect_97[0];
assign n97s3_ce=n97s3_en|addsub_detect_97[0];

muladdsub muladdsub97 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n97s1_en),
    .CE1(n97s2_en),
    .CE2(n97s3_en),
    .ADDNSUB(dat129[0]),
    .A0(n97_a0),
    .A1(n97_b0),
    .B0(n97_a1),
    .B1(n97_b1),
    .SUM(dat130)
);

// node:98 macro muladdsub

wire n98s1_en;
wire n98s2_en;
wire n98s3_en;

wire [17:0] n98_a0, n98_b0, n98_a1, n98_b1;
assign {n98_b1, n98_b0, n98_a1, n98_a0} = dat128;

reg[3:0] addsub_shiftreg_98;
reg[3:0] addsub_detect_98;

wire n98s1_ce;
wire n98s2_ce;
wire n98s3_ce;

always @(posedge clk) addsub_shiftreg_98<={addsub_shiftreg_98[2:0],dat131[0]};
always @(posedge clk) 
if(addsub_shiftreg_98[3]^addsub_shiftreg_98[2]) addsub_detect_98<=4'hF;
else addsub_detect_98 <=addsub_detect_98>>1;

assign n98s1_ce=n98s1_en|addsub_detect_98[0];
assign n98s2_ce=n98s2_en|addsub_detect_98[0];
assign n98s3_ce=n98s3_en|addsub_detect_98[0];

muladdsub muladdsub98 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n98s1_en),
    .CE1(n98s2_en),
    .CE2(n98s3_en),
    .ADDNSUB(dat131[0]),
    .A0(n98_a0),
    .A1(n98_b0),
    .B0(n98_a1),
    .B1(n98_b1),
    .SUM(dat132)
);

// node:99 macro slice16
assign dat135 = {{3{dat133[15]}}, dat133[14:0]};
assign dat136 = {{3{dat133[31]}}, dat133[30:16]};
assign dat139 = {{3{dat133[47]}}, dat133[46:32]};
assign dat140 = {{3{dat133[63]}}, dat133[62:48]};
assign dat143 = {{3{dat133[79]}}, dat133[78:64]};
assign dat144 = {{3{dat133[95]}}, dat133[94:80]};
assign dat147 = {{3{dat133[111]}}, dat133[110:96]};
assign dat148 = {{3{dat133[127]}}, dat133[126:112]};
// node:100 macro slice16
assign dat137 = {{3{dat134[15]}}, dat134[14:0]};
assign dat138 = {{3{dat134[31]}}, dat134[30:16]};
assign dat141 = {{3{dat134[47]}}, dat134[46:32]};
assign dat142 = {{3{dat134[63]}}, dat134[62:48]};
assign dat145 = {{3{dat134[79]}}, dat134[78:64]};
assign dat146 = {{3{dat134[95]}}, dat134[94:80]};
assign dat149 = {{3{dat134[111]}}, dat134[110:96]};
assign dat150 = {{3{dat134[127]}}, dat134[126:112]};
// node:101 macro m2c

wire [1:0] n101sel; assign n101sel = dat151;
assign dat152 =
    (n101sel == 2'b00) ? dat135 :
    (n101sel == 2'b01) ? dat137 :
    (n101sel == 2'b10) ? 1 : 1;

// node:102 macro m2c

wire [1:0] n102sel; assign n102sel = dat153;
assign dat154 =
    (n102sel == 2'b00) ? dat136 :
    (n102sel == 2'b01) ? dat137 :
    (n102sel == 2'b10) ? 1 : 1;

// node:103 macro m2c

wire [1:0] n103sel; assign n103sel = dat155;
assign dat156 =
    (n103sel == 2'b00) ? dat136 :
    (n103sel == 2'b01) ? dat138 :
    (n103sel == 2'b10) ? 1 : 1;

// node:104 macro m2c

wire [1:0] n104sel; assign n104sel = dat157;
assign dat158 =
    (n104sel == 2'b00) ? dat137 :
    (n104sel == 2'b01) ? dat136 :
    (n104sel == 2'b10) ? 1 : 1;

// node:105 macro m2c

wire [1:0] n105sel; assign n105sel = dat159;
assign dat160 =
    (n105sel == 2'b00) ? dat137 :
    (n105sel == 2'b01) ? dat138 :
    (n105sel == 2'b10) ? 1 : 1;

// node:106 macro m2c

wire [1:0] n106sel; assign n106sel = dat161;
assign dat162 =
    (n106sel == 2'b00) ? dat138 :
    (n106sel == 2'b01) ? dat135 :
    (n106sel == 2'b10) ? 1 : 1;

// node:107 operator concat
assign dat163_nxt = {dat156, dat154, dat152, dat135};

// node:108 operator concat
assign dat164_nxt = {dat162, dat138, dat160, dat158};

// node:109 macro muladdsub

wire n109s1_en;
wire n109s2_en;
wire n109s3_en;

wire [17:0] n109_a0, n109_b0, n109_a1, n109_b1;
assign {n109_b1, n109_b0, n109_a1, n109_a0} = dat163;

reg[3:0] addsub_shiftreg_109;
reg[3:0] addsub_detect_109;

wire n109s1_ce;
wire n109s2_ce;
wire n109s3_ce;

always @(posedge clk) addsub_shiftreg_109<={addsub_shiftreg_109[2:0],dat165[0]};
always @(posedge clk) 
if(addsub_shiftreg_109[3]^addsub_shiftreg_109[2]) addsub_detect_109<=4'hF;
else addsub_detect_109 <=addsub_detect_109>>1;

assign n109s1_ce=n109s1_en|addsub_detect_109[0];
assign n109s2_ce=n109s2_en|addsub_detect_109[0];
assign n109s3_ce=n109s3_en|addsub_detect_109[0];

muladdsub muladdsub109 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n109s1_en),
    .CE1(n109s2_en),
    .CE2(n109s3_en),
    .ADDNSUB(dat165[0]),
    .A0(n109_a0),
    .A1(n109_b0),
    .B0(n109_a1),
    .B1(n109_b1),
    .SUM(dat166)
);

// node:110 macro muladdsub

wire n110s1_en;
wire n110s2_en;
wire n110s3_en;

wire [17:0] n110_a0, n110_b0, n110_a1, n110_b1;
assign {n110_b1, n110_b0, n110_a1, n110_a0} = dat164;

reg[3:0] addsub_shiftreg_110;
reg[3:0] addsub_detect_110;

wire n110s1_ce;
wire n110s2_ce;
wire n110s3_ce;

always @(posedge clk) addsub_shiftreg_110<={addsub_shiftreg_110[2:0],dat167[0]};
always @(posedge clk) 
if(addsub_shiftreg_110[3]^addsub_shiftreg_110[2]) addsub_detect_110<=4'hF;
else addsub_detect_110 <=addsub_detect_110>>1;

assign n110s1_ce=n110s1_en|addsub_detect_110[0];
assign n110s2_ce=n110s2_en|addsub_detect_110[0];
assign n110s3_ce=n110s3_en|addsub_detect_110[0];

muladdsub muladdsub110 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n110s1_en),
    .CE1(n110s2_en),
    .CE2(n110s3_en),
    .ADDNSUB(dat167[0]),
    .A0(n110_a0),
    .A1(n110_b0),
    .B0(n110_a1),
    .B1(n110_b1),
    .SUM(dat168)
);

// node:111 macro m2c

wire [1:0] n111sel; assign n111sel = dat169;
assign dat170 =
    (n111sel == 2'b00) ? dat139 :
    (n111sel == 2'b01) ? dat141 :
    (n111sel == 2'b10) ? 1 : 1;

// node:112 macro m2c

wire [1:0] n112sel; assign n112sel = dat171;
assign dat172 =
    (n112sel == 2'b00) ? dat140 :
    (n112sel == 2'b01) ? dat141 :
    (n112sel == 2'b10) ? 1 : 1;

// node:113 macro m2c

wire [1:0] n113sel; assign n113sel = dat173;
assign dat174 =
    (n113sel == 2'b00) ? dat140 :
    (n113sel == 2'b01) ? dat142 :
    (n113sel == 2'b10) ? 1 : 1;

// node:114 macro m2c

wire [1:0] n114sel; assign n114sel = dat175;
assign dat176 =
    (n114sel == 2'b00) ? dat141 :
    (n114sel == 2'b01) ? dat140 :
    (n114sel == 2'b10) ? 1 : 1;

// node:115 macro m2c

wire [1:0] n115sel; assign n115sel = dat177;
assign dat178 =
    (n115sel == 2'b00) ? dat141 :
    (n115sel == 2'b01) ? dat142 :
    (n115sel == 2'b10) ? 1 : 1;

// node:116 macro m2c

wire [1:0] n116sel; assign n116sel = dat179;
assign dat180 =
    (n116sel == 2'b00) ? dat142 :
    (n116sel == 2'b01) ? dat139 :
    (n116sel == 2'b10) ? 1 : 1;

// node:117 operator concat
assign dat181_nxt = {dat174, dat172, dat170, dat139};

// node:118 operator concat
assign dat182_nxt = {dat180, dat142, dat178, dat176};

// node:119 macro muladdsub

wire n119s1_en;
wire n119s2_en;
wire n119s3_en;

wire [17:0] n119_a0, n119_b0, n119_a1, n119_b1;
assign {n119_b1, n119_b0, n119_a1, n119_a0} = dat181;

reg[3:0] addsub_shiftreg_119;
reg[3:0] addsub_detect_119;

wire n119s1_ce;
wire n119s2_ce;
wire n119s3_ce;

always @(posedge clk) addsub_shiftreg_119<={addsub_shiftreg_119[2:0],dat183[0]};
always @(posedge clk) 
if(addsub_shiftreg_119[3]^addsub_shiftreg_119[2]) addsub_detect_119<=4'hF;
else addsub_detect_119 <=addsub_detect_119>>1;

assign n119s1_ce=n119s1_en|addsub_detect_119[0];
assign n119s2_ce=n119s2_en|addsub_detect_119[0];
assign n119s3_ce=n119s3_en|addsub_detect_119[0];

muladdsub muladdsub119 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n119s1_en),
    .CE1(n119s2_en),
    .CE2(n119s3_en),
    .ADDNSUB(dat183[0]),
    .A0(n119_a0),
    .A1(n119_b0),
    .B0(n119_a1),
    .B1(n119_b1),
    .SUM(dat184)
);

// node:120 macro muladdsub

wire n120s1_en;
wire n120s2_en;
wire n120s3_en;

wire [17:0] n120_a0, n120_b0, n120_a1, n120_b1;
assign {n120_b1, n120_b0, n120_a1, n120_a0} = dat182;

reg[3:0] addsub_shiftreg_120;
reg[3:0] addsub_detect_120;

wire n120s1_ce;
wire n120s2_ce;
wire n120s3_ce;

always @(posedge clk) addsub_shiftreg_120<={addsub_shiftreg_120[2:0],dat185[0]};
always @(posedge clk) 
if(addsub_shiftreg_120[3]^addsub_shiftreg_120[2]) addsub_detect_120<=4'hF;
else addsub_detect_120 <=addsub_detect_120>>1;

assign n120s1_ce=n120s1_en|addsub_detect_120[0];
assign n120s2_ce=n120s2_en|addsub_detect_120[0];
assign n120s3_ce=n120s3_en|addsub_detect_120[0];

muladdsub muladdsub120 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n120s1_en),
    .CE1(n120s2_en),
    .CE2(n120s3_en),
    .ADDNSUB(dat185[0]),
    .A0(n120_a0),
    .A1(n120_b0),
    .B0(n120_a1),
    .B1(n120_b1),
    .SUM(dat186)
);

// node:121 macro m2c

wire [1:0] n121sel; assign n121sel = dat187;
assign dat188 =
    (n121sel == 2'b00) ? dat143 :
    (n121sel == 2'b01) ? dat145 :
    (n121sel == 2'b10) ? 1 : 1;

// node:122 macro m2c

wire [1:0] n122sel; assign n122sel = dat189;
assign dat190 =
    (n122sel == 2'b00) ? dat144 :
    (n122sel == 2'b01) ? dat145 :
    (n122sel == 2'b10) ? 1 : 1;

// node:123 macro m2c

wire [1:0] n123sel; assign n123sel = dat191;
assign dat192 =
    (n123sel == 2'b00) ? dat144 :
    (n123sel == 2'b01) ? dat146 :
    (n123sel == 2'b10) ? 1 : 1;

// node:124 macro m2c

wire [1:0] n124sel; assign n124sel = dat193;
assign dat194 =
    (n124sel == 2'b00) ? dat145 :
    (n124sel == 2'b01) ? dat144 :
    (n124sel == 2'b10) ? 1 : 1;

// node:125 macro m2c

wire [1:0] n125sel; assign n125sel = dat195;
assign dat196 =
    (n125sel == 2'b00) ? dat145 :
    (n125sel == 2'b01) ? dat146 :
    (n125sel == 2'b10) ? 1 : 1;

// node:126 macro m2c

wire [1:0] n126sel; assign n126sel = dat197;
assign dat198 =
    (n126sel == 2'b00) ? dat146 :
    (n126sel == 2'b01) ? dat143 :
    (n126sel == 2'b10) ? 1 : 1;

// node:127 operator concat
assign dat199_nxt = {dat192, dat190, dat188, dat143};

// node:128 operator concat
assign dat200_nxt = {dat198, dat146, dat196, dat194};

// node:129 macro muladdsub

wire n129s1_en;
wire n129s2_en;
wire n129s3_en;

wire [17:0] n129_a0, n129_b0, n129_a1, n129_b1;
assign {n129_b1, n129_b0, n129_a1, n129_a0} = dat199;

reg[3:0] addsub_shiftreg_129;
reg[3:0] addsub_detect_129;

wire n129s1_ce;
wire n129s2_ce;
wire n129s3_ce;

always @(posedge clk) addsub_shiftreg_129<={addsub_shiftreg_129[2:0],dat201[0]};
always @(posedge clk) 
if(addsub_shiftreg_129[3]^addsub_shiftreg_129[2]) addsub_detect_129<=4'hF;
else addsub_detect_129 <=addsub_detect_129>>1;

assign n129s1_ce=n129s1_en|addsub_detect_129[0];
assign n129s2_ce=n129s2_en|addsub_detect_129[0];
assign n129s3_ce=n129s3_en|addsub_detect_129[0];

muladdsub muladdsub129 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n129s1_en),
    .CE1(n129s2_en),
    .CE2(n129s3_en),
    .ADDNSUB(dat201[0]),
    .A0(n129_a0),
    .A1(n129_b0),
    .B0(n129_a1),
    .B1(n129_b1),
    .SUM(dat202)
);

// node:130 macro muladdsub

wire n130s1_en;
wire n130s2_en;
wire n130s3_en;

wire [17:0] n130_a0, n130_b0, n130_a1, n130_b1;
assign {n130_b1, n130_b0, n130_a1, n130_a0} = dat200;

reg[3:0] addsub_shiftreg_130;
reg[3:0] addsub_detect_130;

wire n130s1_ce;
wire n130s2_ce;
wire n130s3_ce;

always @(posedge clk) addsub_shiftreg_130<={addsub_shiftreg_130[2:0],dat203[0]};
always @(posedge clk) 
if(addsub_shiftreg_130[3]^addsub_shiftreg_130[2]) addsub_detect_130<=4'hF;
else addsub_detect_130 <=addsub_detect_130>>1;

assign n130s1_ce=n130s1_en|addsub_detect_130[0];
assign n130s2_ce=n130s2_en|addsub_detect_130[0];
assign n130s3_ce=n130s3_en|addsub_detect_130[0];

muladdsub muladdsub130 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n130s1_en),
    .CE1(n130s2_en),
    .CE2(n130s3_en),
    .ADDNSUB(dat203[0]),
    .A0(n130_a0),
    .A1(n130_b0),
    .B0(n130_a1),
    .B1(n130_b1),
    .SUM(dat204)
);

// node:131 macro m2c

wire [1:0] n131sel; assign n131sel = dat205;
assign dat206 =
    (n131sel == 2'b00) ? dat147 :
    (n131sel == 2'b01) ? dat149 :
    (n131sel == 2'b10) ? 1 : 1;

// node:132 macro m2c

wire [1:0] n132sel; assign n132sel = dat207;
assign dat208 =
    (n132sel == 2'b00) ? dat148 :
    (n132sel == 2'b01) ? dat149 :
    (n132sel == 2'b10) ? 1 : 1;

// node:133 macro m2c

wire [1:0] n133sel; assign n133sel = dat209;
assign dat210 =
    (n133sel == 2'b00) ? dat148 :
    (n133sel == 2'b01) ? dat150 :
    (n133sel == 2'b10) ? 1 : 1;

// node:134 macro m2c

wire [1:0] n134sel; assign n134sel = dat211;
assign dat212 =
    (n134sel == 2'b00) ? dat149 :
    (n134sel == 2'b01) ? dat148 :
    (n134sel == 2'b10) ? 1 : 1;

// node:135 macro m2c

wire [1:0] n135sel; assign n135sel = dat213;
assign dat214 =
    (n135sel == 2'b00) ? dat149 :
    (n135sel == 2'b01) ? dat150 :
    (n135sel == 2'b10) ? 1 : 1;

// node:136 macro m2c

wire [1:0] n136sel; assign n136sel = dat215;
assign dat216 =
    (n136sel == 2'b00) ? dat150 :
    (n136sel == 2'b01) ? dat147 :
    (n136sel == 2'b10) ? 1 : 1;

// node:137 operator concat
assign dat217_nxt = {dat210, dat208, dat206, dat147};

// node:138 operator concat
assign dat218_nxt = {dat216, dat150, dat214, dat212};

// node:139 macro muladdsub

wire n139s1_en;
wire n139s2_en;
wire n139s3_en;

wire [17:0] n139_a0, n139_b0, n139_a1, n139_b1;
assign {n139_b1, n139_b0, n139_a1, n139_a0} = dat217;

reg[3:0] addsub_shiftreg_139;
reg[3:0] addsub_detect_139;

wire n139s1_ce;
wire n139s2_ce;
wire n139s3_ce;

always @(posedge clk) addsub_shiftreg_139<={addsub_shiftreg_139[2:0],dat219[0]};
always @(posedge clk) 
if(addsub_shiftreg_139[3]^addsub_shiftreg_139[2]) addsub_detect_139<=4'hF;
else addsub_detect_139 <=addsub_detect_139>>1;

assign n139s1_ce=n139s1_en|addsub_detect_139[0];
assign n139s2_ce=n139s2_en|addsub_detect_139[0];
assign n139s3_ce=n139s3_en|addsub_detect_139[0];

muladdsub muladdsub139 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n139s1_en),
    .CE1(n139s2_en),
    .CE2(n139s3_en),
    .ADDNSUB(dat219[0]),
    .A0(n139_a0),
    .A1(n139_b0),
    .B0(n139_a1),
    .B1(n139_b1),
    .SUM(dat220)
);

// node:140 macro muladdsub

wire n140s1_en;
wire n140s2_en;
wire n140s3_en;

wire [17:0] n140_a0, n140_b0, n140_a1, n140_b1;
assign {n140_b1, n140_b0, n140_a1, n140_a0} = dat218;

reg[3:0] addsub_shiftreg_140;
reg[3:0] addsub_detect_140;

wire n140s1_ce;
wire n140s2_ce;
wire n140s3_ce;

always @(posedge clk) addsub_shiftreg_140<={addsub_shiftreg_140[2:0],dat221[0]};
always @(posedge clk) 
if(addsub_shiftreg_140[3]^addsub_shiftreg_140[2]) addsub_detect_140<=4'hF;
else addsub_detect_140 <=addsub_detect_140>>1;

assign n140s1_ce=n140s1_en|addsub_detect_140[0];
assign n140s2_ce=n140s2_en|addsub_detect_140[0];
assign n140s3_ce=n140s3_en|addsub_detect_140[0];

muladdsub muladdsub140 (
    .CLK0(clk),
    .RST0(~reset_n),
    .CE0(n140s1_en),
    .CE1(n140s2_en),
    .CE2(n140s3_en),
    .ADDNSUB(dat221[0]),
    .A0(n140_a0),
    .A1(n140_b0),
    .B0(n140_a1),
    .B1(n140_b1),
    .SUM(dat222)
);

// node:141 operator add
assign dat223_nxt = ($signed(dat76) + $signed(dat112));

// node:142 operator add
assign dat224_nxt = ($signed(dat78) + $signed(dat114));

// node:143 operator add
assign dat225_nxt = ($signed(dat94) + $signed(dat130));

// node:144 operator add
assign dat226_nxt = ($signed(dat96) + $signed(dat132));

// node:145 operator sub
assign dat227_nxt = ($signed(dat76) - $signed(dat112));

// node:146 operator sub
assign dat228_nxt = ($signed(dat78) - $signed(dat114));

// node:147 operator sub
assign dat229_nxt = ($signed(dat94) - $signed(dat130));

// node:148 operator sub
assign dat230_nxt = ($signed(dat96) - $signed(dat132));

// node:149 operator add
assign dat231 = ($signed(dat223) + $signed(dat225));

// node:150 operator add
assign dat232 = ($signed(dat224) + $signed(dat226));

// node:151 operator add
assign dat233 = ($signed(dat227) + $signed(dat230));

// node:152 operator sub
assign dat234 = ($signed(dat228) - $signed(dat229));

// node:153 operator sub
assign dat235 = ($signed(dat223) - $signed(dat225));

// node:154 operator sub
assign dat236 = ($signed(dat224) - $signed(dat226));

// node:155 operator sub
assign dat237 = ($signed(dat227) - $signed(dat230));

// node:156 operator add
assign dat238 = ($signed(dat228) + $signed(dat229));

// node:157 macro m2c

wire [1:0] n157sel; assign n157sel = dat239;
assign dat241_nxt =
    (n157sel == 2'b00) ? dat76 :
    (n157sel == 2'b01) ? dat231 :
    (n157sel == 2'b10) ? 1 : 1;

// node:158 macro m2c

wire [1:0] n158sel; assign n158sel = dat240;
assign dat242_nxt =
    (n158sel == 2'b00) ? dat78 :
    (n158sel == 2'b01) ? dat232 :
    (n158sel == 2'b10) ? 1 : 1;

// node:159 macro m2c

wire [1:0] n159sel; assign n159sel = dat243;
assign dat245_nxt =
    (n159sel == 2'b00) ? dat94 :
    (n159sel == 2'b01) ? dat233 :
    (n159sel == 2'b10) ? 1 : 1;

// node:160 macro m2c

wire [1:0] n160sel; assign n160sel = dat244;
assign dat246_nxt =
    (n160sel == 2'b00) ? dat96 :
    (n160sel == 2'b01) ? dat234 :
    (n160sel == 2'b10) ? 1 : 1;

// node:161 macro m2c

wire [1:0] n161sel; assign n161sel = dat247;
assign dat249_nxt =
    (n161sel == 2'b00) ? dat112 :
    (n161sel == 2'b01) ? dat235 :
    (n161sel == 2'b10) ? 1 : 1;

// node:162 macro m2c

wire [1:0] n162sel; assign n162sel = dat248;
assign dat250_nxt =
    (n162sel == 2'b00) ? dat114 :
    (n162sel == 2'b01) ? dat236 :
    (n162sel == 2'b10) ? 1 : 1;

// node:163 macro m2c

wire [1:0] n163sel; assign n163sel = dat251;
assign dat253_nxt =
    (n163sel == 2'b00) ? dat130 :
    (n163sel == 2'b01) ? dat237 :
    (n163sel == 2'b10) ? 1 : 1;

// node:164 macro m2c

wire [1:0] n164sel; assign n164sel = dat252;
assign dat254_nxt =
    (n164sel == 2'b00) ? dat132 :
    (n164sel == 2'b01) ? dat238 :
    (n164sel == 2'b10) ? 1 : 1;

// node:165 operator add
assign dat255_nxt = ($signed(dat166) + $signed(dat202));

// node:166 operator add
assign dat256_nxt = ($signed(dat168) + $signed(dat204));

// node:167 operator add
assign dat257_nxt = ($signed(dat184) + $signed(dat220));

// node:168 operator add
assign dat258_nxt = ($signed(dat186) + $signed(dat222));

// node:169 operator sub
assign dat259_nxt = ($signed(dat166) - $signed(dat202));

// node:170 operator sub
assign dat260_nxt = ($signed(dat168) - $signed(dat204));

// node:171 operator sub
assign dat261_nxt = ($signed(dat184) - $signed(dat220));

// node:172 operator sub
assign dat262_nxt = ($signed(dat186) - $signed(dat222));

// node:173 operator add
assign dat263 = ($signed(dat255) + $signed(dat257));

// node:174 operator add
assign dat264 = ($signed(dat256) + $signed(dat258));

// node:175 operator add
assign dat265 = ($signed(dat259) + $signed(dat262));

// node:176 operator sub
assign dat266 = ($signed(dat260) - $signed(dat261));

// node:177 operator sub
assign dat267 = ($signed(dat255) - $signed(dat257));

// node:178 operator sub
assign dat268 = ($signed(dat256) - $signed(dat258));

// node:179 operator sub
assign dat269 = ($signed(dat259) - $signed(dat262));

// node:180 operator add
assign dat270 = ($signed(dat260) + $signed(dat261));

// node:181 macro m2c

wire [1:0] n181sel; assign n181sel = dat271;
assign dat273_nxt =
    (n181sel == 2'b00) ? dat166 :
    (n181sel == 2'b01) ? dat263 :
    (n181sel == 2'b10) ? 1 : 1;

// node:182 macro m2c

wire [1:0] n182sel; assign n182sel = dat272;
assign dat274_nxt =
    (n182sel == 2'b00) ? dat168 :
    (n182sel == 2'b01) ? dat264 :
    (n182sel == 2'b10) ? 1 : 1;

// node:183 macro m2c

wire [1:0] n183sel; assign n183sel = dat275;
assign dat277_nxt =
    (n183sel == 2'b00) ? dat184 :
    (n183sel == 2'b01) ? dat265 :
    (n183sel == 2'b10) ? 1 : 1;

// node:184 macro m2c

wire [1:0] n184sel; assign n184sel = dat276;
assign dat278_nxt =
    (n184sel == 2'b00) ? dat186 :
    (n184sel == 2'b01) ? dat266 :
    (n184sel == 2'b10) ? 1 : 1;

// node:185 macro m2c

wire [1:0] n185sel; assign n185sel = dat279;
assign dat281_nxt =
    (n185sel == 2'b00) ? dat202 :
    (n185sel == 2'b01) ? dat267 :
    (n185sel == 2'b10) ? 1 : 1;

// node:186 macro m2c

wire [1:0] n186sel; assign n186sel = dat280;
assign dat282_nxt =
    (n186sel == 2'b00) ? dat204 :
    (n186sel == 2'b01) ? dat268 :
    (n186sel == 2'b10) ? 1 : 1;

// node:187 macro m2c

wire [1:0] n187sel; assign n187sel = dat283;
assign dat285_nxt =
    (n187sel == 2'b00) ? dat220 :
    (n187sel == 2'b01) ? dat269 :
    (n187sel == 2'b10) ? 1 : 1;

// node:188 macro m2c

wire [1:0] n188sel; assign n188sel = dat284;
assign dat286_nxt =
    (n188sel == 2'b00) ? dat222 :
    (n188sel == 2'b01) ? dat270 :
    (n188sel == 2'b10) ? 1 : 1;

// node:189 operator concat
assign dat287 = {dat311, dat310, dat305, dat304, dat299, dat298, dat293, dat292};

// node:190 macro bs

bs_dat_2_1 unode190 (
    .t_0_dat(dat241),
    .t_cfg_dat(dat288),
    .i_0_dat(dat290_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:191 macro bs

bs_dat_2_1 unode191 (
    .t_0_dat(dat242),
    .t_cfg_dat(dat289),
    .i_0_dat(dat291_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:192 macro round_sat

round_sat_dat_1_1 unode192 (
    .t_0_dat(dat290),
    .i_0_dat(dat292_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:193 macro round_sat

round_sat_dat_1_1 unode193 (
    .t_0_dat(dat291),
    .i_0_dat(dat293_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:194 macro bs

bs_dat_2_1 unode194 (
    .t_0_dat(dat245),
    .t_cfg_dat(dat294),
    .i_0_dat(dat296_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:195 macro bs

bs_dat_2_1 unode195 (
    .t_0_dat(dat246),
    .t_cfg_dat(dat295),
    .i_0_dat(dat297_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:196 macro round_sat

round_sat_dat_1_1 unode196 (
    .t_0_dat(dat296),
    .i_0_dat(dat298_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:197 macro round_sat

round_sat_dat_1_1 unode197 (
    .t_0_dat(dat297),
    .i_0_dat(dat299_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:198 macro bs

bs_dat_2_1 unode198 (
    .t_0_dat(dat249),
    .t_cfg_dat(dat300),
    .i_0_dat(dat302_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:199 macro bs

bs_dat_2_1 unode199 (
    .t_0_dat(dat250),
    .t_cfg_dat(dat301),
    .i_0_dat(dat303_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:200 macro round_sat

round_sat_dat_1_1 unode200 (
    .t_0_dat(dat302),
    .i_0_dat(dat304_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:201 macro round_sat

round_sat_dat_1_1 unode201 (
    .t_0_dat(dat303),
    .i_0_dat(dat305_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:202 macro bs

bs_dat_2_1 unode202 (
    .t_0_dat(dat253),
    .t_cfg_dat(dat306),
    .i_0_dat(dat308_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:203 macro bs

bs_dat_2_1 unode203 (
    .t_0_dat(dat254),
    .t_cfg_dat(dat307),
    .i_0_dat(dat309_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:204 macro round_sat

round_sat_dat_1_1 unode204 (
    .t_0_dat(dat308),
    .i_0_dat(dat310_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:205 macro round_sat

round_sat_dat_1_1 unode205 (
    .t_0_dat(dat309),
    .i_0_dat(dat311_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:206 operator concat
assign dat312 = {dat336, dat335, dat330, dat329, dat324, dat323, dat318, dat317};

// node:207 macro bs

bs_dat_2_1 unode207 (
    .t_0_dat(dat273),
    .t_cfg_dat(dat313),
    .i_0_dat(dat315_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:208 macro bs

bs_dat_2_1 unode208 (
    .t_0_dat(dat274),
    .t_cfg_dat(dat314),
    .i_0_dat(dat316_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:209 macro round_sat

round_sat_dat_1_1 unode209 (
    .t_0_dat(dat315),
    .i_0_dat(dat317_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:210 macro round_sat

round_sat_dat_1_1 unode210 (
    .t_0_dat(dat316),
    .i_0_dat(dat318_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:211 macro bs

bs_dat_2_1 unode211 (
    .t_0_dat(dat277),
    .t_cfg_dat(dat319),
    .i_0_dat(dat321_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:212 macro bs

bs_dat_2_1 unode212 (
    .t_0_dat(dat278),
    .t_cfg_dat(dat320),
    .i_0_dat(dat322_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:213 macro round_sat

round_sat_dat_1_1 unode213 (
    .t_0_dat(dat321),
    .i_0_dat(dat323_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:214 macro round_sat

round_sat_dat_1_1 unode214 (
    .t_0_dat(dat322),
    .i_0_dat(dat324_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:215 macro bs

bs_dat_2_1 unode215 (
    .t_0_dat(dat281),
    .t_cfg_dat(dat325),
    .i_0_dat(dat327_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:216 macro bs

bs_dat_2_1 unode216 (
    .t_0_dat(dat282),
    .t_cfg_dat(dat326),
    .i_0_dat(dat328_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:217 macro round_sat

round_sat_dat_1_1 unode217 (
    .t_0_dat(dat327),
    .i_0_dat(dat329_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:218 macro round_sat

round_sat_dat_1_1 unode218 (
    .t_0_dat(dat328),
    .i_0_dat(dat330_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:219 macro bs

bs_dat_2_1 unode219 (
    .t_0_dat(dat285),
    .t_cfg_dat(dat331),
    .i_0_dat(dat333_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:220 macro bs

bs_dat_2_1 unode220 (
    .t_0_dat(dat286),
    .t_cfg_dat(dat332),
    .i_0_dat(dat334_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:221 macro round_sat

round_sat_dat_1_1 unode221 (
    .t_0_dat(dat333),
    .i_0_dat(dat335_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// node:222 macro round_sat

round_sat_dat_1_1 unode222 (
    .t_0_dat(dat334),
    .i_0_dat(dat336_nxt),
    .clk(clk),
    .reset_n(reset_n)
);
// per edge

// edge:0 EB1.5
wire en0_0, en0_1, sel0;
reg [63:0] dat0_r0, dat0_r1;
always @(posedge clk) if (en0_0) dat0_r0 <= dat0_nxt;
always @(posedge clk) if (en0_1) dat0_r1 <= dat0_nxt;

assign dat0 = sel0 ? dat0_r1 : dat0_r0;


// edge:1 EB1.5
wire en1_0, en1_1, sel1;
reg [63:0] dat1_r0, dat1_r1;
always @(posedge clk) if (en1_0) dat1_r0 <= dat1_nxt;
always @(posedge clk) if (en1_1) dat1_r1 <= dat1_nxt;

assign dat1 = sel1 ? dat1_r1 : dat1_r0;


// edge:2 EB1.5
wire en2_0, en2_1, sel2;
reg [63:0] dat2_r0, dat2_r1;
always @(posedge clk) if (en2_0) dat2_r0 <= dat2_nxt;
always @(posedge clk) if (en2_1) dat2_r1 <= dat2_nxt;

assign dat2 = sel2 ? dat2_r1 : dat2_r0;


// edge:3 EB1.5
wire en3_0, en3_1, sel3;
reg [63:0] dat3_r0, dat3_r1;
always @(posedge clk) if (en3_0) dat3_r0 <= dat3_nxt;
always @(posedge clk) if (en3_1) dat3_r1 <= dat3_nxt;

assign dat3 = sel3 ? dat3_r1 : dat3_r0;


// edge:4 EB1.5
wire en4_0, en4_1, sel4;
reg [63:0] dat4_r0, dat4_r1;
always @(posedge clk) if (en4_0) dat4_r0 <= dat4_nxt;
always @(posedge clk) if (en4_1) dat4_r1 <= dat4_nxt;

assign dat4 = sel4 ? dat4_r1 : dat4_r0;


// edge:5 EB1.5
wire en5_0, en5_1, sel5;
reg [63:0] dat5_r0, dat5_r1;
always @(posedge clk) if (en5_0) dat5_r0 <= dat5_nxt;
always @(posedge clk) if (en5_1) dat5_r1 <= dat5_nxt;

assign dat5 = sel5 ? dat5_r1 : dat5_r0;


// edge:6 EB1.5
wire en6_0, en6_1, sel6;
reg [63:0] dat6_r0, dat6_r1;
always @(posedge clk) if (en6_0) dat6_r0 <= dat6_nxt;
always @(posedge clk) if (en6_1) dat6_r1 <= dat6_nxt;

assign dat6 = sel6 ? dat6_r1 : dat6_r0;


// edge:7 EB1.5
wire en7_0, en7_1, sel7;
reg [63:0] dat7_r0, dat7_r1;
always @(posedge clk) if (en7_0) dat7_r0 <= dat7_nxt;
always @(posedge clk) if (en7_1) dat7_r1 <= dat7_nxt;

assign dat7 = sel7 ? dat7_r1 : dat7_r0;


// edge:8 EB1.5
wire en8_0, en8_1, sel8;
reg [63:0] dat8_r0, dat8_r1;
always @(posedge clk) if (en8_0) dat8_r0 <= dat8_nxt;
always @(posedge clk) if (en8_1) dat8_r1 <= dat8_nxt;

assign dat8 = sel8 ? dat8_r1 : dat8_r0;


// edge:9 EB1.5
wire en9_0, en9_1, sel9;
reg [63:0] dat9_r0, dat9_r1;
always @(posedge clk) if (en9_0) dat9_r0 <= dat9_nxt;
always @(posedge clk) if (en9_1) dat9_r1 <= dat9_nxt;

assign dat9 = sel9 ? dat9_r1 : dat9_r0;


// edge:10 EB1.5
wire en10_0, en10_1, sel10;
reg [63:0] dat10_r0, dat10_r1;
always @(posedge clk) if (en10_0) dat10_r0 <= dat10_nxt;
always @(posedge clk) if (en10_1) dat10_r1 <= dat10_nxt;

assign dat10 = sel10 ? dat10_r1 : dat10_r0;


// edge:11 EB1.5
wire en11_0, en11_1, sel11;
reg [63:0] dat11_r0, dat11_r1;
always @(posedge clk) if (en11_0) dat11_r0 <= dat11_nxt;
always @(posedge clk) if (en11_1) dat11_r1 <= dat11_nxt;

assign dat11 = sel11 ? dat11_r1 : dat11_r0;


// edge:12 EB1.5
wire en12_0, en12_1, sel12;
reg [63:0] dat12_r0, dat12_r1;
always @(posedge clk) if (en12_0) dat12_r0 <= dat12_nxt;
always @(posedge clk) if (en12_1) dat12_r1 <= dat12_nxt;

assign dat12 = sel12 ? dat12_r1 : dat12_r0;


// edge:13 EB1.5
wire en13_0, en13_1, sel13;
reg [63:0] dat13_r0, dat13_r1;
always @(posedge clk) if (en13_0) dat13_r0 <= dat13_nxt;
always @(posedge clk) if (en13_1) dat13_r1 <= dat13_nxt;

assign dat13 = sel13 ? dat13_r1 : dat13_r0;


// edge:14 EB1.5
wire en14_0, en14_1, sel14;
reg [63:0] dat14_r0, dat14_r1;
always @(posedge clk) if (en14_0) dat14_r0 <= dat14_nxt;
always @(posedge clk) if (en14_1) dat14_r1 <= dat14_nxt;

assign dat14 = sel14 ? dat14_r1 : dat14_r0;


// edge:15 EB1.5
wire en15_0, en15_1, sel15;
reg [63:0] dat15_r0, dat15_r1;
always @(posedge clk) if (en15_0) dat15_r0 <= dat15_nxt;
always @(posedge clk) if (en15_1) dat15_r1 <= dat15_nxt;

assign dat15 = sel15 ? dat15_r1 : dat15_r0;


// edge:16 EB1.5
wire en16_0, en16_1, sel16;
reg [63:0] dat16_r0, dat16_r1;
always @(posedge clk) if (en16_0) dat16_r0 <= dat16_nxt;
always @(posedge clk) if (en16_1) dat16_r1 <= dat16_nxt;

assign dat16 = sel16 ? dat16_r1 : dat16_r0;


// edge:17 EB1.5
wire en17_0, en17_1, sel17;
reg [63:0] dat17_r0, dat17_r1;
always @(posedge clk) if (en17_0) dat17_r0 <= dat17_nxt;
always @(posedge clk) if (en17_1) dat17_r1 <= dat17_nxt;

assign dat17 = sel17 ? dat17_r1 : dat17_r0;


// edge:18 EB1.5
wire en18_0, en18_1, sel18;
reg [63:0] dat18_r0, dat18_r1;
always @(posedge clk) if (en18_0) dat18_r0 <= dat18_nxt;
always @(posedge clk) if (en18_1) dat18_r1 <= dat18_nxt;

assign dat18 = sel18 ? dat18_r1 : dat18_r0;


// edge:19 EB1.5
wire en19_0, en19_1, sel19;
reg [63:0] dat19_r0, dat19_r1;
always @(posedge clk) if (en19_0) dat19_r0 <= dat19_nxt;
always @(posedge clk) if (en19_1) dat19_r1 <= dat19_nxt;

assign dat19 = sel19 ? dat19_r1 : dat19_r0;


// edge:20 EB1.5
wire en20_0, en20_1, sel20;
reg [63:0] dat20_r0, dat20_r1;
always @(posedge clk) if (en20_0) dat20_r0 <= dat20_nxt;
always @(posedge clk) if (en20_1) dat20_r1 <= dat20_nxt;

assign dat20 = sel20 ? dat20_r1 : dat20_r0;


// edge:21 EB1.5
wire en21_0, en21_1, sel21;
reg [63:0] dat21_r0, dat21_r1;
always @(posedge clk) if (en21_0) dat21_r0 <= dat21_nxt;
always @(posedge clk) if (en21_1) dat21_r1 <= dat21_nxt;

assign dat21 = sel21 ? dat21_r1 : dat21_r0;


// edge:22 EB1.5
wire en22_0, en22_1, sel22;
reg [63:0] dat22_r0, dat22_r1;
always @(posedge clk) if (en22_0) dat22_r0 <= dat22_nxt;
always @(posedge clk) if (en22_1) dat22_r1 <= dat22_nxt;

assign dat22 = sel22 ? dat22_r1 : dat22_r0;


// edge:23 EB1.5
wire en23_0, en23_1, sel23;
reg [63:0] dat23_r0, dat23_r1;
always @(posedge clk) if (en23_0) dat23_r0 <= dat23_nxt;
always @(posedge clk) if (en23_1) dat23_r1 <= dat23_nxt;

assign dat23 = sel23 ? dat23_r1 : dat23_r0;


// edge:24 EB1.5
wire en24_0, en24_1, sel24;
reg [63:0] dat24_r0, dat24_r1;
always @(posedge clk) if (en24_0) dat24_r0 <= dat24_nxt;
always @(posedge clk) if (en24_1) dat24_r1 <= dat24_nxt;

assign dat24 = sel24 ? dat24_r1 : dat24_r0;


// edge:25 EB1.5
wire en25_0, en25_1, sel25;
reg [63:0] dat25_r0, dat25_r1;
always @(posedge clk) if (en25_0) dat25_r0 <= dat25_nxt;
always @(posedge clk) if (en25_1) dat25_r1 <= dat25_nxt;

assign dat25 = sel25 ? dat25_r1 : dat25_r0;


// edge:26 EB1.5
wire en26_0, en26_1, sel26;
reg [63:0] dat26_r0, dat26_r1;
always @(posedge clk) if (en26_0) dat26_r0 <= dat26_nxt;
always @(posedge clk) if (en26_1) dat26_r1 <= dat26_nxt;

assign dat26 = sel26 ? dat26_r1 : dat26_r0;


// edge:27 EB1.5
wire en27_0, en27_1, sel27;
reg [63:0] dat27_r0, dat27_r1;
always @(posedge clk) if (en27_0) dat27_r0 <= dat27_nxt;
always @(posedge clk) if (en27_1) dat27_r1 <= dat27_nxt;

assign dat27 = sel27 ? dat27_r1 : dat27_r0;


// edge:28 EB1.5
wire en28_0, en28_1, sel28;
reg [63:0] dat28_r0, dat28_r1;
always @(posedge clk) if (en28_0) dat28_r0 <= dat28_nxt;
always @(posedge clk) if (en28_1) dat28_r1 <= dat28_nxt;

assign dat28 = sel28 ? dat28_r1 : dat28_r0;


// edge:29 EB1.5
wire en29_0, en29_1, sel29;
reg [63:0] dat29_r0, dat29_r1;
always @(posedge clk) if (en29_0) dat29_r0 <= dat29_nxt;
always @(posedge clk) if (en29_1) dat29_r1 <= dat29_nxt;

assign dat29 = sel29 ? dat29_r1 : dat29_r0;


// edge:30 EB1.5
wire en30_0, en30_1, sel30;
reg [63:0] dat30_r0, dat30_r1;
always @(posedge clk) if (en30_0) dat30_r0 <= dat30_nxt;
always @(posedge clk) if (en30_1) dat30_r1 <= dat30_nxt;

assign dat30 = sel30 ? dat30_r1 : dat30_r0;


// edge:31 EB1.5
wire en31_0, en31_1, sel31;
reg [511:0] dat31_r0, dat31_r1;
always @(posedge clk) if (en31_0) dat31_r0 <= dat31_nxt;
always @(posedge clk) if (en31_1) dat31_r1 <= dat31_nxt;

assign dat31 = sel31 ? dat31_r1 : dat31_r0;


// edge:32 EB1
wire en32;
reg [511:0] dat32_r;
always @(posedge clk) if (en32) dat32_r <= dat32_nxt;
assign dat32 = dat32_r;


// edge:33 EB1
wire en33;
reg [511:0] dat33_r;
always @(posedge clk) if (en33) dat33_r <= dat33_nxt;
assign dat33 = dat33_r;


// edge:34 EB0


// edge:35 EB1
wire en35;
reg [511:0] dat35_r;
always @(posedge clk) if (en35) dat35_r <= dat35_nxt;
assign dat35 = dat35_r;


// edge:36 EB1.5
wire en36_0, en36_1, sel36;
reg [511:0] dat36_r0, dat36_r1;
always @(posedge clk) if (en36_0) dat36_r0 <= dat36_nxt;
always @(posedge clk) if (en36_1) dat36_r1 <= dat36_nxt;

assign dat36 = sel36 ? dat36_r1 : dat36_r0;


// edge:37 EB1.5
wire en37_0, en37_1, sel37;
reg [511:0] dat37_r0, dat37_r1;
always @(posedge clk) if (en37_0) dat37_r0 <= dat37_nxt;
always @(posedge clk) if (en37_1) dat37_r1 <= dat37_nxt;

assign dat37 = sel37 ? dat37_r1 : dat37_r0;


// edge:38 EB1.5
wire en38_0, en38_1, sel38;
reg [511:0] dat38_r0, dat38_r1;
always @(posedge clk) if (en38_0) dat38_r0 <= dat38_nxt;
always @(posedge clk) if (en38_1) dat38_r1 <= dat38_nxt;

assign dat38 = sel38 ? dat38_r1 : dat38_r0;


// edge:39 EB1.5
wire en39_0, en39_1, sel39;
reg [511:0] dat39_r0, dat39_r1;
always @(posedge clk) if (en39_0) dat39_r0 <= dat39_nxt;
always @(posedge clk) if (en39_1) dat39_r1 <= dat39_nxt;

assign dat39 = sel39 ? dat39_r1 : dat39_r0;


// edge:40 EB1
wire en40;
reg [511:0] dat40_r;
always @(posedge clk) if (en40) dat40_r <= dat40_nxt;
assign dat40 = dat40_r;


// edge:41 EB_FIFO Depth=4
reg [511:0] mem41 [3:0];
reg [511:0] dat41_r0;
wire ren41, wen41;
wire [1:0] wr_ptr41, rd_ptr41;

always @(posedge clk) if (ren41) dat41_r0 <= mem41[rd_ptr41];
always @(posedge clk) if (wen41) mem41[wr_ptr41] <= dat41_nxt;

assign dat41 = dat41_r0;


// edge:42 EB1.5
wire en42_0, en42_1, sel42;
reg [511:0] dat42_r0, dat42_r1;
always @(posedge clk) if (en42_0) dat42_r0 <= dat42_nxt;
always @(posedge clk) if (en42_1) dat42_r1 <= dat42_nxt;

assign dat42 = sel42 ? dat42_r1 : dat42_r0;


// edge:43 EB1
wire en43;
reg [127:0] dat43_r;
always @(posedge clk) if (en43) dat43_r <= dat43_nxt;
assign dat43 = dat43_r;


// edge:44 EB1
wire en44;
reg [127:0] dat44_r;
always @(posedge clk) if (en44) dat44_r <= dat44_nxt;
assign dat44 = dat44_r;


// edge:45 EB0


// edge:46 EB0


// edge:47 EB0


// edge:48 EB0


// edge:49 EB0


// edge:50 EB0


// edge:51 EB0


// edge:52 EB0


// edge:53 EB0


// edge:54 EB0


// edge:55 EB0


// edge:56 EB0


// edge:57 EB0


// edge:58 EB0


// edge:59 EB0


// edge:60 EB0


// edge:61 EB0


// edge:62 EB0


// edge:63 EB0


// edge:64 EB0


// edge:65 EB0


// edge:66 EB0


// edge:67 EB0


// edge:68 EB0


// edge:69 EB0


// edge:70 EB0


// edge:71 EB0


// edge:72 EB0


// edge:73 EB1.5
wire en73_0, en73_1, sel73;
reg [71:0] dat73_r0, dat73_r1;
always @(posedge clk) if (en73_0) dat73_r0 <= dat73_nxt;
always @(posedge clk) if (en73_1) dat73_r1 <= dat73_nxt;

assign dat73 = sel73 ? dat73_r1 : dat73_r0;


// edge:74 EB1.5
wire en74_0, en74_1, sel74;
reg [71:0] dat74_r0, dat74_r1;
always @(posedge clk) if (en74_0) dat74_r0 <= dat74_nxt;
always @(posedge clk) if (en74_1) dat74_r1 <= dat74_nxt;

assign dat74 = sel74 ? dat74_r1 : dat74_r0;


// edge:75 EB0


// edge:76 EB0


// edge:77 EB0


// edge:78 EB0


// edge:79 EB0


// edge:80 EB0


// edge:81 EB0


// edge:82 EB0


// edge:83 EB0


// edge:84 EB0


// edge:85 EB0


// edge:86 EB0


// edge:87 EB0


// edge:88 EB0


// edge:89 EB0


// edge:90 EB0


// edge:91 EB1.5
wire en91_0, en91_1, sel91;
reg [71:0] dat91_r0, dat91_r1;
always @(posedge clk) if (en91_0) dat91_r0 <= dat91_nxt;
always @(posedge clk) if (en91_1) dat91_r1 <= dat91_nxt;

assign dat91 = sel91 ? dat91_r1 : dat91_r0;


// edge:92 EB1.5
wire en92_0, en92_1, sel92;
reg [71:0] dat92_r0, dat92_r1;
always @(posedge clk) if (en92_0) dat92_r0 <= dat92_nxt;
always @(posedge clk) if (en92_1) dat92_r1 <= dat92_nxt;

assign dat92 = sel92 ? dat92_r1 : dat92_r0;


// edge:93 EB0


// edge:94 EB0


// edge:95 EB0


// edge:96 EB0


// edge:97 EB0


// edge:98 EB0


// edge:99 EB0


// edge:100 EB0


// edge:101 EB0


// edge:102 EB0


// edge:103 EB0


// edge:104 EB0


// edge:105 EB0


// edge:106 EB0


// edge:107 EB0


// edge:108 EB0


// edge:109 EB1.5
wire en109_0, en109_1, sel109;
reg [71:0] dat109_r0, dat109_r1;
always @(posedge clk) if (en109_0) dat109_r0 <= dat109_nxt;
always @(posedge clk) if (en109_1) dat109_r1 <= dat109_nxt;

assign dat109 = sel109 ? dat109_r1 : dat109_r0;


// edge:110 EB1.5
wire en110_0, en110_1, sel110;
reg [71:0] dat110_r0, dat110_r1;
always @(posedge clk) if (en110_0) dat110_r0 <= dat110_nxt;
always @(posedge clk) if (en110_1) dat110_r1 <= dat110_nxt;

assign dat110 = sel110 ? dat110_r1 : dat110_r0;


// edge:111 EB0


// edge:112 EB0


// edge:113 EB0


// edge:114 EB0


// edge:115 EB0


// edge:116 EB0


// edge:117 EB0


// edge:118 EB0


// edge:119 EB0


// edge:120 EB0


// edge:121 EB0


// edge:122 EB0


// edge:123 EB0


// edge:124 EB0


// edge:125 EB0


// edge:126 EB0


// edge:127 EB1.5
wire en127_0, en127_1, sel127;
reg [71:0] dat127_r0, dat127_r1;
always @(posedge clk) if (en127_0) dat127_r0 <= dat127_nxt;
always @(posedge clk) if (en127_1) dat127_r1 <= dat127_nxt;

assign dat127 = sel127 ? dat127_r1 : dat127_r0;


// edge:128 EB1.5
wire en128_0, en128_1, sel128;
reg [71:0] dat128_r0, dat128_r1;
always @(posedge clk) if (en128_0) dat128_r0 <= dat128_nxt;
always @(posedge clk) if (en128_1) dat128_r1 <= dat128_nxt;

assign dat128 = sel128 ? dat128_r1 : dat128_r0;


// edge:129 EB0


// edge:130 EB0


// edge:131 EB0


// edge:132 EB0


// edge:133 EB1
wire en133;
reg [127:0] dat133_r;
always @(posedge clk) if (en133) dat133_r <= dat133_nxt;
assign dat133 = dat133_r;


// edge:134 EB1
wire en134;
reg [127:0] dat134_r;
always @(posedge clk) if (en134) dat134_r <= dat134_nxt;
assign dat134 = dat134_r;


// edge:135 EB0


// edge:136 EB0


// edge:137 EB0


// edge:138 EB0


// edge:139 EB0


// edge:140 EB0


// edge:141 EB0


// edge:142 EB0


// edge:143 EB0


// edge:144 EB0


// edge:145 EB0


// edge:146 EB0


// edge:147 EB0


// edge:148 EB0


// edge:149 EB0


// edge:150 EB0


// edge:151 EB0


// edge:152 EB0


// edge:153 EB0


// edge:154 EB0


// edge:155 EB0


// edge:156 EB0


// edge:157 EB0


// edge:158 EB0


// edge:159 EB0


// edge:160 EB0


// edge:161 EB0


// edge:162 EB0


// edge:163 EB1.5
wire en163_0, en163_1, sel163;
reg [71:0] dat163_r0, dat163_r1;
always @(posedge clk) if (en163_0) dat163_r0 <= dat163_nxt;
always @(posedge clk) if (en163_1) dat163_r1 <= dat163_nxt;

assign dat163 = sel163 ? dat163_r1 : dat163_r0;


// edge:164 EB1.5
wire en164_0, en164_1, sel164;
reg [71:0] dat164_r0, dat164_r1;
always @(posedge clk) if (en164_0) dat164_r0 <= dat164_nxt;
always @(posedge clk) if (en164_1) dat164_r1 <= dat164_nxt;

assign dat164 = sel164 ? dat164_r1 : dat164_r0;


// edge:165 EB0


// edge:166 EB0


// edge:167 EB0


// edge:168 EB0


// edge:169 EB0


// edge:170 EB0


// edge:171 EB0


// edge:172 EB0


// edge:173 EB0


// edge:174 EB0


// edge:175 EB0


// edge:176 EB0


// edge:177 EB0


// edge:178 EB0


// edge:179 EB0


// edge:180 EB0


// edge:181 EB1.5
wire en181_0, en181_1, sel181;
reg [71:0] dat181_r0, dat181_r1;
always @(posedge clk) if (en181_0) dat181_r0 <= dat181_nxt;
always @(posedge clk) if (en181_1) dat181_r1 <= dat181_nxt;

assign dat181 = sel181 ? dat181_r1 : dat181_r0;


// edge:182 EB1.5
wire en182_0, en182_1, sel182;
reg [71:0] dat182_r0, dat182_r1;
always @(posedge clk) if (en182_0) dat182_r0 <= dat182_nxt;
always @(posedge clk) if (en182_1) dat182_r1 <= dat182_nxt;

assign dat182 = sel182 ? dat182_r1 : dat182_r0;


// edge:183 EB0


// edge:184 EB0


// edge:185 EB0


// edge:186 EB0


// edge:187 EB0


// edge:188 EB0


// edge:189 EB0


// edge:190 EB0


// edge:191 EB0


// edge:192 EB0


// edge:193 EB0


// edge:194 EB0


// edge:195 EB0


// edge:196 EB0


// edge:197 EB0


// edge:198 EB0


// edge:199 EB1.5
wire en199_0, en199_1, sel199;
reg [71:0] dat199_r0, dat199_r1;
always @(posedge clk) if (en199_0) dat199_r0 <= dat199_nxt;
always @(posedge clk) if (en199_1) dat199_r1 <= dat199_nxt;

assign dat199 = sel199 ? dat199_r1 : dat199_r0;


// edge:200 EB1.5
wire en200_0, en200_1, sel200;
reg [71:0] dat200_r0, dat200_r1;
always @(posedge clk) if (en200_0) dat200_r0 <= dat200_nxt;
always @(posedge clk) if (en200_1) dat200_r1 <= dat200_nxt;

assign dat200 = sel200 ? dat200_r1 : dat200_r0;


// edge:201 EB0


// edge:202 EB0


// edge:203 EB0


// edge:204 EB0


// edge:205 EB0


// edge:206 EB0


// edge:207 EB0


// edge:208 EB0


// edge:209 EB0


// edge:210 EB0


// edge:211 EB0


// edge:212 EB0


// edge:213 EB0


// edge:214 EB0


// edge:215 EB0


// edge:216 EB0


// edge:217 EB1.5
wire en217_0, en217_1, sel217;
reg [71:0] dat217_r0, dat217_r1;
always @(posedge clk) if (en217_0) dat217_r0 <= dat217_nxt;
always @(posedge clk) if (en217_1) dat217_r1 <= dat217_nxt;

assign dat217 = sel217 ? dat217_r1 : dat217_r0;


// edge:218 EB1.5
wire en218_0, en218_1, sel218;
reg [71:0] dat218_r0, dat218_r1;
always @(posedge clk) if (en218_0) dat218_r0 <= dat218_nxt;
always @(posedge clk) if (en218_1) dat218_r1 <= dat218_nxt;

assign dat218 = sel218 ? dat218_r1 : dat218_r0;


// edge:219 EB0


// edge:220 EB0


// edge:221 EB0


// edge:222 EB0


// edge:223 EB1.5
wire en223_0, en223_1, sel223;
reg [35:0] dat223_r0, dat223_r1;
always @(posedge clk) if (en223_0) dat223_r0 <= dat223_nxt;
always @(posedge clk) if (en223_1) dat223_r1 <= dat223_nxt;

assign dat223 = sel223 ? dat223_r1 : dat223_r0;


// edge:224 EB1.5
wire en224_0, en224_1, sel224;
reg [35:0] dat224_r0, dat224_r1;
always @(posedge clk) if (en224_0) dat224_r0 <= dat224_nxt;
always @(posedge clk) if (en224_1) dat224_r1 <= dat224_nxt;

assign dat224 = sel224 ? dat224_r1 : dat224_r0;


// edge:225 EB1.5
wire en225_0, en225_1, sel225;
reg [35:0] dat225_r0, dat225_r1;
always @(posedge clk) if (en225_0) dat225_r0 <= dat225_nxt;
always @(posedge clk) if (en225_1) dat225_r1 <= dat225_nxt;

assign dat225 = sel225 ? dat225_r1 : dat225_r0;


// edge:226 EB1.5
wire en226_0, en226_1, sel226;
reg [35:0] dat226_r0, dat226_r1;
always @(posedge clk) if (en226_0) dat226_r0 <= dat226_nxt;
always @(posedge clk) if (en226_1) dat226_r1 <= dat226_nxt;

assign dat226 = sel226 ? dat226_r1 : dat226_r0;


// edge:227 EB1.5
wire en227_0, en227_1, sel227;
reg [35:0] dat227_r0, dat227_r1;
always @(posedge clk) if (en227_0) dat227_r0 <= dat227_nxt;
always @(posedge clk) if (en227_1) dat227_r1 <= dat227_nxt;

assign dat227 = sel227 ? dat227_r1 : dat227_r0;


// edge:228 EB1.5
wire en228_0, en228_1, sel228;
reg [35:0] dat228_r0, dat228_r1;
always @(posedge clk) if (en228_0) dat228_r0 <= dat228_nxt;
always @(posedge clk) if (en228_1) dat228_r1 <= dat228_nxt;

assign dat228 = sel228 ? dat228_r1 : dat228_r0;


// edge:229 EB1.5
wire en229_0, en229_1, sel229;
reg [35:0] dat229_r0, dat229_r1;
always @(posedge clk) if (en229_0) dat229_r0 <= dat229_nxt;
always @(posedge clk) if (en229_1) dat229_r1 <= dat229_nxt;

assign dat229 = sel229 ? dat229_r1 : dat229_r0;


// edge:230 EB1.5
wire en230_0, en230_1, sel230;
reg [35:0] dat230_r0, dat230_r1;
always @(posedge clk) if (en230_0) dat230_r0 <= dat230_nxt;
always @(posedge clk) if (en230_1) dat230_r1 <= dat230_nxt;

assign dat230 = sel230 ? dat230_r1 : dat230_r0;


// edge:231 EB0


// edge:232 EB0


// edge:233 EB0


// edge:234 EB0


// edge:235 EB0


// edge:236 EB0


// edge:237 EB0


// edge:238 EB0


// edge:239 EB0


// edge:240 EB0


// edge:241 EB1
wire en241;
reg [35:0] dat241_r;
always @(posedge clk) if (en241) dat241_r <= dat241_nxt;
assign dat241 = dat241_r;


// edge:242 EB1
wire en242;
reg [35:0] dat242_r;
always @(posedge clk) if (en242) dat242_r <= dat242_nxt;
assign dat242 = dat242_r;


// edge:243 EB0


// edge:244 EB0


// edge:245 EB1
wire en245;
reg [35:0] dat245_r;
always @(posedge clk) if (en245) dat245_r <= dat245_nxt;
assign dat245 = dat245_r;


// edge:246 EB1
wire en246;
reg [35:0] dat246_r;
always @(posedge clk) if (en246) dat246_r <= dat246_nxt;
assign dat246 = dat246_r;


// edge:247 EB0


// edge:248 EB0


// edge:249 EB1
wire en249;
reg [35:0] dat249_r;
always @(posedge clk) if (en249) dat249_r <= dat249_nxt;
assign dat249 = dat249_r;


// edge:250 EB1
wire en250;
reg [35:0] dat250_r;
always @(posedge clk) if (en250) dat250_r <= dat250_nxt;
assign dat250 = dat250_r;


// edge:251 EB0


// edge:252 EB0


// edge:253 EB1
wire en253;
reg [35:0] dat253_r;
always @(posedge clk) if (en253) dat253_r <= dat253_nxt;
assign dat253 = dat253_r;


// edge:254 EB1
wire en254;
reg [35:0] dat254_r;
always @(posedge clk) if (en254) dat254_r <= dat254_nxt;
assign dat254 = dat254_r;


// edge:255 EB1.5
wire en255_0, en255_1, sel255;
reg [35:0] dat255_r0, dat255_r1;
always @(posedge clk) if (en255_0) dat255_r0 <= dat255_nxt;
always @(posedge clk) if (en255_1) dat255_r1 <= dat255_nxt;

assign dat255 = sel255 ? dat255_r1 : dat255_r0;


// edge:256 EB1.5
wire en256_0, en256_1, sel256;
reg [35:0] dat256_r0, dat256_r1;
always @(posedge clk) if (en256_0) dat256_r0 <= dat256_nxt;
always @(posedge clk) if (en256_1) dat256_r1 <= dat256_nxt;

assign dat256 = sel256 ? dat256_r1 : dat256_r0;


// edge:257 EB1.5
wire en257_0, en257_1, sel257;
reg [35:0] dat257_r0, dat257_r1;
always @(posedge clk) if (en257_0) dat257_r0 <= dat257_nxt;
always @(posedge clk) if (en257_1) dat257_r1 <= dat257_nxt;

assign dat257 = sel257 ? dat257_r1 : dat257_r0;


// edge:258 EB1.5
wire en258_0, en258_1, sel258;
reg [35:0] dat258_r0, dat258_r1;
always @(posedge clk) if (en258_0) dat258_r0 <= dat258_nxt;
always @(posedge clk) if (en258_1) dat258_r1 <= dat258_nxt;

assign dat258 = sel258 ? dat258_r1 : dat258_r0;


// edge:259 EB1.5
wire en259_0, en259_1, sel259;
reg [35:0] dat259_r0, dat259_r1;
always @(posedge clk) if (en259_0) dat259_r0 <= dat259_nxt;
always @(posedge clk) if (en259_1) dat259_r1 <= dat259_nxt;

assign dat259 = sel259 ? dat259_r1 : dat259_r0;


// edge:260 EB1.5
wire en260_0, en260_1, sel260;
reg [35:0] dat260_r0, dat260_r1;
always @(posedge clk) if (en260_0) dat260_r0 <= dat260_nxt;
always @(posedge clk) if (en260_1) dat260_r1 <= dat260_nxt;

assign dat260 = sel260 ? dat260_r1 : dat260_r0;


// edge:261 EB1.5
wire en261_0, en261_1, sel261;
reg [35:0] dat261_r0, dat261_r1;
always @(posedge clk) if (en261_0) dat261_r0 <= dat261_nxt;
always @(posedge clk) if (en261_1) dat261_r1 <= dat261_nxt;

assign dat261 = sel261 ? dat261_r1 : dat261_r0;


// edge:262 EB1.5
wire en262_0, en262_1, sel262;
reg [35:0] dat262_r0, dat262_r1;
always @(posedge clk) if (en262_0) dat262_r0 <= dat262_nxt;
always @(posedge clk) if (en262_1) dat262_r1 <= dat262_nxt;

assign dat262 = sel262 ? dat262_r1 : dat262_r0;


// edge:263 EB0


// edge:264 EB0


// edge:265 EB0


// edge:266 EB0


// edge:267 EB0


// edge:268 EB0


// edge:269 EB0


// edge:270 EB0


// edge:271 EB0


// edge:272 EB0


// edge:273 EB1
wire en273;
reg [35:0] dat273_r;
always @(posedge clk) if (en273) dat273_r <= dat273_nxt;
assign dat273 = dat273_r;


// edge:274 EB1
wire en274;
reg [35:0] dat274_r;
always @(posedge clk) if (en274) dat274_r <= dat274_nxt;
assign dat274 = dat274_r;


// edge:275 EB0


// edge:276 EB0


// edge:277 EB1
wire en277;
reg [35:0] dat277_r;
always @(posedge clk) if (en277) dat277_r <= dat277_nxt;
assign dat277 = dat277_r;


// edge:278 EB1
wire en278;
reg [35:0] dat278_r;
always @(posedge clk) if (en278) dat278_r <= dat278_nxt;
assign dat278 = dat278_r;


// edge:279 EB0


// edge:280 EB0


// edge:281 EB1
wire en281;
reg [35:0] dat281_r;
always @(posedge clk) if (en281) dat281_r <= dat281_nxt;
assign dat281 = dat281_r;


// edge:282 EB1
wire en282;
reg [35:0] dat282_r;
always @(posedge clk) if (en282) dat282_r <= dat282_nxt;
assign dat282 = dat282_r;


// edge:283 EB0


// edge:284 EB0


// edge:285 EB1
wire en285;
reg [35:0] dat285_r;
always @(posedge clk) if (en285) dat285_r <= dat285_nxt;
assign dat285 = dat285_r;


// edge:286 EB1
wire en286;
reg [35:0] dat286_r;
always @(posedge clk) if (en286) dat286_r <= dat286_nxt;
assign dat286 = dat286_r;


// edge:287 EB0


// edge:288 EB0


// edge:289 EB0


// edge:290 EB1.5
wire en290_0, en290_1, sel290;
reg [19:0] dat290_r0, dat290_r1;
always @(posedge clk) if (en290_0) dat290_r0 <= dat290_nxt;
always @(posedge clk) if (en290_1) dat290_r1 <= dat290_nxt;

assign dat290 = sel290 ? dat290_r1 : dat290_r0;


// edge:291 EB1.5
wire en291_0, en291_1, sel291;
reg [19:0] dat291_r0, dat291_r1;
always @(posedge clk) if (en291_0) dat291_r0 <= dat291_nxt;
always @(posedge clk) if (en291_1) dat291_r1 <= dat291_nxt;

assign dat291 = sel291 ? dat291_r1 : dat291_r0;


// edge:292 EB1
wire en292;
reg [15:0] dat292_r;
always @(posedge clk) if (en292) dat292_r <= dat292_nxt;
assign dat292 = dat292_r;


// edge:293 EB1
wire en293;
reg [15:0] dat293_r;
always @(posedge clk) if (en293) dat293_r <= dat293_nxt;
assign dat293 = dat293_r;


// edge:294 EB0


// edge:295 EB0


// edge:296 EB1.5
wire en296_0, en296_1, sel296;
reg [19:0] dat296_r0, dat296_r1;
always @(posedge clk) if (en296_0) dat296_r0 <= dat296_nxt;
always @(posedge clk) if (en296_1) dat296_r1 <= dat296_nxt;

assign dat296 = sel296 ? dat296_r1 : dat296_r0;


// edge:297 EB1.5
wire en297_0, en297_1, sel297;
reg [19:0] dat297_r0, dat297_r1;
always @(posedge clk) if (en297_0) dat297_r0 <= dat297_nxt;
always @(posedge clk) if (en297_1) dat297_r1 <= dat297_nxt;

assign dat297 = sel297 ? dat297_r1 : dat297_r0;


// edge:298 EB1
wire en298;
reg [15:0] dat298_r;
always @(posedge clk) if (en298) dat298_r <= dat298_nxt;
assign dat298 = dat298_r;


// edge:299 EB1
wire en299;
reg [15:0] dat299_r;
always @(posedge clk) if (en299) dat299_r <= dat299_nxt;
assign dat299 = dat299_r;


// edge:300 EB0


// edge:301 EB0


// edge:302 EB1.5
wire en302_0, en302_1, sel302;
reg [19:0] dat302_r0, dat302_r1;
always @(posedge clk) if (en302_0) dat302_r0 <= dat302_nxt;
always @(posedge clk) if (en302_1) dat302_r1 <= dat302_nxt;

assign dat302 = sel302 ? dat302_r1 : dat302_r0;


// edge:303 EB1.5
wire en303_0, en303_1, sel303;
reg [19:0] dat303_r0, dat303_r1;
always @(posedge clk) if (en303_0) dat303_r0 <= dat303_nxt;
always @(posedge clk) if (en303_1) dat303_r1 <= dat303_nxt;

assign dat303 = sel303 ? dat303_r1 : dat303_r0;


// edge:304 EB1
wire en304;
reg [15:0] dat304_r;
always @(posedge clk) if (en304) dat304_r <= dat304_nxt;
assign dat304 = dat304_r;


// edge:305 EB1
wire en305;
reg [15:0] dat305_r;
always @(posedge clk) if (en305) dat305_r <= dat305_nxt;
assign dat305 = dat305_r;


// edge:306 EB0


// edge:307 EB0


// edge:308 EB1.5
wire en308_0, en308_1, sel308;
reg [19:0] dat308_r0, dat308_r1;
always @(posedge clk) if (en308_0) dat308_r0 <= dat308_nxt;
always @(posedge clk) if (en308_1) dat308_r1 <= dat308_nxt;

assign dat308 = sel308 ? dat308_r1 : dat308_r0;


// edge:309 EB1.5
wire en309_0, en309_1, sel309;
reg [19:0] dat309_r0, dat309_r1;
always @(posedge clk) if (en309_0) dat309_r0 <= dat309_nxt;
always @(posedge clk) if (en309_1) dat309_r1 <= dat309_nxt;

assign dat309 = sel309 ? dat309_r1 : dat309_r0;


// edge:310 EB1
wire en310;
reg [15:0] dat310_r;
always @(posedge clk) if (en310) dat310_r <= dat310_nxt;
assign dat310 = dat310_r;


// edge:311 EB1
wire en311;
reg [15:0] dat311_r;
always @(posedge clk) if (en311) dat311_r <= dat311_nxt;
assign dat311 = dat311_r;


// edge:312 EB0


// edge:313 EB0


// edge:314 EB0


// edge:315 EB1.5
wire en315_0, en315_1, sel315;
reg [19:0] dat315_r0, dat315_r1;
always @(posedge clk) if (en315_0) dat315_r0 <= dat315_nxt;
always @(posedge clk) if (en315_1) dat315_r1 <= dat315_nxt;

assign dat315 = sel315 ? dat315_r1 : dat315_r0;


// edge:316 EB1.5
wire en316_0, en316_1, sel316;
reg [19:0] dat316_r0, dat316_r1;
always @(posedge clk) if (en316_0) dat316_r0 <= dat316_nxt;
always @(posedge clk) if (en316_1) dat316_r1 <= dat316_nxt;

assign dat316 = sel316 ? dat316_r1 : dat316_r0;


// edge:317 EB1
wire en317;
reg [15:0] dat317_r;
always @(posedge clk) if (en317) dat317_r <= dat317_nxt;
assign dat317 = dat317_r;


// edge:318 EB1
wire en318;
reg [15:0] dat318_r;
always @(posedge clk) if (en318) dat318_r <= dat318_nxt;
assign dat318 = dat318_r;


// edge:319 EB0


// edge:320 EB0


// edge:321 EB1.5
wire en321_0, en321_1, sel321;
reg [19:0] dat321_r0, dat321_r1;
always @(posedge clk) if (en321_0) dat321_r0 <= dat321_nxt;
always @(posedge clk) if (en321_1) dat321_r1 <= dat321_nxt;

assign dat321 = sel321 ? dat321_r1 : dat321_r0;


// edge:322 EB1.5
wire en322_0, en322_1, sel322;
reg [19:0] dat322_r0, dat322_r1;
always @(posedge clk) if (en322_0) dat322_r0 <= dat322_nxt;
always @(posedge clk) if (en322_1) dat322_r1 <= dat322_nxt;

assign dat322 = sel322 ? dat322_r1 : dat322_r0;


// edge:323 EB1
wire en323;
reg [15:0] dat323_r;
always @(posedge clk) if (en323) dat323_r <= dat323_nxt;
assign dat323 = dat323_r;


// edge:324 EB1
wire en324;
reg [15:0] dat324_r;
always @(posedge clk) if (en324) dat324_r <= dat324_nxt;
assign dat324 = dat324_r;


// edge:325 EB0


// edge:326 EB0


// edge:327 EB1.5
wire en327_0, en327_1, sel327;
reg [19:0] dat327_r0, dat327_r1;
always @(posedge clk) if (en327_0) dat327_r0 <= dat327_nxt;
always @(posedge clk) if (en327_1) dat327_r1 <= dat327_nxt;

assign dat327 = sel327 ? dat327_r1 : dat327_r0;


// edge:328 EB1.5
wire en328_0, en328_1, sel328;
reg [19:0] dat328_r0, dat328_r1;
always @(posedge clk) if (en328_0) dat328_r0 <= dat328_nxt;
always @(posedge clk) if (en328_1) dat328_r1 <= dat328_nxt;

assign dat328 = sel328 ? dat328_r1 : dat328_r0;


// edge:329 EB1
wire en329;
reg [15:0] dat329_r;
always @(posedge clk) if (en329) dat329_r <= dat329_nxt;
assign dat329 = dat329_r;


// edge:330 EB1
wire en330;
reg [15:0] dat330_r;
always @(posedge clk) if (en330) dat330_r <= dat330_nxt;
assign dat330 = dat330_r;


// edge:331 EB0


// edge:332 EB0


// edge:333 EB1.5
wire en333_0, en333_1, sel333;
reg [19:0] dat333_r0, dat333_r1;
always @(posedge clk) if (en333_0) dat333_r0 <= dat333_nxt;
always @(posedge clk) if (en333_1) dat333_r1 <= dat333_nxt;

assign dat333 = sel333 ? dat333_r1 : dat333_r0;


// edge:334 EB1.5
wire en334_0, en334_1, sel334;
reg [19:0] dat334_r0, dat334_r1;
always @(posedge clk) if (en334_0) dat334_r0 <= dat334_nxt;
always @(posedge clk) if (en334_1) dat334_r1 <= dat334_nxt;

assign dat334 = sel334 ? dat334_r1 : dat334_r0;


// edge:335 EB1
wire en335;
reg [15:0] dat335_r;
always @(posedge clk) if (en335) dat335_r <= dat335_nxt;
assign dat335 = dat335_r;


// edge:336 EB1
wire en336;
reg [15:0] dat336_r;
always @(posedge clk) if (en336) dat336_r <= dat336_nxt;
assign dat336 = dat336_r;


// edge:337 EB0


// edge:338 EB0


// edge:339 EB0


// edge:340 EB1.5
wire en340_0, en340_1, sel340;
reg [263:0] dat340_r0, dat340_r1;
always @(posedge clk) if (en340_0) dat340_r0 <= dat340_nxt;
always @(posedge clk) if (en340_1) dat340_r1 <= dat340_nxt;

assign dat340 = sel340 ? dat340_r1 : dat340_r0;


// edge:341 EB1
wire en341;
reg [67:0] dat341_r;
always @(posedge clk) if (en341) dat341_r <= dat341_nxt;
assign dat341 = dat341_r;


// edge:342 EB1
wire en342;
reg [195:0] dat342_r;
always @(posedge clk) if (en342) dat342_r <= dat342_nxt;
assign dat342 = dat342_r;


// edge:343 EB_FIFO Depth=4
reg [195:0] mem343 [3:0];
reg [195:0] dat343_r0;
wire ren343, wen343;
wire [1:0] wr_ptr343, rd_ptr343;

always @(posedge clk) if (ren343) dat343_r0 <= mem343[rd_ptr343];
always @(posedge clk) if (wen343) mem343[wr_ptr343] <= dat343_nxt;

assign dat343 = dat343_r0;


// edge:344 EB_FIFO Depth=2
reg [3:0] mem344 [1:0];
reg [3:0] dat344_r0;
wire ren344, wen344;
wire [0:0] wr_ptr344, rd_ptr344;

always @(posedge clk) if (ren344) dat344_r0 <= mem344[rd_ptr344];
always @(posedge clk) if (wen344) mem344[wr_ptr344] <= dat344_nxt;

assign dat344 = dat344_r0;


// edge:345 EB1
wire en345;
reg [67:0] dat345_r;
always @(posedge clk) if (en345) dat345_r <= dat345_nxt;
assign dat345 = dat345_r;


// edge:346 EB_FIFO Depth=4
reg [3:0] mem346 [3:0];
reg [3:0] dat346_r0;
wire ren346, wen346;
wire [1:0] wr_ptr346, rd_ptr346;

always @(posedge clk) if (ren346) dat346_r0 <= mem346[rd_ptr346];
always @(posedge clk) if (wen346) mem346[wr_ptr346] <= dat346_nxt;

assign dat346 = dat346_r0;


// edge:347 EB_FIFO Depth=3
reg [67:0] mem347 [2:0];
reg [67:0] dat347_r0;
wire ren347, wen347;
wire [1:0] wr_ptr347, rd_ptr347;

always @(posedge clk) if (ren347) dat347_r0 <= mem347[rd_ptr347];
always @(posedge clk) if (wen347) mem347[wr_ptr347] <= dat347_nxt;

assign dat347 = dat347_r0;


// edge:348 EB_FIFO Depth=3
reg [67:0] mem348 [2:0];
reg [67:0] dat348_r0;
wire ren348, wen348;
wire [1:0] wr_ptr348, rd_ptr348;

always @(posedge clk) if (ren348) dat348_r0 <= mem348[rd_ptr348];
always @(posedge clk) if (wen348) mem348[wr_ptr348] <= dat348_nxt;

assign dat348 = dat348_r0;


// edge:349 EB1.5
wire en349_0, en349_1, sel349;
reg [48:0] dat349_r0, dat349_r1;
always @(posedge clk) if (en349_0) dat349_r0 <= dat349_nxt;
always @(posedge clk) if (en349_1) dat349_r1 <= dat349_nxt;

assign dat349 = sel349 ? dat349_r1 : dat349_r0;


// edge:350 EB1.5
wire en350_0, en350_1, sel350;
reg [48:0] dat350_r0, dat350_r1;
always @(posedge clk) if (en350_0) dat350_r0 <= dat350_nxt;
always @(posedge clk) if (en350_1) dat350_r1 <= dat350_nxt;

assign dat350 = sel350 ? dat350_r1 : dat350_r0;


// edge:351 EB1.5
wire en351_0, en351_1, sel351;
reg [48:0] dat351_r0, dat351_r1;
always @(posedge clk) if (en351_0) dat351_r0 <= dat351_nxt;
always @(posedge clk) if (en351_1) dat351_r1 <= dat351_nxt;

assign dat351 = sel351 ? dat351_r1 : dat351_r0;


// edge:352 EB1.5
wire en352_0, en352_1, sel352;
reg [48:0] dat352_r0, dat352_r1;
always @(posedge clk) if (en352_0) dat352_r0 <= dat352_nxt;
always @(posedge clk) if (en352_1) dat352_r1 <= dat352_nxt;

assign dat352 = sel352 ? dat352_r1 : dat352_r0;


// edge:353 EB1.5
wire en353_0, en353_1, sel353;
reg [48:0] dat353_r0, dat353_r1;
always @(posedge clk) if (en353_0) dat353_r0 <= dat353_nxt;
always @(posedge clk) if (en353_1) dat353_r1 <= dat353_nxt;

assign dat353 = sel353 ? dat353_r1 : dat353_r0;


// edge:354 EB1.7
wire en354_0, en354_1, sel354;
reg [31:0] dat354_r0, dat354_r1;
wire [31:0] dat354_r0_nxt;
assign dat354_r0_nxt = sel354 ? dat354_r1 : dat354_nxt;

always @(posedge clk) if (en354_0) dat354_r0 <= dat354_r0_nxt;
always @(posedge clk) if (en354_1) dat354_r1 <= dat354_nxt;

assign dat354 = dat354_r0;


// edge:355 EB1.7
wire en355_0, en355_1, sel355;
reg [31:0] dat355_r0, dat355_r1;
wire [31:0] dat355_r0_nxt;
assign dat355_r0_nxt = sel355 ? dat355_r1 : dat355_nxt;

always @(posedge clk) if (en355_0) dat355_r0 <= dat355_r0_nxt;
always @(posedge clk) if (en355_1) dat355_r1 <= dat355_nxt;

assign dat355 = dat355_r0;


// edge:356 EB1
wire en356;
reg [31:0] dat356_r;
always @(posedge clk) if (en356) dat356_r <= dat356_nxt;
assign dat356 = dat356_r;


// edge:357 EB1.7
wire en357_0, en357_1, sel357;
reg [31:0] dat357_r0, dat357_r1;
wire [31:0] dat357_r0_nxt;
assign dat357_r0_nxt = sel357 ? dat357_r1 : dat357_nxt;

always @(posedge clk) if (en357_0) dat357_r0 <= dat357_r0_nxt;
always @(posedge clk) if (en357_1) dat357_r1 <= dat357_nxt;

assign dat357 = dat357_r0;


// edge:358 EB1
wire en358;
reg [31:0] dat358_r;
always @(posedge clk) if (en358) dat358_r <= dat358_nxt;
assign dat358 = dat358_r;


// edge:359 EB1.7
wire en359_0, en359_1, sel359;
reg [31:0] dat359_r0, dat359_r1;
wire [31:0] dat359_r0_nxt;
assign dat359_r0_nxt = sel359 ? dat359_r1 : dat359_nxt;

always @(posedge clk) if (en359_0) dat359_r0 <= dat359_r0_nxt;
always @(posedge clk) if (en359_1) dat359_r1 <= dat359_nxt;

assign dat359 = dat359_r0;

piston_ctrl uctrl (
    .clk(clk),
    .reset_n(reset_n),
    .t_instr_req(t_instr_req),
    .t_instr_ack(t_instr_ack),
    .t_idma_0_req(t_idma_0_req),
    .t_idma_0_ack(t_idma_0_ack),
    .t_idma_1_req(t_idma_1_req),
    .t_idma_1_ack(t_idma_1_ack),
    .t_idma_2_req(t_idma_2_req),
    .t_idma_2_ack(t_idma_2_ack),
    .t_idma_3_req(t_idma_3_req),
    .t_idma_3_ack(t_idma_3_ack),
    .i_odma_0_req(i_odma_0_req),
    .i_odma_0_ack(i_odma_0_ack),
    .i_odma_1_req(i_odma_1_req),
    .i_odma_1_ack(i_odma_1_ack),
    .i_odma_2_req(i_odma_2_req),
    .i_odma_2_ack(i_odma_2_ack),
    .i_odma_3_req(i_odma_3_req),
    .i_odma_3_ack(i_odma_3_ack),
    .en0_0(en0_0),
    .en0_1(en0_1),
    .sel0(sel0),
    .en1_0(en1_0),
    .en1_1(en1_1),
    .sel1(sel1),
    .en2_0(en2_0),
    .en2_1(en2_1),
    .sel2(sel2),
    .en3_0(en3_0),
    .en3_1(en3_1),
    .sel3(sel3),
    .en4_0(en4_0),
    .en4_1(en4_1),
    .sel4(sel4),
    .en5_0(en5_0),
    .en5_1(en5_1),
    .sel5(sel5),
    .en6_0(en6_0),
    .en6_1(en6_1),
    .sel6(sel6),
    .en7_0(en7_0),
    .en7_1(en7_1),
    .sel7(sel7),
    .en8_0(en8_0),
    .en8_1(en8_1),
    .sel8(sel8),
    .en9_0(en9_0),
    .en9_1(en9_1),
    .sel9(sel9),
    .en10_0(en10_0),
    .en10_1(en10_1),
    .sel10(sel10),
    .en11_0(en11_0),
    .en11_1(en11_1),
    .sel11(sel11),
    .en12_0(en12_0),
    .en12_1(en12_1),
    .sel12(sel12),
    .en13_0(en13_0),
    .en13_1(en13_1),
    .sel13(sel13),
    .en14_0(en14_0),
    .en14_1(en14_1),
    .sel14(sel14),
    .en15_0(en15_0),
    .en15_1(en15_1),
    .sel15(sel15),
    .en16_0(en16_0),
    .en16_1(en16_1),
    .sel16(sel16),
    .en17_0(en17_0),
    .en17_1(en17_1),
    .sel17(sel17),
    .en18_0(en18_0),
    .en18_1(en18_1),
    .sel18(sel18),
    .en19_0(en19_0),
    .en19_1(en19_1),
    .sel19(sel19),
    .en20_0(en20_0),
    .en20_1(en20_1),
    .sel20(sel20),
    .en21_0(en21_0),
    .en21_1(en21_1),
    .sel21(sel21),
    .en22_0(en22_0),
    .en22_1(en22_1),
    .sel22(sel22),
    .en23_0(en23_0),
    .en23_1(en23_1),
    .sel23(sel23),
    .en24_0(en24_0),
    .en24_1(en24_1),
    .sel24(sel24),
    .en25_0(en25_0),
    .en25_1(en25_1),
    .sel25(sel25),
    .en26_0(en26_0),
    .en26_1(en26_1),
    .sel26(sel26),
    .en27_0(en27_0),
    .en27_1(en27_1),
    .sel27(sel27),
    .en28_0(en28_0),
    .en28_1(en28_1),
    .sel28(sel28),
    .en29_0(en29_0),
    .en29_1(en29_1),
    .sel29(sel29),
    .en30_0(en30_0),
    .en30_1(en30_1),
    .sel30(sel30),
    .en31_0(en31_0),
    .en31_1(en31_1),
    .sel31(sel31),
    .en32(en32),
    .en33(en33),
    .en35(en35),
    .en36_0(en36_0),
    .en36_1(en36_1),
    .sel36(sel36),
    .en37_0(en37_0),
    .en37_1(en37_1),
    .sel37(sel37),
    .en38_0(en38_0),
    .en38_1(en38_1),
    .sel38(sel38),
    .en39_0(en39_0),
    .en39_1(en39_1),
    .sel39(sel39),
    .en40(en40),
    .wr_ptr41(wr_ptr41),
    .rd_ptr41(rd_ptr41),
    .wen41(wen41),
    .ren41(ren41),
    .en42_0(en42_0),
    .en42_1(en42_1),
    .sel42(sel42),
    .en43(en43),
    .en44(en44),
    .en73_0(en73_0),
    .en73_1(en73_1),
    .sel73(sel73),
    .en74_0(en74_0),
    .en74_1(en74_1),
    .sel74(sel74),
    .en91_0(en91_0),
    .en91_1(en91_1),
    .sel91(sel91),
    .en92_0(en92_0),
    .en92_1(en92_1),
    .sel92(sel92),
    .en109_0(en109_0),
    .en109_1(en109_1),
    .sel109(sel109),
    .en110_0(en110_0),
    .en110_1(en110_1),
    .sel110(sel110),
    .en127_0(en127_0),
    .en127_1(en127_1),
    .sel127(sel127),
    .en128_0(en128_0),
    .en128_1(en128_1),
    .sel128(sel128),
    .en133(en133),
    .en134(en134),
    .en163_0(en163_0),
    .en163_1(en163_1),
    .sel163(sel163),
    .en164_0(en164_0),
    .en164_1(en164_1),
    .sel164(sel164),
    .en181_0(en181_0),
    .en181_1(en181_1),
    .sel181(sel181),
    .en182_0(en182_0),
    .en182_1(en182_1),
    .sel182(sel182),
    .en199_0(en199_0),
    .en199_1(en199_1),
    .sel199(sel199),
    .en200_0(en200_0),
    .en200_1(en200_1),
    .sel200(sel200),
    .en217_0(en217_0),
    .en217_1(en217_1),
    .sel217(sel217),
    .en218_0(en218_0),
    .en218_1(en218_1),
    .sel218(sel218),
    .en223_0(en223_0),
    .en223_1(en223_1),
    .sel223(sel223),
    .en224_0(en224_0),
    .en224_1(en224_1),
    .sel224(sel224),
    .en225_0(en225_0),
    .en225_1(en225_1),
    .sel225(sel225),
    .en226_0(en226_0),
    .en226_1(en226_1),
    .sel226(sel226),
    .en227_0(en227_0),
    .en227_1(en227_1),
    .sel227(sel227),
    .en228_0(en228_0),
    .en228_1(en228_1),
    .sel228(sel228),
    .en229_0(en229_0),
    .en229_1(en229_1),
    .sel229(sel229),
    .en230_0(en230_0),
    .en230_1(en230_1),
    .sel230(sel230),
    .en241(en241),
    .en242(en242),
    .en245(en245),
    .en246(en246),
    .en249(en249),
    .en250(en250),
    .en253(en253),
    .en254(en254),
    .en255_0(en255_0),
    .en255_1(en255_1),
    .sel255(sel255),
    .en256_0(en256_0),
    .en256_1(en256_1),
    .sel256(sel256),
    .en257_0(en257_0),
    .en257_1(en257_1),
    .sel257(sel257),
    .en258_0(en258_0),
    .en258_1(en258_1),
    .sel258(sel258),
    .en259_0(en259_0),
    .en259_1(en259_1),
    .sel259(sel259),
    .en260_0(en260_0),
    .en260_1(en260_1),
    .sel260(sel260),
    .en261_0(en261_0),
    .en261_1(en261_1),
    .sel261(sel261),
    .en262_0(en262_0),
    .en262_1(en262_1),
    .sel262(sel262),
    .en273(en273),
    .en274(en274),
    .en277(en277),
    .en278(en278),
    .en281(en281),
    .en282(en282),
    .en285(en285),
    .en286(en286),
    .en290_0(en290_0),
    .en290_1(en290_1),
    .sel290(sel290),
    .en291_0(en291_0),
    .en291_1(en291_1),
    .sel291(sel291),
    .en292(en292),
    .en293(en293),
    .en296_0(en296_0),
    .en296_1(en296_1),
    .sel296(sel296),
    .en297_0(en297_0),
    .en297_1(en297_1),
    .sel297(sel297),
    .en298(en298),
    .en299(en299),
    .en302_0(en302_0),
    .en302_1(en302_1),
    .sel302(sel302),
    .en303_0(en303_0),
    .en303_1(en303_1),
    .sel303(sel303),
    .en304(en304),
    .en305(en305),
    .en308_0(en308_0),
    .en308_1(en308_1),
    .sel308(sel308),
    .en309_0(en309_0),
    .en309_1(en309_1),
    .sel309(sel309),
    .en310(en310),
    .en311(en311),
    .en315_0(en315_0),
    .en315_1(en315_1),
    .sel315(sel315),
    .en316_0(en316_0),
    .en316_1(en316_1),
    .sel316(sel316),
    .en317(en317),
    .en318(en318),
    .en321_0(en321_0),
    .en321_1(en321_1),
    .sel321(sel321),
    .en322_0(en322_0),
    .en322_1(en322_1),
    .sel322(sel322),
    .en323(en323),
    .en324(en324),
    .en327_0(en327_0),
    .en327_1(en327_1),
    .sel327(sel327),
    .en328_0(en328_0),
    .en328_1(en328_1),
    .sel328(sel328),
    .en329(en329),
    .en330(en330),
    .en333_0(en333_0),
    .en333_1(en333_1),
    .sel333(sel333),
    .en334_0(en334_0),
    .en334_1(en334_1),
    .sel334(sel334),
    .en335(en335),
    .en336(en336),
    .en340_0(en340_0),
    .en340_1(en340_1),
    .sel340(sel340),
    .en341(en341),
    .en342(en342),
    .wr_ptr343(wr_ptr343),
    .rd_ptr343(rd_ptr343),
    .wen343(wen343),
    .ren343(ren343),
    .wr_ptr344(wr_ptr344),
    .rd_ptr344(rd_ptr344),
    .wen344(wen344),
    .ren344(ren344),
    .en345(en345),
    .wr_ptr346(wr_ptr346),
    .rd_ptr346(rd_ptr346),
    .wen346(wen346),
    .ren346(ren346),
    .wr_ptr347(wr_ptr347),
    .rd_ptr347(rd_ptr347),
    .wen347(wen347),
    .ren347(ren347),
    .wr_ptr348(wr_ptr348),
    .rd_ptr348(rd_ptr348),
    .wen348(wen348),
    .ren348(ren348),
    .en349_0(en349_0),
    .en349_1(en349_1),
    .sel349(sel349),
    .en350_0(en350_0),
    .en350_1(en350_1),
    .sel350(sel350),
    .en351_0(en351_0),
    .en351_1(en351_1),
    .sel351(sel351),
    .en352_0(en352_0),
    .en352_1(en352_1),
    .sel352(sel352),
    .en353_0(en353_0),
    .en353_1(en353_1),
    .sel353(sel353),
    .en354_0(en354_0),
    .en354_1(en354_1),
    .sel354(sel354),
    .en355_0(en355_0),
    .en355_1(en355_1),
    .sel355(sel355),
    .en356(en356),
    .en357_0(en357_0),
    .en357_1(en357_1),
    .sel357(sel357),
    .en358(en358),
    .en359_0(en359_0),
    .en359_1(en359_1),
    .sel359(sel359),
    .instr_0_valid26(instr_0_valid26),
    .instr_0_ready26(instr_0_ready26),
    .instr_1_valid26(instr_1_valid26),
    .instr_1_ready26(instr_1_ready26),
    .instr_2_valid26(instr_2_valid26),
    .instr_2_ready26(instr_2_ready26),
    .instr_3_valid26(instr_3_valid26),
    .instr_3_ready26(instr_3_ready26),
    .instr_4_valid26(instr_4_valid26),
    .instr_4_ready26(instr_4_ready26),
    .instr_5_valid26(instr_5_valid26),
    .instr_5_ready26(instr_5_ready26),
    .instr_6_valid26(instr_6_valid26),
    .instr_6_ready26(instr_6_ready26),
    .instr_7_valid26(instr_7_valid26),
    .instr_7_ready26(instr_7_ready26),
    .instr_8_valid26(instr_8_valid26),
    .instr_8_ready26(instr_8_ready26),
    .instr_9_valid26(instr_9_valid26),
    .instr_9_ready26(instr_9_ready26),
    .instr_10_valid26(instr_10_valid26),
    .instr_10_ready26(instr_10_ready26),
    .instr_11_valid26(instr_11_valid26),
    .instr_11_ready26(instr_11_ready26),
    .instr_12_valid26(instr_12_valid26),
    .instr_12_ready26(instr_12_ready26),
    .instr_13_valid26(instr_13_valid26),
    .instr_13_ready26(instr_13_ready26),
    .instr_14_valid26(instr_14_valid26),
    .instr_14_ready26(instr_14_ready26),
    .instr_15_valid26(instr_15_valid26),
    .instr_15_ready26(instr_15_ready26),
    .tk15_valid26(tk15_valid26),
    .tk15_ready26(tk15_ready26),
    .ik15_valid26(ik15_valid26),
    .ik15_ready26(ik15_ready26),
    .kap_valid26(kap_valid26),
    .kap_ready26(kap_ready26),
    .sel2750(sel2750),
    .idma_valid28(idma_valid28),
    .idma_ready28(idma_ready28),
    .odma_valid28(odma_valid28),
    .odma_ready28(odma_ready28),
    .tvs_valid28(tvs_valid28),
    .tvs_ready28(tvs_ready28),
    .ivs_valid28(ivs_valid28),
    .ivs_ready28(ivs_ready28),
    .k_ctrl28(k_ctrl28),
    .sel2950(sel2950),
    .k_ctrl34(k_ctrl34),
    .k_ctrl35(k_ctrl35),
    .nsel53(nsel53),
    .nmode53(nmode53),
    .nsel54(nsel54),
    .nmode54(nmode54),
    .enable55(enable55),
    .mode55(mode55),
    .n59sel(n59sel),
    .n60sel(n60sel),
    .n61sel(n61sel),
    .n62sel(n62sel),
    .n63sel(n63sel),
    .n64sel(n64sel),
    .n67s1_en(n67s1_en),
    .n67s2_en(n67s2_en),
    .n67s3_en(n67s3_en),
    .n68s1_en(n68s1_en),
    .n68s2_en(n68s2_en),
    .n68s3_en(n68s3_en),
    .n69sel(n69sel),
    .n70sel(n70sel),
    .n71sel(n71sel),
    .n72sel(n72sel),
    .n73sel(n73sel),
    .n74sel(n74sel),
    .n77s1_en(n77s1_en),
    .n77s2_en(n77s2_en),
    .n77s3_en(n77s3_en),
    .n78s1_en(n78s1_en),
    .n78s2_en(n78s2_en),
    .n78s3_en(n78s3_en),
    .n79sel(n79sel),
    .n80sel(n80sel),
    .n81sel(n81sel),
    .n82sel(n82sel),
    .n83sel(n83sel),
    .n84sel(n84sel),
    .n87s1_en(n87s1_en),
    .n87s2_en(n87s2_en),
    .n87s3_en(n87s3_en),
    .n88s1_en(n88s1_en),
    .n88s2_en(n88s2_en),
    .n88s3_en(n88s3_en),
    .n89sel(n89sel),
    .n90sel(n90sel),
    .n91sel(n91sel),
    .n92sel(n92sel),
    .n93sel(n93sel),
    .n94sel(n94sel),
    .n97s1_en(n97s1_en),
    .n97s2_en(n97s2_en),
    .n97s3_en(n97s3_en),
    .n98s1_en(n98s1_en),
    .n98s2_en(n98s2_en),
    .n98s3_en(n98s3_en),
    .n101sel(n101sel),
    .n102sel(n102sel),
    .n103sel(n103sel),
    .n104sel(n104sel),
    .n105sel(n105sel),
    .n106sel(n106sel),
    .n109s1_en(n109s1_en),
    .n109s2_en(n109s2_en),
    .n109s3_en(n109s3_en),
    .n110s1_en(n110s1_en),
    .n110s2_en(n110s2_en),
    .n110s3_en(n110s3_en),
    .n111sel(n111sel),
    .n112sel(n112sel),
    .n113sel(n113sel),
    .n114sel(n114sel),
    .n115sel(n115sel),
    .n116sel(n116sel),
    .n119s1_en(n119s1_en),
    .n119s2_en(n119s2_en),
    .n119s3_en(n119s3_en),
    .n120s1_en(n120s1_en),
    .n120s2_en(n120s2_en),
    .n120s3_en(n120s3_en),
    .n121sel(n121sel),
    .n122sel(n122sel),
    .n123sel(n123sel),
    .n124sel(n124sel),
    .n125sel(n125sel),
    .n126sel(n126sel),
    .n129s1_en(n129s1_en),
    .n129s2_en(n129s2_en),
    .n129s3_en(n129s3_en),
    .n130s1_en(n130s1_en),
    .n130s2_en(n130s2_en),
    .n130s3_en(n130s3_en),
    .n131sel(n131sel),
    .n132sel(n132sel),
    .n133sel(n133sel),
    .n134sel(n134sel),
    .n135sel(n135sel),
    .n136sel(n136sel),
    .n139s1_en(n139s1_en),
    .n139s2_en(n139s2_en),
    .n139s3_en(n139s3_en),
    .n140s1_en(n140s1_en),
    .n140s2_en(n140s2_en),
    .n140s3_en(n140s3_en),
    .n157sel(n157sel),
    .n158sel(n158sel),
    .n159sel(n159sel),
    .n160sel(n160sel),
    .n161sel(n161sel),
    .n162sel(n162sel),
    .n163sel(n163sel),
    .n164sel(n164sel),
    .n181sel(n181sel),
    .n182sel(n182sel),
    .n183sel(n183sel),
    .n184sel(n184sel),
    .n185sel(n185sel),
    .n186sel(n186sel),
    .n187sel(n187sel),
    .n188sel(n188sel)
);
endmodule // piston

module piston_ctrl (
    // per node (target / initiator)
    input              clk,
    input              reset_n,
    input              t_instr_req,
    output             t_instr_ack,
    input              t_idma_0_req,
    output             t_idma_0_ack,
    input              t_idma_1_req,
    output             t_idma_1_ack,
    input              t_idma_2_req,
    output             t_idma_2_ack,
    input              t_idma_3_req,
    output             t_idma_3_ack,
    output             i_odma_0_req,
    input              i_odma_0_ack,
    output             i_odma_1_req,
    input              i_odma_1_ack,
    output             i_odma_2_req,
    input              i_odma_2_ack,
    output             i_odma_3_req,
    input              i_odma_3_ack,
    output             en0_0,
    output             en0_1,
    output             sel0,
    output             en1_0,
    output             en1_1,
    output             sel1,
    output             en2_0,
    output             en2_1,
    output             sel2,
    output             en3_0,
    output             en3_1,
    output             sel3,
    output             en4_0,
    output             en4_1,
    output             sel4,
    output             en5_0,
    output             en5_1,
    output             sel5,
    output             en6_0,
    output             en6_1,
    output             sel6,
    output             en7_0,
    output             en7_1,
    output             sel7,
    output             en8_0,
    output             en8_1,
    output             sel8,
    output             en9_0,
    output             en9_1,
    output             sel9,
    output             en10_0,
    output             en10_1,
    output             sel10,
    output             en11_0,
    output             en11_1,
    output             sel11,
    output             en12_0,
    output             en12_1,
    output             sel12,
    output             en13_0,
    output             en13_1,
    output             sel13,
    output             en14_0,
    output             en14_1,
    output             sel14,
    output             en15_0,
    output             en15_1,
    output             sel15,
    output             en16_0,
    output             en16_1,
    output             sel16,
    output             en17_0,
    output             en17_1,
    output             sel17,
    output             en18_0,
    output             en18_1,
    output             sel18,
    output             en19_0,
    output             en19_1,
    output             sel19,
    output             en20_0,
    output             en20_1,
    output             sel20,
    output             en21_0,
    output             en21_1,
    output             sel21,
    output             en22_0,
    output             en22_1,
    output             sel22,
    output             en23_0,
    output             en23_1,
    output             sel23,
    output             en24_0,
    output             en24_1,
    output             sel24,
    output             en25_0,
    output             en25_1,
    output             sel25,
    output             en26_0,
    output             en26_1,
    output             sel26,
    output             en27_0,
    output             en27_1,
    output             sel27,
    output             en28_0,
    output             en28_1,
    output             sel28,
    output             en29_0,
    output             en29_1,
    output             sel29,
    output             en30_0,
    output             en30_1,
    output             sel30,
    output             en31_0,
    output             en31_1,
    output             sel31,
    output             en32,
    output             en33,
    output             en35,
    output             en36_0,
    output             en36_1,
    output             sel36,
    output             en37_0,
    output             en37_1,
    output             sel37,
    output             en38_0,
    output             en38_1,
    output             sel38,
    output             en39_0,
    output             en39_1,
    output             sel39,
    output             en40,
    output       [1:0] wr_ptr41,
    output       [1:0] rd_ptr41,
    output             wen41,
    output             ren41,
    output             en42_0,
    output             en42_1,
    output             sel42,
    output             en43,
    output             en44,
    output             en73_0,
    output             en73_1,
    output             sel73,
    output             en74_0,
    output             en74_1,
    output             sel74,
    output             en91_0,
    output             en91_1,
    output             sel91,
    output             en92_0,
    output             en92_1,
    output             sel92,
    output             en109_0,
    output             en109_1,
    output             sel109,
    output             en110_0,
    output             en110_1,
    output             sel110,
    output             en127_0,
    output             en127_1,
    output             sel127,
    output             en128_0,
    output             en128_1,
    output             sel128,
    output             en133,
    output             en134,
    output             en163_0,
    output             en163_1,
    output             sel163,
    output             en164_0,
    output             en164_1,
    output             sel164,
    output             en181_0,
    output             en181_1,
    output             sel181,
    output             en182_0,
    output             en182_1,
    output             sel182,
    output             en199_0,
    output             en199_1,
    output             sel199,
    output             en200_0,
    output             en200_1,
    output             sel200,
    output             en217_0,
    output             en217_1,
    output             sel217,
    output             en218_0,
    output             en218_1,
    output             sel218,
    output             en223_0,
    output             en223_1,
    output             sel223,
    output             en224_0,
    output             en224_1,
    output             sel224,
    output             en225_0,
    output             en225_1,
    output             sel225,
    output             en226_0,
    output             en226_1,
    output             sel226,
    output             en227_0,
    output             en227_1,
    output             sel227,
    output             en228_0,
    output             en228_1,
    output             sel228,
    output             en229_0,
    output             en229_1,
    output             sel229,
    output             en230_0,
    output             en230_1,
    output             sel230,
    output             en241,
    output             en242,
    output             en245,
    output             en246,
    output             en249,
    output             en250,
    output             en253,
    output             en254,
    output             en255_0,
    output             en255_1,
    output             sel255,
    output             en256_0,
    output             en256_1,
    output             sel256,
    output             en257_0,
    output             en257_1,
    output             sel257,
    output             en258_0,
    output             en258_1,
    output             sel258,
    output             en259_0,
    output             en259_1,
    output             sel259,
    output             en260_0,
    output             en260_1,
    output             sel260,
    output             en261_0,
    output             en261_1,
    output             sel261,
    output             en262_0,
    output             en262_1,
    output             sel262,
    output             en273,
    output             en274,
    output             en277,
    output             en278,
    output             en281,
    output             en282,
    output             en285,
    output             en286,
    output             en290_0,
    output             en290_1,
    output             sel290,
    output             en291_0,
    output             en291_1,
    output             sel291,
    output             en292,
    output             en293,
    output             en296_0,
    output             en296_1,
    output             sel296,
    output             en297_0,
    output             en297_1,
    output             sel297,
    output             en298,
    output             en299,
    output             en302_0,
    output             en302_1,
    output             sel302,
    output             en303_0,
    output             en303_1,
    output             sel303,
    output             en304,
    output             en305,
    output             en308_0,
    output             en308_1,
    output             sel308,
    output             en309_0,
    output             en309_1,
    output             sel309,
    output             en310,
    output             en311,
    output             en315_0,
    output             en315_1,
    output             sel315,
    output             en316_0,
    output             en316_1,
    output             sel316,
    output             en317,
    output             en318,
    output             en321_0,
    output             en321_1,
    output             sel321,
    output             en322_0,
    output             en322_1,
    output             sel322,
    output             en323,
    output             en324,
    output             en327_0,
    output             en327_1,
    output             sel327,
    output             en328_0,
    output             en328_1,
    output             sel328,
    output             en329,
    output             en330,
    output             en333_0,
    output             en333_1,
    output             sel333,
    output             en334_0,
    output             en334_1,
    output             sel334,
    output             en335,
    output             en336,
    output             en340_0,
    output             en340_1,
    output             sel340,
    output             en341,
    output             en342,
    output       [1:0] wr_ptr343,
    output       [1:0] rd_ptr343,
    output             wen343,
    output             ren343,
    output             wr_ptr344,
    output             rd_ptr344,
    output             wen344,
    output             ren344,
    output             en345,
    output       [1:0] wr_ptr346,
    output       [1:0] rd_ptr346,
    output             wen346,
    output             ren346,
    output       [1:0] wr_ptr347,
    output       [1:0] rd_ptr347,
    output             wen347,
    output             ren347,
    output       [1:0] wr_ptr348,
    output       [1:0] rd_ptr348,
    output             wen348,
    output             ren348,
    output             en349_0,
    output             en349_1,
    output             sel349,
    output             en350_0,
    output             en350_1,
    output             sel350,
    output             en351_0,
    output             en351_1,
    output             sel351,
    output             en352_0,
    output             en352_1,
    output             sel352,
    output             en353_0,
    output             en353_1,
    output             sel353,
    output             en354_0,
    output             en354_1,
    output             sel354,
    output             en355_0,
    output             en355_1,
    output             sel355,
    output             en356,
    output             en357_0,
    output             en357_1,
    output             sel357,
    output             en358,
    output             en359_0,
    output             en359_1,
    output             sel359,
    output             instr_0_valid26,
    input              instr_0_ready26,
    output             instr_1_valid26,
    input              instr_1_ready26,
    output             instr_2_valid26,
    input              instr_2_ready26,
    output             instr_3_valid26,
    input              instr_3_ready26,
    output             instr_4_valid26,
    input              instr_4_ready26,
    output             instr_5_valid26,
    input              instr_5_ready26,
    output             instr_6_valid26,
    input              instr_6_ready26,
    output             instr_7_valid26,
    input              instr_7_ready26,
    output             instr_8_valid26,
    input              instr_8_ready26,
    output             instr_9_valid26,
    input              instr_9_ready26,
    output             instr_10_valid26,
    input              instr_10_ready26,
    output             instr_11_valid26,
    input              instr_11_ready26,
    output             instr_12_valid26,
    input              instr_12_ready26,
    output             instr_13_valid26,
    input              instr_13_ready26,
    output             instr_14_valid26,
    input              instr_14_ready26,
    output             instr_15_valid26,
    input              instr_15_ready26,
    output             tk15_valid26,
    input              tk15_ready26,
    input              ik15_valid26,
    output             ik15_ready26,
    input              kap_valid26,
    output             kap_ready26,
    input        [3:0] sel2750,
    output       [3:0] idma_valid28,
    input        [3:0] idma_ready28,
    input        [3:0] odma_valid28,
    output       [3:0] odma_ready28,
    output             tvs_valid28,
    input              tvs_ready28,
    input              ivs_valid28,
    output             ivs_ready28,
    input        [3:0] k_ctrl28,
    input        [3:0] sel2950,
    input        [3:0] k_ctrl34,
    input        [3:0] k_ctrl35,
    output       [7:0] nsel53,
    input        [7:0] nmode53,
    output       [7:0] nsel54,
    input        [7:0] nmode54,
    output       [7:0] enable55,
    input        [7:0] mode55,
    input        [1:0] n59sel,
    input        [1:0] n60sel,
    input        [1:0] n61sel,
    input        [1:0] n62sel,
    input        [1:0] n63sel,
    input        [1:0] n64sel,
    output             n67s1_en,
    output             n67s2_en,
    output             n67s3_en,
    output             n68s1_en,
    output             n68s2_en,
    output             n68s3_en,
    input        [1:0] n69sel,
    input        [1:0] n70sel,
    input        [1:0] n71sel,
    input        [1:0] n72sel,
    input        [1:0] n73sel,
    input        [1:0] n74sel,
    output             n77s1_en,
    output             n77s2_en,
    output             n77s3_en,
    output             n78s1_en,
    output             n78s2_en,
    output             n78s3_en,
    input        [1:0] n79sel,
    input        [1:0] n80sel,
    input        [1:0] n81sel,
    input        [1:0] n82sel,
    input        [1:0] n83sel,
    input        [1:0] n84sel,
    output             n87s1_en,
    output             n87s2_en,
    output             n87s3_en,
    output             n88s1_en,
    output             n88s2_en,
    output             n88s3_en,
    input        [1:0] n89sel,
    input        [1:0] n90sel,
    input        [1:0] n91sel,
    input        [1:0] n92sel,
    input        [1:0] n93sel,
    input        [1:0] n94sel,
    output             n97s1_en,
    output             n97s2_en,
    output             n97s3_en,
    output             n98s1_en,
    output             n98s2_en,
    output             n98s3_en,
    input        [1:0] n101sel,
    input        [1:0] n102sel,
    input        [1:0] n103sel,
    input        [1:0] n104sel,
    input        [1:0] n105sel,
    input        [1:0] n106sel,
    output             n109s1_en,
    output             n109s2_en,
    output             n109s3_en,
    output             n110s1_en,
    output             n110s2_en,
    output             n110s3_en,
    input        [1:0] n111sel,
    input        [1:0] n112sel,
    input        [1:0] n113sel,
    input        [1:0] n114sel,
    input        [1:0] n115sel,
    input        [1:0] n116sel,
    output             n119s1_en,
    output             n119s2_en,
    output             n119s3_en,
    output             n120s1_en,
    output             n120s2_en,
    output             n120s3_en,
    input        [1:0] n121sel,
    input        [1:0] n122sel,
    input        [1:0] n123sel,
    input        [1:0] n124sel,
    input        [1:0] n125sel,
    input        [1:0] n126sel,
    output             n129s1_en,
    output             n129s2_en,
    output             n129s3_en,
    output             n130s1_en,
    output             n130s2_en,
    output             n130s3_en,
    input        [1:0] n131sel,
    input        [1:0] n132sel,
    input        [1:0] n133sel,
    input        [1:0] n134sel,
    input        [1:0] n135sel,
    input        [1:0] n136sel,
    output             n139s1_en,
    output             n139s2_en,
    output             n139s3_en,
    output             n140s1_en,
    output             n140s2_en,
    output             n140s3_en,
    input        [1:0] n157sel,
    input        [1:0] n158sel,
    input        [1:0] n159sel,
    input        [1:0] n160sel,
    input        [1:0] n161sel,
    input        [1:0] n162sel,
    input        [1:0] n163sel,
    input        [1:0] n164sel,
    input        [1:0] n181sel,
    input        [1:0] n182sel,
    input        [1:0] n183sel,
    input        [1:0] n184sel,
    input        [1:0] n185sel,
    input        [1:0] n186sel,
    input        [1:0] n187sel,
    input        [1:0] n188sel
);
// per edge
wire             req0, ack0, ack0_0, req0_0, ack0_1, req0_1;
wire             req1, ack1, ack1_0, req1_0, ack1_1, req1_1;
wire             req2, ack2, ack2_0, req2_0, ack2_1, req2_1;
wire             req3, ack3, ack3_0, req3_0, ack3_1, req3_1;
wire             req4, ack4, ack4_0, req4_0, ack4_1, req4_1;
wire             req5, ack5, ack5_0, req5_0, ack5_1, req5_1;
wire             req6, ack6, ack6_0, req6_0, ack6_1, req6_1;
wire             req7, ack7, ack7_0, req7_0, ack7_1, req7_1;
wire             req8, ack8, ack8_0, req8_0;
wire             req9, ack9, ack9_0, req9_0;
wire             req10, ack10, ack10_0, req10_0, ack10_1, req10_1;
wire             req11, ack11, ack11_0, req11_0;
wire             req12, ack12, ack12_0, req12_0;
wire             req13, ack13, ack13_0, req13_0, ack13_1, req13_1;
wire             req14, ack14, ack14_0, req14_0;
wire             req15, ack15, ack15_0, req15_0;
wire             req16, ack16, ack16_0, req16_0, ack16_1, req16_1;
wire             req17, ack17, ack17_0, req17_0;
wire             req18, ack18, ack18_0, req18_0;
wire             req19, ack19, ack19_0, req19_0, ack19_1, req19_1;
wire             req20, ack20, ack20_0, req20_0;
wire             req21, ack21, ack21_0, req21_0;
wire             req22, ack22, ack22_0, req22_0, ack22_1, req22_1;
wire             req23, ack23, ack23_0, req23_0;
wire             req24, ack24, ack24_0, req24_0;
wire             req25, ack25, ack25_0, req25_0, ack25_1, req25_1;
wire             req26, ack26, ack26_0, req26_0;
wire             req27, ack27, ack27_0, req27_0;
wire             req28, ack28, ack28_0, req28_0, ack28_1, req28_1;
wire             req29, ack29, ack29_0, req29_0;
wire             req30, ack30, ack30_0, req30_0;
wire             req31, ack31, ack31_0, req31_0;
wire             req32, ack32, ack32_0, req32_0;
wire             req33, ack33, ack33_0, req33_0;
wire             req34, ack34, ack34_0, req34_0;
wire             req35, ack35, ack35_0, req35_0;
wire             req36, ack36, ack36_0, req36_0;
wire             req37, ack37, ack37_0, req37_0;
wire             req38, ack38, ack38_0, req38_0;
wire             req39, ack39, ack39_0, req39_0;
wire             req40, ack40, ack40_0, req40_0;
wire             req41, ack41, ack41_0, req41_0;
wire             req42, ack42, ack42_0, req42_0;
wire             req43, ack43, ack43_0, req43_0;
wire             req44, ack44, ack44_0, req44_0;
wire             req45, ack45, ack45_0, req45_0, ack45_1, req45_1, ack45_2, req45_2;
wire             req46, ack46, ack46_0, req46_0, ack46_1, req46_1, ack46_2, req46_2;
wire             req47, ack47, ack47_0, req47_0, ack47_1, req47_1, ack47_2, req47_2, ack47_3, req47_3;
wire             req48, ack48, ack48_0, req48_0, ack48_1, req48_1, ack48_2, req48_2, ack48_3, req48_3;
wire             req49, ack49, ack49_0, req49_0, ack49_1, req49_1, ack49_2, req49_2;
wire             req50, ack50, ack50_0, req50_0, ack50_1, req50_1, ack50_2, req50_2;
wire             req51, ack51, ack51_0, req51_0, ack51_1, req51_1, ack51_2, req51_2, ack51_3, req51_3;
wire             req52, ack52, ack52_0, req52_0, ack52_1, req52_1, ack52_2, req52_2, ack52_3, req52_3;
wire             req53, ack53, ack53_0, req53_0, ack53_1, req53_1, ack53_2, req53_2;
wire             req54, ack54, ack54_0, req54_0, ack54_1, req54_1, ack54_2, req54_2;
wire             req55, ack55, ack55_0, req55_0, ack55_1, req55_1, ack55_2, req55_2, ack55_3, req55_3;
wire             req56, ack56, ack56_0, req56_0, ack56_1, req56_1, ack56_2, req56_2, ack56_3, req56_3;
wire             req57, ack57, ack57_0, req57_0, ack57_1, req57_1, ack57_2, req57_2;
wire             req58, ack58, ack58_0, req58_0, ack58_1, req58_1, ack58_2, req58_2;
wire             req59, ack59, ack59_0, req59_0, ack59_1, req59_1, ack59_2, req59_2, ack59_3, req59_3;
wire             req60, ack60, ack60_0, req60_0, ack60_1, req60_1, ack60_2, req60_2, ack60_3, req60_3;
wire             req61, ack61, ack61_0, req61_0;
wire             req62, ack62, ack62_0, req62_0;
wire             req63, ack63, ack63_0, req63_0;
wire             req64, ack64, ack64_0, req64_0;
wire             req65, ack65, ack65_0, req65_0;
wire             req66, ack66, ack66_0, req66_0;
wire             req67, ack67, ack67_0, req67_0;
wire             req68, ack68, ack68_0, req68_0;
wire             req69, ack69, ack69_0, req69_0;
wire             req70, ack70, ack70_0, req70_0;
wire             req71, ack71, ack71_0, req71_0;
wire             req72, ack72, ack72_0, req72_0;
wire             req73, ack73, ack73_0, req73_0;
wire             req74, ack74, ack74_0, req74_0;
wire             req75, ack75, ack75_0, req75_0;
wire             req76, ack76, ack76_0, req76_0, ack76_1, req76_1, ack76_2, req76_2;
wire             req77, ack77, ack77_0, req77_0;
wire             req78, ack78, ack78_0, req78_0, ack78_1, req78_1, ack78_2, req78_2;
wire             req79, ack79, ack79_0, req79_0;
wire             req80, ack80, ack80_0, req80_0;
wire             req81, ack81, ack81_0, req81_0;
wire             req82, ack82, ack82_0, req82_0;
wire             req83, ack83, ack83_0, req83_0;
wire             req84, ack84, ack84_0, req84_0;
wire             req85, ack85, ack85_0, req85_0;
wire             req86, ack86, ack86_0, req86_0;
wire             req87, ack87, ack87_0, req87_0;
wire             req88, ack88, ack88_0, req88_0;
wire             req89, ack89, ack89_0, req89_0;
wire             req90, ack90, ack90_0, req90_0;
wire             req91, ack91, ack91_0, req91_0;
wire             req92, ack92, ack92_0, req92_0;
wire             req93, ack93, ack93_0, req93_0;
wire             req94, ack94, ack94_0, req94_0, ack94_1, req94_1, ack94_2, req94_2;
wire             req95, ack95, ack95_0, req95_0;
wire             req96, ack96, ack96_0, req96_0, ack96_1, req96_1, ack96_2, req96_2;
wire             req97, ack97, ack97_0, req97_0;
wire             req98, ack98, ack98_0, req98_0;
wire             req99, ack99, ack99_0, req99_0;
wire             req100, ack100, ack100_0, req100_0;
wire             req101, ack101, ack101_0, req101_0;
wire             req102, ack102, ack102_0, req102_0;
wire             req103, ack103, ack103_0, req103_0;
wire             req104, ack104, ack104_0, req104_0;
wire             req105, ack105, ack105_0, req105_0;
wire             req106, ack106, ack106_0, req106_0;
wire             req107, ack107, ack107_0, req107_0;
wire             req108, ack108, ack108_0, req108_0;
wire             req109, ack109, ack109_0, req109_0;
wire             req110, ack110, ack110_0, req110_0;
wire             req111, ack111, ack111_0, req111_0;
wire             req112, ack112, ack112_0, req112_0, ack112_1, req112_1, ack112_2, req112_2;
wire             req113, ack113, ack113_0, req113_0;
wire             req114, ack114, ack114_0, req114_0, ack114_1, req114_1, ack114_2, req114_2;
wire             req115, ack115, ack115_0, req115_0;
wire             req116, ack116, ack116_0, req116_0;
wire             req117, ack117, ack117_0, req117_0;
wire             req118, ack118, ack118_0, req118_0;
wire             req119, ack119, ack119_0, req119_0;
wire             req120, ack120, ack120_0, req120_0;
wire             req121, ack121, ack121_0, req121_0;
wire             req122, ack122, ack122_0, req122_0;
wire             req123, ack123, ack123_0, req123_0;
wire             req124, ack124, ack124_0, req124_0;
wire             req125, ack125, ack125_0, req125_0;
wire             req126, ack126, ack126_0, req126_0;
wire             req127, ack127, ack127_0, req127_0;
wire             req128, ack128, ack128_0, req128_0;
wire             req129, ack129, ack129_0, req129_0;
wire             req130, ack130, ack130_0, req130_0, ack130_1, req130_1, ack130_2, req130_2;
wire             req131, ack131, ack131_0, req131_0;
wire             req132, ack132, ack132_0, req132_0, ack132_1, req132_1, ack132_2, req132_2;
wire             req133, ack133, ack133_0, req133_0;
wire             req134, ack134, ack134_0, req134_0;
wire             req135, ack135, ack135_0, req135_0, ack135_1, req135_1, ack135_2, req135_2;
wire             req136, ack136, ack136_0, req136_0, ack136_1, req136_1, ack136_2, req136_2;
wire             req137, ack137, ack137_0, req137_0, ack137_1, req137_1, ack137_2, req137_2, ack137_3, req137_3;
wire             req138, ack138, ack138_0, req138_0, ack138_1, req138_1, ack138_2, req138_2, ack138_3, req138_3;
wire             req139, ack139, ack139_0, req139_0, ack139_1, req139_1, ack139_2, req139_2;
wire             req140, ack140, ack140_0, req140_0, ack140_1, req140_1, ack140_2, req140_2;
wire             req141, ack141, ack141_0, req141_0, ack141_1, req141_1, ack141_2, req141_2, ack141_3, req141_3;
wire             req142, ack142, ack142_0, req142_0, ack142_1, req142_1, ack142_2, req142_2, ack142_3, req142_3;
wire             req143, ack143, ack143_0, req143_0, ack143_1, req143_1, ack143_2, req143_2;
wire             req144, ack144, ack144_0, req144_0, ack144_1, req144_1, ack144_2, req144_2;
wire             req145, ack145, ack145_0, req145_0, ack145_1, req145_1, ack145_2, req145_2, ack145_3, req145_3;
wire             req146, ack146, ack146_0, req146_0, ack146_1, req146_1, ack146_2, req146_2, ack146_3, req146_3;
wire             req147, ack147, ack147_0, req147_0, ack147_1, req147_1, ack147_2, req147_2;
wire             req148, ack148, ack148_0, req148_0, ack148_1, req148_1, ack148_2, req148_2;
wire             req149, ack149, ack149_0, req149_0, ack149_1, req149_1, ack149_2, req149_2, ack149_3, req149_3;
wire             req150, ack150, ack150_0, req150_0, ack150_1, req150_1, ack150_2, req150_2, ack150_3, req150_3;
wire             req151, ack151, ack151_0, req151_0;
wire             req152, ack152, ack152_0, req152_0;
wire             req153, ack153, ack153_0, req153_0;
wire             req154, ack154, ack154_0, req154_0;
wire             req155, ack155, ack155_0, req155_0;
wire             req156, ack156, ack156_0, req156_0;
wire             req157, ack157, ack157_0, req157_0;
wire             req158, ack158, ack158_0, req158_0;
wire             req159, ack159, ack159_0, req159_0;
wire             req160, ack160, ack160_0, req160_0;
wire             req161, ack161, ack161_0, req161_0;
wire             req162, ack162, ack162_0, req162_0;
wire             req163, ack163, ack163_0, req163_0;
wire             req164, ack164, ack164_0, req164_0;
wire             req165, ack165, ack165_0, req165_0;
wire             req166, ack166, ack166_0, req166_0, ack166_1, req166_1, ack166_2, req166_2;
wire             req167, ack167, ack167_0, req167_0;
wire             req168, ack168, ack168_0, req168_0, ack168_1, req168_1, ack168_2, req168_2;
wire             req169, ack169, ack169_0, req169_0;
wire             req170, ack170, ack170_0, req170_0;
wire             req171, ack171, ack171_0, req171_0;
wire             req172, ack172, ack172_0, req172_0;
wire             req173, ack173, ack173_0, req173_0;
wire             req174, ack174, ack174_0, req174_0;
wire             req175, ack175, ack175_0, req175_0;
wire             req176, ack176, ack176_0, req176_0;
wire             req177, ack177, ack177_0, req177_0;
wire             req178, ack178, ack178_0, req178_0;
wire             req179, ack179, ack179_0, req179_0;
wire             req180, ack180, ack180_0, req180_0;
wire             req181, ack181, ack181_0, req181_0;
wire             req182, ack182, ack182_0, req182_0;
wire             req183, ack183, ack183_0, req183_0;
wire             req184, ack184, ack184_0, req184_0, ack184_1, req184_1, ack184_2, req184_2;
wire             req185, ack185, ack185_0, req185_0;
wire             req186, ack186, ack186_0, req186_0, ack186_1, req186_1, ack186_2, req186_2;
wire             req187, ack187, ack187_0, req187_0;
wire             req188, ack188, ack188_0, req188_0;
wire             req189, ack189, ack189_0, req189_0;
wire             req190, ack190, ack190_0, req190_0;
wire             req191, ack191, ack191_0, req191_0;
wire             req192, ack192, ack192_0, req192_0;
wire             req193, ack193, ack193_0, req193_0;
wire             req194, ack194, ack194_0, req194_0;
wire             req195, ack195, ack195_0, req195_0;
wire             req196, ack196, ack196_0, req196_0;
wire             req197, ack197, ack197_0, req197_0;
wire             req198, ack198, ack198_0, req198_0;
wire             req199, ack199, ack199_0, req199_0;
wire             req200, ack200, ack200_0, req200_0;
wire             req201, ack201, ack201_0, req201_0;
wire             req202, ack202, ack202_0, req202_0, ack202_1, req202_1, ack202_2, req202_2;
wire             req203, ack203, ack203_0, req203_0;
wire             req204, ack204, ack204_0, req204_0, ack204_1, req204_1, ack204_2, req204_2;
wire             req205, ack205, ack205_0, req205_0;
wire             req206, ack206, ack206_0, req206_0;
wire             req207, ack207, ack207_0, req207_0;
wire             req208, ack208, ack208_0, req208_0;
wire             req209, ack209, ack209_0, req209_0;
wire             req210, ack210, ack210_0, req210_0;
wire             req211, ack211, ack211_0, req211_0;
wire             req212, ack212, ack212_0, req212_0;
wire             req213, ack213, ack213_0, req213_0;
wire             req214, ack214, ack214_0, req214_0;
wire             req215, ack215, ack215_0, req215_0;
wire             req216, ack216, ack216_0, req216_0;
wire             req217, ack217, ack217_0, req217_0;
wire             req218, ack218, ack218_0, req218_0;
wire             req219, ack219, ack219_0, req219_0;
wire             req220, ack220, ack220_0, req220_0, ack220_1, req220_1, ack220_2, req220_2;
wire             req221, ack221, ack221_0, req221_0;
wire             req222, ack222, ack222_0, req222_0, ack222_1, req222_1, ack222_2, req222_2;
wire             req223, ack223, ack223_0, req223_0, ack223_1, req223_1;
wire             req224, ack224, ack224_0, req224_0, ack224_1, req224_1;
wire             req225, ack225, ack225_0, req225_0, ack225_1, req225_1;
wire             req226, ack226, ack226_0, req226_0, ack226_1, req226_1;
wire             req227, ack227, ack227_0, req227_0, ack227_1, req227_1;
wire             req228, ack228, ack228_0, req228_0, ack228_1, req228_1;
wire             req229, ack229, ack229_0, req229_0, ack229_1, req229_1;
wire             req230, ack230, ack230_0, req230_0, ack230_1, req230_1;
wire             req231, ack231, ack231_0, req231_0;
wire             req232, ack232, ack232_0, req232_0;
wire             req233, ack233, ack233_0, req233_0;
wire             req234, ack234, ack234_0, req234_0;
wire             req235, ack235, ack235_0, req235_0;
wire             req236, ack236, ack236_0, req236_0;
wire             req237, ack237, ack237_0, req237_0;
wire             req238, ack238, ack238_0, req238_0;
wire             req239, ack239, ack239_0, req239_0;
wire             req240, ack240, ack240_0, req240_0;
wire             req241, ack241, ack241_0, req241_0;
wire             req242, ack242, ack242_0, req242_0;
wire             req243, ack243, ack243_0, req243_0;
wire             req244, ack244, ack244_0, req244_0;
wire             req245, ack245, ack245_0, req245_0;
wire             req246, ack246, ack246_0, req246_0;
wire             req247, ack247, ack247_0, req247_0;
wire             req248, ack248, ack248_0, req248_0;
wire             req249, ack249, ack249_0, req249_0;
wire             req250, ack250, ack250_0, req250_0;
wire             req251, ack251, ack251_0, req251_0;
wire             req252, ack252, ack252_0, req252_0;
wire             req253, ack253, ack253_0, req253_0;
wire             req254, ack254, ack254_0, req254_0;
wire             req255, ack255, ack255_0, req255_0, ack255_1, req255_1;
wire             req256, ack256, ack256_0, req256_0, ack256_1, req256_1;
wire             req257, ack257, ack257_0, req257_0, ack257_1, req257_1;
wire             req258, ack258, ack258_0, req258_0, ack258_1, req258_1;
wire             req259, ack259, ack259_0, req259_0, ack259_1, req259_1;
wire             req260, ack260, ack260_0, req260_0, ack260_1, req260_1;
wire             req261, ack261, ack261_0, req261_0, ack261_1, req261_1;
wire             req262, ack262, ack262_0, req262_0, ack262_1, req262_1;
wire             req263, ack263, ack263_0, req263_0;
wire             req264, ack264, ack264_0, req264_0;
wire             req265, ack265, ack265_0, req265_0;
wire             req266, ack266, ack266_0, req266_0;
wire             req267, ack267, ack267_0, req267_0;
wire             req268, ack268, ack268_0, req268_0;
wire             req269, ack269, ack269_0, req269_0;
wire             req270, ack270, ack270_0, req270_0;
wire             req271, ack271, ack271_0, req271_0;
wire             req272, ack272, ack272_0, req272_0;
wire             req273, ack273, ack273_0, req273_0;
wire             req274, ack274, ack274_0, req274_0;
wire             req275, ack275, ack275_0, req275_0;
wire             req276, ack276, ack276_0, req276_0;
wire             req277, ack277, ack277_0, req277_0;
wire             req278, ack278, ack278_0, req278_0;
wire             req279, ack279, ack279_0, req279_0;
wire             req280, ack280, ack280_0, req280_0;
wire             req281, ack281, ack281_0, req281_0;
wire             req282, ack282, ack282_0, req282_0;
wire             req283, ack283, ack283_0, req283_0;
wire             req284, ack284, ack284_0, req284_0;
wire             req285, ack285, ack285_0, req285_0;
wire             req286, ack286, ack286_0, req286_0;
wire             req287, ack287, ack287_0, req287_0;
wire             req288, ack288, ack288_0, req288_0;
wire             req289, ack289, ack289_0, req289_0;
wire             req290, ack290, ack290_0, req290_0;
wire             req291, ack291, ack291_0, req291_0;
wire             req292, ack292, ack292_0, req292_0;
wire             req293, ack293, ack293_0, req293_0;
wire             req294, ack294, ack294_0, req294_0;
wire             req295, ack295, ack295_0, req295_0;
wire             req296, ack296, ack296_0, req296_0;
wire             req297, ack297, ack297_0, req297_0;
wire             req298, ack298, ack298_0, req298_0;
wire             req299, ack299, ack299_0, req299_0;
wire             req300, ack300, ack300_0, req300_0;
wire             req301, ack301, ack301_0, req301_0;
wire             req302, ack302, ack302_0, req302_0;
wire             req303, ack303, ack303_0, req303_0;
wire             req304, ack304, ack304_0, req304_0;
wire             req305, ack305, ack305_0, req305_0;
wire             req306, ack306, ack306_0, req306_0;
wire             req307, ack307, ack307_0, req307_0;
wire             req308, ack308, ack308_0, req308_0;
wire             req309, ack309, ack309_0, req309_0;
wire             req310, ack310, ack310_0, req310_0;
wire             req311, ack311, ack311_0, req311_0;
wire             req312, ack312, ack312_0, req312_0;
wire             req313, ack313, ack313_0, req313_0;
wire             req314, ack314, ack314_0, req314_0;
wire             req315, ack315, ack315_0, req315_0;
wire             req316, ack316, ack316_0, req316_0;
wire             req317, ack317, ack317_0, req317_0;
wire             req318, ack318, ack318_0, req318_0;
wire             req319, ack319, ack319_0, req319_0;
wire             req320, ack320, ack320_0, req320_0;
wire             req321, ack321, ack321_0, req321_0;
wire             req322, ack322, ack322_0, req322_0;
wire             req323, ack323, ack323_0, req323_0;
wire             req324, ack324, ack324_0, req324_0;
wire             req325, ack325, ack325_0, req325_0;
wire             req326, ack326, ack326_0, req326_0;
wire             req327, ack327, ack327_0, req327_0;
wire             req328, ack328, ack328_0, req328_0;
wire             req329, ack329, ack329_0, req329_0;
wire             req330, ack330, ack330_0, req330_0;
wire             req331, ack331, ack331_0, req331_0;
wire             req332, ack332, ack332_0, req332_0;
wire             req333, ack333, ack333_0, req333_0;
wire             req334, ack334, ack334_0, req334_0;
wire             req335, ack335, ack335_0, req335_0;
wire             req336, ack336, ack336_0, req336_0;
wire             req337, ack337, ack337_0, req337_0;
wire             req338, ack338, ack338_0, req338_0;
wire             req339, ack339, ack339_0, req339_0;
wire             req340, ack340, ack340_0, req340_0;
wire             req341, ack341, ack341_0, req341_0;
wire             req342, ack342, ack342_0, req342_0;
wire             req343, ack343, ack343_0, req343_0;
wire             req344, ack344, ack344_0, req344_0;
wire             req345, ack345, ack345_0, req345_0;
wire             req346, ack346, ack346_0, req346_0;
wire             req347, ack347, ack347_0, req347_0;
wire             req348, ack348, ack348_0, req348_0;
wire             req349, ack349, ack349_0, req349_0;
wire             req350, ack350, ack350_0, req350_0;
wire             req351, ack351, ack351_0, req351_0;
wire             req352, ack352, ack352_0, req352_0;
wire             req353, ack353, ack353_0, req353_0;
wire             req354, ack354, ack354_0, req354_0;
wire             req355, ack355, ack355_0, req355_0;
wire             req356, ack356, ack356_0, req356_0;
wire             req357, ack357, ack357_0, req357_0;
wire             req358, ack358, ack358_0, req358_0;
wire             req359, ack359, ack359_0, req359_0;
// node:t_instr target
assign req0 = t_instr_req;
assign t_instr_ack = ack0;
// node:t_idma_0 target
assign req349 = t_idma_0_req;
assign t_idma_0_ack = ack349;
// node:t_idma_1 target
assign req350 = t_idma_1_req;
assign t_idma_1_ack = ack350;
// node:t_idma_2 target
assign req352 = t_idma_2_req;
assign t_idma_2_ack = ack352;
// node:t_idma_3 target
assign req353 = t_idma_3_req;
assign t_idma_3_ack = ack353;

// edge:0 EB1.5
wire ack0m, req0m;
eb15_ctrl uctrl_0 (
    .t_0_req(req0), .t_0_ack(ack0),
    .i_0_req(req0m), .i_0_ack(ack0m),
    .en0(en0_0), .en1(en0_1), .sel(sel0),
    .clk(clk), .reset_n(reset_n)
);


// edge:0 fork
reg  ack0_0_r, ack0_1_r;
wire ack0_0_s, ack0_1_s;
assign req0_0 = req0m & ~ack0_0_r;
assign req0_1 = req0m & ~ack0_1_r;
assign ack0_0_s = ack0_0 | ~req0_0;
assign ack0_1_s = ack0_1 | ~req0_1;
assign ack0m = ack0_0_s & ack0_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack0_0_r <= 1'b0; else ack0_0_r <= ack0_0_s & ~ack0m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack0_1_r <= 1'b0; else ack0_1_r <= ack0_1_s & ~ack0m;


// edge:1 EB1.5
wire ack1m, req1m;
eb15_ctrl uctrl_1 (
    .t_0_req(req1), .t_0_ack(ack1),
    .i_0_req(req1m), .i_0_ack(ack1m),
    .en0(en1_0), .en1(en1_1), .sel(sel1),
    .clk(clk), .reset_n(reset_n)
);


// edge:1 fork
reg  ack1_0_r, ack1_1_r;
wire ack1_0_s, ack1_1_s;
assign req1_0 = req1m & ~ack1_0_r;
assign req1_1 = req1m & ~ack1_1_r;
assign ack1_0_s = ack1_0 | ~req1_0;
assign ack1_1_s = ack1_1 | ~req1_1;
assign ack1m = ack1_0_s & ack1_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack1_0_r <= 1'b0; else ack1_0_r <= ack1_0_s & ~ack1m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack1_1_r <= 1'b0; else ack1_1_r <= ack1_1_s & ~ack1m;


// edge:2 EB1.5
wire ack2m, req2m;
eb15_ctrl uctrl_2 (
    .t_0_req(req2), .t_0_ack(ack2),
    .i_0_req(req2m), .i_0_ack(ack2m),
    .en0(en2_0), .en1(en2_1), .sel(sel2),
    .clk(clk), .reset_n(reset_n)
);


// edge:2 fork
reg  ack2_0_r, ack2_1_r;
wire ack2_0_s, ack2_1_s;
assign req2_0 = req2m & ~ack2_0_r;
assign req2_1 = req2m & ~ack2_1_r;
assign ack2_0_s = ack2_0 | ~req2_0;
assign ack2_1_s = ack2_1 | ~req2_1;
assign ack2m = ack2_0_s & ack2_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack2_0_r <= 1'b0; else ack2_0_r <= ack2_0_s & ~ack2m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack2_1_r <= 1'b0; else ack2_1_r <= ack2_1_s & ~ack2m;


// edge:3 EB1.5
wire ack3m, req3m;
eb15_ctrl uctrl_3 (
    .t_0_req(req3), .t_0_ack(ack3),
    .i_0_req(req3m), .i_0_ack(ack3m),
    .en0(en3_0), .en1(en3_1), .sel(sel3),
    .clk(clk), .reset_n(reset_n)
);


// edge:3 fork
reg  ack3_0_r, ack3_1_r;
wire ack3_0_s, ack3_1_s;
assign req3_0 = req3m & ~ack3_0_r;
assign req3_1 = req3m & ~ack3_1_r;
assign ack3_0_s = ack3_0 | ~req3_0;
assign ack3_1_s = ack3_1 | ~req3_1;
assign ack3m = ack3_0_s & ack3_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack3_0_r <= 1'b0; else ack3_0_r <= ack3_0_s & ~ack3m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack3_1_r <= 1'b0; else ack3_1_r <= ack3_1_s & ~ack3m;


// edge:4 EB1.5
wire ack4m, req4m;
eb15_ctrl uctrl_4 (
    .t_0_req(req4), .t_0_ack(ack4),
    .i_0_req(req4m), .i_0_ack(ack4m),
    .en0(en4_0), .en1(en4_1), .sel(sel4),
    .clk(clk), .reset_n(reset_n)
);


// edge:4 fork
reg  ack4_0_r, ack4_1_r;
wire ack4_0_s, ack4_1_s;
assign req4_0 = req4m & ~ack4_0_r;
assign req4_1 = req4m & ~ack4_1_r;
assign ack4_0_s = ack4_0 | ~req4_0;
assign ack4_1_s = ack4_1 | ~req4_1;
assign ack4m = ack4_0_s & ack4_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack4_0_r <= 1'b0; else ack4_0_r <= ack4_0_s & ~ack4m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack4_1_r <= 1'b0; else ack4_1_r <= ack4_1_s & ~ack4m;


// edge:5 EB1.5
wire ack5m, req5m;
eb15_ctrl uctrl_5 (
    .t_0_req(req5), .t_0_ack(ack5),
    .i_0_req(req5m), .i_0_ack(ack5m),
    .en0(en5_0), .en1(en5_1), .sel(sel5),
    .clk(clk), .reset_n(reset_n)
);


// edge:5 fork
reg  ack5_0_r, ack5_1_r;
wire ack5_0_s, ack5_1_s;
assign req5_0 = req5m & ~ack5_0_r;
assign req5_1 = req5m & ~ack5_1_r;
assign ack5_0_s = ack5_0 | ~req5_0;
assign ack5_1_s = ack5_1 | ~req5_1;
assign ack5m = ack5_0_s & ack5_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack5_0_r <= 1'b0; else ack5_0_r <= ack5_0_s & ~ack5m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack5_1_r <= 1'b0; else ack5_1_r <= ack5_1_s & ~ack5m;


// edge:6 EB1.5
wire ack6m, req6m;
eb15_ctrl uctrl_6 (
    .t_0_req(req6), .t_0_ack(ack6),
    .i_0_req(req6m), .i_0_ack(ack6m),
    .en0(en6_0), .en1(en6_1), .sel(sel6),
    .clk(clk), .reset_n(reset_n)
);


// edge:6 fork
reg  ack6_0_r, ack6_1_r;
wire ack6_0_s, ack6_1_s;
assign req6_0 = req6m & ~ack6_0_r;
assign req6_1 = req6m & ~ack6_1_r;
assign ack6_0_s = ack6_0 | ~req6_0;
assign ack6_1_s = ack6_1 | ~req6_1;
assign ack6m = ack6_0_s & ack6_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack6_0_r <= 1'b0; else ack6_0_r <= ack6_0_s & ~ack6m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack6_1_r <= 1'b0; else ack6_1_r <= ack6_1_s & ~ack6m;


// edge:7 EB1.5
wire ack7m, req7m;
eb15_ctrl uctrl_7 (
    .t_0_req(req7), .t_0_ack(ack7),
    .i_0_req(req7m), .i_0_ack(ack7m),
    .en0(en7_0), .en1(en7_1), .sel(sel7),
    .clk(clk), .reset_n(reset_n)
);


// edge:7 fork
reg  ack7_0_r, ack7_1_r;
wire ack7_0_s, ack7_1_s;
assign req7_0 = req7m & ~ack7_0_r;
assign req7_1 = req7m & ~ack7_1_r;
assign ack7_0_s = ack7_0 | ~req7_0;
assign ack7_1_s = ack7_1 | ~req7_1;
assign ack7m = ack7_0_s & ack7_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack7_0_r <= 1'b0; else ack7_0_r <= ack7_0_s & ~ack7m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack7_1_r <= 1'b0; else ack7_1_r <= ack7_1_s & ~ack7m;


// edge:8 EB1.5
wire ack8m, req8m;
eb15_ctrl uctrl_8 (
    .t_0_req(req8), .t_0_ack(ack8),
    .i_0_req(req8m), .i_0_ack(ack8m),
    .en0(en8_0), .en1(en8_1), .sel(sel8),
    .clk(clk), .reset_n(reset_n)
);


// edge:8 fork


assign req8_0 = req8m;

assign ack8m = ack8_0;



// edge:9 EB1.5
wire ack9m, req9m;
eb15_ctrl uctrl_9 (
    .t_0_req(req9), .t_0_ack(ack9),
    .i_0_req(req9m), .i_0_ack(ack9m),
    .en0(en9_0), .en1(en9_1), .sel(sel9),
    .clk(clk), .reset_n(reset_n)
);


// edge:9 fork


assign req9_0 = req9m;

assign ack9m = ack9_0;



// edge:10 EB1.5
wire ack10m, req10m;
eb15_ctrl uctrl_10 (
    .t_0_req(req10), .t_0_ack(ack10),
    .i_0_req(req10m), .i_0_ack(ack10m),
    .en0(en10_0), .en1(en10_1), .sel(sel10),
    .clk(clk), .reset_n(reset_n)
);


// edge:10 fork
reg  ack10_0_r, ack10_1_r;
wire ack10_0_s, ack10_1_s;
assign req10_0 = req10m & ~ack10_0_r;
assign req10_1 = req10m & ~ack10_1_r;
assign ack10_0_s = ack10_0 | ~req10_0;
assign ack10_1_s = ack10_1 | ~req10_1;
assign ack10m = ack10_0_s & ack10_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack10_0_r <= 1'b0; else ack10_0_r <= ack10_0_s & ~ack10m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack10_1_r <= 1'b0; else ack10_1_r <= ack10_1_s & ~ack10m;


// edge:11 EB1.5
wire ack11m, req11m;
eb15_ctrl uctrl_11 (
    .t_0_req(req11), .t_0_ack(ack11),
    .i_0_req(req11m), .i_0_ack(ack11m),
    .en0(en11_0), .en1(en11_1), .sel(sel11),
    .clk(clk), .reset_n(reset_n)
);


// edge:11 fork


assign req11_0 = req11m;

assign ack11m = ack11_0;



// edge:12 EB1.5
wire ack12m, req12m;
eb15_ctrl uctrl_12 (
    .t_0_req(req12), .t_0_ack(ack12),
    .i_0_req(req12m), .i_0_ack(ack12m),
    .en0(en12_0), .en1(en12_1), .sel(sel12),
    .clk(clk), .reset_n(reset_n)
);


// edge:12 fork


assign req12_0 = req12m;

assign ack12m = ack12_0;



// edge:13 EB1.5
wire ack13m, req13m;
eb15_ctrl uctrl_13 (
    .t_0_req(req13), .t_0_ack(ack13),
    .i_0_req(req13m), .i_0_ack(ack13m),
    .en0(en13_0), .en1(en13_1), .sel(sel13),
    .clk(clk), .reset_n(reset_n)
);


// edge:13 fork
reg  ack13_0_r, ack13_1_r;
wire ack13_0_s, ack13_1_s;
assign req13_0 = req13m & ~ack13_0_r;
assign req13_1 = req13m & ~ack13_1_r;
assign ack13_0_s = ack13_0 | ~req13_0;
assign ack13_1_s = ack13_1 | ~req13_1;
assign ack13m = ack13_0_s & ack13_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack13_0_r <= 1'b0; else ack13_0_r <= ack13_0_s & ~ack13m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack13_1_r <= 1'b0; else ack13_1_r <= ack13_1_s & ~ack13m;


// edge:14 EB1.5
wire ack14m, req14m;
eb15_ctrl uctrl_14 (
    .t_0_req(req14), .t_0_ack(ack14),
    .i_0_req(req14m), .i_0_ack(ack14m),
    .en0(en14_0), .en1(en14_1), .sel(sel14),
    .clk(clk), .reset_n(reset_n)
);


// edge:14 fork


assign req14_0 = req14m;

assign ack14m = ack14_0;



// edge:15 EB1.5
wire ack15m, req15m;
eb15_ctrl uctrl_15 (
    .t_0_req(req15), .t_0_ack(ack15),
    .i_0_req(req15m), .i_0_ack(ack15m),
    .en0(en15_0), .en1(en15_1), .sel(sel15),
    .clk(clk), .reset_n(reset_n)
);


// edge:15 fork


assign req15_0 = req15m;

assign ack15m = ack15_0;



// edge:16 EB1.5
wire ack16m, req16m;
eb15_ctrl uctrl_16 (
    .t_0_req(req16), .t_0_ack(ack16),
    .i_0_req(req16m), .i_0_ack(ack16m),
    .en0(en16_0), .en1(en16_1), .sel(sel16),
    .clk(clk), .reset_n(reset_n)
);


// edge:16 fork
reg  ack16_0_r, ack16_1_r;
wire ack16_0_s, ack16_1_s;
assign req16_0 = req16m & ~ack16_0_r;
assign req16_1 = req16m & ~ack16_1_r;
assign ack16_0_s = ack16_0 | ~req16_0;
assign ack16_1_s = ack16_1 | ~req16_1;
assign ack16m = ack16_0_s & ack16_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack16_0_r <= 1'b0; else ack16_0_r <= ack16_0_s & ~ack16m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack16_1_r <= 1'b0; else ack16_1_r <= ack16_1_s & ~ack16m;


// edge:17 EB1.5
wire ack17m, req17m;
eb15_ctrl uctrl_17 (
    .t_0_req(req17), .t_0_ack(ack17),
    .i_0_req(req17m), .i_0_ack(ack17m),
    .en0(en17_0), .en1(en17_1), .sel(sel17),
    .clk(clk), .reset_n(reset_n)
);


// edge:17 fork


assign req17_0 = req17m;

assign ack17m = ack17_0;



// edge:18 EB1.5
wire ack18m, req18m;
eb15_ctrl uctrl_18 (
    .t_0_req(req18), .t_0_ack(ack18),
    .i_0_req(req18m), .i_0_ack(ack18m),
    .en0(en18_0), .en1(en18_1), .sel(sel18),
    .clk(clk), .reset_n(reset_n)
);


// edge:18 fork


assign req18_0 = req18m;

assign ack18m = ack18_0;



// edge:19 EB1.5
wire ack19m, req19m;
eb15_ctrl uctrl_19 (
    .t_0_req(req19), .t_0_ack(ack19),
    .i_0_req(req19m), .i_0_ack(ack19m),
    .en0(en19_0), .en1(en19_1), .sel(sel19),
    .clk(clk), .reset_n(reset_n)
);


// edge:19 fork
reg  ack19_0_r, ack19_1_r;
wire ack19_0_s, ack19_1_s;
assign req19_0 = req19m & ~ack19_0_r;
assign req19_1 = req19m & ~ack19_1_r;
assign ack19_0_s = ack19_0 | ~req19_0;
assign ack19_1_s = ack19_1 | ~req19_1;
assign ack19m = ack19_0_s & ack19_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack19_0_r <= 1'b0; else ack19_0_r <= ack19_0_s & ~ack19m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack19_1_r <= 1'b0; else ack19_1_r <= ack19_1_s & ~ack19m;


// edge:20 EB1.5
wire ack20m, req20m;
eb15_ctrl uctrl_20 (
    .t_0_req(req20), .t_0_ack(ack20),
    .i_0_req(req20m), .i_0_ack(ack20m),
    .en0(en20_0), .en1(en20_1), .sel(sel20),
    .clk(clk), .reset_n(reset_n)
);


// edge:20 fork


assign req20_0 = req20m;

assign ack20m = ack20_0;



// edge:21 EB1.5
wire ack21m, req21m;
eb15_ctrl uctrl_21 (
    .t_0_req(req21), .t_0_ack(ack21),
    .i_0_req(req21m), .i_0_ack(ack21m),
    .en0(en21_0), .en1(en21_1), .sel(sel21),
    .clk(clk), .reset_n(reset_n)
);


// edge:21 fork


assign req21_0 = req21m;

assign ack21m = ack21_0;



// edge:22 EB1.5
wire ack22m, req22m;
eb15_ctrl uctrl_22 (
    .t_0_req(req22), .t_0_ack(ack22),
    .i_0_req(req22m), .i_0_ack(ack22m),
    .en0(en22_0), .en1(en22_1), .sel(sel22),
    .clk(clk), .reset_n(reset_n)
);


// edge:22 fork
reg  ack22_0_r, ack22_1_r;
wire ack22_0_s, ack22_1_s;
assign req22_0 = req22m & ~ack22_0_r;
assign req22_1 = req22m & ~ack22_1_r;
assign ack22_0_s = ack22_0 | ~req22_0;
assign ack22_1_s = ack22_1 | ~req22_1;
assign ack22m = ack22_0_s & ack22_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack22_0_r <= 1'b0; else ack22_0_r <= ack22_0_s & ~ack22m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack22_1_r <= 1'b0; else ack22_1_r <= ack22_1_s & ~ack22m;


// edge:23 EB1.5
wire ack23m, req23m;
eb15_ctrl uctrl_23 (
    .t_0_req(req23), .t_0_ack(ack23),
    .i_0_req(req23m), .i_0_ack(ack23m),
    .en0(en23_0), .en1(en23_1), .sel(sel23),
    .clk(clk), .reset_n(reset_n)
);


// edge:23 fork


assign req23_0 = req23m;

assign ack23m = ack23_0;



// edge:24 EB1.5
wire ack24m, req24m;
eb15_ctrl uctrl_24 (
    .t_0_req(req24), .t_0_ack(ack24),
    .i_0_req(req24m), .i_0_ack(ack24m),
    .en0(en24_0), .en1(en24_1), .sel(sel24),
    .clk(clk), .reset_n(reset_n)
);


// edge:24 fork


assign req24_0 = req24m;

assign ack24m = ack24_0;



// edge:25 EB1.5
wire ack25m, req25m;
eb15_ctrl uctrl_25 (
    .t_0_req(req25), .t_0_ack(ack25),
    .i_0_req(req25m), .i_0_ack(ack25m),
    .en0(en25_0), .en1(en25_1), .sel(sel25),
    .clk(clk), .reset_n(reset_n)
);


// edge:25 fork
reg  ack25_0_r, ack25_1_r;
wire ack25_0_s, ack25_1_s;
assign req25_0 = req25m & ~ack25_0_r;
assign req25_1 = req25m & ~ack25_1_r;
assign ack25_0_s = ack25_0 | ~req25_0;
assign ack25_1_s = ack25_1 | ~req25_1;
assign ack25m = ack25_0_s & ack25_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack25_0_r <= 1'b0; else ack25_0_r <= ack25_0_s & ~ack25m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack25_1_r <= 1'b0; else ack25_1_r <= ack25_1_s & ~ack25m;


// edge:26 EB1.5
wire ack26m, req26m;
eb15_ctrl uctrl_26 (
    .t_0_req(req26), .t_0_ack(ack26),
    .i_0_req(req26m), .i_0_ack(ack26m),
    .en0(en26_0), .en1(en26_1), .sel(sel26),
    .clk(clk), .reset_n(reset_n)
);


// edge:26 fork


assign req26_0 = req26m;

assign ack26m = ack26_0;



// edge:27 EB1.5
wire ack27m, req27m;
eb15_ctrl uctrl_27 (
    .t_0_req(req27), .t_0_ack(ack27),
    .i_0_req(req27m), .i_0_ack(ack27m),
    .en0(en27_0), .en1(en27_1), .sel(sel27),
    .clk(clk), .reset_n(reset_n)
);


// edge:27 fork


assign req27_0 = req27m;

assign ack27m = ack27_0;



// edge:28 EB1.5
wire ack28m, req28m;
eb15_ctrl uctrl_28 (
    .t_0_req(req28), .t_0_ack(ack28),
    .i_0_req(req28m), .i_0_ack(ack28m),
    .en0(en28_0), .en1(en28_1), .sel(sel28),
    .clk(clk), .reset_n(reset_n)
);


// edge:28 fork
reg  ack28_0_r, ack28_1_r;
wire ack28_0_s, ack28_1_s;
assign req28_0 = req28m & ~ack28_0_r;
assign req28_1 = req28m & ~ack28_1_r;
assign ack28_0_s = ack28_0 | ~req28_0;
assign ack28_1_s = ack28_1 | ~req28_1;
assign ack28m = ack28_0_s & ack28_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack28_0_r <= 1'b0; else ack28_0_r <= ack28_0_s & ~ack28m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack28_1_r <= 1'b0; else ack28_1_r <= ack28_1_s & ~ack28m;


// edge:29 EB1.5
wire ack29m, req29m;
eb15_ctrl uctrl_29 (
    .t_0_req(req29), .t_0_ack(ack29),
    .i_0_req(req29m), .i_0_ack(ack29m),
    .en0(en29_0), .en1(en29_1), .sel(sel29),
    .clk(clk), .reset_n(reset_n)
);


// edge:29 fork


assign req29_0 = req29m;

assign ack29m = ack29_0;



// edge:30 EB1.5
wire ack30m, req30m;
eb15_ctrl uctrl_30 (
    .t_0_req(req30), .t_0_ack(ack30),
    .i_0_req(req30m), .i_0_ack(ack30m),
    .en0(en30_0), .en1(en30_1), .sel(sel30),
    .clk(clk), .reset_n(reset_n)
);


// edge:30 fork


assign req30_0 = req30m;

assign ack30m = ack30_0;



// edge:31 EB1.5
wire ack31m, req31m;
eb15_ctrl uctrl_31 (
    .t_0_req(req31), .t_0_ack(ack31),
    .i_0_req(req31m), .i_0_ack(ack31m),
    .en0(en31_0), .en1(en31_1), .sel(sel31),
    .clk(clk), .reset_n(reset_n)
);


// edge:31 fork


assign req31_0 = req31m;

assign ack31m = ack31_0;



// edge:32 EB1
wire ack32m;
reg req32m;
assign en32 = req32 & ack32;
assign ack32 = ~req32m | ack32m;
always @(posedge clk or negedge reset_n) if (~reset_n) req32m <= 1'b0; else req32m <= ~ack32 | req32;


// edge:32 fork


assign req32_0 = req32m;

assign ack32m = ack32_0;



// edge:33 EB1
wire ack33m;
reg req33m;
assign en33 = req33 & ack33;
assign ack33 = ~req33m | ack33m;
always @(posedge clk or negedge reset_n) if (~reset_n) req33m <= 1'b0; else req33m <= ~ack33 | req33;


// edge:33 fork


assign req33_0 = req33m;

assign ack33m = ack33_0;



// edge:34 EB0
wire ack34m, req34m;
assign req34m = req34;
assign ack34 = ack34m;


// edge:34 fork


assign req34_0 = req34m;

assign ack34m = ack34_0;



// edge:35 EB1
wire ack35m;
reg req35m;
assign en35 = req35 & ack35;
assign ack35 = ~req35m | ack35m;
always @(posedge clk or negedge reset_n) if (~reset_n) req35m <= 1'b0; else req35m <= ~ack35 | req35;


// edge:35 fork


assign req35_0 = req35m;

assign ack35m = ack35_0;



// edge:36 EB1.5
wire ack36m, req36m;
eb15_ctrl uctrl_36 (
    .t_0_req(req36), .t_0_ack(ack36),
    .i_0_req(req36m), .i_0_ack(ack36m),
    .en0(en36_0), .en1(en36_1), .sel(sel36),
    .clk(clk), .reset_n(reset_n)
);


// edge:36 fork


assign req36_0 = req36m;

assign ack36m = ack36_0;



// edge:37 EB1.5
wire ack37m, req37m;
eb15_ctrl uctrl_37 (
    .t_0_req(req37), .t_0_ack(ack37),
    .i_0_req(req37m), .i_0_ack(ack37m),
    .en0(en37_0), .en1(en37_1), .sel(sel37),
    .clk(clk), .reset_n(reset_n)
);


// edge:37 fork


assign req37_0 = req37m;

assign ack37m = ack37_0;



// edge:38 EB1.5
wire ack38m, req38m;
eb15_ctrl uctrl_38 (
    .t_0_req(req38), .t_0_ack(ack38),
    .i_0_req(req38m), .i_0_ack(ack38m),
    .en0(en38_0), .en1(en38_1), .sel(sel38),
    .clk(clk), .reset_n(reset_n)
);


// edge:38 fork


assign req38_0 = req38m;

assign ack38m = ack38_0;



// edge:39 EB1.5
wire ack39m, req39m;
eb15_ctrl uctrl_39 (
    .t_0_req(req39), .t_0_ack(ack39),
    .i_0_req(req39m), .i_0_ack(ack39m),
    .en0(en39_0), .en1(en39_1), .sel(sel39),
    .clk(clk), .reset_n(reset_n)
);


// edge:39 fork


assign req39_0 = req39m;

assign ack39m = ack39_0;



// edge:40 EB1
wire ack40m;
reg req40m;
assign en40 = req40 & ack40;
assign ack40 = ~req40m | ack40m;
always @(posedge clk or negedge reset_n) if (~reset_n) req40m <= 1'b0; else req40m <= ~ack40 | req40;


// edge:40 fork


assign req40_0 = req40m;

assign ack40m = ack40_0;



// edge:41 EB_FIFO
wire ack41m, req41m;
eb_fifo_ctrl #(
    .DEPTHMO(2'd3),
    .DEPTHLOG2MO(1)
) uctrl_41 (
    .t_0_req(req41), .t_0_ack(ack41),
    .i_0_req(req41m), .i_0_ack(ack41m),
    .wr_ptr(wr_ptr41),
    .rd_ptr(rd_ptr41),
    .wen(wen41),
    .ren(ren41),
    .clk(clk), .reset_n(reset_n)
);


// edge:41 fork


assign req41_0 = req41m;

assign ack41m = ack41_0;



// edge:42 EB1.5
wire ack42m, req42m;
eb15_ctrl uctrl_42 (
    .t_0_req(req42), .t_0_ack(ack42),
    .i_0_req(req42m), .i_0_ack(ack42m),
    .en0(en42_0), .en1(en42_1), .sel(sel42),
    .clk(clk), .reset_n(reset_n)
);


// edge:42 fork


assign req42_0 = req42m;

assign ack42m = ack42_0;



// edge:43 EB1
wire ack43m;
reg req43m;
assign en43 = req43 & ack43;
assign ack43 = ~req43m | ack43m;
always @(posedge clk or negedge reset_n) if (~reset_n) req43m <= 1'b0; else req43m <= ~ack43 | req43;


// edge:43 fork


assign req43_0 = req43m;

assign ack43m = ack43_0;



// edge:44 EB1
wire ack44m;
reg req44m;
assign en44 = req44 & ack44;
assign ack44 = ~req44m | ack44m;
always @(posedge clk or negedge reset_n) if (~reset_n) req44m <= 1'b0; else req44m <= ~ack44 | req44;


// edge:44 fork


assign req44_0 = req44m;

assign ack44m = ack44_0;



// edge:45 EB0
wire ack45m, req45m;
assign req45m = req45;
assign ack45 = ack45m;


// edge:45 fork
reg  ack45_0_r, ack45_1_r, ack45_2_r;
wire ack45_0_s, ack45_1_s, ack45_2_s;
assign req45_0 = req45m & ~ack45_0_r;
assign req45_1 = req45m & ~ack45_1_r;
assign req45_2 = req45m & ~ack45_2_r;
assign ack45_0_s = ack45_0 | ~req45_0;
assign ack45_1_s = ack45_1 | ~req45_1;
assign ack45_2_s = ack45_2 | ~req45_2;
assign ack45m = ack45_0_s & ack45_1_s & ack45_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack45_0_r <= 1'b0; else ack45_0_r <= ack45_0_s & ~ack45m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack45_1_r <= 1'b0; else ack45_1_r <= ack45_1_s & ~ack45m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack45_2_r <= 1'b0; else ack45_2_r <= ack45_2_s & ~ack45m;


// edge:46 EB0
wire ack46m, req46m;
assign req46m = req46;
assign ack46 = ack46m;


// edge:46 fork
reg  ack46_0_r, ack46_1_r, ack46_2_r;
wire ack46_0_s, ack46_1_s, ack46_2_s;
assign req46_0 = req46m & ~ack46_0_r;
assign req46_1 = req46m & ~ack46_1_r;
assign req46_2 = req46m & ~ack46_2_r;
assign ack46_0_s = ack46_0 | ~req46_0;
assign ack46_1_s = ack46_1 | ~req46_1;
assign ack46_2_s = ack46_2 | ~req46_2;
assign ack46m = ack46_0_s & ack46_1_s & ack46_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack46_0_r <= 1'b0; else ack46_0_r <= ack46_0_s & ~ack46m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack46_1_r <= 1'b0; else ack46_1_r <= ack46_1_s & ~ack46m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack46_2_r <= 1'b0; else ack46_2_r <= ack46_2_s & ~ack46m;


// edge:47 EB0
wire ack47m, req47m;
assign req47m = req47;
assign ack47 = ack47m;


// edge:47 fork
reg  ack47_0_r, ack47_1_r, ack47_2_r, ack47_3_r;
wire ack47_0_s, ack47_1_s, ack47_2_s, ack47_3_s;
assign req47_0 = req47m & ~ack47_0_r;
assign req47_1 = req47m & ~ack47_1_r;
assign req47_2 = req47m & ~ack47_2_r;
assign req47_3 = req47m & ~ack47_3_r;
assign ack47_0_s = ack47_0 | ~req47_0;
assign ack47_1_s = ack47_1 | ~req47_1;
assign ack47_2_s = ack47_2 | ~req47_2;
assign ack47_3_s = ack47_3 | ~req47_3;
assign ack47m = ack47_0_s & ack47_1_s & ack47_2_s & ack47_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack47_0_r <= 1'b0; else ack47_0_r <= ack47_0_s & ~ack47m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack47_1_r <= 1'b0; else ack47_1_r <= ack47_1_s & ~ack47m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack47_2_r <= 1'b0; else ack47_2_r <= ack47_2_s & ~ack47m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack47_3_r <= 1'b0; else ack47_3_r <= ack47_3_s & ~ack47m;


// edge:48 EB0
wire ack48m, req48m;
assign req48m = req48;
assign ack48 = ack48m;


// edge:48 fork
reg  ack48_0_r, ack48_1_r, ack48_2_r, ack48_3_r;
wire ack48_0_s, ack48_1_s, ack48_2_s, ack48_3_s;
assign req48_0 = req48m & ~ack48_0_r;
assign req48_1 = req48m & ~ack48_1_r;
assign req48_2 = req48m & ~ack48_2_r;
assign req48_3 = req48m & ~ack48_3_r;
assign ack48_0_s = ack48_0 | ~req48_0;
assign ack48_1_s = ack48_1 | ~req48_1;
assign ack48_2_s = ack48_2 | ~req48_2;
assign ack48_3_s = ack48_3 | ~req48_3;
assign ack48m = ack48_0_s & ack48_1_s & ack48_2_s & ack48_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack48_0_r <= 1'b0; else ack48_0_r <= ack48_0_s & ~ack48m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack48_1_r <= 1'b0; else ack48_1_r <= ack48_1_s & ~ack48m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack48_2_r <= 1'b0; else ack48_2_r <= ack48_2_s & ~ack48m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack48_3_r <= 1'b0; else ack48_3_r <= ack48_3_s & ~ack48m;


// edge:49 EB0
wire ack49m, req49m;
assign req49m = req49;
assign ack49 = ack49m;


// edge:49 fork
reg  ack49_0_r, ack49_1_r, ack49_2_r;
wire ack49_0_s, ack49_1_s, ack49_2_s;
assign req49_0 = req49m & ~ack49_0_r;
assign req49_1 = req49m & ~ack49_1_r;
assign req49_2 = req49m & ~ack49_2_r;
assign ack49_0_s = ack49_0 | ~req49_0;
assign ack49_1_s = ack49_1 | ~req49_1;
assign ack49_2_s = ack49_2 | ~req49_2;
assign ack49m = ack49_0_s & ack49_1_s & ack49_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack49_0_r <= 1'b0; else ack49_0_r <= ack49_0_s & ~ack49m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack49_1_r <= 1'b0; else ack49_1_r <= ack49_1_s & ~ack49m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack49_2_r <= 1'b0; else ack49_2_r <= ack49_2_s & ~ack49m;


// edge:50 EB0
wire ack50m, req50m;
assign req50m = req50;
assign ack50 = ack50m;


// edge:50 fork
reg  ack50_0_r, ack50_1_r, ack50_2_r;
wire ack50_0_s, ack50_1_s, ack50_2_s;
assign req50_0 = req50m & ~ack50_0_r;
assign req50_1 = req50m & ~ack50_1_r;
assign req50_2 = req50m & ~ack50_2_r;
assign ack50_0_s = ack50_0 | ~req50_0;
assign ack50_1_s = ack50_1 | ~req50_1;
assign ack50_2_s = ack50_2 | ~req50_2;
assign ack50m = ack50_0_s & ack50_1_s & ack50_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack50_0_r <= 1'b0; else ack50_0_r <= ack50_0_s & ~ack50m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack50_1_r <= 1'b0; else ack50_1_r <= ack50_1_s & ~ack50m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack50_2_r <= 1'b0; else ack50_2_r <= ack50_2_s & ~ack50m;


// edge:51 EB0
wire ack51m, req51m;
assign req51m = req51;
assign ack51 = ack51m;


// edge:51 fork
reg  ack51_0_r, ack51_1_r, ack51_2_r, ack51_3_r;
wire ack51_0_s, ack51_1_s, ack51_2_s, ack51_3_s;
assign req51_0 = req51m & ~ack51_0_r;
assign req51_1 = req51m & ~ack51_1_r;
assign req51_2 = req51m & ~ack51_2_r;
assign req51_3 = req51m & ~ack51_3_r;
assign ack51_0_s = ack51_0 | ~req51_0;
assign ack51_1_s = ack51_1 | ~req51_1;
assign ack51_2_s = ack51_2 | ~req51_2;
assign ack51_3_s = ack51_3 | ~req51_3;
assign ack51m = ack51_0_s & ack51_1_s & ack51_2_s & ack51_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack51_0_r <= 1'b0; else ack51_0_r <= ack51_0_s & ~ack51m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack51_1_r <= 1'b0; else ack51_1_r <= ack51_1_s & ~ack51m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack51_2_r <= 1'b0; else ack51_2_r <= ack51_2_s & ~ack51m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack51_3_r <= 1'b0; else ack51_3_r <= ack51_3_s & ~ack51m;


// edge:52 EB0
wire ack52m, req52m;
assign req52m = req52;
assign ack52 = ack52m;


// edge:52 fork
reg  ack52_0_r, ack52_1_r, ack52_2_r, ack52_3_r;
wire ack52_0_s, ack52_1_s, ack52_2_s, ack52_3_s;
assign req52_0 = req52m & ~ack52_0_r;
assign req52_1 = req52m & ~ack52_1_r;
assign req52_2 = req52m & ~ack52_2_r;
assign req52_3 = req52m & ~ack52_3_r;
assign ack52_0_s = ack52_0 | ~req52_0;
assign ack52_1_s = ack52_1 | ~req52_1;
assign ack52_2_s = ack52_2 | ~req52_2;
assign ack52_3_s = ack52_3 | ~req52_3;
assign ack52m = ack52_0_s & ack52_1_s & ack52_2_s & ack52_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack52_0_r <= 1'b0; else ack52_0_r <= ack52_0_s & ~ack52m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack52_1_r <= 1'b0; else ack52_1_r <= ack52_1_s & ~ack52m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack52_2_r <= 1'b0; else ack52_2_r <= ack52_2_s & ~ack52m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack52_3_r <= 1'b0; else ack52_3_r <= ack52_3_s & ~ack52m;


// edge:53 EB0
wire ack53m, req53m;
assign req53m = req53;
assign ack53 = ack53m;


// edge:53 fork
reg  ack53_0_r, ack53_1_r, ack53_2_r;
wire ack53_0_s, ack53_1_s, ack53_2_s;
assign req53_0 = req53m & ~ack53_0_r;
assign req53_1 = req53m & ~ack53_1_r;
assign req53_2 = req53m & ~ack53_2_r;
assign ack53_0_s = ack53_0 | ~req53_0;
assign ack53_1_s = ack53_1 | ~req53_1;
assign ack53_2_s = ack53_2 | ~req53_2;
assign ack53m = ack53_0_s & ack53_1_s & ack53_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack53_0_r <= 1'b0; else ack53_0_r <= ack53_0_s & ~ack53m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack53_1_r <= 1'b0; else ack53_1_r <= ack53_1_s & ~ack53m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack53_2_r <= 1'b0; else ack53_2_r <= ack53_2_s & ~ack53m;


// edge:54 EB0
wire ack54m, req54m;
assign req54m = req54;
assign ack54 = ack54m;


// edge:54 fork
reg  ack54_0_r, ack54_1_r, ack54_2_r;
wire ack54_0_s, ack54_1_s, ack54_2_s;
assign req54_0 = req54m & ~ack54_0_r;
assign req54_1 = req54m & ~ack54_1_r;
assign req54_2 = req54m & ~ack54_2_r;
assign ack54_0_s = ack54_0 | ~req54_0;
assign ack54_1_s = ack54_1 | ~req54_1;
assign ack54_2_s = ack54_2 | ~req54_2;
assign ack54m = ack54_0_s & ack54_1_s & ack54_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack54_0_r <= 1'b0; else ack54_0_r <= ack54_0_s & ~ack54m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack54_1_r <= 1'b0; else ack54_1_r <= ack54_1_s & ~ack54m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack54_2_r <= 1'b0; else ack54_2_r <= ack54_2_s & ~ack54m;


// edge:55 EB0
wire ack55m, req55m;
assign req55m = req55;
assign ack55 = ack55m;


// edge:55 fork
reg  ack55_0_r, ack55_1_r, ack55_2_r, ack55_3_r;
wire ack55_0_s, ack55_1_s, ack55_2_s, ack55_3_s;
assign req55_0 = req55m & ~ack55_0_r;
assign req55_1 = req55m & ~ack55_1_r;
assign req55_2 = req55m & ~ack55_2_r;
assign req55_3 = req55m & ~ack55_3_r;
assign ack55_0_s = ack55_0 | ~req55_0;
assign ack55_1_s = ack55_1 | ~req55_1;
assign ack55_2_s = ack55_2 | ~req55_2;
assign ack55_3_s = ack55_3 | ~req55_3;
assign ack55m = ack55_0_s & ack55_1_s & ack55_2_s & ack55_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack55_0_r <= 1'b0; else ack55_0_r <= ack55_0_s & ~ack55m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack55_1_r <= 1'b0; else ack55_1_r <= ack55_1_s & ~ack55m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack55_2_r <= 1'b0; else ack55_2_r <= ack55_2_s & ~ack55m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack55_3_r <= 1'b0; else ack55_3_r <= ack55_3_s & ~ack55m;


// edge:56 EB0
wire ack56m, req56m;
assign req56m = req56;
assign ack56 = ack56m;


// edge:56 fork
reg  ack56_0_r, ack56_1_r, ack56_2_r, ack56_3_r;
wire ack56_0_s, ack56_1_s, ack56_2_s, ack56_3_s;
assign req56_0 = req56m & ~ack56_0_r;
assign req56_1 = req56m & ~ack56_1_r;
assign req56_2 = req56m & ~ack56_2_r;
assign req56_3 = req56m & ~ack56_3_r;
assign ack56_0_s = ack56_0 | ~req56_0;
assign ack56_1_s = ack56_1 | ~req56_1;
assign ack56_2_s = ack56_2 | ~req56_2;
assign ack56_3_s = ack56_3 | ~req56_3;
assign ack56m = ack56_0_s & ack56_1_s & ack56_2_s & ack56_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack56_0_r <= 1'b0; else ack56_0_r <= ack56_0_s & ~ack56m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack56_1_r <= 1'b0; else ack56_1_r <= ack56_1_s & ~ack56m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack56_2_r <= 1'b0; else ack56_2_r <= ack56_2_s & ~ack56m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack56_3_r <= 1'b0; else ack56_3_r <= ack56_3_s & ~ack56m;


// edge:57 EB0
wire ack57m, req57m;
assign req57m = req57;
assign ack57 = ack57m;


// edge:57 fork
reg  ack57_0_r, ack57_1_r, ack57_2_r;
wire ack57_0_s, ack57_1_s, ack57_2_s;
assign req57_0 = req57m & ~ack57_0_r;
assign req57_1 = req57m & ~ack57_1_r;
assign req57_2 = req57m & ~ack57_2_r;
assign ack57_0_s = ack57_0 | ~req57_0;
assign ack57_1_s = ack57_1 | ~req57_1;
assign ack57_2_s = ack57_2 | ~req57_2;
assign ack57m = ack57_0_s & ack57_1_s & ack57_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack57_0_r <= 1'b0; else ack57_0_r <= ack57_0_s & ~ack57m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack57_1_r <= 1'b0; else ack57_1_r <= ack57_1_s & ~ack57m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack57_2_r <= 1'b0; else ack57_2_r <= ack57_2_s & ~ack57m;


// edge:58 EB0
wire ack58m, req58m;
assign req58m = req58;
assign ack58 = ack58m;


// edge:58 fork
reg  ack58_0_r, ack58_1_r, ack58_2_r;
wire ack58_0_s, ack58_1_s, ack58_2_s;
assign req58_0 = req58m & ~ack58_0_r;
assign req58_1 = req58m & ~ack58_1_r;
assign req58_2 = req58m & ~ack58_2_r;
assign ack58_0_s = ack58_0 | ~req58_0;
assign ack58_1_s = ack58_1 | ~req58_1;
assign ack58_2_s = ack58_2 | ~req58_2;
assign ack58m = ack58_0_s & ack58_1_s & ack58_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack58_0_r <= 1'b0; else ack58_0_r <= ack58_0_s & ~ack58m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack58_1_r <= 1'b0; else ack58_1_r <= ack58_1_s & ~ack58m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack58_2_r <= 1'b0; else ack58_2_r <= ack58_2_s & ~ack58m;


// edge:59 EB0
wire ack59m, req59m;
assign req59m = req59;
assign ack59 = ack59m;


// edge:59 fork
reg  ack59_0_r, ack59_1_r, ack59_2_r, ack59_3_r;
wire ack59_0_s, ack59_1_s, ack59_2_s, ack59_3_s;
assign req59_0 = req59m & ~ack59_0_r;
assign req59_1 = req59m & ~ack59_1_r;
assign req59_2 = req59m & ~ack59_2_r;
assign req59_3 = req59m & ~ack59_3_r;
assign ack59_0_s = ack59_0 | ~req59_0;
assign ack59_1_s = ack59_1 | ~req59_1;
assign ack59_2_s = ack59_2 | ~req59_2;
assign ack59_3_s = ack59_3 | ~req59_3;
assign ack59m = ack59_0_s & ack59_1_s & ack59_2_s & ack59_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack59_0_r <= 1'b0; else ack59_0_r <= ack59_0_s & ~ack59m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack59_1_r <= 1'b0; else ack59_1_r <= ack59_1_s & ~ack59m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack59_2_r <= 1'b0; else ack59_2_r <= ack59_2_s & ~ack59m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack59_3_r <= 1'b0; else ack59_3_r <= ack59_3_s & ~ack59m;


// edge:60 EB0
wire ack60m, req60m;
assign req60m = req60;
assign ack60 = ack60m;


// edge:60 fork
reg  ack60_0_r, ack60_1_r, ack60_2_r, ack60_3_r;
wire ack60_0_s, ack60_1_s, ack60_2_s, ack60_3_s;
assign req60_0 = req60m & ~ack60_0_r;
assign req60_1 = req60m & ~ack60_1_r;
assign req60_2 = req60m & ~ack60_2_r;
assign req60_3 = req60m & ~ack60_3_r;
assign ack60_0_s = ack60_0 | ~req60_0;
assign ack60_1_s = ack60_1 | ~req60_1;
assign ack60_2_s = ack60_2 | ~req60_2;
assign ack60_3_s = ack60_3 | ~req60_3;
assign ack60m = ack60_0_s & ack60_1_s & ack60_2_s & ack60_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack60_0_r <= 1'b0; else ack60_0_r <= ack60_0_s & ~ack60m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack60_1_r <= 1'b0; else ack60_1_r <= ack60_1_s & ~ack60m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack60_2_r <= 1'b0; else ack60_2_r <= ack60_2_s & ~ack60m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack60_3_r <= 1'b0; else ack60_3_r <= ack60_3_s & ~ack60m;


// edge:61 EB0
wire ack61m, req61m;
assign req61m = req61;
assign ack61 = ack61m;


// edge:61 fork


assign req61_0 = req61m;

assign ack61m = ack61_0;



// edge:62 EB0
wire ack62m, req62m;
assign req62m = req62;
assign ack62 = ack62m;


// edge:62 fork


assign req62_0 = req62m;

assign ack62m = ack62_0;



// edge:63 EB0
wire ack63m, req63m;
assign req63m = req63;
assign ack63 = ack63m;


// edge:63 fork


assign req63_0 = req63m;

assign ack63m = ack63_0;



// edge:64 EB0
wire ack64m, req64m;
assign req64m = req64;
assign ack64 = ack64m;


// edge:64 fork


assign req64_0 = req64m;

assign ack64m = ack64_0;



// edge:65 EB0
wire ack65m, req65m;
assign req65m = req65;
assign ack65 = ack65m;


// edge:65 fork


assign req65_0 = req65m;

assign ack65m = ack65_0;



// edge:66 EB0
wire ack66m, req66m;
assign req66m = req66;
assign ack66 = ack66m;


// edge:66 fork


assign req66_0 = req66m;

assign ack66m = ack66_0;



// edge:67 EB0
wire ack67m, req67m;
assign req67m = req67;
assign ack67 = ack67m;


// edge:67 fork


assign req67_0 = req67m;

assign ack67m = ack67_0;



// edge:68 EB0
wire ack68m, req68m;
assign req68m = req68;
assign ack68 = ack68m;


// edge:68 fork


assign req68_0 = req68m;

assign ack68m = ack68_0;



// edge:69 EB0
wire ack69m, req69m;
assign req69m = req69;
assign ack69 = ack69m;


// edge:69 fork


assign req69_0 = req69m;

assign ack69m = ack69_0;



// edge:70 EB0
wire ack70m, req70m;
assign req70m = req70;
assign ack70 = ack70m;


// edge:70 fork


assign req70_0 = req70m;

assign ack70m = ack70_0;



// edge:71 EB0
wire ack71m, req71m;
assign req71m = req71;
assign ack71 = ack71m;


// edge:71 fork


assign req71_0 = req71m;

assign ack71m = ack71_0;



// edge:72 EB0
wire ack72m, req72m;
assign req72m = req72;
assign ack72 = ack72m;


// edge:72 fork


assign req72_0 = req72m;

assign ack72m = ack72_0;



// edge:73 EB1.5
wire ack73m, req73m;
eb15_ctrl uctrl_73 (
    .t_0_req(req73), .t_0_ack(ack73),
    .i_0_req(req73m), .i_0_ack(ack73m),
    .en0(en73_0), .en1(en73_1), .sel(sel73),
    .clk(clk), .reset_n(reset_n)
);


// edge:73 fork


assign req73_0 = req73m;

assign ack73m = ack73_0;



// edge:74 EB1.5
wire ack74m, req74m;
eb15_ctrl uctrl_74 (
    .t_0_req(req74), .t_0_ack(ack74),
    .i_0_req(req74m), .i_0_ack(ack74m),
    .en0(en74_0), .en1(en74_1), .sel(sel74),
    .clk(clk), .reset_n(reset_n)
);


// edge:74 fork


assign req74_0 = req74m;

assign ack74m = ack74_0;



// edge:75 EB0
wire ack75m, req75m;
assign req75m = req75;
assign ack75 = ack75m;


// edge:75 fork


assign req75_0 = req75m;

assign ack75m = ack75_0;



// edge:76 EB0
wire ack76m, req76m;
assign req76m = req76;
assign ack76 = ack76m;


// edge:76 fork
reg  ack76_0_r, ack76_1_r, ack76_2_r;
wire ack76_0_s, ack76_1_s, ack76_2_s;
assign req76_0 = req76m & ~ack76_0_r;
assign req76_1 = req76m & ~ack76_1_r;
assign req76_2 = req76m & ~ack76_2_r;
assign ack76_0_s = ack76_0 | ~req76_0;
assign ack76_1_s = ack76_1 | ~req76_1;
assign ack76_2_s = ack76_2 | ~req76_2;
assign ack76m = ack76_0_s & ack76_1_s & ack76_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack76_0_r <= 1'b0; else ack76_0_r <= ack76_0_s & ~ack76m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack76_1_r <= 1'b0; else ack76_1_r <= ack76_1_s & ~ack76m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack76_2_r <= 1'b0; else ack76_2_r <= ack76_2_s & ~ack76m;


// edge:77 EB0
wire ack77m, req77m;
assign req77m = req77;
assign ack77 = ack77m;


// edge:77 fork


assign req77_0 = req77m;

assign ack77m = ack77_0;



// edge:78 EB0
wire ack78m, req78m;
assign req78m = req78;
assign ack78 = ack78m;


// edge:78 fork
reg  ack78_0_r, ack78_1_r, ack78_2_r;
wire ack78_0_s, ack78_1_s, ack78_2_s;
assign req78_0 = req78m & ~ack78_0_r;
assign req78_1 = req78m & ~ack78_1_r;
assign req78_2 = req78m & ~ack78_2_r;
assign ack78_0_s = ack78_0 | ~req78_0;
assign ack78_1_s = ack78_1 | ~req78_1;
assign ack78_2_s = ack78_2 | ~req78_2;
assign ack78m = ack78_0_s & ack78_1_s & ack78_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack78_0_r <= 1'b0; else ack78_0_r <= ack78_0_s & ~ack78m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack78_1_r <= 1'b0; else ack78_1_r <= ack78_1_s & ~ack78m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack78_2_r <= 1'b0; else ack78_2_r <= ack78_2_s & ~ack78m;


// edge:79 EB0
wire ack79m, req79m;
assign req79m = req79;
assign ack79 = ack79m;


// edge:79 fork


assign req79_0 = req79m;

assign ack79m = ack79_0;



// edge:80 EB0
wire ack80m, req80m;
assign req80m = req80;
assign ack80 = ack80m;


// edge:80 fork


assign req80_0 = req80m;

assign ack80m = ack80_0;



// edge:81 EB0
wire ack81m, req81m;
assign req81m = req81;
assign ack81 = ack81m;


// edge:81 fork


assign req81_0 = req81m;

assign ack81m = ack81_0;



// edge:82 EB0
wire ack82m, req82m;
assign req82m = req82;
assign ack82 = ack82m;


// edge:82 fork


assign req82_0 = req82m;

assign ack82m = ack82_0;



// edge:83 EB0
wire ack83m, req83m;
assign req83m = req83;
assign ack83 = ack83m;


// edge:83 fork


assign req83_0 = req83m;

assign ack83m = ack83_0;



// edge:84 EB0
wire ack84m, req84m;
assign req84m = req84;
assign ack84 = ack84m;


// edge:84 fork


assign req84_0 = req84m;

assign ack84m = ack84_0;



// edge:85 EB0
wire ack85m, req85m;
assign req85m = req85;
assign ack85 = ack85m;


// edge:85 fork


assign req85_0 = req85m;

assign ack85m = ack85_0;



// edge:86 EB0
wire ack86m, req86m;
assign req86m = req86;
assign ack86 = ack86m;


// edge:86 fork


assign req86_0 = req86m;

assign ack86m = ack86_0;



// edge:87 EB0
wire ack87m, req87m;
assign req87m = req87;
assign ack87 = ack87m;


// edge:87 fork


assign req87_0 = req87m;

assign ack87m = ack87_0;



// edge:88 EB0
wire ack88m, req88m;
assign req88m = req88;
assign ack88 = ack88m;


// edge:88 fork


assign req88_0 = req88m;

assign ack88m = ack88_0;



// edge:89 EB0
wire ack89m, req89m;
assign req89m = req89;
assign ack89 = ack89m;


// edge:89 fork


assign req89_0 = req89m;

assign ack89m = ack89_0;



// edge:90 EB0
wire ack90m, req90m;
assign req90m = req90;
assign ack90 = ack90m;


// edge:90 fork


assign req90_0 = req90m;

assign ack90m = ack90_0;



// edge:91 EB1.5
wire ack91m, req91m;
eb15_ctrl uctrl_91 (
    .t_0_req(req91), .t_0_ack(ack91),
    .i_0_req(req91m), .i_0_ack(ack91m),
    .en0(en91_0), .en1(en91_1), .sel(sel91),
    .clk(clk), .reset_n(reset_n)
);


// edge:91 fork


assign req91_0 = req91m;

assign ack91m = ack91_0;



// edge:92 EB1.5
wire ack92m, req92m;
eb15_ctrl uctrl_92 (
    .t_0_req(req92), .t_0_ack(ack92),
    .i_0_req(req92m), .i_0_ack(ack92m),
    .en0(en92_0), .en1(en92_1), .sel(sel92),
    .clk(clk), .reset_n(reset_n)
);


// edge:92 fork


assign req92_0 = req92m;

assign ack92m = ack92_0;



// edge:93 EB0
wire ack93m, req93m;
assign req93m = req93;
assign ack93 = ack93m;


// edge:93 fork


assign req93_0 = req93m;

assign ack93m = ack93_0;



// edge:94 EB0
wire ack94m, req94m;
assign req94m = req94;
assign ack94 = ack94m;


// edge:94 fork
reg  ack94_0_r, ack94_1_r, ack94_2_r;
wire ack94_0_s, ack94_1_s, ack94_2_s;
assign req94_0 = req94m & ~ack94_0_r;
assign req94_1 = req94m & ~ack94_1_r;
assign req94_2 = req94m & ~ack94_2_r;
assign ack94_0_s = ack94_0 | ~req94_0;
assign ack94_1_s = ack94_1 | ~req94_1;
assign ack94_2_s = ack94_2 | ~req94_2;
assign ack94m = ack94_0_s & ack94_1_s & ack94_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack94_0_r <= 1'b0; else ack94_0_r <= ack94_0_s & ~ack94m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack94_1_r <= 1'b0; else ack94_1_r <= ack94_1_s & ~ack94m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack94_2_r <= 1'b0; else ack94_2_r <= ack94_2_s & ~ack94m;


// edge:95 EB0
wire ack95m, req95m;
assign req95m = req95;
assign ack95 = ack95m;


// edge:95 fork


assign req95_0 = req95m;

assign ack95m = ack95_0;



// edge:96 EB0
wire ack96m, req96m;
assign req96m = req96;
assign ack96 = ack96m;


// edge:96 fork
reg  ack96_0_r, ack96_1_r, ack96_2_r;
wire ack96_0_s, ack96_1_s, ack96_2_s;
assign req96_0 = req96m & ~ack96_0_r;
assign req96_1 = req96m & ~ack96_1_r;
assign req96_2 = req96m & ~ack96_2_r;
assign ack96_0_s = ack96_0 | ~req96_0;
assign ack96_1_s = ack96_1 | ~req96_1;
assign ack96_2_s = ack96_2 | ~req96_2;
assign ack96m = ack96_0_s & ack96_1_s & ack96_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack96_0_r <= 1'b0; else ack96_0_r <= ack96_0_s & ~ack96m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack96_1_r <= 1'b0; else ack96_1_r <= ack96_1_s & ~ack96m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack96_2_r <= 1'b0; else ack96_2_r <= ack96_2_s & ~ack96m;


// edge:97 EB0
wire ack97m, req97m;
assign req97m = req97;
assign ack97 = ack97m;


// edge:97 fork


assign req97_0 = req97m;

assign ack97m = ack97_0;



// edge:98 EB0
wire ack98m, req98m;
assign req98m = req98;
assign ack98 = ack98m;


// edge:98 fork


assign req98_0 = req98m;

assign ack98m = ack98_0;



// edge:99 EB0
wire ack99m, req99m;
assign req99m = req99;
assign ack99 = ack99m;


// edge:99 fork


assign req99_0 = req99m;

assign ack99m = ack99_0;



// edge:100 EB0
wire ack100m, req100m;
assign req100m = req100;
assign ack100 = ack100m;


// edge:100 fork


assign req100_0 = req100m;

assign ack100m = ack100_0;



// edge:101 EB0
wire ack101m, req101m;
assign req101m = req101;
assign ack101 = ack101m;


// edge:101 fork


assign req101_0 = req101m;

assign ack101m = ack101_0;



// edge:102 EB0
wire ack102m, req102m;
assign req102m = req102;
assign ack102 = ack102m;


// edge:102 fork


assign req102_0 = req102m;

assign ack102m = ack102_0;



// edge:103 EB0
wire ack103m, req103m;
assign req103m = req103;
assign ack103 = ack103m;


// edge:103 fork


assign req103_0 = req103m;

assign ack103m = ack103_0;



// edge:104 EB0
wire ack104m, req104m;
assign req104m = req104;
assign ack104 = ack104m;


// edge:104 fork


assign req104_0 = req104m;

assign ack104m = ack104_0;



// edge:105 EB0
wire ack105m, req105m;
assign req105m = req105;
assign ack105 = ack105m;


// edge:105 fork


assign req105_0 = req105m;

assign ack105m = ack105_0;



// edge:106 EB0
wire ack106m, req106m;
assign req106m = req106;
assign ack106 = ack106m;


// edge:106 fork


assign req106_0 = req106m;

assign ack106m = ack106_0;



// edge:107 EB0
wire ack107m, req107m;
assign req107m = req107;
assign ack107 = ack107m;


// edge:107 fork


assign req107_0 = req107m;

assign ack107m = ack107_0;



// edge:108 EB0
wire ack108m, req108m;
assign req108m = req108;
assign ack108 = ack108m;


// edge:108 fork


assign req108_0 = req108m;

assign ack108m = ack108_0;



// edge:109 EB1.5
wire ack109m, req109m;
eb15_ctrl uctrl_109 (
    .t_0_req(req109), .t_0_ack(ack109),
    .i_0_req(req109m), .i_0_ack(ack109m),
    .en0(en109_0), .en1(en109_1), .sel(sel109),
    .clk(clk), .reset_n(reset_n)
);


// edge:109 fork


assign req109_0 = req109m;

assign ack109m = ack109_0;



// edge:110 EB1.5
wire ack110m, req110m;
eb15_ctrl uctrl_110 (
    .t_0_req(req110), .t_0_ack(ack110),
    .i_0_req(req110m), .i_0_ack(ack110m),
    .en0(en110_0), .en1(en110_1), .sel(sel110),
    .clk(clk), .reset_n(reset_n)
);


// edge:110 fork


assign req110_0 = req110m;

assign ack110m = ack110_0;



// edge:111 EB0
wire ack111m, req111m;
assign req111m = req111;
assign ack111 = ack111m;


// edge:111 fork


assign req111_0 = req111m;

assign ack111m = ack111_0;



// edge:112 EB0
wire ack112m, req112m;
assign req112m = req112;
assign ack112 = ack112m;


// edge:112 fork
reg  ack112_0_r, ack112_1_r, ack112_2_r;
wire ack112_0_s, ack112_1_s, ack112_2_s;
assign req112_0 = req112m & ~ack112_0_r;
assign req112_1 = req112m & ~ack112_1_r;
assign req112_2 = req112m & ~ack112_2_r;
assign ack112_0_s = ack112_0 | ~req112_0;
assign ack112_1_s = ack112_1 | ~req112_1;
assign ack112_2_s = ack112_2 | ~req112_2;
assign ack112m = ack112_0_s & ack112_1_s & ack112_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack112_0_r <= 1'b0; else ack112_0_r <= ack112_0_s & ~ack112m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack112_1_r <= 1'b0; else ack112_1_r <= ack112_1_s & ~ack112m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack112_2_r <= 1'b0; else ack112_2_r <= ack112_2_s & ~ack112m;


// edge:113 EB0
wire ack113m, req113m;
assign req113m = req113;
assign ack113 = ack113m;


// edge:113 fork


assign req113_0 = req113m;

assign ack113m = ack113_0;



// edge:114 EB0
wire ack114m, req114m;
assign req114m = req114;
assign ack114 = ack114m;


// edge:114 fork
reg  ack114_0_r, ack114_1_r, ack114_2_r;
wire ack114_0_s, ack114_1_s, ack114_2_s;
assign req114_0 = req114m & ~ack114_0_r;
assign req114_1 = req114m & ~ack114_1_r;
assign req114_2 = req114m & ~ack114_2_r;
assign ack114_0_s = ack114_0 | ~req114_0;
assign ack114_1_s = ack114_1 | ~req114_1;
assign ack114_2_s = ack114_2 | ~req114_2;
assign ack114m = ack114_0_s & ack114_1_s & ack114_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack114_0_r <= 1'b0; else ack114_0_r <= ack114_0_s & ~ack114m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack114_1_r <= 1'b0; else ack114_1_r <= ack114_1_s & ~ack114m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack114_2_r <= 1'b0; else ack114_2_r <= ack114_2_s & ~ack114m;


// edge:115 EB0
wire ack115m, req115m;
assign req115m = req115;
assign ack115 = ack115m;


// edge:115 fork


assign req115_0 = req115m;

assign ack115m = ack115_0;



// edge:116 EB0
wire ack116m, req116m;
assign req116m = req116;
assign ack116 = ack116m;


// edge:116 fork


assign req116_0 = req116m;

assign ack116m = ack116_0;



// edge:117 EB0
wire ack117m, req117m;
assign req117m = req117;
assign ack117 = ack117m;


// edge:117 fork


assign req117_0 = req117m;

assign ack117m = ack117_0;



// edge:118 EB0
wire ack118m, req118m;
assign req118m = req118;
assign ack118 = ack118m;


// edge:118 fork


assign req118_0 = req118m;

assign ack118m = ack118_0;



// edge:119 EB0
wire ack119m, req119m;
assign req119m = req119;
assign ack119 = ack119m;


// edge:119 fork


assign req119_0 = req119m;

assign ack119m = ack119_0;



// edge:120 EB0
wire ack120m, req120m;
assign req120m = req120;
assign ack120 = ack120m;


// edge:120 fork


assign req120_0 = req120m;

assign ack120m = ack120_0;



// edge:121 EB0
wire ack121m, req121m;
assign req121m = req121;
assign ack121 = ack121m;


// edge:121 fork


assign req121_0 = req121m;

assign ack121m = ack121_0;



// edge:122 EB0
wire ack122m, req122m;
assign req122m = req122;
assign ack122 = ack122m;


// edge:122 fork


assign req122_0 = req122m;

assign ack122m = ack122_0;



// edge:123 EB0
wire ack123m, req123m;
assign req123m = req123;
assign ack123 = ack123m;


// edge:123 fork


assign req123_0 = req123m;

assign ack123m = ack123_0;



// edge:124 EB0
wire ack124m, req124m;
assign req124m = req124;
assign ack124 = ack124m;


// edge:124 fork


assign req124_0 = req124m;

assign ack124m = ack124_0;



// edge:125 EB0
wire ack125m, req125m;
assign req125m = req125;
assign ack125 = ack125m;


// edge:125 fork


assign req125_0 = req125m;

assign ack125m = ack125_0;



// edge:126 EB0
wire ack126m, req126m;
assign req126m = req126;
assign ack126 = ack126m;


// edge:126 fork


assign req126_0 = req126m;

assign ack126m = ack126_0;



// edge:127 EB1.5
wire ack127m, req127m;
eb15_ctrl uctrl_127 (
    .t_0_req(req127), .t_0_ack(ack127),
    .i_0_req(req127m), .i_0_ack(ack127m),
    .en0(en127_0), .en1(en127_1), .sel(sel127),
    .clk(clk), .reset_n(reset_n)
);


// edge:127 fork


assign req127_0 = req127m;

assign ack127m = ack127_0;



// edge:128 EB1.5
wire ack128m, req128m;
eb15_ctrl uctrl_128 (
    .t_0_req(req128), .t_0_ack(ack128),
    .i_0_req(req128m), .i_0_ack(ack128m),
    .en0(en128_0), .en1(en128_1), .sel(sel128),
    .clk(clk), .reset_n(reset_n)
);


// edge:128 fork


assign req128_0 = req128m;

assign ack128m = ack128_0;



// edge:129 EB0
wire ack129m, req129m;
assign req129m = req129;
assign ack129 = ack129m;


// edge:129 fork


assign req129_0 = req129m;

assign ack129m = ack129_0;



// edge:130 EB0
wire ack130m, req130m;
assign req130m = req130;
assign ack130 = ack130m;


// edge:130 fork
reg  ack130_0_r, ack130_1_r, ack130_2_r;
wire ack130_0_s, ack130_1_s, ack130_2_s;
assign req130_0 = req130m & ~ack130_0_r;
assign req130_1 = req130m & ~ack130_1_r;
assign req130_2 = req130m & ~ack130_2_r;
assign ack130_0_s = ack130_0 | ~req130_0;
assign ack130_1_s = ack130_1 | ~req130_1;
assign ack130_2_s = ack130_2 | ~req130_2;
assign ack130m = ack130_0_s & ack130_1_s & ack130_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack130_0_r <= 1'b0; else ack130_0_r <= ack130_0_s & ~ack130m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack130_1_r <= 1'b0; else ack130_1_r <= ack130_1_s & ~ack130m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack130_2_r <= 1'b0; else ack130_2_r <= ack130_2_s & ~ack130m;


// edge:131 EB0
wire ack131m, req131m;
assign req131m = req131;
assign ack131 = ack131m;


// edge:131 fork


assign req131_0 = req131m;

assign ack131m = ack131_0;



// edge:132 EB0
wire ack132m, req132m;
assign req132m = req132;
assign ack132 = ack132m;


// edge:132 fork
reg  ack132_0_r, ack132_1_r, ack132_2_r;
wire ack132_0_s, ack132_1_s, ack132_2_s;
assign req132_0 = req132m & ~ack132_0_r;
assign req132_1 = req132m & ~ack132_1_r;
assign req132_2 = req132m & ~ack132_2_r;
assign ack132_0_s = ack132_0 | ~req132_0;
assign ack132_1_s = ack132_1 | ~req132_1;
assign ack132_2_s = ack132_2 | ~req132_2;
assign ack132m = ack132_0_s & ack132_1_s & ack132_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack132_0_r <= 1'b0; else ack132_0_r <= ack132_0_s & ~ack132m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack132_1_r <= 1'b0; else ack132_1_r <= ack132_1_s & ~ack132m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack132_2_r <= 1'b0; else ack132_2_r <= ack132_2_s & ~ack132m;


// edge:133 EB1
wire ack133m;
reg req133m;
assign en133 = req133 & ack133;
assign ack133 = ~req133m | ack133m;
always @(posedge clk or negedge reset_n) if (~reset_n) req133m <= 1'b0; else req133m <= ~ack133 | req133;


// edge:133 fork


assign req133_0 = req133m;

assign ack133m = ack133_0;



// edge:134 EB1
wire ack134m;
reg req134m;
assign en134 = req134 & ack134;
assign ack134 = ~req134m | ack134m;
always @(posedge clk or negedge reset_n) if (~reset_n) req134m <= 1'b0; else req134m <= ~ack134 | req134;


// edge:134 fork


assign req134_0 = req134m;

assign ack134m = ack134_0;



// edge:135 EB0
wire ack135m, req135m;
assign req135m = req135;
assign ack135 = ack135m;


// edge:135 fork
reg  ack135_0_r, ack135_1_r, ack135_2_r;
wire ack135_0_s, ack135_1_s, ack135_2_s;
assign req135_0 = req135m & ~ack135_0_r;
assign req135_1 = req135m & ~ack135_1_r;
assign req135_2 = req135m & ~ack135_2_r;
assign ack135_0_s = ack135_0 | ~req135_0;
assign ack135_1_s = ack135_1 | ~req135_1;
assign ack135_2_s = ack135_2 | ~req135_2;
assign ack135m = ack135_0_s & ack135_1_s & ack135_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack135_0_r <= 1'b0; else ack135_0_r <= ack135_0_s & ~ack135m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack135_1_r <= 1'b0; else ack135_1_r <= ack135_1_s & ~ack135m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack135_2_r <= 1'b0; else ack135_2_r <= ack135_2_s & ~ack135m;


// edge:136 EB0
wire ack136m, req136m;
assign req136m = req136;
assign ack136 = ack136m;


// edge:136 fork
reg  ack136_0_r, ack136_1_r, ack136_2_r;
wire ack136_0_s, ack136_1_s, ack136_2_s;
assign req136_0 = req136m & ~ack136_0_r;
assign req136_1 = req136m & ~ack136_1_r;
assign req136_2 = req136m & ~ack136_2_r;
assign ack136_0_s = ack136_0 | ~req136_0;
assign ack136_1_s = ack136_1 | ~req136_1;
assign ack136_2_s = ack136_2 | ~req136_2;
assign ack136m = ack136_0_s & ack136_1_s & ack136_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack136_0_r <= 1'b0; else ack136_0_r <= ack136_0_s & ~ack136m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack136_1_r <= 1'b0; else ack136_1_r <= ack136_1_s & ~ack136m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack136_2_r <= 1'b0; else ack136_2_r <= ack136_2_s & ~ack136m;


// edge:137 EB0
wire ack137m, req137m;
assign req137m = req137;
assign ack137 = ack137m;


// edge:137 fork
reg  ack137_0_r, ack137_1_r, ack137_2_r, ack137_3_r;
wire ack137_0_s, ack137_1_s, ack137_2_s, ack137_3_s;
assign req137_0 = req137m & ~ack137_0_r;
assign req137_1 = req137m & ~ack137_1_r;
assign req137_2 = req137m & ~ack137_2_r;
assign req137_3 = req137m & ~ack137_3_r;
assign ack137_0_s = ack137_0 | ~req137_0;
assign ack137_1_s = ack137_1 | ~req137_1;
assign ack137_2_s = ack137_2 | ~req137_2;
assign ack137_3_s = ack137_3 | ~req137_3;
assign ack137m = ack137_0_s & ack137_1_s & ack137_2_s & ack137_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack137_0_r <= 1'b0; else ack137_0_r <= ack137_0_s & ~ack137m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack137_1_r <= 1'b0; else ack137_1_r <= ack137_1_s & ~ack137m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack137_2_r <= 1'b0; else ack137_2_r <= ack137_2_s & ~ack137m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack137_3_r <= 1'b0; else ack137_3_r <= ack137_3_s & ~ack137m;


// edge:138 EB0
wire ack138m, req138m;
assign req138m = req138;
assign ack138 = ack138m;


// edge:138 fork
reg  ack138_0_r, ack138_1_r, ack138_2_r, ack138_3_r;
wire ack138_0_s, ack138_1_s, ack138_2_s, ack138_3_s;
assign req138_0 = req138m & ~ack138_0_r;
assign req138_1 = req138m & ~ack138_1_r;
assign req138_2 = req138m & ~ack138_2_r;
assign req138_3 = req138m & ~ack138_3_r;
assign ack138_0_s = ack138_0 | ~req138_0;
assign ack138_1_s = ack138_1 | ~req138_1;
assign ack138_2_s = ack138_2 | ~req138_2;
assign ack138_3_s = ack138_3 | ~req138_3;
assign ack138m = ack138_0_s & ack138_1_s & ack138_2_s & ack138_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack138_0_r <= 1'b0; else ack138_0_r <= ack138_0_s & ~ack138m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack138_1_r <= 1'b0; else ack138_1_r <= ack138_1_s & ~ack138m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack138_2_r <= 1'b0; else ack138_2_r <= ack138_2_s & ~ack138m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack138_3_r <= 1'b0; else ack138_3_r <= ack138_3_s & ~ack138m;


// edge:139 EB0
wire ack139m, req139m;
assign req139m = req139;
assign ack139 = ack139m;


// edge:139 fork
reg  ack139_0_r, ack139_1_r, ack139_2_r;
wire ack139_0_s, ack139_1_s, ack139_2_s;
assign req139_0 = req139m & ~ack139_0_r;
assign req139_1 = req139m & ~ack139_1_r;
assign req139_2 = req139m & ~ack139_2_r;
assign ack139_0_s = ack139_0 | ~req139_0;
assign ack139_1_s = ack139_1 | ~req139_1;
assign ack139_2_s = ack139_2 | ~req139_2;
assign ack139m = ack139_0_s & ack139_1_s & ack139_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack139_0_r <= 1'b0; else ack139_0_r <= ack139_0_s & ~ack139m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack139_1_r <= 1'b0; else ack139_1_r <= ack139_1_s & ~ack139m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack139_2_r <= 1'b0; else ack139_2_r <= ack139_2_s & ~ack139m;


// edge:140 EB0
wire ack140m, req140m;
assign req140m = req140;
assign ack140 = ack140m;


// edge:140 fork
reg  ack140_0_r, ack140_1_r, ack140_2_r;
wire ack140_0_s, ack140_1_s, ack140_2_s;
assign req140_0 = req140m & ~ack140_0_r;
assign req140_1 = req140m & ~ack140_1_r;
assign req140_2 = req140m & ~ack140_2_r;
assign ack140_0_s = ack140_0 | ~req140_0;
assign ack140_1_s = ack140_1 | ~req140_1;
assign ack140_2_s = ack140_2 | ~req140_2;
assign ack140m = ack140_0_s & ack140_1_s & ack140_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack140_0_r <= 1'b0; else ack140_0_r <= ack140_0_s & ~ack140m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack140_1_r <= 1'b0; else ack140_1_r <= ack140_1_s & ~ack140m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack140_2_r <= 1'b0; else ack140_2_r <= ack140_2_s & ~ack140m;


// edge:141 EB0
wire ack141m, req141m;
assign req141m = req141;
assign ack141 = ack141m;


// edge:141 fork
reg  ack141_0_r, ack141_1_r, ack141_2_r, ack141_3_r;
wire ack141_0_s, ack141_1_s, ack141_2_s, ack141_3_s;
assign req141_0 = req141m & ~ack141_0_r;
assign req141_1 = req141m & ~ack141_1_r;
assign req141_2 = req141m & ~ack141_2_r;
assign req141_3 = req141m & ~ack141_3_r;
assign ack141_0_s = ack141_0 | ~req141_0;
assign ack141_1_s = ack141_1 | ~req141_1;
assign ack141_2_s = ack141_2 | ~req141_2;
assign ack141_3_s = ack141_3 | ~req141_3;
assign ack141m = ack141_0_s & ack141_1_s & ack141_2_s & ack141_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack141_0_r <= 1'b0; else ack141_0_r <= ack141_0_s & ~ack141m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack141_1_r <= 1'b0; else ack141_1_r <= ack141_1_s & ~ack141m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack141_2_r <= 1'b0; else ack141_2_r <= ack141_2_s & ~ack141m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack141_3_r <= 1'b0; else ack141_3_r <= ack141_3_s & ~ack141m;


// edge:142 EB0
wire ack142m, req142m;
assign req142m = req142;
assign ack142 = ack142m;


// edge:142 fork
reg  ack142_0_r, ack142_1_r, ack142_2_r, ack142_3_r;
wire ack142_0_s, ack142_1_s, ack142_2_s, ack142_3_s;
assign req142_0 = req142m & ~ack142_0_r;
assign req142_1 = req142m & ~ack142_1_r;
assign req142_2 = req142m & ~ack142_2_r;
assign req142_3 = req142m & ~ack142_3_r;
assign ack142_0_s = ack142_0 | ~req142_0;
assign ack142_1_s = ack142_1 | ~req142_1;
assign ack142_2_s = ack142_2 | ~req142_2;
assign ack142_3_s = ack142_3 | ~req142_3;
assign ack142m = ack142_0_s & ack142_1_s & ack142_2_s & ack142_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack142_0_r <= 1'b0; else ack142_0_r <= ack142_0_s & ~ack142m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack142_1_r <= 1'b0; else ack142_1_r <= ack142_1_s & ~ack142m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack142_2_r <= 1'b0; else ack142_2_r <= ack142_2_s & ~ack142m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack142_3_r <= 1'b0; else ack142_3_r <= ack142_3_s & ~ack142m;


// edge:143 EB0
wire ack143m, req143m;
assign req143m = req143;
assign ack143 = ack143m;


// edge:143 fork
reg  ack143_0_r, ack143_1_r, ack143_2_r;
wire ack143_0_s, ack143_1_s, ack143_2_s;
assign req143_0 = req143m & ~ack143_0_r;
assign req143_1 = req143m & ~ack143_1_r;
assign req143_2 = req143m & ~ack143_2_r;
assign ack143_0_s = ack143_0 | ~req143_0;
assign ack143_1_s = ack143_1 | ~req143_1;
assign ack143_2_s = ack143_2 | ~req143_2;
assign ack143m = ack143_0_s & ack143_1_s & ack143_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack143_0_r <= 1'b0; else ack143_0_r <= ack143_0_s & ~ack143m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack143_1_r <= 1'b0; else ack143_1_r <= ack143_1_s & ~ack143m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack143_2_r <= 1'b0; else ack143_2_r <= ack143_2_s & ~ack143m;


// edge:144 EB0
wire ack144m, req144m;
assign req144m = req144;
assign ack144 = ack144m;


// edge:144 fork
reg  ack144_0_r, ack144_1_r, ack144_2_r;
wire ack144_0_s, ack144_1_s, ack144_2_s;
assign req144_0 = req144m & ~ack144_0_r;
assign req144_1 = req144m & ~ack144_1_r;
assign req144_2 = req144m & ~ack144_2_r;
assign ack144_0_s = ack144_0 | ~req144_0;
assign ack144_1_s = ack144_1 | ~req144_1;
assign ack144_2_s = ack144_2 | ~req144_2;
assign ack144m = ack144_0_s & ack144_1_s & ack144_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack144_0_r <= 1'b0; else ack144_0_r <= ack144_0_s & ~ack144m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack144_1_r <= 1'b0; else ack144_1_r <= ack144_1_s & ~ack144m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack144_2_r <= 1'b0; else ack144_2_r <= ack144_2_s & ~ack144m;


// edge:145 EB0
wire ack145m, req145m;
assign req145m = req145;
assign ack145 = ack145m;


// edge:145 fork
reg  ack145_0_r, ack145_1_r, ack145_2_r, ack145_3_r;
wire ack145_0_s, ack145_1_s, ack145_2_s, ack145_3_s;
assign req145_0 = req145m & ~ack145_0_r;
assign req145_1 = req145m & ~ack145_1_r;
assign req145_2 = req145m & ~ack145_2_r;
assign req145_3 = req145m & ~ack145_3_r;
assign ack145_0_s = ack145_0 | ~req145_0;
assign ack145_1_s = ack145_1 | ~req145_1;
assign ack145_2_s = ack145_2 | ~req145_2;
assign ack145_3_s = ack145_3 | ~req145_3;
assign ack145m = ack145_0_s & ack145_1_s & ack145_2_s & ack145_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack145_0_r <= 1'b0; else ack145_0_r <= ack145_0_s & ~ack145m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack145_1_r <= 1'b0; else ack145_1_r <= ack145_1_s & ~ack145m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack145_2_r <= 1'b0; else ack145_2_r <= ack145_2_s & ~ack145m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack145_3_r <= 1'b0; else ack145_3_r <= ack145_3_s & ~ack145m;


// edge:146 EB0
wire ack146m, req146m;
assign req146m = req146;
assign ack146 = ack146m;


// edge:146 fork
reg  ack146_0_r, ack146_1_r, ack146_2_r, ack146_3_r;
wire ack146_0_s, ack146_1_s, ack146_2_s, ack146_3_s;
assign req146_0 = req146m & ~ack146_0_r;
assign req146_1 = req146m & ~ack146_1_r;
assign req146_2 = req146m & ~ack146_2_r;
assign req146_3 = req146m & ~ack146_3_r;
assign ack146_0_s = ack146_0 | ~req146_0;
assign ack146_1_s = ack146_1 | ~req146_1;
assign ack146_2_s = ack146_2 | ~req146_2;
assign ack146_3_s = ack146_3 | ~req146_3;
assign ack146m = ack146_0_s & ack146_1_s & ack146_2_s & ack146_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack146_0_r <= 1'b0; else ack146_0_r <= ack146_0_s & ~ack146m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack146_1_r <= 1'b0; else ack146_1_r <= ack146_1_s & ~ack146m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack146_2_r <= 1'b0; else ack146_2_r <= ack146_2_s & ~ack146m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack146_3_r <= 1'b0; else ack146_3_r <= ack146_3_s & ~ack146m;


// edge:147 EB0
wire ack147m, req147m;
assign req147m = req147;
assign ack147 = ack147m;


// edge:147 fork
reg  ack147_0_r, ack147_1_r, ack147_2_r;
wire ack147_0_s, ack147_1_s, ack147_2_s;
assign req147_0 = req147m & ~ack147_0_r;
assign req147_1 = req147m & ~ack147_1_r;
assign req147_2 = req147m & ~ack147_2_r;
assign ack147_0_s = ack147_0 | ~req147_0;
assign ack147_1_s = ack147_1 | ~req147_1;
assign ack147_2_s = ack147_2 | ~req147_2;
assign ack147m = ack147_0_s & ack147_1_s & ack147_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack147_0_r <= 1'b0; else ack147_0_r <= ack147_0_s & ~ack147m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack147_1_r <= 1'b0; else ack147_1_r <= ack147_1_s & ~ack147m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack147_2_r <= 1'b0; else ack147_2_r <= ack147_2_s & ~ack147m;


// edge:148 EB0
wire ack148m, req148m;
assign req148m = req148;
assign ack148 = ack148m;


// edge:148 fork
reg  ack148_0_r, ack148_1_r, ack148_2_r;
wire ack148_0_s, ack148_1_s, ack148_2_s;
assign req148_0 = req148m & ~ack148_0_r;
assign req148_1 = req148m & ~ack148_1_r;
assign req148_2 = req148m & ~ack148_2_r;
assign ack148_0_s = ack148_0 | ~req148_0;
assign ack148_1_s = ack148_1 | ~req148_1;
assign ack148_2_s = ack148_2 | ~req148_2;
assign ack148m = ack148_0_s & ack148_1_s & ack148_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack148_0_r <= 1'b0; else ack148_0_r <= ack148_0_s & ~ack148m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack148_1_r <= 1'b0; else ack148_1_r <= ack148_1_s & ~ack148m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack148_2_r <= 1'b0; else ack148_2_r <= ack148_2_s & ~ack148m;


// edge:149 EB0
wire ack149m, req149m;
assign req149m = req149;
assign ack149 = ack149m;


// edge:149 fork
reg  ack149_0_r, ack149_1_r, ack149_2_r, ack149_3_r;
wire ack149_0_s, ack149_1_s, ack149_2_s, ack149_3_s;
assign req149_0 = req149m & ~ack149_0_r;
assign req149_1 = req149m & ~ack149_1_r;
assign req149_2 = req149m & ~ack149_2_r;
assign req149_3 = req149m & ~ack149_3_r;
assign ack149_0_s = ack149_0 | ~req149_0;
assign ack149_1_s = ack149_1 | ~req149_1;
assign ack149_2_s = ack149_2 | ~req149_2;
assign ack149_3_s = ack149_3 | ~req149_3;
assign ack149m = ack149_0_s & ack149_1_s & ack149_2_s & ack149_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack149_0_r <= 1'b0; else ack149_0_r <= ack149_0_s & ~ack149m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack149_1_r <= 1'b0; else ack149_1_r <= ack149_1_s & ~ack149m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack149_2_r <= 1'b0; else ack149_2_r <= ack149_2_s & ~ack149m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack149_3_r <= 1'b0; else ack149_3_r <= ack149_3_s & ~ack149m;


// edge:150 EB0
wire ack150m, req150m;
assign req150m = req150;
assign ack150 = ack150m;


// edge:150 fork
reg  ack150_0_r, ack150_1_r, ack150_2_r, ack150_3_r;
wire ack150_0_s, ack150_1_s, ack150_2_s, ack150_3_s;
assign req150_0 = req150m & ~ack150_0_r;
assign req150_1 = req150m & ~ack150_1_r;
assign req150_2 = req150m & ~ack150_2_r;
assign req150_3 = req150m & ~ack150_3_r;
assign ack150_0_s = ack150_0 | ~req150_0;
assign ack150_1_s = ack150_1 | ~req150_1;
assign ack150_2_s = ack150_2 | ~req150_2;
assign ack150_3_s = ack150_3 | ~req150_3;
assign ack150m = ack150_0_s & ack150_1_s & ack150_2_s & ack150_3_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack150_0_r <= 1'b0; else ack150_0_r <= ack150_0_s & ~ack150m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack150_1_r <= 1'b0; else ack150_1_r <= ack150_1_s & ~ack150m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack150_2_r <= 1'b0; else ack150_2_r <= ack150_2_s & ~ack150m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack150_3_r <= 1'b0; else ack150_3_r <= ack150_3_s & ~ack150m;


// edge:151 EB0
wire ack151m, req151m;
assign req151m = req151;
assign ack151 = ack151m;


// edge:151 fork


assign req151_0 = req151m;

assign ack151m = ack151_0;



// edge:152 EB0
wire ack152m, req152m;
assign req152m = req152;
assign ack152 = ack152m;


// edge:152 fork


assign req152_0 = req152m;

assign ack152m = ack152_0;



// edge:153 EB0
wire ack153m, req153m;
assign req153m = req153;
assign ack153 = ack153m;


// edge:153 fork


assign req153_0 = req153m;

assign ack153m = ack153_0;



// edge:154 EB0
wire ack154m, req154m;
assign req154m = req154;
assign ack154 = ack154m;


// edge:154 fork


assign req154_0 = req154m;

assign ack154m = ack154_0;



// edge:155 EB0
wire ack155m, req155m;
assign req155m = req155;
assign ack155 = ack155m;


// edge:155 fork


assign req155_0 = req155m;

assign ack155m = ack155_0;



// edge:156 EB0
wire ack156m, req156m;
assign req156m = req156;
assign ack156 = ack156m;


// edge:156 fork


assign req156_0 = req156m;

assign ack156m = ack156_0;



// edge:157 EB0
wire ack157m, req157m;
assign req157m = req157;
assign ack157 = ack157m;


// edge:157 fork


assign req157_0 = req157m;

assign ack157m = ack157_0;



// edge:158 EB0
wire ack158m, req158m;
assign req158m = req158;
assign ack158 = ack158m;


// edge:158 fork


assign req158_0 = req158m;

assign ack158m = ack158_0;



// edge:159 EB0
wire ack159m, req159m;
assign req159m = req159;
assign ack159 = ack159m;


// edge:159 fork


assign req159_0 = req159m;

assign ack159m = ack159_0;



// edge:160 EB0
wire ack160m, req160m;
assign req160m = req160;
assign ack160 = ack160m;


// edge:160 fork


assign req160_0 = req160m;

assign ack160m = ack160_0;



// edge:161 EB0
wire ack161m, req161m;
assign req161m = req161;
assign ack161 = ack161m;


// edge:161 fork


assign req161_0 = req161m;

assign ack161m = ack161_0;



// edge:162 EB0
wire ack162m, req162m;
assign req162m = req162;
assign ack162 = ack162m;


// edge:162 fork


assign req162_0 = req162m;

assign ack162m = ack162_0;



// edge:163 EB1.5
wire ack163m, req163m;
eb15_ctrl uctrl_163 (
    .t_0_req(req163), .t_0_ack(ack163),
    .i_0_req(req163m), .i_0_ack(ack163m),
    .en0(en163_0), .en1(en163_1), .sel(sel163),
    .clk(clk), .reset_n(reset_n)
);


// edge:163 fork


assign req163_0 = req163m;

assign ack163m = ack163_0;



// edge:164 EB1.5
wire ack164m, req164m;
eb15_ctrl uctrl_164 (
    .t_0_req(req164), .t_0_ack(ack164),
    .i_0_req(req164m), .i_0_ack(ack164m),
    .en0(en164_0), .en1(en164_1), .sel(sel164),
    .clk(clk), .reset_n(reset_n)
);


// edge:164 fork


assign req164_0 = req164m;

assign ack164m = ack164_0;



// edge:165 EB0
wire ack165m, req165m;
assign req165m = req165;
assign ack165 = ack165m;


// edge:165 fork


assign req165_0 = req165m;

assign ack165m = ack165_0;



// edge:166 EB0
wire ack166m, req166m;
assign req166m = req166;
assign ack166 = ack166m;


// edge:166 fork
reg  ack166_0_r, ack166_1_r, ack166_2_r;
wire ack166_0_s, ack166_1_s, ack166_2_s;
assign req166_0 = req166m & ~ack166_0_r;
assign req166_1 = req166m & ~ack166_1_r;
assign req166_2 = req166m & ~ack166_2_r;
assign ack166_0_s = ack166_0 | ~req166_0;
assign ack166_1_s = ack166_1 | ~req166_1;
assign ack166_2_s = ack166_2 | ~req166_2;
assign ack166m = ack166_0_s & ack166_1_s & ack166_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack166_0_r <= 1'b0; else ack166_0_r <= ack166_0_s & ~ack166m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack166_1_r <= 1'b0; else ack166_1_r <= ack166_1_s & ~ack166m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack166_2_r <= 1'b0; else ack166_2_r <= ack166_2_s & ~ack166m;


// edge:167 EB0
wire ack167m, req167m;
assign req167m = req167;
assign ack167 = ack167m;


// edge:167 fork


assign req167_0 = req167m;

assign ack167m = ack167_0;



// edge:168 EB0
wire ack168m, req168m;
assign req168m = req168;
assign ack168 = ack168m;


// edge:168 fork
reg  ack168_0_r, ack168_1_r, ack168_2_r;
wire ack168_0_s, ack168_1_s, ack168_2_s;
assign req168_0 = req168m & ~ack168_0_r;
assign req168_1 = req168m & ~ack168_1_r;
assign req168_2 = req168m & ~ack168_2_r;
assign ack168_0_s = ack168_0 | ~req168_0;
assign ack168_1_s = ack168_1 | ~req168_1;
assign ack168_2_s = ack168_2 | ~req168_2;
assign ack168m = ack168_0_s & ack168_1_s & ack168_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack168_0_r <= 1'b0; else ack168_0_r <= ack168_0_s & ~ack168m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack168_1_r <= 1'b0; else ack168_1_r <= ack168_1_s & ~ack168m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack168_2_r <= 1'b0; else ack168_2_r <= ack168_2_s & ~ack168m;


// edge:169 EB0
wire ack169m, req169m;
assign req169m = req169;
assign ack169 = ack169m;


// edge:169 fork


assign req169_0 = req169m;

assign ack169m = ack169_0;



// edge:170 EB0
wire ack170m, req170m;
assign req170m = req170;
assign ack170 = ack170m;


// edge:170 fork


assign req170_0 = req170m;

assign ack170m = ack170_0;



// edge:171 EB0
wire ack171m, req171m;
assign req171m = req171;
assign ack171 = ack171m;


// edge:171 fork


assign req171_0 = req171m;

assign ack171m = ack171_0;



// edge:172 EB0
wire ack172m, req172m;
assign req172m = req172;
assign ack172 = ack172m;


// edge:172 fork


assign req172_0 = req172m;

assign ack172m = ack172_0;



// edge:173 EB0
wire ack173m, req173m;
assign req173m = req173;
assign ack173 = ack173m;


// edge:173 fork


assign req173_0 = req173m;

assign ack173m = ack173_0;



// edge:174 EB0
wire ack174m, req174m;
assign req174m = req174;
assign ack174 = ack174m;


// edge:174 fork


assign req174_0 = req174m;

assign ack174m = ack174_0;



// edge:175 EB0
wire ack175m, req175m;
assign req175m = req175;
assign ack175 = ack175m;


// edge:175 fork


assign req175_0 = req175m;

assign ack175m = ack175_0;



// edge:176 EB0
wire ack176m, req176m;
assign req176m = req176;
assign ack176 = ack176m;


// edge:176 fork


assign req176_0 = req176m;

assign ack176m = ack176_0;



// edge:177 EB0
wire ack177m, req177m;
assign req177m = req177;
assign ack177 = ack177m;


// edge:177 fork


assign req177_0 = req177m;

assign ack177m = ack177_0;



// edge:178 EB0
wire ack178m, req178m;
assign req178m = req178;
assign ack178 = ack178m;


// edge:178 fork


assign req178_0 = req178m;

assign ack178m = ack178_0;



// edge:179 EB0
wire ack179m, req179m;
assign req179m = req179;
assign ack179 = ack179m;


// edge:179 fork


assign req179_0 = req179m;

assign ack179m = ack179_0;



// edge:180 EB0
wire ack180m, req180m;
assign req180m = req180;
assign ack180 = ack180m;


// edge:180 fork


assign req180_0 = req180m;

assign ack180m = ack180_0;



// edge:181 EB1.5
wire ack181m, req181m;
eb15_ctrl uctrl_181 (
    .t_0_req(req181), .t_0_ack(ack181),
    .i_0_req(req181m), .i_0_ack(ack181m),
    .en0(en181_0), .en1(en181_1), .sel(sel181),
    .clk(clk), .reset_n(reset_n)
);


// edge:181 fork


assign req181_0 = req181m;

assign ack181m = ack181_0;



// edge:182 EB1.5
wire ack182m, req182m;
eb15_ctrl uctrl_182 (
    .t_0_req(req182), .t_0_ack(ack182),
    .i_0_req(req182m), .i_0_ack(ack182m),
    .en0(en182_0), .en1(en182_1), .sel(sel182),
    .clk(clk), .reset_n(reset_n)
);


// edge:182 fork


assign req182_0 = req182m;

assign ack182m = ack182_0;



// edge:183 EB0
wire ack183m, req183m;
assign req183m = req183;
assign ack183 = ack183m;


// edge:183 fork


assign req183_0 = req183m;

assign ack183m = ack183_0;



// edge:184 EB0
wire ack184m, req184m;
assign req184m = req184;
assign ack184 = ack184m;


// edge:184 fork
reg  ack184_0_r, ack184_1_r, ack184_2_r;
wire ack184_0_s, ack184_1_s, ack184_2_s;
assign req184_0 = req184m & ~ack184_0_r;
assign req184_1 = req184m & ~ack184_1_r;
assign req184_2 = req184m & ~ack184_2_r;
assign ack184_0_s = ack184_0 | ~req184_0;
assign ack184_1_s = ack184_1 | ~req184_1;
assign ack184_2_s = ack184_2 | ~req184_2;
assign ack184m = ack184_0_s & ack184_1_s & ack184_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack184_0_r <= 1'b0; else ack184_0_r <= ack184_0_s & ~ack184m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack184_1_r <= 1'b0; else ack184_1_r <= ack184_1_s & ~ack184m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack184_2_r <= 1'b0; else ack184_2_r <= ack184_2_s & ~ack184m;


// edge:185 EB0
wire ack185m, req185m;
assign req185m = req185;
assign ack185 = ack185m;


// edge:185 fork


assign req185_0 = req185m;

assign ack185m = ack185_0;



// edge:186 EB0
wire ack186m, req186m;
assign req186m = req186;
assign ack186 = ack186m;


// edge:186 fork
reg  ack186_0_r, ack186_1_r, ack186_2_r;
wire ack186_0_s, ack186_1_s, ack186_2_s;
assign req186_0 = req186m & ~ack186_0_r;
assign req186_1 = req186m & ~ack186_1_r;
assign req186_2 = req186m & ~ack186_2_r;
assign ack186_0_s = ack186_0 | ~req186_0;
assign ack186_1_s = ack186_1 | ~req186_1;
assign ack186_2_s = ack186_2 | ~req186_2;
assign ack186m = ack186_0_s & ack186_1_s & ack186_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack186_0_r <= 1'b0; else ack186_0_r <= ack186_0_s & ~ack186m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack186_1_r <= 1'b0; else ack186_1_r <= ack186_1_s & ~ack186m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack186_2_r <= 1'b0; else ack186_2_r <= ack186_2_s & ~ack186m;


// edge:187 EB0
wire ack187m, req187m;
assign req187m = req187;
assign ack187 = ack187m;


// edge:187 fork


assign req187_0 = req187m;

assign ack187m = ack187_0;



// edge:188 EB0
wire ack188m, req188m;
assign req188m = req188;
assign ack188 = ack188m;


// edge:188 fork


assign req188_0 = req188m;

assign ack188m = ack188_0;



// edge:189 EB0
wire ack189m, req189m;
assign req189m = req189;
assign ack189 = ack189m;


// edge:189 fork


assign req189_0 = req189m;

assign ack189m = ack189_0;



// edge:190 EB0
wire ack190m, req190m;
assign req190m = req190;
assign ack190 = ack190m;


// edge:190 fork


assign req190_0 = req190m;

assign ack190m = ack190_0;



// edge:191 EB0
wire ack191m, req191m;
assign req191m = req191;
assign ack191 = ack191m;


// edge:191 fork


assign req191_0 = req191m;

assign ack191m = ack191_0;



// edge:192 EB0
wire ack192m, req192m;
assign req192m = req192;
assign ack192 = ack192m;


// edge:192 fork


assign req192_0 = req192m;

assign ack192m = ack192_0;



// edge:193 EB0
wire ack193m, req193m;
assign req193m = req193;
assign ack193 = ack193m;


// edge:193 fork


assign req193_0 = req193m;

assign ack193m = ack193_0;



// edge:194 EB0
wire ack194m, req194m;
assign req194m = req194;
assign ack194 = ack194m;


// edge:194 fork


assign req194_0 = req194m;

assign ack194m = ack194_0;



// edge:195 EB0
wire ack195m, req195m;
assign req195m = req195;
assign ack195 = ack195m;


// edge:195 fork


assign req195_0 = req195m;

assign ack195m = ack195_0;



// edge:196 EB0
wire ack196m, req196m;
assign req196m = req196;
assign ack196 = ack196m;


// edge:196 fork


assign req196_0 = req196m;

assign ack196m = ack196_0;



// edge:197 EB0
wire ack197m, req197m;
assign req197m = req197;
assign ack197 = ack197m;


// edge:197 fork


assign req197_0 = req197m;

assign ack197m = ack197_0;



// edge:198 EB0
wire ack198m, req198m;
assign req198m = req198;
assign ack198 = ack198m;


// edge:198 fork


assign req198_0 = req198m;

assign ack198m = ack198_0;



// edge:199 EB1.5
wire ack199m, req199m;
eb15_ctrl uctrl_199 (
    .t_0_req(req199), .t_0_ack(ack199),
    .i_0_req(req199m), .i_0_ack(ack199m),
    .en0(en199_0), .en1(en199_1), .sel(sel199),
    .clk(clk), .reset_n(reset_n)
);


// edge:199 fork


assign req199_0 = req199m;

assign ack199m = ack199_0;



// edge:200 EB1.5
wire ack200m, req200m;
eb15_ctrl uctrl_200 (
    .t_0_req(req200), .t_0_ack(ack200),
    .i_0_req(req200m), .i_0_ack(ack200m),
    .en0(en200_0), .en1(en200_1), .sel(sel200),
    .clk(clk), .reset_n(reset_n)
);


// edge:200 fork


assign req200_0 = req200m;

assign ack200m = ack200_0;



// edge:201 EB0
wire ack201m, req201m;
assign req201m = req201;
assign ack201 = ack201m;


// edge:201 fork


assign req201_0 = req201m;

assign ack201m = ack201_0;



// edge:202 EB0
wire ack202m, req202m;
assign req202m = req202;
assign ack202 = ack202m;


// edge:202 fork
reg  ack202_0_r, ack202_1_r, ack202_2_r;
wire ack202_0_s, ack202_1_s, ack202_2_s;
assign req202_0 = req202m & ~ack202_0_r;
assign req202_1 = req202m & ~ack202_1_r;
assign req202_2 = req202m & ~ack202_2_r;
assign ack202_0_s = ack202_0 | ~req202_0;
assign ack202_1_s = ack202_1 | ~req202_1;
assign ack202_2_s = ack202_2 | ~req202_2;
assign ack202m = ack202_0_s & ack202_1_s & ack202_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack202_0_r <= 1'b0; else ack202_0_r <= ack202_0_s & ~ack202m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack202_1_r <= 1'b0; else ack202_1_r <= ack202_1_s & ~ack202m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack202_2_r <= 1'b0; else ack202_2_r <= ack202_2_s & ~ack202m;


// edge:203 EB0
wire ack203m, req203m;
assign req203m = req203;
assign ack203 = ack203m;


// edge:203 fork


assign req203_0 = req203m;

assign ack203m = ack203_0;



// edge:204 EB0
wire ack204m, req204m;
assign req204m = req204;
assign ack204 = ack204m;


// edge:204 fork
reg  ack204_0_r, ack204_1_r, ack204_2_r;
wire ack204_0_s, ack204_1_s, ack204_2_s;
assign req204_0 = req204m & ~ack204_0_r;
assign req204_1 = req204m & ~ack204_1_r;
assign req204_2 = req204m & ~ack204_2_r;
assign ack204_0_s = ack204_0 | ~req204_0;
assign ack204_1_s = ack204_1 | ~req204_1;
assign ack204_2_s = ack204_2 | ~req204_2;
assign ack204m = ack204_0_s & ack204_1_s & ack204_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack204_0_r <= 1'b0; else ack204_0_r <= ack204_0_s & ~ack204m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack204_1_r <= 1'b0; else ack204_1_r <= ack204_1_s & ~ack204m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack204_2_r <= 1'b0; else ack204_2_r <= ack204_2_s & ~ack204m;


// edge:205 EB0
wire ack205m, req205m;
assign req205m = req205;
assign ack205 = ack205m;


// edge:205 fork


assign req205_0 = req205m;

assign ack205m = ack205_0;



// edge:206 EB0
wire ack206m, req206m;
assign req206m = req206;
assign ack206 = ack206m;


// edge:206 fork


assign req206_0 = req206m;

assign ack206m = ack206_0;



// edge:207 EB0
wire ack207m, req207m;
assign req207m = req207;
assign ack207 = ack207m;


// edge:207 fork


assign req207_0 = req207m;

assign ack207m = ack207_0;



// edge:208 EB0
wire ack208m, req208m;
assign req208m = req208;
assign ack208 = ack208m;


// edge:208 fork


assign req208_0 = req208m;

assign ack208m = ack208_0;



// edge:209 EB0
wire ack209m, req209m;
assign req209m = req209;
assign ack209 = ack209m;


// edge:209 fork


assign req209_0 = req209m;

assign ack209m = ack209_0;



// edge:210 EB0
wire ack210m, req210m;
assign req210m = req210;
assign ack210 = ack210m;


// edge:210 fork


assign req210_0 = req210m;

assign ack210m = ack210_0;



// edge:211 EB0
wire ack211m, req211m;
assign req211m = req211;
assign ack211 = ack211m;


// edge:211 fork


assign req211_0 = req211m;

assign ack211m = ack211_0;



// edge:212 EB0
wire ack212m, req212m;
assign req212m = req212;
assign ack212 = ack212m;


// edge:212 fork


assign req212_0 = req212m;

assign ack212m = ack212_0;



// edge:213 EB0
wire ack213m, req213m;
assign req213m = req213;
assign ack213 = ack213m;


// edge:213 fork


assign req213_0 = req213m;

assign ack213m = ack213_0;



// edge:214 EB0
wire ack214m, req214m;
assign req214m = req214;
assign ack214 = ack214m;


// edge:214 fork


assign req214_0 = req214m;

assign ack214m = ack214_0;



// edge:215 EB0
wire ack215m, req215m;
assign req215m = req215;
assign ack215 = ack215m;


// edge:215 fork


assign req215_0 = req215m;

assign ack215m = ack215_0;



// edge:216 EB0
wire ack216m, req216m;
assign req216m = req216;
assign ack216 = ack216m;


// edge:216 fork


assign req216_0 = req216m;

assign ack216m = ack216_0;



// edge:217 EB1.5
wire ack217m, req217m;
eb15_ctrl uctrl_217 (
    .t_0_req(req217), .t_0_ack(ack217),
    .i_0_req(req217m), .i_0_ack(ack217m),
    .en0(en217_0), .en1(en217_1), .sel(sel217),
    .clk(clk), .reset_n(reset_n)
);


// edge:217 fork


assign req217_0 = req217m;

assign ack217m = ack217_0;



// edge:218 EB1.5
wire ack218m, req218m;
eb15_ctrl uctrl_218 (
    .t_0_req(req218), .t_0_ack(ack218),
    .i_0_req(req218m), .i_0_ack(ack218m),
    .en0(en218_0), .en1(en218_1), .sel(sel218),
    .clk(clk), .reset_n(reset_n)
);


// edge:218 fork


assign req218_0 = req218m;

assign ack218m = ack218_0;



// edge:219 EB0
wire ack219m, req219m;
assign req219m = req219;
assign ack219 = ack219m;


// edge:219 fork


assign req219_0 = req219m;

assign ack219m = ack219_0;



// edge:220 EB0
wire ack220m, req220m;
assign req220m = req220;
assign ack220 = ack220m;


// edge:220 fork
reg  ack220_0_r, ack220_1_r, ack220_2_r;
wire ack220_0_s, ack220_1_s, ack220_2_s;
assign req220_0 = req220m & ~ack220_0_r;
assign req220_1 = req220m & ~ack220_1_r;
assign req220_2 = req220m & ~ack220_2_r;
assign ack220_0_s = ack220_0 | ~req220_0;
assign ack220_1_s = ack220_1 | ~req220_1;
assign ack220_2_s = ack220_2 | ~req220_2;
assign ack220m = ack220_0_s & ack220_1_s & ack220_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack220_0_r <= 1'b0; else ack220_0_r <= ack220_0_s & ~ack220m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack220_1_r <= 1'b0; else ack220_1_r <= ack220_1_s & ~ack220m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack220_2_r <= 1'b0; else ack220_2_r <= ack220_2_s & ~ack220m;


// edge:221 EB0
wire ack221m, req221m;
assign req221m = req221;
assign ack221 = ack221m;


// edge:221 fork


assign req221_0 = req221m;

assign ack221m = ack221_0;



// edge:222 EB0
wire ack222m, req222m;
assign req222m = req222;
assign ack222 = ack222m;


// edge:222 fork
reg  ack222_0_r, ack222_1_r, ack222_2_r;
wire ack222_0_s, ack222_1_s, ack222_2_s;
assign req222_0 = req222m & ~ack222_0_r;
assign req222_1 = req222m & ~ack222_1_r;
assign req222_2 = req222m & ~ack222_2_r;
assign ack222_0_s = ack222_0 | ~req222_0;
assign ack222_1_s = ack222_1 | ~req222_1;
assign ack222_2_s = ack222_2 | ~req222_2;
assign ack222m = ack222_0_s & ack222_1_s & ack222_2_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack222_0_r <= 1'b0; else ack222_0_r <= ack222_0_s & ~ack222m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack222_1_r <= 1'b0; else ack222_1_r <= ack222_1_s & ~ack222m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack222_2_r <= 1'b0; else ack222_2_r <= ack222_2_s & ~ack222m;


// edge:223 EB1.5
wire ack223m, req223m;
eb15_ctrl uctrl_223 (
    .t_0_req(req223), .t_0_ack(ack223),
    .i_0_req(req223m), .i_0_ack(ack223m),
    .en0(en223_0), .en1(en223_1), .sel(sel223),
    .clk(clk), .reset_n(reset_n)
);


// edge:223 fork
reg  ack223_0_r, ack223_1_r;
wire ack223_0_s, ack223_1_s;
assign req223_0 = req223m & ~ack223_0_r;
assign req223_1 = req223m & ~ack223_1_r;
assign ack223_0_s = ack223_0 | ~req223_0;
assign ack223_1_s = ack223_1 | ~req223_1;
assign ack223m = ack223_0_s & ack223_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack223_0_r <= 1'b0; else ack223_0_r <= ack223_0_s & ~ack223m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack223_1_r <= 1'b0; else ack223_1_r <= ack223_1_s & ~ack223m;


// edge:224 EB1.5
wire ack224m, req224m;
eb15_ctrl uctrl_224 (
    .t_0_req(req224), .t_0_ack(ack224),
    .i_0_req(req224m), .i_0_ack(ack224m),
    .en0(en224_0), .en1(en224_1), .sel(sel224),
    .clk(clk), .reset_n(reset_n)
);


// edge:224 fork
reg  ack224_0_r, ack224_1_r;
wire ack224_0_s, ack224_1_s;
assign req224_0 = req224m & ~ack224_0_r;
assign req224_1 = req224m & ~ack224_1_r;
assign ack224_0_s = ack224_0 | ~req224_0;
assign ack224_1_s = ack224_1 | ~req224_1;
assign ack224m = ack224_0_s & ack224_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack224_0_r <= 1'b0; else ack224_0_r <= ack224_0_s & ~ack224m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack224_1_r <= 1'b0; else ack224_1_r <= ack224_1_s & ~ack224m;


// edge:225 EB1.5
wire ack225m, req225m;
eb15_ctrl uctrl_225 (
    .t_0_req(req225), .t_0_ack(ack225),
    .i_0_req(req225m), .i_0_ack(ack225m),
    .en0(en225_0), .en1(en225_1), .sel(sel225),
    .clk(clk), .reset_n(reset_n)
);


// edge:225 fork
reg  ack225_0_r, ack225_1_r;
wire ack225_0_s, ack225_1_s;
assign req225_0 = req225m & ~ack225_0_r;
assign req225_1 = req225m & ~ack225_1_r;
assign ack225_0_s = ack225_0 | ~req225_0;
assign ack225_1_s = ack225_1 | ~req225_1;
assign ack225m = ack225_0_s & ack225_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack225_0_r <= 1'b0; else ack225_0_r <= ack225_0_s & ~ack225m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack225_1_r <= 1'b0; else ack225_1_r <= ack225_1_s & ~ack225m;


// edge:226 EB1.5
wire ack226m, req226m;
eb15_ctrl uctrl_226 (
    .t_0_req(req226), .t_0_ack(ack226),
    .i_0_req(req226m), .i_0_ack(ack226m),
    .en0(en226_0), .en1(en226_1), .sel(sel226),
    .clk(clk), .reset_n(reset_n)
);


// edge:226 fork
reg  ack226_0_r, ack226_1_r;
wire ack226_0_s, ack226_1_s;
assign req226_0 = req226m & ~ack226_0_r;
assign req226_1 = req226m & ~ack226_1_r;
assign ack226_0_s = ack226_0 | ~req226_0;
assign ack226_1_s = ack226_1 | ~req226_1;
assign ack226m = ack226_0_s & ack226_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack226_0_r <= 1'b0; else ack226_0_r <= ack226_0_s & ~ack226m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack226_1_r <= 1'b0; else ack226_1_r <= ack226_1_s & ~ack226m;


// edge:227 EB1.5
wire ack227m, req227m;
eb15_ctrl uctrl_227 (
    .t_0_req(req227), .t_0_ack(ack227),
    .i_0_req(req227m), .i_0_ack(ack227m),
    .en0(en227_0), .en1(en227_1), .sel(sel227),
    .clk(clk), .reset_n(reset_n)
);


// edge:227 fork
reg  ack227_0_r, ack227_1_r;
wire ack227_0_s, ack227_1_s;
assign req227_0 = req227m & ~ack227_0_r;
assign req227_1 = req227m & ~ack227_1_r;
assign ack227_0_s = ack227_0 | ~req227_0;
assign ack227_1_s = ack227_1 | ~req227_1;
assign ack227m = ack227_0_s & ack227_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack227_0_r <= 1'b0; else ack227_0_r <= ack227_0_s & ~ack227m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack227_1_r <= 1'b0; else ack227_1_r <= ack227_1_s & ~ack227m;


// edge:228 EB1.5
wire ack228m, req228m;
eb15_ctrl uctrl_228 (
    .t_0_req(req228), .t_0_ack(ack228),
    .i_0_req(req228m), .i_0_ack(ack228m),
    .en0(en228_0), .en1(en228_1), .sel(sel228),
    .clk(clk), .reset_n(reset_n)
);


// edge:228 fork
reg  ack228_0_r, ack228_1_r;
wire ack228_0_s, ack228_1_s;
assign req228_0 = req228m & ~ack228_0_r;
assign req228_1 = req228m & ~ack228_1_r;
assign ack228_0_s = ack228_0 | ~req228_0;
assign ack228_1_s = ack228_1 | ~req228_1;
assign ack228m = ack228_0_s & ack228_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack228_0_r <= 1'b0; else ack228_0_r <= ack228_0_s & ~ack228m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack228_1_r <= 1'b0; else ack228_1_r <= ack228_1_s & ~ack228m;


// edge:229 EB1.5
wire ack229m, req229m;
eb15_ctrl uctrl_229 (
    .t_0_req(req229), .t_0_ack(ack229),
    .i_0_req(req229m), .i_0_ack(ack229m),
    .en0(en229_0), .en1(en229_1), .sel(sel229),
    .clk(clk), .reset_n(reset_n)
);


// edge:229 fork
reg  ack229_0_r, ack229_1_r;
wire ack229_0_s, ack229_1_s;
assign req229_0 = req229m & ~ack229_0_r;
assign req229_1 = req229m & ~ack229_1_r;
assign ack229_0_s = ack229_0 | ~req229_0;
assign ack229_1_s = ack229_1 | ~req229_1;
assign ack229m = ack229_0_s & ack229_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack229_0_r <= 1'b0; else ack229_0_r <= ack229_0_s & ~ack229m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack229_1_r <= 1'b0; else ack229_1_r <= ack229_1_s & ~ack229m;


// edge:230 EB1.5
wire ack230m, req230m;
eb15_ctrl uctrl_230 (
    .t_0_req(req230), .t_0_ack(ack230),
    .i_0_req(req230m), .i_0_ack(ack230m),
    .en0(en230_0), .en1(en230_1), .sel(sel230),
    .clk(clk), .reset_n(reset_n)
);


// edge:230 fork
reg  ack230_0_r, ack230_1_r;
wire ack230_0_s, ack230_1_s;
assign req230_0 = req230m & ~ack230_0_r;
assign req230_1 = req230m & ~ack230_1_r;
assign ack230_0_s = ack230_0 | ~req230_0;
assign ack230_1_s = ack230_1 | ~req230_1;
assign ack230m = ack230_0_s & ack230_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack230_0_r <= 1'b0; else ack230_0_r <= ack230_0_s & ~ack230m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack230_1_r <= 1'b0; else ack230_1_r <= ack230_1_s & ~ack230m;


// edge:231 EB0
wire ack231m, req231m;
assign req231m = req231;
assign ack231 = ack231m;


// edge:231 fork


assign req231_0 = req231m;

assign ack231m = ack231_0;



// edge:232 EB0
wire ack232m, req232m;
assign req232m = req232;
assign ack232 = ack232m;


// edge:232 fork


assign req232_0 = req232m;

assign ack232m = ack232_0;



// edge:233 EB0
wire ack233m, req233m;
assign req233m = req233;
assign ack233 = ack233m;


// edge:233 fork


assign req233_0 = req233m;

assign ack233m = ack233_0;



// edge:234 EB0
wire ack234m, req234m;
assign req234m = req234;
assign ack234 = ack234m;


// edge:234 fork


assign req234_0 = req234m;

assign ack234m = ack234_0;



// edge:235 EB0
wire ack235m, req235m;
assign req235m = req235;
assign ack235 = ack235m;


// edge:235 fork


assign req235_0 = req235m;

assign ack235m = ack235_0;



// edge:236 EB0
wire ack236m, req236m;
assign req236m = req236;
assign ack236 = ack236m;


// edge:236 fork


assign req236_0 = req236m;

assign ack236m = ack236_0;



// edge:237 EB0
wire ack237m, req237m;
assign req237m = req237;
assign ack237 = ack237m;


// edge:237 fork


assign req237_0 = req237m;

assign ack237m = ack237_0;



// edge:238 EB0
wire ack238m, req238m;
assign req238m = req238;
assign ack238 = ack238m;


// edge:238 fork


assign req238_0 = req238m;

assign ack238m = ack238_0;



// edge:239 EB0
wire ack239m, req239m;
assign req239m = req239;
assign ack239 = ack239m;


// edge:239 fork


assign req239_0 = req239m;

assign ack239m = ack239_0;



// edge:240 EB0
wire ack240m, req240m;
assign req240m = req240;
assign ack240 = ack240m;


// edge:240 fork


assign req240_0 = req240m;

assign ack240m = ack240_0;



// edge:241 EB1
wire ack241m;
reg req241m;
assign en241 = req241 & ack241;
assign ack241 = ~req241m | ack241m;
always @(posedge clk or negedge reset_n) if (~reset_n) req241m <= 1'b0; else req241m <= ~ack241 | req241;


// edge:241 fork


assign req241_0 = req241m;

assign ack241m = ack241_0;



// edge:242 EB1
wire ack242m;
reg req242m;
assign en242 = req242 & ack242;
assign ack242 = ~req242m | ack242m;
always @(posedge clk or negedge reset_n) if (~reset_n) req242m <= 1'b0; else req242m <= ~ack242 | req242;


// edge:242 fork


assign req242_0 = req242m;

assign ack242m = ack242_0;



// edge:243 EB0
wire ack243m, req243m;
assign req243m = req243;
assign ack243 = ack243m;


// edge:243 fork


assign req243_0 = req243m;

assign ack243m = ack243_0;



// edge:244 EB0
wire ack244m, req244m;
assign req244m = req244;
assign ack244 = ack244m;


// edge:244 fork


assign req244_0 = req244m;

assign ack244m = ack244_0;



// edge:245 EB1
wire ack245m;
reg req245m;
assign en245 = req245 & ack245;
assign ack245 = ~req245m | ack245m;
always @(posedge clk or negedge reset_n) if (~reset_n) req245m <= 1'b0; else req245m <= ~ack245 | req245;


// edge:245 fork


assign req245_0 = req245m;

assign ack245m = ack245_0;



// edge:246 EB1
wire ack246m;
reg req246m;
assign en246 = req246 & ack246;
assign ack246 = ~req246m | ack246m;
always @(posedge clk or negedge reset_n) if (~reset_n) req246m <= 1'b0; else req246m <= ~ack246 | req246;


// edge:246 fork


assign req246_0 = req246m;

assign ack246m = ack246_0;



// edge:247 EB0
wire ack247m, req247m;
assign req247m = req247;
assign ack247 = ack247m;


// edge:247 fork


assign req247_0 = req247m;

assign ack247m = ack247_0;



// edge:248 EB0
wire ack248m, req248m;
assign req248m = req248;
assign ack248 = ack248m;


// edge:248 fork


assign req248_0 = req248m;

assign ack248m = ack248_0;



// edge:249 EB1
wire ack249m;
reg req249m;
assign en249 = req249 & ack249;
assign ack249 = ~req249m | ack249m;
always @(posedge clk or negedge reset_n) if (~reset_n) req249m <= 1'b0; else req249m <= ~ack249 | req249;


// edge:249 fork


assign req249_0 = req249m;

assign ack249m = ack249_0;



// edge:250 EB1
wire ack250m;
reg req250m;
assign en250 = req250 & ack250;
assign ack250 = ~req250m | ack250m;
always @(posedge clk or negedge reset_n) if (~reset_n) req250m <= 1'b0; else req250m <= ~ack250 | req250;


// edge:250 fork


assign req250_0 = req250m;

assign ack250m = ack250_0;



// edge:251 EB0
wire ack251m, req251m;
assign req251m = req251;
assign ack251 = ack251m;


// edge:251 fork


assign req251_0 = req251m;

assign ack251m = ack251_0;



// edge:252 EB0
wire ack252m, req252m;
assign req252m = req252;
assign ack252 = ack252m;


// edge:252 fork


assign req252_0 = req252m;

assign ack252m = ack252_0;



// edge:253 EB1
wire ack253m;
reg req253m;
assign en253 = req253 & ack253;
assign ack253 = ~req253m | ack253m;
always @(posedge clk or negedge reset_n) if (~reset_n) req253m <= 1'b0; else req253m <= ~ack253 | req253;


// edge:253 fork


assign req253_0 = req253m;

assign ack253m = ack253_0;



// edge:254 EB1
wire ack254m;
reg req254m;
assign en254 = req254 & ack254;
assign ack254 = ~req254m | ack254m;
always @(posedge clk or negedge reset_n) if (~reset_n) req254m <= 1'b0; else req254m <= ~ack254 | req254;


// edge:254 fork


assign req254_0 = req254m;

assign ack254m = ack254_0;



// edge:255 EB1.5
wire ack255m, req255m;
eb15_ctrl uctrl_255 (
    .t_0_req(req255), .t_0_ack(ack255),
    .i_0_req(req255m), .i_0_ack(ack255m),
    .en0(en255_0), .en1(en255_1), .sel(sel255),
    .clk(clk), .reset_n(reset_n)
);


// edge:255 fork
reg  ack255_0_r, ack255_1_r;
wire ack255_0_s, ack255_1_s;
assign req255_0 = req255m & ~ack255_0_r;
assign req255_1 = req255m & ~ack255_1_r;
assign ack255_0_s = ack255_0 | ~req255_0;
assign ack255_1_s = ack255_1 | ~req255_1;
assign ack255m = ack255_0_s & ack255_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack255_0_r <= 1'b0; else ack255_0_r <= ack255_0_s & ~ack255m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack255_1_r <= 1'b0; else ack255_1_r <= ack255_1_s & ~ack255m;


// edge:256 EB1.5
wire ack256m, req256m;
eb15_ctrl uctrl_256 (
    .t_0_req(req256), .t_0_ack(ack256),
    .i_0_req(req256m), .i_0_ack(ack256m),
    .en0(en256_0), .en1(en256_1), .sel(sel256),
    .clk(clk), .reset_n(reset_n)
);


// edge:256 fork
reg  ack256_0_r, ack256_1_r;
wire ack256_0_s, ack256_1_s;
assign req256_0 = req256m & ~ack256_0_r;
assign req256_1 = req256m & ~ack256_1_r;
assign ack256_0_s = ack256_0 | ~req256_0;
assign ack256_1_s = ack256_1 | ~req256_1;
assign ack256m = ack256_0_s & ack256_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack256_0_r <= 1'b0; else ack256_0_r <= ack256_0_s & ~ack256m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack256_1_r <= 1'b0; else ack256_1_r <= ack256_1_s & ~ack256m;


// edge:257 EB1.5
wire ack257m, req257m;
eb15_ctrl uctrl_257 (
    .t_0_req(req257), .t_0_ack(ack257),
    .i_0_req(req257m), .i_0_ack(ack257m),
    .en0(en257_0), .en1(en257_1), .sel(sel257),
    .clk(clk), .reset_n(reset_n)
);


// edge:257 fork
reg  ack257_0_r, ack257_1_r;
wire ack257_0_s, ack257_1_s;
assign req257_0 = req257m & ~ack257_0_r;
assign req257_1 = req257m & ~ack257_1_r;
assign ack257_0_s = ack257_0 | ~req257_0;
assign ack257_1_s = ack257_1 | ~req257_1;
assign ack257m = ack257_0_s & ack257_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack257_0_r <= 1'b0; else ack257_0_r <= ack257_0_s & ~ack257m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack257_1_r <= 1'b0; else ack257_1_r <= ack257_1_s & ~ack257m;


// edge:258 EB1.5
wire ack258m, req258m;
eb15_ctrl uctrl_258 (
    .t_0_req(req258), .t_0_ack(ack258),
    .i_0_req(req258m), .i_0_ack(ack258m),
    .en0(en258_0), .en1(en258_1), .sel(sel258),
    .clk(clk), .reset_n(reset_n)
);


// edge:258 fork
reg  ack258_0_r, ack258_1_r;
wire ack258_0_s, ack258_1_s;
assign req258_0 = req258m & ~ack258_0_r;
assign req258_1 = req258m & ~ack258_1_r;
assign ack258_0_s = ack258_0 | ~req258_0;
assign ack258_1_s = ack258_1 | ~req258_1;
assign ack258m = ack258_0_s & ack258_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack258_0_r <= 1'b0; else ack258_0_r <= ack258_0_s & ~ack258m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack258_1_r <= 1'b0; else ack258_1_r <= ack258_1_s & ~ack258m;


// edge:259 EB1.5
wire ack259m, req259m;
eb15_ctrl uctrl_259 (
    .t_0_req(req259), .t_0_ack(ack259),
    .i_0_req(req259m), .i_0_ack(ack259m),
    .en0(en259_0), .en1(en259_1), .sel(sel259),
    .clk(clk), .reset_n(reset_n)
);


// edge:259 fork
reg  ack259_0_r, ack259_1_r;
wire ack259_0_s, ack259_1_s;
assign req259_0 = req259m & ~ack259_0_r;
assign req259_1 = req259m & ~ack259_1_r;
assign ack259_0_s = ack259_0 | ~req259_0;
assign ack259_1_s = ack259_1 | ~req259_1;
assign ack259m = ack259_0_s & ack259_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack259_0_r <= 1'b0; else ack259_0_r <= ack259_0_s & ~ack259m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack259_1_r <= 1'b0; else ack259_1_r <= ack259_1_s & ~ack259m;


// edge:260 EB1.5
wire ack260m, req260m;
eb15_ctrl uctrl_260 (
    .t_0_req(req260), .t_0_ack(ack260),
    .i_0_req(req260m), .i_0_ack(ack260m),
    .en0(en260_0), .en1(en260_1), .sel(sel260),
    .clk(clk), .reset_n(reset_n)
);


// edge:260 fork
reg  ack260_0_r, ack260_1_r;
wire ack260_0_s, ack260_1_s;
assign req260_0 = req260m & ~ack260_0_r;
assign req260_1 = req260m & ~ack260_1_r;
assign ack260_0_s = ack260_0 | ~req260_0;
assign ack260_1_s = ack260_1 | ~req260_1;
assign ack260m = ack260_0_s & ack260_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack260_0_r <= 1'b0; else ack260_0_r <= ack260_0_s & ~ack260m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack260_1_r <= 1'b0; else ack260_1_r <= ack260_1_s & ~ack260m;


// edge:261 EB1.5
wire ack261m, req261m;
eb15_ctrl uctrl_261 (
    .t_0_req(req261), .t_0_ack(ack261),
    .i_0_req(req261m), .i_0_ack(ack261m),
    .en0(en261_0), .en1(en261_1), .sel(sel261),
    .clk(clk), .reset_n(reset_n)
);


// edge:261 fork
reg  ack261_0_r, ack261_1_r;
wire ack261_0_s, ack261_1_s;
assign req261_0 = req261m & ~ack261_0_r;
assign req261_1 = req261m & ~ack261_1_r;
assign ack261_0_s = ack261_0 | ~req261_0;
assign ack261_1_s = ack261_1 | ~req261_1;
assign ack261m = ack261_0_s & ack261_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack261_0_r <= 1'b0; else ack261_0_r <= ack261_0_s & ~ack261m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack261_1_r <= 1'b0; else ack261_1_r <= ack261_1_s & ~ack261m;


// edge:262 EB1.5
wire ack262m, req262m;
eb15_ctrl uctrl_262 (
    .t_0_req(req262), .t_0_ack(ack262),
    .i_0_req(req262m), .i_0_ack(ack262m),
    .en0(en262_0), .en1(en262_1), .sel(sel262),
    .clk(clk), .reset_n(reset_n)
);


// edge:262 fork
reg  ack262_0_r, ack262_1_r;
wire ack262_0_s, ack262_1_s;
assign req262_0 = req262m & ~ack262_0_r;
assign req262_1 = req262m & ~ack262_1_r;
assign ack262_0_s = ack262_0 | ~req262_0;
assign ack262_1_s = ack262_1 | ~req262_1;
assign ack262m = ack262_0_s & ack262_1_s;
always @(posedge clk or negedge reset_n) if (~reset_n) ack262_0_r <= 1'b0; else ack262_0_r <= ack262_0_s & ~ack262m;
always @(posedge clk or negedge reset_n) if (~reset_n) ack262_1_r <= 1'b0; else ack262_1_r <= ack262_1_s & ~ack262m;


// edge:263 EB0
wire ack263m, req263m;
assign req263m = req263;
assign ack263 = ack263m;


// edge:263 fork


assign req263_0 = req263m;

assign ack263m = ack263_0;



// edge:264 EB0
wire ack264m, req264m;
assign req264m = req264;
assign ack264 = ack264m;


// edge:264 fork


assign req264_0 = req264m;

assign ack264m = ack264_0;



// edge:265 EB0
wire ack265m, req265m;
assign req265m = req265;
assign ack265 = ack265m;


// edge:265 fork


assign req265_0 = req265m;

assign ack265m = ack265_0;



// edge:266 EB0
wire ack266m, req266m;
assign req266m = req266;
assign ack266 = ack266m;


// edge:266 fork


assign req266_0 = req266m;

assign ack266m = ack266_0;



// edge:267 EB0
wire ack267m, req267m;
assign req267m = req267;
assign ack267 = ack267m;


// edge:267 fork


assign req267_0 = req267m;

assign ack267m = ack267_0;



// edge:268 EB0
wire ack268m, req268m;
assign req268m = req268;
assign ack268 = ack268m;


// edge:268 fork


assign req268_0 = req268m;

assign ack268m = ack268_0;



// edge:269 EB0
wire ack269m, req269m;
assign req269m = req269;
assign ack269 = ack269m;


// edge:269 fork


assign req269_0 = req269m;

assign ack269m = ack269_0;



// edge:270 EB0
wire ack270m, req270m;
assign req270m = req270;
assign ack270 = ack270m;


// edge:270 fork


assign req270_0 = req270m;

assign ack270m = ack270_0;



// edge:271 EB0
wire ack271m, req271m;
assign req271m = req271;
assign ack271 = ack271m;


// edge:271 fork


assign req271_0 = req271m;

assign ack271m = ack271_0;



// edge:272 EB0
wire ack272m, req272m;
assign req272m = req272;
assign ack272 = ack272m;


// edge:272 fork


assign req272_0 = req272m;

assign ack272m = ack272_0;



// edge:273 EB1
wire ack273m;
reg req273m;
assign en273 = req273 & ack273;
assign ack273 = ~req273m | ack273m;
always @(posedge clk or negedge reset_n) if (~reset_n) req273m <= 1'b0; else req273m <= ~ack273 | req273;


// edge:273 fork


assign req273_0 = req273m;

assign ack273m = ack273_0;



// edge:274 EB1
wire ack274m;
reg req274m;
assign en274 = req274 & ack274;
assign ack274 = ~req274m | ack274m;
always @(posedge clk or negedge reset_n) if (~reset_n) req274m <= 1'b0; else req274m <= ~ack274 | req274;


// edge:274 fork


assign req274_0 = req274m;

assign ack274m = ack274_0;



// edge:275 EB0
wire ack275m, req275m;
assign req275m = req275;
assign ack275 = ack275m;


// edge:275 fork


assign req275_0 = req275m;

assign ack275m = ack275_0;



// edge:276 EB0
wire ack276m, req276m;
assign req276m = req276;
assign ack276 = ack276m;


// edge:276 fork


assign req276_0 = req276m;

assign ack276m = ack276_0;



// edge:277 EB1
wire ack277m;
reg req277m;
assign en277 = req277 & ack277;
assign ack277 = ~req277m | ack277m;
always @(posedge clk or negedge reset_n) if (~reset_n) req277m <= 1'b0; else req277m <= ~ack277 | req277;


// edge:277 fork


assign req277_0 = req277m;

assign ack277m = ack277_0;



// edge:278 EB1
wire ack278m;
reg req278m;
assign en278 = req278 & ack278;
assign ack278 = ~req278m | ack278m;
always @(posedge clk or negedge reset_n) if (~reset_n) req278m <= 1'b0; else req278m <= ~ack278 | req278;


// edge:278 fork


assign req278_0 = req278m;

assign ack278m = ack278_0;



// edge:279 EB0
wire ack279m, req279m;
assign req279m = req279;
assign ack279 = ack279m;


// edge:279 fork


assign req279_0 = req279m;

assign ack279m = ack279_0;



// edge:280 EB0
wire ack280m, req280m;
assign req280m = req280;
assign ack280 = ack280m;


// edge:280 fork


assign req280_0 = req280m;

assign ack280m = ack280_0;



// edge:281 EB1
wire ack281m;
reg req281m;
assign en281 = req281 & ack281;
assign ack281 = ~req281m | ack281m;
always @(posedge clk or negedge reset_n) if (~reset_n) req281m <= 1'b0; else req281m <= ~ack281 | req281;


// edge:281 fork


assign req281_0 = req281m;

assign ack281m = ack281_0;



// edge:282 EB1
wire ack282m;
reg req282m;
assign en282 = req282 & ack282;
assign ack282 = ~req282m | ack282m;
always @(posedge clk or negedge reset_n) if (~reset_n) req282m <= 1'b0; else req282m <= ~ack282 | req282;


// edge:282 fork


assign req282_0 = req282m;

assign ack282m = ack282_0;



// edge:283 EB0
wire ack283m, req283m;
assign req283m = req283;
assign ack283 = ack283m;


// edge:283 fork


assign req283_0 = req283m;

assign ack283m = ack283_0;



// edge:284 EB0
wire ack284m, req284m;
assign req284m = req284;
assign ack284 = ack284m;


// edge:284 fork


assign req284_0 = req284m;

assign ack284m = ack284_0;



// edge:285 EB1
wire ack285m;
reg req285m;
assign en285 = req285 & ack285;
assign ack285 = ~req285m | ack285m;
always @(posedge clk or negedge reset_n) if (~reset_n) req285m <= 1'b0; else req285m <= ~ack285 | req285;


// edge:285 fork


assign req285_0 = req285m;

assign ack285m = ack285_0;



// edge:286 EB1
wire ack286m;
reg req286m;
assign en286 = req286 & ack286;
assign ack286 = ~req286m | ack286m;
always @(posedge clk or negedge reset_n) if (~reset_n) req286m <= 1'b0; else req286m <= ~ack286 | req286;


// edge:286 fork


assign req286_0 = req286m;

assign ack286m = ack286_0;



// edge:287 EB0
wire ack287m, req287m;
assign req287m = req287;
assign ack287 = ack287m;


// edge:287 fork


assign req287_0 = req287m;

assign ack287m = ack287_0;



// edge:288 EB0
wire ack288m, req288m;
assign req288m = req288;
assign ack288 = ack288m;


// edge:288 fork


assign req288_0 = req288m;

assign ack288m = ack288_0;



// edge:289 EB0
wire ack289m, req289m;
assign req289m = req289;
assign ack289 = ack289m;


// edge:289 fork


assign req289_0 = req289m;

assign ack289m = ack289_0;



// edge:290 EB1.5
wire ack290m, req290m;
eb15_ctrl uctrl_290 (
    .t_0_req(req290), .t_0_ack(ack290),
    .i_0_req(req290m), .i_0_ack(ack290m),
    .en0(en290_0), .en1(en290_1), .sel(sel290),
    .clk(clk), .reset_n(reset_n)
);


// edge:290 fork


assign req290_0 = req290m;

assign ack290m = ack290_0;



// edge:291 EB1.5
wire ack291m, req291m;
eb15_ctrl uctrl_291 (
    .t_0_req(req291), .t_0_ack(ack291),
    .i_0_req(req291m), .i_0_ack(ack291m),
    .en0(en291_0), .en1(en291_1), .sel(sel291),
    .clk(clk), .reset_n(reset_n)
);


// edge:291 fork


assign req291_0 = req291m;

assign ack291m = ack291_0;



// edge:292 EB1
wire ack292m;
reg req292m;
assign en292 = req292 & ack292;
assign ack292 = ~req292m | ack292m;
always @(posedge clk or negedge reset_n) if (~reset_n) req292m <= 1'b0; else req292m <= ~ack292 | req292;


// edge:292 fork


assign req292_0 = req292m;

assign ack292m = ack292_0;



// edge:293 EB1
wire ack293m;
reg req293m;
assign en293 = req293 & ack293;
assign ack293 = ~req293m | ack293m;
always @(posedge clk or negedge reset_n) if (~reset_n) req293m <= 1'b0; else req293m <= ~ack293 | req293;


// edge:293 fork


assign req293_0 = req293m;

assign ack293m = ack293_0;



// edge:294 EB0
wire ack294m, req294m;
assign req294m = req294;
assign ack294 = ack294m;


// edge:294 fork


assign req294_0 = req294m;

assign ack294m = ack294_0;



// edge:295 EB0
wire ack295m, req295m;
assign req295m = req295;
assign ack295 = ack295m;


// edge:295 fork


assign req295_0 = req295m;

assign ack295m = ack295_0;



// edge:296 EB1.5
wire ack296m, req296m;
eb15_ctrl uctrl_296 (
    .t_0_req(req296), .t_0_ack(ack296),
    .i_0_req(req296m), .i_0_ack(ack296m),
    .en0(en296_0), .en1(en296_1), .sel(sel296),
    .clk(clk), .reset_n(reset_n)
);


// edge:296 fork


assign req296_0 = req296m;

assign ack296m = ack296_0;



// edge:297 EB1.5
wire ack297m, req297m;
eb15_ctrl uctrl_297 (
    .t_0_req(req297), .t_0_ack(ack297),
    .i_0_req(req297m), .i_0_ack(ack297m),
    .en0(en297_0), .en1(en297_1), .sel(sel297),
    .clk(clk), .reset_n(reset_n)
);


// edge:297 fork


assign req297_0 = req297m;

assign ack297m = ack297_0;



// edge:298 EB1
wire ack298m;
reg req298m;
assign en298 = req298 & ack298;
assign ack298 = ~req298m | ack298m;
always @(posedge clk or negedge reset_n) if (~reset_n) req298m <= 1'b0; else req298m <= ~ack298 | req298;


// edge:298 fork


assign req298_0 = req298m;

assign ack298m = ack298_0;



// edge:299 EB1
wire ack299m;
reg req299m;
assign en299 = req299 & ack299;
assign ack299 = ~req299m | ack299m;
always @(posedge clk or negedge reset_n) if (~reset_n) req299m <= 1'b0; else req299m <= ~ack299 | req299;


// edge:299 fork


assign req299_0 = req299m;

assign ack299m = ack299_0;



// edge:300 EB0
wire ack300m, req300m;
assign req300m = req300;
assign ack300 = ack300m;


// edge:300 fork


assign req300_0 = req300m;

assign ack300m = ack300_0;



// edge:301 EB0
wire ack301m, req301m;
assign req301m = req301;
assign ack301 = ack301m;


// edge:301 fork


assign req301_0 = req301m;

assign ack301m = ack301_0;



// edge:302 EB1.5
wire ack302m, req302m;
eb15_ctrl uctrl_302 (
    .t_0_req(req302), .t_0_ack(ack302),
    .i_0_req(req302m), .i_0_ack(ack302m),
    .en0(en302_0), .en1(en302_1), .sel(sel302),
    .clk(clk), .reset_n(reset_n)
);


// edge:302 fork


assign req302_0 = req302m;

assign ack302m = ack302_0;



// edge:303 EB1.5
wire ack303m, req303m;
eb15_ctrl uctrl_303 (
    .t_0_req(req303), .t_0_ack(ack303),
    .i_0_req(req303m), .i_0_ack(ack303m),
    .en0(en303_0), .en1(en303_1), .sel(sel303),
    .clk(clk), .reset_n(reset_n)
);


// edge:303 fork


assign req303_0 = req303m;

assign ack303m = ack303_0;



// edge:304 EB1
wire ack304m;
reg req304m;
assign en304 = req304 & ack304;
assign ack304 = ~req304m | ack304m;
always @(posedge clk or negedge reset_n) if (~reset_n) req304m <= 1'b0; else req304m <= ~ack304 | req304;


// edge:304 fork


assign req304_0 = req304m;

assign ack304m = ack304_0;



// edge:305 EB1
wire ack305m;
reg req305m;
assign en305 = req305 & ack305;
assign ack305 = ~req305m | ack305m;
always @(posedge clk or negedge reset_n) if (~reset_n) req305m <= 1'b0; else req305m <= ~ack305 | req305;


// edge:305 fork


assign req305_0 = req305m;

assign ack305m = ack305_0;



// edge:306 EB0
wire ack306m, req306m;
assign req306m = req306;
assign ack306 = ack306m;


// edge:306 fork


assign req306_0 = req306m;

assign ack306m = ack306_0;



// edge:307 EB0
wire ack307m, req307m;
assign req307m = req307;
assign ack307 = ack307m;


// edge:307 fork


assign req307_0 = req307m;

assign ack307m = ack307_0;



// edge:308 EB1.5
wire ack308m, req308m;
eb15_ctrl uctrl_308 (
    .t_0_req(req308), .t_0_ack(ack308),
    .i_0_req(req308m), .i_0_ack(ack308m),
    .en0(en308_0), .en1(en308_1), .sel(sel308),
    .clk(clk), .reset_n(reset_n)
);


// edge:308 fork


assign req308_0 = req308m;

assign ack308m = ack308_0;



// edge:309 EB1.5
wire ack309m, req309m;
eb15_ctrl uctrl_309 (
    .t_0_req(req309), .t_0_ack(ack309),
    .i_0_req(req309m), .i_0_ack(ack309m),
    .en0(en309_0), .en1(en309_1), .sel(sel309),
    .clk(clk), .reset_n(reset_n)
);


// edge:309 fork


assign req309_0 = req309m;

assign ack309m = ack309_0;



// edge:310 EB1
wire ack310m;
reg req310m;
assign en310 = req310 & ack310;
assign ack310 = ~req310m | ack310m;
always @(posedge clk or negedge reset_n) if (~reset_n) req310m <= 1'b0; else req310m <= ~ack310 | req310;


// edge:310 fork


assign req310_0 = req310m;

assign ack310m = ack310_0;



// edge:311 EB1
wire ack311m;
reg req311m;
assign en311 = req311 & ack311;
assign ack311 = ~req311m | ack311m;
always @(posedge clk or negedge reset_n) if (~reset_n) req311m <= 1'b0; else req311m <= ~ack311 | req311;


// edge:311 fork


assign req311_0 = req311m;

assign ack311m = ack311_0;



// edge:312 EB0
wire ack312m, req312m;
assign req312m = req312;
assign ack312 = ack312m;


// edge:312 fork


assign req312_0 = req312m;

assign ack312m = ack312_0;



// edge:313 EB0
wire ack313m, req313m;
assign req313m = req313;
assign ack313 = ack313m;


// edge:313 fork


assign req313_0 = req313m;

assign ack313m = ack313_0;



// edge:314 EB0
wire ack314m, req314m;
assign req314m = req314;
assign ack314 = ack314m;


// edge:314 fork


assign req314_0 = req314m;

assign ack314m = ack314_0;



// edge:315 EB1.5
wire ack315m, req315m;
eb15_ctrl uctrl_315 (
    .t_0_req(req315), .t_0_ack(ack315),
    .i_0_req(req315m), .i_0_ack(ack315m),
    .en0(en315_0), .en1(en315_1), .sel(sel315),
    .clk(clk), .reset_n(reset_n)
);


// edge:315 fork


assign req315_0 = req315m;

assign ack315m = ack315_0;



// edge:316 EB1.5
wire ack316m, req316m;
eb15_ctrl uctrl_316 (
    .t_0_req(req316), .t_0_ack(ack316),
    .i_0_req(req316m), .i_0_ack(ack316m),
    .en0(en316_0), .en1(en316_1), .sel(sel316),
    .clk(clk), .reset_n(reset_n)
);


// edge:316 fork


assign req316_0 = req316m;

assign ack316m = ack316_0;



// edge:317 EB1
wire ack317m;
reg req317m;
assign en317 = req317 & ack317;
assign ack317 = ~req317m | ack317m;
always @(posedge clk or negedge reset_n) if (~reset_n) req317m <= 1'b0; else req317m <= ~ack317 | req317;


// edge:317 fork


assign req317_0 = req317m;

assign ack317m = ack317_0;



// edge:318 EB1
wire ack318m;
reg req318m;
assign en318 = req318 & ack318;
assign ack318 = ~req318m | ack318m;
always @(posedge clk or negedge reset_n) if (~reset_n) req318m <= 1'b0; else req318m <= ~ack318 | req318;


// edge:318 fork


assign req318_0 = req318m;

assign ack318m = ack318_0;



// edge:319 EB0
wire ack319m, req319m;
assign req319m = req319;
assign ack319 = ack319m;


// edge:319 fork


assign req319_0 = req319m;

assign ack319m = ack319_0;



// edge:320 EB0
wire ack320m, req320m;
assign req320m = req320;
assign ack320 = ack320m;


// edge:320 fork


assign req320_0 = req320m;

assign ack320m = ack320_0;



// edge:321 EB1.5
wire ack321m, req321m;
eb15_ctrl uctrl_321 (
    .t_0_req(req321), .t_0_ack(ack321),
    .i_0_req(req321m), .i_0_ack(ack321m),
    .en0(en321_0), .en1(en321_1), .sel(sel321),
    .clk(clk), .reset_n(reset_n)
);


// edge:321 fork


assign req321_0 = req321m;

assign ack321m = ack321_0;



// edge:322 EB1.5
wire ack322m, req322m;
eb15_ctrl uctrl_322 (
    .t_0_req(req322), .t_0_ack(ack322),
    .i_0_req(req322m), .i_0_ack(ack322m),
    .en0(en322_0), .en1(en322_1), .sel(sel322),
    .clk(clk), .reset_n(reset_n)
);


// edge:322 fork


assign req322_0 = req322m;

assign ack322m = ack322_0;



// edge:323 EB1
wire ack323m;
reg req323m;
assign en323 = req323 & ack323;
assign ack323 = ~req323m | ack323m;
always @(posedge clk or negedge reset_n) if (~reset_n) req323m <= 1'b0; else req323m <= ~ack323 | req323;


// edge:323 fork


assign req323_0 = req323m;

assign ack323m = ack323_0;



// edge:324 EB1
wire ack324m;
reg req324m;
assign en324 = req324 & ack324;
assign ack324 = ~req324m | ack324m;
always @(posedge clk or negedge reset_n) if (~reset_n) req324m <= 1'b0; else req324m <= ~ack324 | req324;


// edge:324 fork


assign req324_0 = req324m;

assign ack324m = ack324_0;



// edge:325 EB0
wire ack325m, req325m;
assign req325m = req325;
assign ack325 = ack325m;


// edge:325 fork


assign req325_0 = req325m;

assign ack325m = ack325_0;



// edge:326 EB0
wire ack326m, req326m;
assign req326m = req326;
assign ack326 = ack326m;


// edge:326 fork


assign req326_0 = req326m;

assign ack326m = ack326_0;



// edge:327 EB1.5
wire ack327m, req327m;
eb15_ctrl uctrl_327 (
    .t_0_req(req327), .t_0_ack(ack327),
    .i_0_req(req327m), .i_0_ack(ack327m),
    .en0(en327_0), .en1(en327_1), .sel(sel327),
    .clk(clk), .reset_n(reset_n)
);


// edge:327 fork


assign req327_0 = req327m;

assign ack327m = ack327_0;



// edge:328 EB1.5
wire ack328m, req328m;
eb15_ctrl uctrl_328 (
    .t_0_req(req328), .t_0_ack(ack328),
    .i_0_req(req328m), .i_0_ack(ack328m),
    .en0(en328_0), .en1(en328_1), .sel(sel328),
    .clk(clk), .reset_n(reset_n)
);


// edge:328 fork


assign req328_0 = req328m;

assign ack328m = ack328_0;



// edge:329 EB1
wire ack329m;
reg req329m;
assign en329 = req329 & ack329;
assign ack329 = ~req329m | ack329m;
always @(posedge clk or negedge reset_n) if (~reset_n) req329m <= 1'b0; else req329m <= ~ack329 | req329;


// edge:329 fork


assign req329_0 = req329m;

assign ack329m = ack329_0;



// edge:330 EB1
wire ack330m;
reg req330m;
assign en330 = req330 & ack330;
assign ack330 = ~req330m | ack330m;
always @(posedge clk or negedge reset_n) if (~reset_n) req330m <= 1'b0; else req330m <= ~ack330 | req330;


// edge:330 fork


assign req330_0 = req330m;

assign ack330m = ack330_0;



// edge:331 EB0
wire ack331m, req331m;
assign req331m = req331;
assign ack331 = ack331m;


// edge:331 fork


assign req331_0 = req331m;

assign ack331m = ack331_0;



// edge:332 EB0
wire ack332m, req332m;
assign req332m = req332;
assign ack332 = ack332m;


// edge:332 fork


assign req332_0 = req332m;

assign ack332m = ack332_0;



// edge:333 EB1.5
wire ack333m, req333m;
eb15_ctrl uctrl_333 (
    .t_0_req(req333), .t_0_ack(ack333),
    .i_0_req(req333m), .i_0_ack(ack333m),
    .en0(en333_0), .en1(en333_1), .sel(sel333),
    .clk(clk), .reset_n(reset_n)
);


// edge:333 fork


assign req333_0 = req333m;

assign ack333m = ack333_0;



// edge:334 EB1.5
wire ack334m, req334m;
eb15_ctrl uctrl_334 (
    .t_0_req(req334), .t_0_ack(ack334),
    .i_0_req(req334m), .i_0_ack(ack334m),
    .en0(en334_0), .en1(en334_1), .sel(sel334),
    .clk(clk), .reset_n(reset_n)
);


// edge:334 fork


assign req334_0 = req334m;

assign ack334m = ack334_0;



// edge:335 EB1
wire ack335m;
reg req335m;
assign en335 = req335 & ack335;
assign ack335 = ~req335m | ack335m;
always @(posedge clk or negedge reset_n) if (~reset_n) req335m <= 1'b0; else req335m <= ~ack335 | req335;


// edge:335 fork


assign req335_0 = req335m;

assign ack335m = ack335_0;



// edge:336 EB1
wire ack336m;
reg req336m;
assign en336 = req336 & ack336;
assign ack336 = ~req336m | ack336m;
always @(posedge clk or negedge reset_n) if (~reset_n) req336m <= 1'b0; else req336m <= ~ack336 | req336;


// edge:336 fork


assign req336_0 = req336m;

assign ack336m = ack336_0;



// edge:337 EB0
wire ack337m, req337m;
assign req337m = req337;
assign ack337 = ack337m;


// edge:337 fork


assign req337_0 = req337m;

assign ack337m = ack337_0;



// edge:338 EB0
wire ack338m, req338m;
assign req338m = req338;
assign ack338 = ack338m;


// edge:338 fork


assign req338_0 = req338m;

assign ack338m = ack338_0;



// edge:339 EB0
wire ack339m, req339m;
assign req339m = req339;
assign ack339 = ack339m;


// edge:339 fork


assign req339_0 = req339m;

assign ack339m = ack339_0;



// edge:340 EB1.5
wire ack340m, req340m;
eb15_ctrl uctrl_340 (
    .t_0_req(req340), .t_0_ack(ack340),
    .i_0_req(req340m), .i_0_ack(ack340m),
    .en0(en340_0), .en1(en340_1), .sel(sel340),
    .clk(clk), .reset_n(reset_n)
);


// edge:340 fork


assign req340_0 = req340m;

assign ack340m = ack340_0;



// edge:341 EB1
wire ack341m;
reg req341m;
assign en341 = req341 & ack341;
assign ack341 = ~req341m | ack341m;
always @(posedge clk or negedge reset_n) if (~reset_n) req341m <= 1'b0; else req341m <= ~ack341 | req341;


// edge:341 fork


assign req341_0 = req341m;

assign ack341m = ack341_0;



// edge:342 EB1
wire ack342m;
reg req342m;
assign en342 = req342 & ack342;
assign ack342 = ~req342m | ack342m;
always @(posedge clk or negedge reset_n) if (~reset_n) req342m <= 1'b0; else req342m <= ~ack342 | req342;


// edge:342 fork


assign req342_0 = req342m;

assign ack342m = ack342_0;



// edge:343 EB_FIFO
wire ack343m, req343m;
eb_fifo_ctrl #(
    .DEPTHMO(2'd3),
    .DEPTHLOG2MO(1)
) uctrl_343 (
    .t_0_req(req343), .t_0_ack(ack343),
    .i_0_req(req343m), .i_0_ack(ack343m),
    .wr_ptr(wr_ptr343),
    .rd_ptr(rd_ptr343),
    .wen(wen343),
    .ren(ren343),
    .clk(clk), .reset_n(reset_n)
);


// edge:343 fork


assign req343_0 = req343m;

assign ack343m = ack343_0;



// edge:344 EB_FIFO
wire ack344m, req344m;
eb_fifo_ctrl #(
    .DEPTHMO(1'd1),
    .DEPTHLOG2MO(0)
) uctrl_344 (
    .t_0_req(req344), .t_0_ack(ack344),
    .i_0_req(req344m), .i_0_ack(ack344m),
    .wr_ptr(wr_ptr344),
    .rd_ptr(rd_ptr344),
    .wen(wen344),
    .ren(ren344),
    .clk(clk), .reset_n(reset_n)
);


// edge:344 fork


assign req344_0 = req344m;

assign ack344m = ack344_0;



// edge:345 EB1
wire ack345m;
reg req345m;
assign en345 = req345 & ack345;
assign ack345 = ~req345m | ack345m;
always @(posedge clk or negedge reset_n) if (~reset_n) req345m <= 1'b0; else req345m <= ~ack345 | req345;


// edge:345 fork


assign req345_0 = req345m;

assign ack345m = ack345_0;



// edge:346 EB_FIFO
wire ack346m, req346m;
eb_fifo_ctrl #(
    .DEPTHMO(2'd3),
    .DEPTHLOG2MO(1)
) uctrl_346 (
    .t_0_req(req346), .t_0_ack(ack346),
    .i_0_req(req346m), .i_0_ack(ack346m),
    .wr_ptr(wr_ptr346),
    .rd_ptr(rd_ptr346),
    .wen(wen346),
    .ren(ren346),
    .clk(clk), .reset_n(reset_n)
);


// edge:346 fork


assign req346_0 = req346m;

assign ack346m = ack346_0;



// edge:347 EB_FIFO
wire ack347m, req347m;
eb_fifo_ctrl #(
    .DEPTHMO(2'd2),
    .DEPTHLOG2MO(1)
) uctrl_347 (
    .t_0_req(req347), .t_0_ack(ack347),
    .i_0_req(req347m), .i_0_ack(ack347m),
    .wr_ptr(wr_ptr347),
    .rd_ptr(rd_ptr347),
    .wen(wen347),
    .ren(ren347),
    .clk(clk), .reset_n(reset_n)
);


// edge:347 fork


assign req347_0 = req347m;

assign ack347m = ack347_0;



// edge:348 EB_FIFO
wire ack348m, req348m;
eb_fifo_ctrl #(
    .DEPTHMO(2'd2),
    .DEPTHLOG2MO(1)
) uctrl_348 (
    .t_0_req(req348), .t_0_ack(ack348),
    .i_0_req(req348m), .i_0_ack(ack348m),
    .wr_ptr(wr_ptr348),
    .rd_ptr(rd_ptr348),
    .wen(wen348),
    .ren(ren348),
    .clk(clk), .reset_n(reset_n)
);


// edge:348 fork


assign req348_0 = req348m;

assign ack348m = ack348_0;



// edge:349 EB1.5
wire ack349m, req349m;
eb15_ctrl uctrl_349 (
    .t_0_req(req349), .t_0_ack(ack349),
    .i_0_req(req349m), .i_0_ack(ack349m),
    .en0(en349_0), .en1(en349_1), .sel(sel349),
    .clk(clk), .reset_n(reset_n)
);


// edge:349 fork


assign req349_0 = req349m;

assign ack349m = ack349_0;



// edge:350 EB1.5
wire ack350m, req350m;
eb15_ctrl uctrl_350 (
    .t_0_req(req350), .t_0_ack(ack350),
    .i_0_req(req350m), .i_0_ack(ack350m),
    .en0(en350_0), .en1(en350_1), .sel(sel350),
    .clk(clk), .reset_n(reset_n)
);


// edge:350 fork


assign req350_0 = req350m;

assign ack350m = ack350_0;



// edge:351 EB1.5
wire ack351m, req351m;
eb15_ctrl uctrl_351 (
    .t_0_req(req351), .t_0_ack(ack351),
    .i_0_req(req351m), .i_0_ack(ack351m),
    .en0(en351_0), .en1(en351_1), .sel(sel351),
    .clk(clk), .reset_n(reset_n)
);


// edge:351 fork


assign req351_0 = req351m;

assign ack351m = ack351_0;



// edge:352 EB1.5
wire ack352m, req352m;
eb15_ctrl uctrl_352 (
    .t_0_req(req352), .t_0_ack(ack352),
    .i_0_req(req352m), .i_0_ack(ack352m),
    .en0(en352_0), .en1(en352_1), .sel(sel352),
    .clk(clk), .reset_n(reset_n)
);


// edge:352 fork


assign req352_0 = req352m;

assign ack352m = ack352_0;



// edge:353 EB1.5
wire ack353m, req353m;
eb15_ctrl uctrl_353 (
    .t_0_req(req353), .t_0_ack(ack353),
    .i_0_req(req353m), .i_0_ack(ack353m),
    .en0(en353_0), .en1(en353_1), .sel(sel353),
    .clk(clk), .reset_n(reset_n)
);


// edge:353 fork


assign req353_0 = req353m;

assign ack353m = ack353_0;



// edge:354 EB1.7
wire ack354m, req354m;
eb17_ctrl uctrl_354 (
    .t_0_req(req354), .t_0_ack(ack354),
    .i_0_req(req354m), .i_0_ack(ack354m),
    .en0(en354_0), .en1(en354_1), .sel(sel354),
    .clk(clk), .reset_n(reset_n)
);


// edge:354 fork


assign req354_0 = req354m;

assign ack354m = ack354_0;



// edge:355 EB1.7
wire ack355m, req355m;
eb17_ctrl uctrl_355 (
    .t_0_req(req355), .t_0_ack(ack355),
    .i_0_req(req355m), .i_0_ack(ack355m),
    .en0(en355_0), .en1(en355_1), .sel(sel355),
    .clk(clk), .reset_n(reset_n)
);


// edge:355 fork


assign req355_0 = req355m;

assign ack355m = ack355_0;



// edge:356 EB1
wire ack356m;
reg req356m;
assign en356 = req356 & ack356;
assign ack356 = ~req356m | ack356m;
always @(posedge clk or negedge reset_n) if (~reset_n) req356m <= 1'b0; else req356m <= ~ack356 | req356;


// edge:356 fork


assign req356_0 = req356m;

assign ack356m = ack356_0;



// edge:357 EB1.7
wire ack357m, req357m;
eb17_ctrl uctrl_357 (
    .t_0_req(req357), .t_0_ack(ack357),
    .i_0_req(req357m), .i_0_ack(ack357m),
    .en0(en357_0), .en1(en357_1), .sel(sel357),
    .clk(clk), .reset_n(reset_n)
);


// edge:357 fork


assign req357_0 = req357m;

assign ack357m = ack357_0;



// edge:358 EB1
wire ack358m;
reg req358m;
assign en358 = req358 & ack358;
assign ack358 = ~req358m | ack358m;
always @(posedge clk or negedge reset_n) if (~reset_n) req358m <= 1'b0; else req358m <= ~ack358 | req358;


// edge:358 fork


assign req358_0 = req358m;

assign ack358m = ack358_0;



// edge:359 EB1.7
wire ack359m, req359m;
eb17_ctrl uctrl_359 (
    .t_0_req(req359), .t_0_ack(ack359),
    .i_0_req(req359m), .i_0_ack(ack359m),
    .en0(en359_0), .en1(en359_1), .sel(sel359),
    .clk(clk), .reset_n(reset_n)
);


// edge:359 fork


assign req359_0 = req359m;

assign ack359m = ack359_0;


// node:1 join undefined
assign req1 = req0_0;
assign ack0_0 = ack1;
// node:2 join undefined
assign req2 = req0_1;
assign ack0_1 = ack2;
// node:3 join undefined
assign req3 = req1_0;
assign ack1_0 = ack3;
// node:4 join undefined
assign req4 = req1_1;
assign ack1_1 = ack4;
// node:5 join undefined
assign req5 = req2_0;
assign ack2_0 = ack5;
// node:6 join undefined
assign req6 = req2_1;
assign ack2_1 = ack6;
// node:7 join undefined
assign req7 = req3_0;
assign ack3_0 = ack7;
// node:8 join undefined
assign req10 = req3_1;
assign ack3_1 = ack10;
// node:9 join undefined
assign req13 = req4_0;
assign ack4_0 = ack13;
// node:10 join undefined
assign req16 = req4_1;
assign ack4_1 = ack16;
// node:11 join undefined
assign req19 = req5_0;
assign ack5_0 = ack19;
// node:12 join undefined
assign req22 = req5_1;
assign ack5_1 = ack22;
// node:13 join undefined
assign req25 = req6_0;
assign ack6_0 = ack25;
// node:14 join undefined
assign req28 = req6_1;
assign ack6_1 = ack28;
// node:17 join undefined
assign req351 = req350_0;
assign ack350_0 = ack351;
// node:22 join undefined
assign req356 = req355_0;
assign ack355_0 = ack356;
// node:24 join undefined
assign req358 = req357_0;
assign ack357_0 = ack358;
// node:26 custom controller vector
vector_ctrl_17_2 unode26 (
    .t_instr_0_req(req8_0),
    .t_instr_0_ack(ack8_0),
    .t_instr_1_req(req9_0),
    .t_instr_1_ack(ack9_0),
    .t_instr_2_req(req11_0),
    .t_instr_2_ack(ack11_0),
    .t_instr_3_req(req12_0),
    .t_instr_3_ack(ack12_0),
    .t_instr_4_req(req14_0),
    .t_instr_4_ack(ack14_0),
    .t_instr_5_req(req15_0),
    .t_instr_5_ack(ack15_0),
    .t_instr_6_req(req17_0),
    .t_instr_6_ack(ack17_0),
    .t_instr_7_req(req18_0),
    .t_instr_7_ack(ack18_0),
    .t_instr_8_req(req20_0),
    .t_instr_8_ack(ack20_0),
    .t_instr_9_req(req21_0),
    .t_instr_9_ack(ack21_0),
    .t_instr_10_req(req23_0),
    .t_instr_10_ack(ack23_0),
    .t_instr_11_req(req24_0),
    .t_instr_11_ack(ack24_0),
    .t_instr_12_req(req26_0),
    .t_instr_12_ack(ack26_0),
    .t_instr_13_req(req27_0),
    .t_instr_13_ack(ack27_0),
    .t_instr_14_req(req29_0),
    .t_instr_14_ack(ack29_0),
    .t_instr_15_req(req30_0),
    .t_instr_15_ack(ack30_0),
    .t_k15_req(req37_0),
    .t_k15_ack(ack37_0),
    .i_k15_req(req31),
    .i_k15_ack(ack31),
    .i_kap_req(req340),
    .i_kap_ack(ack340),
    .instr_0_valid(instr_0_valid26),
    .instr_0_ready(instr_0_ready26),
    .instr_1_valid(instr_1_valid26),
    .instr_1_ready(instr_1_ready26),
    .instr_2_valid(instr_2_valid26),
    .instr_2_ready(instr_2_ready26),
    .instr_3_valid(instr_3_valid26),
    .instr_3_ready(instr_3_ready26),
    .instr_4_valid(instr_4_valid26),
    .instr_4_ready(instr_4_ready26),
    .instr_5_valid(instr_5_valid26),
    .instr_5_ready(instr_5_ready26),
    .instr_6_valid(instr_6_valid26),
    .instr_6_ready(instr_6_ready26),
    .instr_7_valid(instr_7_valid26),
    .instr_7_ready(instr_7_ready26),
    .instr_8_valid(instr_8_valid26),
    .instr_8_ready(instr_8_ready26),
    .instr_9_valid(instr_9_valid26),
    .instr_9_ready(instr_9_ready26),
    .instr_10_valid(instr_10_valid26),
    .instr_10_ready(instr_10_ready26),
    .instr_11_valid(instr_11_valid26),
    .instr_11_ready(instr_11_ready26),
    .instr_12_valid(instr_12_valid26),
    .instr_12_ready(instr_12_ready26),
    .instr_13_valid(instr_13_valid26),
    .instr_13_ready(instr_13_ready26),
    .instr_14_valid(instr_14_valid26),
    .instr_14_ready(instr_14_ready26),
    .instr_15_valid(instr_15_valid26),
    .instr_15_ready(instr_15_ready26),
    .tk15_valid(tk15_valid26),
    .tk15_ready(tk15_ready26),
    .ik15_valid(ik15_valid26),
    .ik15_ready(ik15_ready26),
    .kap_valid(kap_valid26),
    .kap_ready(kap_ready26),
    .clk(clk),
    .reset_n(reset_n));

// node:27 custom controller inmux
inmux_ctrl_4_1 unode27 (
    .t_k15_req(req31_0),
    .t_k15_ack(ack31_0),
    .t_k13_req(req41_0),
    .t_k13_ack(ack41_0),
    .t_k1_req(req42_0),
    .t_k1_ack(ack42_0),
    .t_c_req(req344_0),
    .t_c_ack(ack344_0),
    .i_inmux_req(req32),
    .i_inmux_ack(ack32),
    .sel(sel2750),
    .clk(clk),
    .reset_n(reset_n));

// node:28 custom controller vmem
vmem_ctrl_6_5 unode28 (
    .t_ivs_req(req33_0),
    .t_ivs_ack(ack33_0),
    .t_ka_req(req343_0),
    .t_ka_ack(ack343_0),
    .t_idma_0_req(req349_0),
    .t_idma_0_ack(ack349_0),
    .t_idma_1_req(req351_0),
    .t_idma_1_ack(ack351_0),
    .t_idma_2_req(req352_0),
    .t_idma_2_ack(ack352_0),
    .t_idma_3_req(req353_0),
    .t_idma_3_ack(ack353_0),
    .i_ovs_req(req34),
    .i_ovs_ack(ack34),
    .i_odma_0_req(req354),
    .i_odma_0_ack(ack354),
    .i_odma_1_req(req355),
    .i_odma_1_ack(ack355),
    .i_odma_2_req(req357),
    .i_odma_2_ack(ack357),
    .i_odma_3_req(req359),
    .i_odma_3_ack(ack359),
    .idma_valid(idma_valid28),
    .idma_ready(idma_ready28),
    .odma_valid(odma_valid28),
    .odma_ready(odma_ready28),
    .tvs_valid(tvs_valid28),
    .tvs_ready(tvs_ready28),
    .ivs_valid(ivs_valid28),
    .ivs_ready(ivs_ready28),
    .k_ctrl(k_ctrl28),
    .clk(clk),
    .reset_n(reset_n));

// node:29 custom controller oumux
oumux_ctrl_2_5 unode29 (
    .t_oumux_req(req36_0),
    .t_oumux_ack(ack36_0),
    .t_c_req(req346_0),
    .t_c_ack(ack346_0),
    .i_k15_req(req37),
    .i_k15_ack(ack37),
    .i_k8_req(req38),
    .i_k8_ack(ack38),
    .i_k9_req(req39),
    .i_k9_ack(ack39),
    .i_k14_req(req40),
    .i_k14_ack(ack40),
    .i_k13_req(req41),
    .i_k13_ack(ack41),
    .sel(sel2950),
    .clk(clk),
    .reset_n(reset_n));

// node:30 fork controller;
reg    req341_reg, req342_reg;
assign req341 = req340_0 & ~req341_reg;
assign req342 = req340_0 & ~req342_reg;
wire   ack341_g, ack342_g;
assign ack341_g = ack341 | ~req341;
assign ack342_g = ack342 | ~req342;
assign ack340_0 = ack341_g & ack342_g;
always @(posedge clk or negedge reset_n) if (~reset_n) req341_reg <= 1'b0; else req341_reg <= ack341_g & ~ack340_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req342_reg <= 1'b0; else req342_reg <= ack342_g & ~ack340_0;

// node:31 join perm_full_addr
assign req345 = req341_0;
assign ack341_0 = ack345;
// node:32 join perm_full_data
assign req33 = req32_0 & req347_0;
assign ack32_0 = ack33 & req347_0;
assign ack347_0 = ack33 & req32_0;
// node:33 join perm_full_data
assign req36 = req35_0 & req348_0;
assign ack35_0 = ack36 & req348_0;
assign ack348_0 = ack36 & req35_0;
// node:34 custom controller ka_decode
ka_decode_ctrl_1_3 unode34 (
    .t_ka_req(req342_0),
    .t_ka_ack(ack342_0),
    .i_ka_req(req343),
    .i_ka_ack(ack343),
    .i_k_sk_req(req344),
    .i_k_sk_ack(ack344),
    .i_k_lk_req(req346),
    .i_k_lk_ack(ack346),
    .k_ctrl(k_ctrl34),
    .clk(clk),
    .reset_n(reset_n));

// node:35 custom controller p_decode
p_decode_ctrl_1_2 unode35 (
    .t_kp_req(req345_0),
    .t_kp_ack(ack345_0),
    .i_p_sk_req(req347),
    .i_p_sk_ack(ack347),
    .i_p_lk_req(req348),
    .i_p_lk_ack(ack348),
    .k_ctrl(k_ctrl35),
    .clk(clk),
    .reset_n(reset_n));

// node:36 join undefined
assign req35 = req34_0;
assign ack34_0 = ack35;
// node:37 join undefined
assign req8 = req7_0;
assign ack7_0 = ack8;
// node:38 join undefined
assign req9 = req7_1;
assign ack7_1 = ack9;
// node:39 join undefined
assign req11 = req10_0;
assign ack10_0 = ack11;
// node:40 join undefined
assign req12 = req10_1;
assign ack10_1 = ack12;
// node:41 join undefined
assign req14 = req13_0;
assign ack13_0 = ack14;
// node:42 join undefined
assign req15 = req13_1;
assign ack13_1 = ack15;
// node:43 join undefined
assign req17 = req16_0;
assign ack16_0 = ack17;
// node:44 join undefined
assign req18 = req16_1;
assign ack16_1 = ack18;
// node:45 join undefined
assign req20 = req19_0;
assign ack19_0 = ack20;
// node:46 join undefined
assign req21 = req19_1;
assign ack19_1 = ack21;
// node:47 join undefined
assign req23 = req22_0;
assign ack22_0 = ack23;
// node:48 join undefined
assign req24 = req22_1;
assign ack22_1 = ack24;
// node:49 join undefined
assign req26 = req25_0;
assign ack25_0 = ack26;
// node:50 join undefined
assign req27 = req25_1;
assign ack25_1 = ack27;
// node:51 join undefined
assign req29 = req28_0;
assign ack28_0 = ack29;
// node:52 join undefined
assign req30 = req28_1;
assign ack28_1 = ack30;
// node:53 custom controller funnel
funnel_ctrl_2_2 unode53 (
    .t_0_req(req38_0),
    .t_0_ack(ack38_0),
    .t_cfg_req(req337_0),
    .t_cfg_ack(ack337_0),
    .i_0_req(req43),
    .i_0_ack(ack43),
    .i_1_req(req133),
    .i_1_ack(ack133),
    .sel(nsel53),
    .mode(nmode53),
    .clk(clk),
    .reset_n(reset_n));

// node:54 custom controller funnel
funnel_ctrl_2_2 unode54 (
    .t_0_req(req39_0),
    .t_0_ack(ack39_0),
    .t_cfg_req(req338_0),
    .t_cfg_ack(ack338_0),
    .i_0_req(req44),
    .i_0_ack(ack44),
    .i_1_req(req134),
    .i_1_ack(ack134),
    .sel(nsel54),
    .mode(nmode54),
    .clk(clk),
    .reset_n(reset_n));

// node:55 custom controller defunnel
defunnel_ctrl_3_1 unode55 (
    .t_0_req(req287_0),
    .t_0_ack(ack287_0),
    .t_1_req(req312_0),
    .t_1_ack(ack312_0),
    .t_cfg_req(req339_0),
    .t_cfg_ack(ack339_0),
    .i_0_req(req42),
    .i_0_ack(ack42),
    .enable(enable55),
    .mode(mode55),
    .clk(clk),
    .reset_n(reset_n));

// node:56 fork controller;
reg    req61_reg, req63_reg, req65_reg, req67_reg, req69_reg, req71_reg, req75_reg, req77_reg, req79_reg, req81_reg, req83_reg, req85_reg, req87_reg, req89_reg, req93_reg, req95_reg, req97_reg, req99_reg, req101_reg, req103_reg, req105_reg, req107_reg, req111_reg, req113_reg, req115_reg, req117_reg, req119_reg, req121_reg, req123_reg, req125_reg, req129_reg, req131_reg, req151_reg, req153_reg, req155_reg, req157_reg, req159_reg, req161_reg, req165_reg, req167_reg, req169_reg, req171_reg, req173_reg, req175_reg, req177_reg, req179_reg, req183_reg, req185_reg, req187_reg, req189_reg, req191_reg, req193_reg, req195_reg, req197_reg, req201_reg, req203_reg, req205_reg, req207_reg, req209_reg, req211_reg, req213_reg, req215_reg, req219_reg, req221_reg, req239_reg, req240_reg, req243_reg, req244_reg, req247_reg, req248_reg, req251_reg, req252_reg, req271_reg, req272_reg, req275_reg, req276_reg, req279_reg, req280_reg, req283_reg, req284_reg, req288_reg, req289_reg, req294_reg, req295_reg, req300_reg, req301_reg, req306_reg, req307_reg, req313_reg, req314_reg, req319_reg, req320_reg, req325_reg, req326_reg, req331_reg, req332_reg, req337_reg, req338_reg, req339_reg;
assign req61 = req40_0 & ~req61_reg;
assign req63 = req40_0 & ~req63_reg;
assign req65 = req40_0 & ~req65_reg;
assign req67 = req40_0 & ~req67_reg;
assign req69 = req40_0 & ~req69_reg;
assign req71 = req40_0 & ~req71_reg;
assign req75 = req40_0 & ~req75_reg;
assign req77 = req40_0 & ~req77_reg;
assign req79 = req40_0 & ~req79_reg;
assign req81 = req40_0 & ~req81_reg;
assign req83 = req40_0 & ~req83_reg;
assign req85 = req40_0 & ~req85_reg;
assign req87 = req40_0 & ~req87_reg;
assign req89 = req40_0 & ~req89_reg;
assign req93 = req40_0 & ~req93_reg;
assign req95 = req40_0 & ~req95_reg;
assign req97 = req40_0 & ~req97_reg;
assign req99 = req40_0 & ~req99_reg;
assign req101 = req40_0 & ~req101_reg;
assign req103 = req40_0 & ~req103_reg;
assign req105 = req40_0 & ~req105_reg;
assign req107 = req40_0 & ~req107_reg;
assign req111 = req40_0 & ~req111_reg;
assign req113 = req40_0 & ~req113_reg;
assign req115 = req40_0 & ~req115_reg;
assign req117 = req40_0 & ~req117_reg;
assign req119 = req40_0 & ~req119_reg;
assign req121 = req40_0 & ~req121_reg;
assign req123 = req40_0 & ~req123_reg;
assign req125 = req40_0 & ~req125_reg;
assign req129 = req40_0 & ~req129_reg;
assign req131 = req40_0 & ~req131_reg;
assign req151 = req40_0 & ~req151_reg;
assign req153 = req40_0 & ~req153_reg;
assign req155 = req40_0 & ~req155_reg;
assign req157 = req40_0 & ~req157_reg;
assign req159 = req40_0 & ~req159_reg;
assign req161 = req40_0 & ~req161_reg;
assign req165 = req40_0 & ~req165_reg;
assign req167 = req40_0 & ~req167_reg;
assign req169 = req40_0 & ~req169_reg;
assign req171 = req40_0 & ~req171_reg;
assign req173 = req40_0 & ~req173_reg;
assign req175 = req40_0 & ~req175_reg;
assign req177 = req40_0 & ~req177_reg;
assign req179 = req40_0 & ~req179_reg;
assign req183 = req40_0 & ~req183_reg;
assign req185 = req40_0 & ~req185_reg;
assign req187 = req40_0 & ~req187_reg;
assign req189 = req40_0 & ~req189_reg;
assign req191 = req40_0 & ~req191_reg;
assign req193 = req40_0 & ~req193_reg;
assign req195 = req40_0 & ~req195_reg;
assign req197 = req40_0 & ~req197_reg;
assign req201 = req40_0 & ~req201_reg;
assign req203 = req40_0 & ~req203_reg;
assign req205 = req40_0 & ~req205_reg;
assign req207 = req40_0 & ~req207_reg;
assign req209 = req40_0 & ~req209_reg;
assign req211 = req40_0 & ~req211_reg;
assign req213 = req40_0 & ~req213_reg;
assign req215 = req40_0 & ~req215_reg;
assign req219 = req40_0 & ~req219_reg;
assign req221 = req40_0 & ~req221_reg;
assign req239 = req40_0 & ~req239_reg;
assign req240 = req40_0 & ~req240_reg;
assign req243 = req40_0 & ~req243_reg;
assign req244 = req40_0 & ~req244_reg;
assign req247 = req40_0 & ~req247_reg;
assign req248 = req40_0 & ~req248_reg;
assign req251 = req40_0 & ~req251_reg;
assign req252 = req40_0 & ~req252_reg;
assign req271 = req40_0 & ~req271_reg;
assign req272 = req40_0 & ~req272_reg;
assign req275 = req40_0 & ~req275_reg;
assign req276 = req40_0 & ~req276_reg;
assign req279 = req40_0 & ~req279_reg;
assign req280 = req40_0 & ~req280_reg;
assign req283 = req40_0 & ~req283_reg;
assign req284 = req40_0 & ~req284_reg;
assign req288 = req40_0 & ~req288_reg;
assign req289 = req40_0 & ~req289_reg;
assign req294 = req40_0 & ~req294_reg;
assign req295 = req40_0 & ~req295_reg;
assign req300 = req40_0 & ~req300_reg;
assign req301 = req40_0 & ~req301_reg;
assign req306 = req40_0 & ~req306_reg;
assign req307 = req40_0 & ~req307_reg;
assign req313 = req40_0 & ~req313_reg;
assign req314 = req40_0 & ~req314_reg;
assign req319 = req40_0 & ~req319_reg;
assign req320 = req40_0 & ~req320_reg;
assign req325 = req40_0 & ~req325_reg;
assign req326 = req40_0 & ~req326_reg;
assign req331 = req40_0 & ~req331_reg;
assign req332 = req40_0 & ~req332_reg;
assign req337 = req40_0 & ~req337_reg;
assign req338 = req40_0 & ~req338_reg;
assign req339 = req40_0 & ~req339_reg;
wire   ack61_g, ack63_g, ack65_g, ack67_g, ack69_g, ack71_g, ack75_g, ack77_g, ack79_g, ack81_g, ack83_g, ack85_g, ack87_g, ack89_g, ack93_g, ack95_g, ack97_g, ack99_g, ack101_g, ack103_g, ack105_g, ack107_g, ack111_g, ack113_g, ack115_g, ack117_g, ack119_g, ack121_g, ack123_g, ack125_g, ack129_g, ack131_g, ack151_g, ack153_g, ack155_g, ack157_g, ack159_g, ack161_g, ack165_g, ack167_g, ack169_g, ack171_g, ack173_g, ack175_g, ack177_g, ack179_g, ack183_g, ack185_g, ack187_g, ack189_g, ack191_g, ack193_g, ack195_g, ack197_g, ack201_g, ack203_g, ack205_g, ack207_g, ack209_g, ack211_g, ack213_g, ack215_g, ack219_g, ack221_g, ack239_g, ack240_g, ack243_g, ack244_g, ack247_g, ack248_g, ack251_g, ack252_g, ack271_g, ack272_g, ack275_g, ack276_g, ack279_g, ack280_g, ack283_g, ack284_g, ack288_g, ack289_g, ack294_g, ack295_g, ack300_g, ack301_g, ack306_g, ack307_g, ack313_g, ack314_g, ack319_g, ack320_g, ack325_g, ack326_g, ack331_g, ack332_g, ack337_g, ack338_g, ack339_g;
assign ack61_g = ack61 | ~req61;
assign ack63_g = ack63 | ~req63;
assign ack65_g = ack65 | ~req65;
assign ack67_g = ack67 | ~req67;
assign ack69_g = ack69 | ~req69;
assign ack71_g = ack71 | ~req71;
assign ack75_g = ack75 | ~req75;
assign ack77_g = ack77 | ~req77;
assign ack79_g = ack79 | ~req79;
assign ack81_g = ack81 | ~req81;
assign ack83_g = ack83 | ~req83;
assign ack85_g = ack85 | ~req85;
assign ack87_g = ack87 | ~req87;
assign ack89_g = ack89 | ~req89;
assign ack93_g = ack93 | ~req93;
assign ack95_g = ack95 | ~req95;
assign ack97_g = ack97 | ~req97;
assign ack99_g = ack99 | ~req99;
assign ack101_g = ack101 | ~req101;
assign ack103_g = ack103 | ~req103;
assign ack105_g = ack105 | ~req105;
assign ack107_g = ack107 | ~req107;
assign ack111_g = ack111 | ~req111;
assign ack113_g = ack113 | ~req113;
assign ack115_g = ack115 | ~req115;
assign ack117_g = ack117 | ~req117;
assign ack119_g = ack119 | ~req119;
assign ack121_g = ack121 | ~req121;
assign ack123_g = ack123 | ~req123;
assign ack125_g = ack125 | ~req125;
assign ack129_g = ack129 | ~req129;
assign ack131_g = ack131 | ~req131;
assign ack151_g = ack151 | ~req151;
assign ack153_g = ack153 | ~req153;
assign ack155_g = ack155 | ~req155;
assign ack157_g = ack157 | ~req157;
assign ack159_g = ack159 | ~req159;
assign ack161_g = ack161 | ~req161;
assign ack165_g = ack165 | ~req165;
assign ack167_g = ack167 | ~req167;
assign ack169_g = ack169 | ~req169;
assign ack171_g = ack171 | ~req171;
assign ack173_g = ack173 | ~req173;
assign ack175_g = ack175 | ~req175;
assign ack177_g = ack177 | ~req177;
assign ack179_g = ack179 | ~req179;
assign ack183_g = ack183 | ~req183;
assign ack185_g = ack185 | ~req185;
assign ack187_g = ack187 | ~req187;
assign ack189_g = ack189 | ~req189;
assign ack191_g = ack191 | ~req191;
assign ack193_g = ack193 | ~req193;
assign ack195_g = ack195 | ~req195;
assign ack197_g = ack197 | ~req197;
assign ack201_g = ack201 | ~req201;
assign ack203_g = ack203 | ~req203;
assign ack205_g = ack205 | ~req205;
assign ack207_g = ack207 | ~req207;
assign ack209_g = ack209 | ~req209;
assign ack211_g = ack211 | ~req211;
assign ack213_g = ack213 | ~req213;
assign ack215_g = ack215 | ~req215;
assign ack219_g = ack219 | ~req219;
assign ack221_g = ack221 | ~req221;
assign ack239_g = ack239 | ~req239;
assign ack240_g = ack240 | ~req240;
assign ack243_g = ack243 | ~req243;
assign ack244_g = ack244 | ~req244;
assign ack247_g = ack247 | ~req247;
assign ack248_g = ack248 | ~req248;
assign ack251_g = ack251 | ~req251;
assign ack252_g = ack252 | ~req252;
assign ack271_g = ack271 | ~req271;
assign ack272_g = ack272 | ~req272;
assign ack275_g = ack275 | ~req275;
assign ack276_g = ack276 | ~req276;
assign ack279_g = ack279 | ~req279;
assign ack280_g = ack280 | ~req280;
assign ack283_g = ack283 | ~req283;
assign ack284_g = ack284 | ~req284;
assign ack288_g = ack288 | ~req288;
assign ack289_g = ack289 | ~req289;
assign ack294_g = ack294 | ~req294;
assign ack295_g = ack295 | ~req295;
assign ack300_g = ack300 | ~req300;
assign ack301_g = ack301 | ~req301;
assign ack306_g = ack306 | ~req306;
assign ack307_g = ack307 | ~req307;
assign ack313_g = ack313 | ~req313;
assign ack314_g = ack314 | ~req314;
assign ack319_g = ack319 | ~req319;
assign ack320_g = ack320 | ~req320;
assign ack325_g = ack325 | ~req325;
assign ack326_g = ack326 | ~req326;
assign ack331_g = ack331 | ~req331;
assign ack332_g = ack332 | ~req332;
assign ack337_g = ack337 | ~req337;
assign ack338_g = ack338 | ~req338;
assign ack339_g = ack339 | ~req339;
assign ack40_0 = ack61_g & ack63_g & ack65_g & ack67_g & ack69_g & ack71_g & ack75_g & ack77_g & ack79_g & ack81_g & ack83_g & ack85_g & ack87_g & ack89_g & ack93_g & ack95_g & ack97_g & ack99_g & ack101_g & ack103_g & ack105_g & ack107_g & ack111_g & ack113_g & ack115_g & ack117_g & ack119_g & ack121_g & ack123_g & ack125_g & ack129_g & ack131_g & ack151_g & ack153_g & ack155_g & ack157_g & ack159_g & ack161_g & ack165_g & ack167_g & ack169_g & ack171_g & ack173_g & ack175_g & ack177_g & ack179_g & ack183_g & ack185_g & ack187_g & ack189_g & ack191_g & ack193_g & ack195_g & ack197_g & ack201_g & ack203_g & ack205_g & ack207_g & ack209_g & ack211_g & ack213_g & ack215_g & ack219_g & ack221_g & ack239_g & ack240_g & ack243_g & ack244_g & ack247_g & ack248_g & ack251_g & ack252_g & ack271_g & ack272_g & ack275_g & ack276_g & ack279_g & ack280_g & ack283_g & ack284_g & ack288_g & ack289_g & ack294_g & ack295_g & ack300_g & ack301_g & ack306_g & ack307_g & ack313_g & ack314_g & ack319_g & ack320_g & ack325_g & ack326_g & ack331_g & ack332_g & ack337_g & ack338_g & ack339_g;
always @(posedge clk or negedge reset_n) if (~reset_n) req61_reg <= 1'b0; else req61_reg <= ack61_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req63_reg <= 1'b0; else req63_reg <= ack63_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req65_reg <= 1'b0; else req65_reg <= ack65_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req67_reg <= 1'b0; else req67_reg <= ack67_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req69_reg <= 1'b0; else req69_reg <= ack69_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req71_reg <= 1'b0; else req71_reg <= ack71_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req75_reg <= 1'b0; else req75_reg <= ack75_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req77_reg <= 1'b0; else req77_reg <= ack77_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req79_reg <= 1'b0; else req79_reg <= ack79_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req81_reg <= 1'b0; else req81_reg <= ack81_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req83_reg <= 1'b0; else req83_reg <= ack83_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req85_reg <= 1'b0; else req85_reg <= ack85_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req87_reg <= 1'b0; else req87_reg <= ack87_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req89_reg <= 1'b0; else req89_reg <= ack89_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req93_reg <= 1'b0; else req93_reg <= ack93_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req95_reg <= 1'b0; else req95_reg <= ack95_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req97_reg <= 1'b0; else req97_reg <= ack97_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req99_reg <= 1'b0; else req99_reg <= ack99_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req101_reg <= 1'b0; else req101_reg <= ack101_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req103_reg <= 1'b0; else req103_reg <= ack103_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req105_reg <= 1'b0; else req105_reg <= ack105_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req107_reg <= 1'b0; else req107_reg <= ack107_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req111_reg <= 1'b0; else req111_reg <= ack111_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req113_reg <= 1'b0; else req113_reg <= ack113_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req115_reg <= 1'b0; else req115_reg <= ack115_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req117_reg <= 1'b0; else req117_reg <= ack117_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req119_reg <= 1'b0; else req119_reg <= ack119_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req121_reg <= 1'b0; else req121_reg <= ack121_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req123_reg <= 1'b0; else req123_reg <= ack123_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req125_reg <= 1'b0; else req125_reg <= ack125_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req129_reg <= 1'b0; else req129_reg <= ack129_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req131_reg <= 1'b0; else req131_reg <= ack131_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req151_reg <= 1'b0; else req151_reg <= ack151_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req153_reg <= 1'b0; else req153_reg <= ack153_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req155_reg <= 1'b0; else req155_reg <= ack155_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req157_reg <= 1'b0; else req157_reg <= ack157_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req159_reg <= 1'b0; else req159_reg <= ack159_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req161_reg <= 1'b0; else req161_reg <= ack161_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req165_reg <= 1'b0; else req165_reg <= ack165_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req167_reg <= 1'b0; else req167_reg <= ack167_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req169_reg <= 1'b0; else req169_reg <= ack169_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req171_reg <= 1'b0; else req171_reg <= ack171_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req173_reg <= 1'b0; else req173_reg <= ack173_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req175_reg <= 1'b0; else req175_reg <= ack175_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req177_reg <= 1'b0; else req177_reg <= ack177_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req179_reg <= 1'b0; else req179_reg <= ack179_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req183_reg <= 1'b0; else req183_reg <= ack183_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req185_reg <= 1'b0; else req185_reg <= ack185_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req187_reg <= 1'b0; else req187_reg <= ack187_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req189_reg <= 1'b0; else req189_reg <= ack189_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req191_reg <= 1'b0; else req191_reg <= ack191_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req193_reg <= 1'b0; else req193_reg <= ack193_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req195_reg <= 1'b0; else req195_reg <= ack195_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req197_reg <= 1'b0; else req197_reg <= ack197_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req201_reg <= 1'b0; else req201_reg <= ack201_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req203_reg <= 1'b0; else req203_reg <= ack203_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req205_reg <= 1'b0; else req205_reg <= ack205_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req207_reg <= 1'b0; else req207_reg <= ack207_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req209_reg <= 1'b0; else req209_reg <= ack209_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req211_reg <= 1'b0; else req211_reg <= ack211_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req213_reg <= 1'b0; else req213_reg <= ack213_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req215_reg <= 1'b0; else req215_reg <= ack215_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req219_reg <= 1'b0; else req219_reg <= ack219_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req221_reg <= 1'b0; else req221_reg <= ack221_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req239_reg <= 1'b0; else req239_reg <= ack239_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req240_reg <= 1'b0; else req240_reg <= ack240_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req243_reg <= 1'b0; else req243_reg <= ack243_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req244_reg <= 1'b0; else req244_reg <= ack244_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req247_reg <= 1'b0; else req247_reg <= ack247_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req248_reg <= 1'b0; else req248_reg <= ack248_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req251_reg <= 1'b0; else req251_reg <= ack251_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req252_reg <= 1'b0; else req252_reg <= ack252_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req271_reg <= 1'b0; else req271_reg <= ack271_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req272_reg <= 1'b0; else req272_reg <= ack272_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req275_reg <= 1'b0; else req275_reg <= ack275_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req276_reg <= 1'b0; else req276_reg <= ack276_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req279_reg <= 1'b0; else req279_reg <= ack279_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req280_reg <= 1'b0; else req280_reg <= ack280_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req283_reg <= 1'b0; else req283_reg <= ack283_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req284_reg <= 1'b0; else req284_reg <= ack284_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req288_reg <= 1'b0; else req288_reg <= ack288_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req289_reg <= 1'b0; else req289_reg <= ack289_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req294_reg <= 1'b0; else req294_reg <= ack294_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req295_reg <= 1'b0; else req295_reg <= ack295_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req300_reg <= 1'b0; else req300_reg <= ack300_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req301_reg <= 1'b0; else req301_reg <= ack301_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req306_reg <= 1'b0; else req306_reg <= ack306_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req307_reg <= 1'b0; else req307_reg <= ack307_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req313_reg <= 1'b0; else req313_reg <= ack313_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req314_reg <= 1'b0; else req314_reg <= ack314_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req319_reg <= 1'b0; else req319_reg <= ack319_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req320_reg <= 1'b0; else req320_reg <= ack320_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req325_reg <= 1'b0; else req325_reg <= ack325_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req326_reg <= 1'b0; else req326_reg <= ack326_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req331_reg <= 1'b0; else req331_reg <= ack331_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req332_reg <= 1'b0; else req332_reg <= ack332_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req337_reg <= 1'b0; else req337_reg <= ack337_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req338_reg <= 1'b0; else req338_reg <= ack338_g & ~ack40_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req339_reg <= 1'b0; else req339_reg <= ack339_g & ~ack40_0;

// node:57 fork controller;
reg    req45_reg, req46_reg, req49_reg, req50_reg, req53_reg, req54_reg, req57_reg, req58_reg;
assign req45 = req43_0 & ~req45_reg;
assign req46 = req43_0 & ~req46_reg;
assign req49 = req43_0 & ~req49_reg;
assign req50 = req43_0 & ~req50_reg;
assign req53 = req43_0 & ~req53_reg;
assign req54 = req43_0 & ~req54_reg;
assign req57 = req43_0 & ~req57_reg;
assign req58 = req43_0 & ~req58_reg;
wire   ack45_g, ack46_g, ack49_g, ack50_g, ack53_g, ack54_g, ack57_g, ack58_g;
assign ack45_g = ack45 | ~req45;
assign ack46_g = ack46 | ~req46;
assign ack49_g = ack49 | ~req49;
assign ack50_g = ack50 | ~req50;
assign ack53_g = ack53 | ~req53;
assign ack54_g = ack54 | ~req54;
assign ack57_g = ack57 | ~req57;
assign ack58_g = ack58 | ~req58;
assign ack43_0 = ack45_g & ack46_g & ack49_g & ack50_g & ack53_g & ack54_g & ack57_g & ack58_g;
always @(posedge clk or negedge reset_n) if (~reset_n) req45_reg <= 1'b0; else req45_reg <= ack45_g & ~ack43_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req46_reg <= 1'b0; else req46_reg <= ack46_g & ~ack43_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req49_reg <= 1'b0; else req49_reg <= ack49_g & ~ack43_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req50_reg <= 1'b0; else req50_reg <= ack50_g & ~ack43_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req53_reg <= 1'b0; else req53_reg <= ack53_g & ~ack43_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req54_reg <= 1'b0; else req54_reg <= ack54_g & ~ack43_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req57_reg <= 1'b0; else req57_reg <= ack57_g & ~ack43_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req58_reg <= 1'b0; else req58_reg <= ack58_g & ~ack43_0;

// node:58 fork controller;
reg    req47_reg, req48_reg, req51_reg, req52_reg, req55_reg, req56_reg, req59_reg, req60_reg;
assign req47 = req44_0 & ~req47_reg;
assign req48 = req44_0 & ~req48_reg;
assign req51 = req44_0 & ~req51_reg;
assign req52 = req44_0 & ~req52_reg;
assign req55 = req44_0 & ~req55_reg;
assign req56 = req44_0 & ~req56_reg;
assign req59 = req44_0 & ~req59_reg;
assign req60 = req44_0 & ~req60_reg;
wire   ack47_g, ack48_g, ack51_g, ack52_g, ack55_g, ack56_g, ack59_g, ack60_g;
assign ack47_g = ack47 | ~req47;
assign ack48_g = ack48 | ~req48;
assign ack51_g = ack51 | ~req51;
assign ack52_g = ack52 | ~req52;
assign ack55_g = ack55 | ~req55;
assign ack56_g = ack56 | ~req56;
assign ack59_g = ack59 | ~req59;
assign ack60_g = ack60 | ~req60;
assign ack44_0 = ack47_g & ack48_g & ack51_g & ack52_g & ack55_g & ack56_g & ack59_g & ack60_g;
always @(posedge clk or negedge reset_n) if (~reset_n) req47_reg <= 1'b0; else req47_reg <= ack47_g & ~ack44_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req48_reg <= 1'b0; else req48_reg <= ack48_g & ~ack44_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req51_reg <= 1'b0; else req51_reg <= ack51_g & ~ack44_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req52_reg <= 1'b0; else req52_reg <= ack52_g & ~ack44_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req55_reg <= 1'b0; else req55_reg <= ack55_g & ~ack44_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req56_reg <= 1'b0; else req56_reg <= ack56_g & ~ack44_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req59_reg <= 1'b0; else req59_reg <= ack59_g & ~ack44_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req60_reg <= 1'b0; else req60_reg <= ack60_g & ~ack44_0;

// node:59 m2c
assign req62 =
    (n59sel == 2'b00) ? req45_0 :
    (n59sel == 2'b01) ? req47_0 :
    (n59sel == 2'b10) ? 1 : 1;
assign ack45_0 = (n59sel != 0) | ack62;
assign ack47_0 = (n59sel != 1) | ack62;
assign ack61_0 = 1'b1;

// node:60 m2c
assign req64 =
    (n60sel == 2'b00) ? req46_0 :
    (n60sel == 2'b01) ? req47_1 :
    (n60sel == 2'b10) ? 1 : 1;
assign ack46_0 = (n60sel != 0) | ack64;
assign ack47_1 = (n60sel != 1) | ack64;
assign ack63_0 = 1'b1;

// node:61 m2c
assign req66 =
    (n61sel == 2'b00) ? req46_1 :
    (n61sel == 2'b01) ? req48_0 :
    (n61sel == 2'b10) ? 1 : 1;
assign ack46_1 = (n61sel != 0) | ack66;
assign ack48_0 = (n61sel != 1) | ack66;
assign ack65_0 = 1'b1;

// node:62 m2c
assign req68 =
    (n62sel == 2'b00) ? req47_2 :
    (n62sel == 2'b01) ? req46_2 :
    (n62sel == 2'b10) ? 1 : 1;
assign ack47_2 = (n62sel != 0) | ack68;
assign ack46_2 = (n62sel != 1) | ack68;
assign ack67_0 = 1'b1;

// node:63 m2c
assign req70 =
    (n63sel == 2'b00) ? req47_3 :
    (n63sel == 2'b01) ? req48_1 :
    (n63sel == 2'b10) ? 1 : 1;
assign ack47_3 = (n63sel != 0) | ack70;
assign ack48_1 = (n63sel != 1) | ack70;
assign ack69_0 = 1'b1;

// node:64 m2c
assign req72 =
    (n64sel == 2'b00) ? req48_2 :
    (n64sel == 2'b01) ? req45_1 :
    (n64sel == 2'b10) ? 1 : 1;
assign ack48_2 = (n64sel != 0) | ack72;
assign ack45_1 = (n64sel != 1) | ack72;
assign ack71_0 = 1'b1;

// node:65 join concat
assign req73 = req45_2 & req62_0 & req64_0 & req66_0;
assign ack45_2 = ack73 & req62_0 & req64_0 & req66_0;
assign ack62_0 = ack73 & req45_2 & req64_0 & req66_0;
assign ack64_0 = ack73 & req45_2 & req62_0 & req66_0;
assign ack66_0 = ack73 & req45_2 & req62_0 & req64_0;
// node:66 join concat
assign req74 = req68_0 & req70_0 & req48_3 & req72_0;
assign ack68_0 = ack74 & req70_0 & req48_3 & req72_0;
assign ack70_0 = ack74 & req68_0 & req48_3 & req72_0;
assign ack48_3 = ack74 & req68_0 & req70_0 & req72_0;
assign ack72_0 = ack74 & req68_0 & req70_0 & req48_3;
// node: 67 muladdsub
reg[3:0] cfg_valid_67;

always @(posedge clk) cfg_valid_67 <= {cfg_valid_67[2:0],req75_0};

assign ack75_0=1'b1;

//stage 1
reg req76_s1_r;
wire req76_s1,ack76_s1;

assign req76_s1 = req76_s1_r;
assign n67s1_en = req73_0 & ack73_0 | cfg_valid_67[3];
assign ack73_0 = ~req76_s1_r | ack76_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req76_s1_r <= 1'b0; else req76_s1_r <= ~ack73_0 | req73_0;

//stage 2
reg req76_s2_r;
wire req76_s2,ack76_s2;

assign req76_s2 = req76_s2_r;
assign n67s2_en = req76_s1 & ack76_s1 | cfg_valid_67[3];
assign ack76_s1 = ~req76_s2_r | ack76_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req76_s2_r <= 1'b0; else req76_s2_r <= ~ack76_s1 | req76_s1;

//stage 3
reg req76_s3_r;

assign req76 = req76_s3_r;
assign n67s3_en = req76_s2 & ack76_s2 | cfg_valid_67[3];
assign ack76_s2 = ~req76_s3_r | ack76;
always @(posedge clk or negedge reset_n) if(~reset_n) req76_s3_r <= 1'b0; else req76_s3_r <= ~ack76_s2 | req76_s2;

// node: 68 muladdsub
reg[3:0] cfg_valid_68;

always @(posedge clk) cfg_valid_68 <= {cfg_valid_68[2:0],req77_0};

assign ack77_0=1'b1;

//stage 1
reg req78_s1_r;
wire req78_s1,ack78_s1;

assign req78_s1 = req78_s1_r;
assign n68s1_en = req74_0 & ack74_0 | cfg_valid_68[3];
assign ack74_0 = ~req78_s1_r | ack78_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req78_s1_r <= 1'b0; else req78_s1_r <= ~ack74_0 | req74_0;

//stage 2
reg req78_s2_r;
wire req78_s2,ack78_s2;

assign req78_s2 = req78_s2_r;
assign n68s2_en = req78_s1 & ack78_s1 | cfg_valid_68[3];
assign ack78_s1 = ~req78_s2_r | ack78_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req78_s2_r <= 1'b0; else req78_s2_r <= ~ack78_s1 | req78_s1;

//stage 3
reg req78_s3_r;

assign req78 = req78_s3_r;
assign n68s3_en = req78_s2 & ack78_s2 | cfg_valid_68[3];
assign ack78_s2 = ~req78_s3_r | ack78;
always @(posedge clk or negedge reset_n) if(~reset_n) req78_s3_r <= 1'b0; else req78_s3_r <= ~ack78_s2 | req78_s2;

// node:69 m2c
assign req80 =
    (n69sel == 2'b00) ? req49_0 :
    (n69sel == 2'b01) ? req51_0 :
    (n69sel == 2'b10) ? 1 : 1;
assign ack49_0 = (n69sel != 0) | ack80;
assign ack51_0 = (n69sel != 1) | ack80;
assign ack79_0 = 1'b1;

// node:70 m2c
assign req82 =
    (n70sel == 2'b00) ? req50_0 :
    (n70sel == 2'b01) ? req51_1 :
    (n70sel == 2'b10) ? 1 : 1;
assign ack50_0 = (n70sel != 0) | ack82;
assign ack51_1 = (n70sel != 1) | ack82;
assign ack81_0 = 1'b1;

// node:71 m2c
assign req84 =
    (n71sel == 2'b00) ? req50_1 :
    (n71sel == 2'b01) ? req52_0 :
    (n71sel == 2'b10) ? 1 : 1;
assign ack50_1 = (n71sel != 0) | ack84;
assign ack52_0 = (n71sel != 1) | ack84;
assign ack83_0 = 1'b1;

// node:72 m2c
assign req86 =
    (n72sel == 2'b00) ? req51_2 :
    (n72sel == 2'b01) ? req50_2 :
    (n72sel == 2'b10) ? 1 : 1;
assign ack51_2 = (n72sel != 0) | ack86;
assign ack50_2 = (n72sel != 1) | ack86;
assign ack85_0 = 1'b1;

// node:73 m2c
assign req88 =
    (n73sel == 2'b00) ? req51_3 :
    (n73sel == 2'b01) ? req52_1 :
    (n73sel == 2'b10) ? 1 : 1;
assign ack51_3 = (n73sel != 0) | ack88;
assign ack52_1 = (n73sel != 1) | ack88;
assign ack87_0 = 1'b1;

// node:74 m2c
assign req90 =
    (n74sel == 2'b00) ? req52_2 :
    (n74sel == 2'b01) ? req49_1 :
    (n74sel == 2'b10) ? 1 : 1;
assign ack52_2 = (n74sel != 0) | ack90;
assign ack49_1 = (n74sel != 1) | ack90;
assign ack89_0 = 1'b1;

// node:75 join concat
assign req91 = req49_2 & req80_0 & req82_0 & req84_0;
assign ack49_2 = ack91 & req80_0 & req82_0 & req84_0;
assign ack80_0 = ack91 & req49_2 & req82_0 & req84_0;
assign ack82_0 = ack91 & req49_2 & req80_0 & req84_0;
assign ack84_0 = ack91 & req49_2 & req80_0 & req82_0;
// node:76 join concat
assign req92 = req86_0 & req88_0 & req52_3 & req90_0;
assign ack86_0 = ack92 & req88_0 & req52_3 & req90_0;
assign ack88_0 = ack92 & req86_0 & req52_3 & req90_0;
assign ack52_3 = ack92 & req86_0 & req88_0 & req90_0;
assign ack90_0 = ack92 & req86_0 & req88_0 & req52_3;
// node: 77 muladdsub
reg[3:0] cfg_valid_77;

always @(posedge clk) cfg_valid_77 <= {cfg_valid_77[2:0],req93_0};

assign ack93_0=1'b1;

//stage 1
reg req94_s1_r;
wire req94_s1,ack94_s1;

assign req94_s1 = req94_s1_r;
assign n77s1_en = req91_0 & ack91_0 | cfg_valid_77[3];
assign ack91_0 = ~req94_s1_r | ack94_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req94_s1_r <= 1'b0; else req94_s1_r <= ~ack91_0 | req91_0;

//stage 2
reg req94_s2_r;
wire req94_s2,ack94_s2;

assign req94_s2 = req94_s2_r;
assign n77s2_en = req94_s1 & ack94_s1 | cfg_valid_77[3];
assign ack94_s1 = ~req94_s2_r | ack94_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req94_s2_r <= 1'b0; else req94_s2_r <= ~ack94_s1 | req94_s1;

//stage 3
reg req94_s3_r;

assign req94 = req94_s3_r;
assign n77s3_en = req94_s2 & ack94_s2 | cfg_valid_77[3];
assign ack94_s2 = ~req94_s3_r | ack94;
always @(posedge clk or negedge reset_n) if(~reset_n) req94_s3_r <= 1'b0; else req94_s3_r <= ~ack94_s2 | req94_s2;

// node: 78 muladdsub
reg[3:0] cfg_valid_78;

always @(posedge clk) cfg_valid_78 <= {cfg_valid_78[2:0],req95_0};

assign ack95_0=1'b1;

//stage 1
reg req96_s1_r;
wire req96_s1,ack96_s1;

assign req96_s1 = req96_s1_r;
assign n78s1_en = req92_0 & ack92_0 | cfg_valid_78[3];
assign ack92_0 = ~req96_s1_r | ack96_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req96_s1_r <= 1'b0; else req96_s1_r <= ~ack92_0 | req92_0;

//stage 2
reg req96_s2_r;
wire req96_s2,ack96_s2;

assign req96_s2 = req96_s2_r;
assign n78s2_en = req96_s1 & ack96_s1 | cfg_valid_78[3];
assign ack96_s1 = ~req96_s2_r | ack96_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req96_s2_r <= 1'b0; else req96_s2_r <= ~ack96_s1 | req96_s1;

//stage 3
reg req96_s3_r;

assign req96 = req96_s3_r;
assign n78s3_en = req96_s2 & ack96_s2 | cfg_valid_78[3];
assign ack96_s2 = ~req96_s3_r | ack96;
always @(posedge clk or negedge reset_n) if(~reset_n) req96_s3_r <= 1'b0; else req96_s3_r <= ~ack96_s2 | req96_s2;

// node:79 m2c
assign req98 =
    (n79sel == 2'b00) ? req53_0 :
    (n79sel == 2'b01) ? req55_0 :
    (n79sel == 2'b10) ? 1 : 1;
assign ack53_0 = (n79sel != 0) | ack98;
assign ack55_0 = (n79sel != 1) | ack98;
assign ack97_0 = 1'b1;

// node:80 m2c
assign req100 =
    (n80sel == 2'b00) ? req54_0 :
    (n80sel == 2'b01) ? req55_1 :
    (n80sel == 2'b10) ? 1 : 1;
assign ack54_0 = (n80sel != 0) | ack100;
assign ack55_1 = (n80sel != 1) | ack100;
assign ack99_0 = 1'b1;

// node:81 m2c
assign req102 =
    (n81sel == 2'b00) ? req54_1 :
    (n81sel == 2'b01) ? req56_0 :
    (n81sel == 2'b10) ? 1 : 1;
assign ack54_1 = (n81sel != 0) | ack102;
assign ack56_0 = (n81sel != 1) | ack102;
assign ack101_0 = 1'b1;

// node:82 m2c
assign req104 =
    (n82sel == 2'b00) ? req55_2 :
    (n82sel == 2'b01) ? req54_2 :
    (n82sel == 2'b10) ? 1 : 1;
assign ack55_2 = (n82sel != 0) | ack104;
assign ack54_2 = (n82sel != 1) | ack104;
assign ack103_0 = 1'b1;

// node:83 m2c
assign req106 =
    (n83sel == 2'b00) ? req55_3 :
    (n83sel == 2'b01) ? req56_1 :
    (n83sel == 2'b10) ? 1 : 1;
assign ack55_3 = (n83sel != 0) | ack106;
assign ack56_1 = (n83sel != 1) | ack106;
assign ack105_0 = 1'b1;

// node:84 m2c
assign req108 =
    (n84sel == 2'b00) ? req56_2 :
    (n84sel == 2'b01) ? req53_1 :
    (n84sel == 2'b10) ? 1 : 1;
assign ack56_2 = (n84sel != 0) | ack108;
assign ack53_1 = (n84sel != 1) | ack108;
assign ack107_0 = 1'b1;

// node:85 join concat
assign req109 = req53_2 & req98_0 & req100_0 & req102_0;
assign ack53_2 = ack109 & req98_0 & req100_0 & req102_0;
assign ack98_0 = ack109 & req53_2 & req100_0 & req102_0;
assign ack100_0 = ack109 & req53_2 & req98_0 & req102_0;
assign ack102_0 = ack109 & req53_2 & req98_0 & req100_0;
// node:86 join concat
assign req110 = req104_0 & req106_0 & req56_3 & req108_0;
assign ack104_0 = ack110 & req106_0 & req56_3 & req108_0;
assign ack106_0 = ack110 & req104_0 & req56_3 & req108_0;
assign ack56_3 = ack110 & req104_0 & req106_0 & req108_0;
assign ack108_0 = ack110 & req104_0 & req106_0 & req56_3;
// node: 87 muladdsub
reg[3:0] cfg_valid_87;

always @(posedge clk) cfg_valid_87 <= {cfg_valid_87[2:0],req111_0};

assign ack111_0=1'b1;

//stage 1
reg req112_s1_r;
wire req112_s1,ack112_s1;

assign req112_s1 = req112_s1_r;
assign n87s1_en = req109_0 & ack109_0 | cfg_valid_87[3];
assign ack109_0 = ~req112_s1_r | ack112_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req112_s1_r <= 1'b0; else req112_s1_r <= ~ack109_0 | req109_0;

//stage 2
reg req112_s2_r;
wire req112_s2,ack112_s2;

assign req112_s2 = req112_s2_r;
assign n87s2_en = req112_s1 & ack112_s1 | cfg_valid_87[3];
assign ack112_s1 = ~req112_s2_r | ack112_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req112_s2_r <= 1'b0; else req112_s2_r <= ~ack112_s1 | req112_s1;

//stage 3
reg req112_s3_r;

assign req112 = req112_s3_r;
assign n87s3_en = req112_s2 & ack112_s2 | cfg_valid_87[3];
assign ack112_s2 = ~req112_s3_r | ack112;
always @(posedge clk or negedge reset_n) if(~reset_n) req112_s3_r <= 1'b0; else req112_s3_r <= ~ack112_s2 | req112_s2;

// node: 88 muladdsub
reg[3:0] cfg_valid_88;

always @(posedge clk) cfg_valid_88 <= {cfg_valid_88[2:0],req113_0};

assign ack113_0=1'b1;

//stage 1
reg req114_s1_r;
wire req114_s1,ack114_s1;

assign req114_s1 = req114_s1_r;
assign n88s1_en = req110_0 & ack110_0 | cfg_valid_88[3];
assign ack110_0 = ~req114_s1_r | ack114_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req114_s1_r <= 1'b0; else req114_s1_r <= ~ack110_0 | req110_0;

//stage 2
reg req114_s2_r;
wire req114_s2,ack114_s2;

assign req114_s2 = req114_s2_r;
assign n88s2_en = req114_s1 & ack114_s1 | cfg_valid_88[3];
assign ack114_s1 = ~req114_s2_r | ack114_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req114_s2_r <= 1'b0; else req114_s2_r <= ~ack114_s1 | req114_s1;

//stage 3
reg req114_s3_r;

assign req114 = req114_s3_r;
assign n88s3_en = req114_s2 & ack114_s2 | cfg_valid_88[3];
assign ack114_s2 = ~req114_s3_r | ack114;
always @(posedge clk or negedge reset_n) if(~reset_n) req114_s3_r <= 1'b0; else req114_s3_r <= ~ack114_s2 | req114_s2;

// node:89 m2c
assign req116 =
    (n89sel == 2'b00) ? req57_0 :
    (n89sel == 2'b01) ? req59_0 :
    (n89sel == 2'b10) ? 1 : 1;
assign ack57_0 = (n89sel != 0) | ack116;
assign ack59_0 = (n89sel != 1) | ack116;
assign ack115_0 = 1'b1;

// node:90 m2c
assign req118 =
    (n90sel == 2'b00) ? req58_0 :
    (n90sel == 2'b01) ? req59_1 :
    (n90sel == 2'b10) ? 1 : 1;
assign ack58_0 = (n90sel != 0) | ack118;
assign ack59_1 = (n90sel != 1) | ack118;
assign ack117_0 = 1'b1;

// node:91 m2c
assign req120 =
    (n91sel == 2'b00) ? req58_1 :
    (n91sel == 2'b01) ? req60_0 :
    (n91sel == 2'b10) ? 1 : 1;
assign ack58_1 = (n91sel != 0) | ack120;
assign ack60_0 = (n91sel != 1) | ack120;
assign ack119_0 = 1'b1;

// node:92 m2c
assign req122 =
    (n92sel == 2'b00) ? req59_2 :
    (n92sel == 2'b01) ? req58_2 :
    (n92sel == 2'b10) ? 1 : 1;
assign ack59_2 = (n92sel != 0) | ack122;
assign ack58_2 = (n92sel != 1) | ack122;
assign ack121_0 = 1'b1;

// node:93 m2c
assign req124 =
    (n93sel == 2'b00) ? req59_3 :
    (n93sel == 2'b01) ? req60_1 :
    (n93sel == 2'b10) ? 1 : 1;
assign ack59_3 = (n93sel != 0) | ack124;
assign ack60_1 = (n93sel != 1) | ack124;
assign ack123_0 = 1'b1;

// node:94 m2c
assign req126 =
    (n94sel == 2'b00) ? req60_2 :
    (n94sel == 2'b01) ? req57_1 :
    (n94sel == 2'b10) ? 1 : 1;
assign ack60_2 = (n94sel != 0) | ack126;
assign ack57_1 = (n94sel != 1) | ack126;
assign ack125_0 = 1'b1;

// node:95 join concat
assign req127 = req57_2 & req116_0 & req118_0 & req120_0;
assign ack57_2 = ack127 & req116_0 & req118_0 & req120_0;
assign ack116_0 = ack127 & req57_2 & req118_0 & req120_0;
assign ack118_0 = ack127 & req57_2 & req116_0 & req120_0;
assign ack120_0 = ack127 & req57_2 & req116_0 & req118_0;
// node:96 join concat
assign req128 = req122_0 & req124_0 & req60_3 & req126_0;
assign ack122_0 = ack128 & req124_0 & req60_3 & req126_0;
assign ack124_0 = ack128 & req122_0 & req60_3 & req126_0;
assign ack60_3 = ack128 & req122_0 & req124_0 & req126_0;
assign ack126_0 = ack128 & req122_0 & req124_0 & req60_3;
// node: 97 muladdsub
reg[3:0] cfg_valid_97;

always @(posedge clk) cfg_valid_97 <= {cfg_valid_97[2:0],req129_0};

assign ack129_0=1'b1;

//stage 1
reg req130_s1_r;
wire req130_s1,ack130_s1;

assign req130_s1 = req130_s1_r;
assign n97s1_en = req127_0 & ack127_0 | cfg_valid_97[3];
assign ack127_0 = ~req130_s1_r | ack130_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req130_s1_r <= 1'b0; else req130_s1_r <= ~ack127_0 | req127_0;

//stage 2
reg req130_s2_r;
wire req130_s2,ack130_s2;

assign req130_s2 = req130_s2_r;
assign n97s2_en = req130_s1 & ack130_s1 | cfg_valid_97[3];
assign ack130_s1 = ~req130_s2_r | ack130_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req130_s2_r <= 1'b0; else req130_s2_r <= ~ack130_s1 | req130_s1;

//stage 3
reg req130_s3_r;

assign req130 = req130_s3_r;
assign n97s3_en = req130_s2 & ack130_s2 | cfg_valid_97[3];
assign ack130_s2 = ~req130_s3_r | ack130;
always @(posedge clk or negedge reset_n) if(~reset_n) req130_s3_r <= 1'b0; else req130_s3_r <= ~ack130_s2 | req130_s2;

// node: 98 muladdsub
reg[3:0] cfg_valid_98;

always @(posedge clk) cfg_valid_98 <= {cfg_valid_98[2:0],req131_0};

assign ack131_0=1'b1;

//stage 1
reg req132_s1_r;
wire req132_s1,ack132_s1;

assign req132_s1 = req132_s1_r;
assign n98s1_en = req128_0 & ack128_0 | cfg_valid_98[3];
assign ack128_0 = ~req132_s1_r | ack132_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req132_s1_r <= 1'b0; else req132_s1_r <= ~ack128_0 | req128_0;

//stage 2
reg req132_s2_r;
wire req132_s2,ack132_s2;

assign req132_s2 = req132_s2_r;
assign n98s2_en = req132_s1 & ack132_s1 | cfg_valid_98[3];
assign ack132_s1 = ~req132_s2_r | ack132_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req132_s2_r <= 1'b0; else req132_s2_r <= ~ack132_s1 | req132_s1;

//stage 3
reg req132_s3_r;

assign req132 = req132_s3_r;
assign n98s3_en = req132_s2 & ack132_s2 | cfg_valid_98[3];
assign ack132_s2 = ~req132_s3_r | ack132;
always @(posedge clk or negedge reset_n) if(~reset_n) req132_s3_r <= 1'b0; else req132_s3_r <= ~ack132_s2 | req132_s2;

// node:99 fork controller;
reg    req135_reg, req136_reg, req139_reg, req140_reg, req143_reg, req144_reg, req147_reg, req148_reg;
assign req135 = req133_0 & ~req135_reg;
assign req136 = req133_0 & ~req136_reg;
assign req139 = req133_0 & ~req139_reg;
assign req140 = req133_0 & ~req140_reg;
assign req143 = req133_0 & ~req143_reg;
assign req144 = req133_0 & ~req144_reg;
assign req147 = req133_0 & ~req147_reg;
assign req148 = req133_0 & ~req148_reg;
wire   ack135_g, ack136_g, ack139_g, ack140_g, ack143_g, ack144_g, ack147_g, ack148_g;
assign ack135_g = ack135 | ~req135;
assign ack136_g = ack136 | ~req136;
assign ack139_g = ack139 | ~req139;
assign ack140_g = ack140 | ~req140;
assign ack143_g = ack143 | ~req143;
assign ack144_g = ack144 | ~req144;
assign ack147_g = ack147 | ~req147;
assign ack148_g = ack148 | ~req148;
assign ack133_0 = ack135_g & ack136_g & ack139_g & ack140_g & ack143_g & ack144_g & ack147_g & ack148_g;
always @(posedge clk or negedge reset_n) if (~reset_n) req135_reg <= 1'b0; else req135_reg <= ack135_g & ~ack133_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req136_reg <= 1'b0; else req136_reg <= ack136_g & ~ack133_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req139_reg <= 1'b0; else req139_reg <= ack139_g & ~ack133_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req140_reg <= 1'b0; else req140_reg <= ack140_g & ~ack133_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req143_reg <= 1'b0; else req143_reg <= ack143_g & ~ack133_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req144_reg <= 1'b0; else req144_reg <= ack144_g & ~ack133_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req147_reg <= 1'b0; else req147_reg <= ack147_g & ~ack133_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req148_reg <= 1'b0; else req148_reg <= ack148_g & ~ack133_0;

// node:100 fork controller;
reg    req137_reg, req138_reg, req141_reg, req142_reg, req145_reg, req146_reg, req149_reg, req150_reg;
assign req137 = req134_0 & ~req137_reg;
assign req138 = req134_0 & ~req138_reg;
assign req141 = req134_0 & ~req141_reg;
assign req142 = req134_0 & ~req142_reg;
assign req145 = req134_0 & ~req145_reg;
assign req146 = req134_0 & ~req146_reg;
assign req149 = req134_0 & ~req149_reg;
assign req150 = req134_0 & ~req150_reg;
wire   ack137_g, ack138_g, ack141_g, ack142_g, ack145_g, ack146_g, ack149_g, ack150_g;
assign ack137_g = ack137 | ~req137;
assign ack138_g = ack138 | ~req138;
assign ack141_g = ack141 | ~req141;
assign ack142_g = ack142 | ~req142;
assign ack145_g = ack145 | ~req145;
assign ack146_g = ack146 | ~req146;
assign ack149_g = ack149 | ~req149;
assign ack150_g = ack150 | ~req150;
assign ack134_0 = ack137_g & ack138_g & ack141_g & ack142_g & ack145_g & ack146_g & ack149_g & ack150_g;
always @(posedge clk or negedge reset_n) if (~reset_n) req137_reg <= 1'b0; else req137_reg <= ack137_g & ~ack134_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req138_reg <= 1'b0; else req138_reg <= ack138_g & ~ack134_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req141_reg <= 1'b0; else req141_reg <= ack141_g & ~ack134_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req142_reg <= 1'b0; else req142_reg <= ack142_g & ~ack134_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req145_reg <= 1'b0; else req145_reg <= ack145_g & ~ack134_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req146_reg <= 1'b0; else req146_reg <= ack146_g & ~ack134_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req149_reg <= 1'b0; else req149_reg <= ack149_g & ~ack134_0;
always @(posedge clk or negedge reset_n) if (~reset_n) req150_reg <= 1'b0; else req150_reg <= ack150_g & ~ack134_0;

// node:101 m2c
assign req152 =
    (n101sel == 2'b00) ? req135_0 :
    (n101sel == 2'b01) ? req137_0 :
    (n101sel == 2'b10) ? 1 : 1;
assign ack135_0 = (n101sel != 0) | ack152;
assign ack137_0 = (n101sel != 1) | ack152;
assign ack151_0 = 1'b1;

// node:102 m2c
assign req154 =
    (n102sel == 2'b00) ? req136_0 :
    (n102sel == 2'b01) ? req137_1 :
    (n102sel == 2'b10) ? 1 : 1;
assign ack136_0 = (n102sel != 0) | ack154;
assign ack137_1 = (n102sel != 1) | ack154;
assign ack153_0 = 1'b1;

// node:103 m2c
assign req156 =
    (n103sel == 2'b00) ? req136_1 :
    (n103sel == 2'b01) ? req138_0 :
    (n103sel == 2'b10) ? 1 : 1;
assign ack136_1 = (n103sel != 0) | ack156;
assign ack138_0 = (n103sel != 1) | ack156;
assign ack155_0 = 1'b1;

// node:104 m2c
assign req158 =
    (n104sel == 2'b00) ? req137_2 :
    (n104sel == 2'b01) ? req136_2 :
    (n104sel == 2'b10) ? 1 : 1;
assign ack137_2 = (n104sel != 0) | ack158;
assign ack136_2 = (n104sel != 1) | ack158;
assign ack157_0 = 1'b1;

// node:105 m2c
assign req160 =
    (n105sel == 2'b00) ? req137_3 :
    (n105sel == 2'b01) ? req138_1 :
    (n105sel == 2'b10) ? 1 : 1;
assign ack137_3 = (n105sel != 0) | ack160;
assign ack138_1 = (n105sel != 1) | ack160;
assign ack159_0 = 1'b1;

// node:106 m2c
assign req162 =
    (n106sel == 2'b00) ? req138_2 :
    (n106sel == 2'b01) ? req135_1 :
    (n106sel == 2'b10) ? 1 : 1;
assign ack138_2 = (n106sel != 0) | ack162;
assign ack135_1 = (n106sel != 1) | ack162;
assign ack161_0 = 1'b1;

// node:107 join concat
assign req163 = req135_2 & req152_0 & req154_0 & req156_0;
assign ack135_2 = ack163 & req152_0 & req154_0 & req156_0;
assign ack152_0 = ack163 & req135_2 & req154_0 & req156_0;
assign ack154_0 = ack163 & req135_2 & req152_0 & req156_0;
assign ack156_0 = ack163 & req135_2 & req152_0 & req154_0;
// node:108 join concat
assign req164 = req158_0 & req160_0 & req138_3 & req162_0;
assign ack158_0 = ack164 & req160_0 & req138_3 & req162_0;
assign ack160_0 = ack164 & req158_0 & req138_3 & req162_0;
assign ack138_3 = ack164 & req158_0 & req160_0 & req162_0;
assign ack162_0 = ack164 & req158_0 & req160_0 & req138_3;
// node: 109 muladdsub
reg[3:0] cfg_valid_109;

always @(posedge clk) cfg_valid_109 <= {cfg_valid_109[2:0],req165_0};

assign ack165_0=1'b1;

//stage 1
reg req166_s1_r;
wire req166_s1,ack166_s1;

assign req166_s1 = req166_s1_r;
assign n109s1_en = req163_0 & ack163_0 | cfg_valid_109[3];
assign ack163_0 = ~req166_s1_r | ack166_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req166_s1_r <= 1'b0; else req166_s1_r <= ~ack163_0 | req163_0;

//stage 2
reg req166_s2_r;
wire req166_s2,ack166_s2;

assign req166_s2 = req166_s2_r;
assign n109s2_en = req166_s1 & ack166_s1 | cfg_valid_109[3];
assign ack166_s1 = ~req166_s2_r | ack166_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req166_s2_r <= 1'b0; else req166_s2_r <= ~ack166_s1 | req166_s1;

//stage 3
reg req166_s3_r;

assign req166 = req166_s3_r;
assign n109s3_en = req166_s2 & ack166_s2 | cfg_valid_109[3];
assign ack166_s2 = ~req166_s3_r | ack166;
always @(posedge clk or negedge reset_n) if(~reset_n) req166_s3_r <= 1'b0; else req166_s3_r <= ~ack166_s2 | req166_s2;

// node: 110 muladdsub
reg[3:0] cfg_valid_110;

always @(posedge clk) cfg_valid_110 <= {cfg_valid_110[2:0],req167_0};

assign ack167_0=1'b1;

//stage 1
reg req168_s1_r;
wire req168_s1,ack168_s1;

assign req168_s1 = req168_s1_r;
assign n110s1_en = req164_0 & ack164_0 | cfg_valid_110[3];
assign ack164_0 = ~req168_s1_r | ack168_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req168_s1_r <= 1'b0; else req168_s1_r <= ~ack164_0 | req164_0;

//stage 2
reg req168_s2_r;
wire req168_s2,ack168_s2;

assign req168_s2 = req168_s2_r;
assign n110s2_en = req168_s1 & ack168_s1 | cfg_valid_110[3];
assign ack168_s1 = ~req168_s2_r | ack168_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req168_s2_r <= 1'b0; else req168_s2_r <= ~ack168_s1 | req168_s1;

//stage 3
reg req168_s3_r;

assign req168 = req168_s3_r;
assign n110s3_en = req168_s2 & ack168_s2 | cfg_valid_110[3];
assign ack168_s2 = ~req168_s3_r | ack168;
always @(posedge clk or negedge reset_n) if(~reset_n) req168_s3_r <= 1'b0; else req168_s3_r <= ~ack168_s2 | req168_s2;

// node:111 m2c
assign req170 =
    (n111sel == 2'b00) ? req139_0 :
    (n111sel == 2'b01) ? req141_0 :
    (n111sel == 2'b10) ? 1 : 1;
assign ack139_0 = (n111sel != 0) | ack170;
assign ack141_0 = (n111sel != 1) | ack170;
assign ack169_0 = 1'b1;

// node:112 m2c
assign req172 =
    (n112sel == 2'b00) ? req140_0 :
    (n112sel == 2'b01) ? req141_1 :
    (n112sel == 2'b10) ? 1 : 1;
assign ack140_0 = (n112sel != 0) | ack172;
assign ack141_1 = (n112sel != 1) | ack172;
assign ack171_0 = 1'b1;

// node:113 m2c
assign req174 =
    (n113sel == 2'b00) ? req140_1 :
    (n113sel == 2'b01) ? req142_0 :
    (n113sel == 2'b10) ? 1 : 1;
assign ack140_1 = (n113sel != 0) | ack174;
assign ack142_0 = (n113sel != 1) | ack174;
assign ack173_0 = 1'b1;

// node:114 m2c
assign req176 =
    (n114sel == 2'b00) ? req141_2 :
    (n114sel == 2'b01) ? req140_2 :
    (n114sel == 2'b10) ? 1 : 1;
assign ack141_2 = (n114sel != 0) | ack176;
assign ack140_2 = (n114sel != 1) | ack176;
assign ack175_0 = 1'b1;

// node:115 m2c
assign req178 =
    (n115sel == 2'b00) ? req141_3 :
    (n115sel == 2'b01) ? req142_1 :
    (n115sel == 2'b10) ? 1 : 1;
assign ack141_3 = (n115sel != 0) | ack178;
assign ack142_1 = (n115sel != 1) | ack178;
assign ack177_0 = 1'b1;

// node:116 m2c
assign req180 =
    (n116sel == 2'b00) ? req142_2 :
    (n116sel == 2'b01) ? req139_1 :
    (n116sel == 2'b10) ? 1 : 1;
assign ack142_2 = (n116sel != 0) | ack180;
assign ack139_1 = (n116sel != 1) | ack180;
assign ack179_0 = 1'b1;

// node:117 join concat
assign req181 = req139_2 & req170_0 & req172_0 & req174_0;
assign ack139_2 = ack181 & req170_0 & req172_0 & req174_0;
assign ack170_0 = ack181 & req139_2 & req172_0 & req174_0;
assign ack172_0 = ack181 & req139_2 & req170_0 & req174_0;
assign ack174_0 = ack181 & req139_2 & req170_0 & req172_0;
// node:118 join concat
assign req182 = req176_0 & req178_0 & req142_3 & req180_0;
assign ack176_0 = ack182 & req178_0 & req142_3 & req180_0;
assign ack178_0 = ack182 & req176_0 & req142_3 & req180_0;
assign ack142_3 = ack182 & req176_0 & req178_0 & req180_0;
assign ack180_0 = ack182 & req176_0 & req178_0 & req142_3;
// node: 119 muladdsub
reg[3:0] cfg_valid_119;

always @(posedge clk) cfg_valid_119 <= {cfg_valid_119[2:0],req183_0};

assign ack183_0=1'b1;

//stage 1
reg req184_s1_r;
wire req184_s1,ack184_s1;

assign req184_s1 = req184_s1_r;
assign n119s1_en = req181_0 & ack181_0 | cfg_valid_119[3];
assign ack181_0 = ~req184_s1_r | ack184_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req184_s1_r <= 1'b0; else req184_s1_r <= ~ack181_0 | req181_0;

//stage 2
reg req184_s2_r;
wire req184_s2,ack184_s2;

assign req184_s2 = req184_s2_r;
assign n119s2_en = req184_s1 & ack184_s1 | cfg_valid_119[3];
assign ack184_s1 = ~req184_s2_r | ack184_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req184_s2_r <= 1'b0; else req184_s2_r <= ~ack184_s1 | req184_s1;

//stage 3
reg req184_s3_r;

assign req184 = req184_s3_r;
assign n119s3_en = req184_s2 & ack184_s2 | cfg_valid_119[3];
assign ack184_s2 = ~req184_s3_r | ack184;
always @(posedge clk or negedge reset_n) if(~reset_n) req184_s3_r <= 1'b0; else req184_s3_r <= ~ack184_s2 | req184_s2;

// node: 120 muladdsub
reg[3:0] cfg_valid_120;

always @(posedge clk) cfg_valid_120 <= {cfg_valid_120[2:0],req185_0};

assign ack185_0=1'b1;

//stage 1
reg req186_s1_r;
wire req186_s1,ack186_s1;

assign req186_s1 = req186_s1_r;
assign n120s1_en = req182_0 & ack182_0 | cfg_valid_120[3];
assign ack182_0 = ~req186_s1_r | ack186_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req186_s1_r <= 1'b0; else req186_s1_r <= ~ack182_0 | req182_0;

//stage 2
reg req186_s2_r;
wire req186_s2,ack186_s2;

assign req186_s2 = req186_s2_r;
assign n120s2_en = req186_s1 & ack186_s1 | cfg_valid_120[3];
assign ack186_s1 = ~req186_s2_r | ack186_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req186_s2_r <= 1'b0; else req186_s2_r <= ~ack186_s1 | req186_s1;

//stage 3
reg req186_s3_r;

assign req186 = req186_s3_r;
assign n120s3_en = req186_s2 & ack186_s2 | cfg_valid_120[3];
assign ack186_s2 = ~req186_s3_r | ack186;
always @(posedge clk or negedge reset_n) if(~reset_n) req186_s3_r <= 1'b0; else req186_s3_r <= ~ack186_s2 | req186_s2;

// node:121 m2c
assign req188 =
    (n121sel == 2'b00) ? req143_0 :
    (n121sel == 2'b01) ? req145_0 :
    (n121sel == 2'b10) ? 1 : 1;
assign ack143_0 = (n121sel != 0) | ack188;
assign ack145_0 = (n121sel != 1) | ack188;
assign ack187_0 = 1'b1;

// node:122 m2c
assign req190 =
    (n122sel == 2'b00) ? req144_0 :
    (n122sel == 2'b01) ? req145_1 :
    (n122sel == 2'b10) ? 1 : 1;
assign ack144_0 = (n122sel != 0) | ack190;
assign ack145_1 = (n122sel != 1) | ack190;
assign ack189_0 = 1'b1;

// node:123 m2c
assign req192 =
    (n123sel == 2'b00) ? req144_1 :
    (n123sel == 2'b01) ? req146_0 :
    (n123sel == 2'b10) ? 1 : 1;
assign ack144_1 = (n123sel != 0) | ack192;
assign ack146_0 = (n123sel != 1) | ack192;
assign ack191_0 = 1'b1;

// node:124 m2c
assign req194 =
    (n124sel == 2'b00) ? req145_2 :
    (n124sel == 2'b01) ? req144_2 :
    (n124sel == 2'b10) ? 1 : 1;
assign ack145_2 = (n124sel != 0) | ack194;
assign ack144_2 = (n124sel != 1) | ack194;
assign ack193_0 = 1'b1;

// node:125 m2c
assign req196 =
    (n125sel == 2'b00) ? req145_3 :
    (n125sel == 2'b01) ? req146_1 :
    (n125sel == 2'b10) ? 1 : 1;
assign ack145_3 = (n125sel != 0) | ack196;
assign ack146_1 = (n125sel != 1) | ack196;
assign ack195_0 = 1'b1;

// node:126 m2c
assign req198 =
    (n126sel == 2'b00) ? req146_2 :
    (n126sel == 2'b01) ? req143_1 :
    (n126sel == 2'b10) ? 1 : 1;
assign ack146_2 = (n126sel != 0) | ack198;
assign ack143_1 = (n126sel != 1) | ack198;
assign ack197_0 = 1'b1;

// node:127 join concat
assign req199 = req143_2 & req188_0 & req190_0 & req192_0;
assign ack143_2 = ack199 & req188_0 & req190_0 & req192_0;
assign ack188_0 = ack199 & req143_2 & req190_0 & req192_0;
assign ack190_0 = ack199 & req143_2 & req188_0 & req192_0;
assign ack192_0 = ack199 & req143_2 & req188_0 & req190_0;
// node:128 join concat
assign req200 = req194_0 & req196_0 & req146_3 & req198_0;
assign ack194_0 = ack200 & req196_0 & req146_3 & req198_0;
assign ack196_0 = ack200 & req194_0 & req146_3 & req198_0;
assign ack146_3 = ack200 & req194_0 & req196_0 & req198_0;
assign ack198_0 = ack200 & req194_0 & req196_0 & req146_3;
// node: 129 muladdsub
reg[3:0] cfg_valid_129;

always @(posedge clk) cfg_valid_129 <= {cfg_valid_129[2:0],req201_0};

assign ack201_0=1'b1;

//stage 1
reg req202_s1_r;
wire req202_s1,ack202_s1;

assign req202_s1 = req202_s1_r;
assign n129s1_en = req199_0 & ack199_0 | cfg_valid_129[3];
assign ack199_0 = ~req202_s1_r | ack202_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req202_s1_r <= 1'b0; else req202_s1_r <= ~ack199_0 | req199_0;

//stage 2
reg req202_s2_r;
wire req202_s2,ack202_s2;

assign req202_s2 = req202_s2_r;
assign n129s2_en = req202_s1 & ack202_s1 | cfg_valid_129[3];
assign ack202_s1 = ~req202_s2_r | ack202_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req202_s2_r <= 1'b0; else req202_s2_r <= ~ack202_s1 | req202_s1;

//stage 3
reg req202_s3_r;

assign req202 = req202_s3_r;
assign n129s3_en = req202_s2 & ack202_s2 | cfg_valid_129[3];
assign ack202_s2 = ~req202_s3_r | ack202;
always @(posedge clk or negedge reset_n) if(~reset_n) req202_s3_r <= 1'b0; else req202_s3_r <= ~ack202_s2 | req202_s2;

// node: 130 muladdsub
reg[3:0] cfg_valid_130;

always @(posedge clk) cfg_valid_130 <= {cfg_valid_130[2:0],req203_0};

assign ack203_0=1'b1;

//stage 1
reg req204_s1_r;
wire req204_s1,ack204_s1;

assign req204_s1 = req204_s1_r;
assign n130s1_en = req200_0 & ack200_0 | cfg_valid_130[3];
assign ack200_0 = ~req204_s1_r | ack204_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req204_s1_r <= 1'b0; else req204_s1_r <= ~ack200_0 | req200_0;

//stage 2
reg req204_s2_r;
wire req204_s2,ack204_s2;

assign req204_s2 = req204_s2_r;
assign n130s2_en = req204_s1 & ack204_s1 | cfg_valid_130[3];
assign ack204_s1 = ~req204_s2_r | ack204_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req204_s2_r <= 1'b0; else req204_s2_r <= ~ack204_s1 | req204_s1;

//stage 3
reg req204_s3_r;

assign req204 = req204_s3_r;
assign n130s3_en = req204_s2 & ack204_s2 | cfg_valid_130[3];
assign ack204_s2 = ~req204_s3_r | ack204;
always @(posedge clk or negedge reset_n) if(~reset_n) req204_s3_r <= 1'b0; else req204_s3_r <= ~ack204_s2 | req204_s2;

// node:131 m2c
assign req206 =
    (n131sel == 2'b00) ? req147_0 :
    (n131sel == 2'b01) ? req149_0 :
    (n131sel == 2'b10) ? 1 : 1;
assign ack147_0 = (n131sel != 0) | ack206;
assign ack149_0 = (n131sel != 1) | ack206;
assign ack205_0 = 1'b1;

// node:132 m2c
assign req208 =
    (n132sel == 2'b00) ? req148_0 :
    (n132sel == 2'b01) ? req149_1 :
    (n132sel == 2'b10) ? 1 : 1;
assign ack148_0 = (n132sel != 0) | ack208;
assign ack149_1 = (n132sel != 1) | ack208;
assign ack207_0 = 1'b1;

// node:133 m2c
assign req210 =
    (n133sel == 2'b00) ? req148_1 :
    (n133sel == 2'b01) ? req150_0 :
    (n133sel == 2'b10) ? 1 : 1;
assign ack148_1 = (n133sel != 0) | ack210;
assign ack150_0 = (n133sel != 1) | ack210;
assign ack209_0 = 1'b1;

// node:134 m2c
assign req212 =
    (n134sel == 2'b00) ? req149_2 :
    (n134sel == 2'b01) ? req148_2 :
    (n134sel == 2'b10) ? 1 : 1;
assign ack149_2 = (n134sel != 0) | ack212;
assign ack148_2 = (n134sel != 1) | ack212;
assign ack211_0 = 1'b1;

// node:135 m2c
assign req214 =
    (n135sel == 2'b00) ? req149_3 :
    (n135sel == 2'b01) ? req150_1 :
    (n135sel == 2'b10) ? 1 : 1;
assign ack149_3 = (n135sel != 0) | ack214;
assign ack150_1 = (n135sel != 1) | ack214;
assign ack213_0 = 1'b1;

// node:136 m2c
assign req216 =
    (n136sel == 2'b00) ? req150_2 :
    (n136sel == 2'b01) ? req147_1 :
    (n136sel == 2'b10) ? 1 : 1;
assign ack150_2 = (n136sel != 0) | ack216;
assign ack147_1 = (n136sel != 1) | ack216;
assign ack215_0 = 1'b1;

// node:137 join concat
assign req217 = req147_2 & req206_0 & req208_0 & req210_0;
assign ack147_2 = ack217 & req206_0 & req208_0 & req210_0;
assign ack206_0 = ack217 & req147_2 & req208_0 & req210_0;
assign ack208_0 = ack217 & req147_2 & req206_0 & req210_0;
assign ack210_0 = ack217 & req147_2 & req206_0 & req208_0;
// node:138 join concat
assign req218 = req212_0 & req214_0 & req150_3 & req216_0;
assign ack212_0 = ack218 & req214_0 & req150_3 & req216_0;
assign ack214_0 = ack218 & req212_0 & req150_3 & req216_0;
assign ack150_3 = ack218 & req212_0 & req214_0 & req216_0;
assign ack216_0 = ack218 & req212_0 & req214_0 & req150_3;
// node: 139 muladdsub
reg[3:0] cfg_valid_139;

always @(posedge clk) cfg_valid_139 <= {cfg_valid_139[2:0],req219_0};

assign ack219_0=1'b1;

//stage 1
reg req220_s1_r;
wire req220_s1,ack220_s1;

assign req220_s1 = req220_s1_r;
assign n139s1_en = req217_0 & ack217_0 | cfg_valid_139[3];
assign ack217_0 = ~req220_s1_r | ack220_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req220_s1_r <= 1'b0; else req220_s1_r <= ~ack217_0 | req217_0;

//stage 2
reg req220_s2_r;
wire req220_s2,ack220_s2;

assign req220_s2 = req220_s2_r;
assign n139s2_en = req220_s1 & ack220_s1 | cfg_valid_139[3];
assign ack220_s1 = ~req220_s2_r | ack220_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req220_s2_r <= 1'b0; else req220_s2_r <= ~ack220_s1 | req220_s1;

//stage 3
reg req220_s3_r;

assign req220 = req220_s3_r;
assign n139s3_en = req220_s2 & ack220_s2 | cfg_valid_139[3];
assign ack220_s2 = ~req220_s3_r | ack220;
always @(posedge clk or negedge reset_n) if(~reset_n) req220_s3_r <= 1'b0; else req220_s3_r <= ~ack220_s2 | req220_s2;

// node: 140 muladdsub
reg[3:0] cfg_valid_140;

always @(posedge clk) cfg_valid_140 <= {cfg_valid_140[2:0],req221_0};

assign ack221_0=1'b1;

//stage 1
reg req222_s1_r;
wire req222_s1,ack222_s1;

assign req222_s1 = req222_s1_r;
assign n140s1_en = req218_0 & ack218_0 | cfg_valid_140[3];
assign ack218_0 = ~req222_s1_r | ack222_s1;
always @(posedge clk or negedge reset_n) if(~reset_n) req222_s1_r <= 1'b0; else req222_s1_r <= ~ack218_0 | req218_0;

//stage 2
reg req222_s2_r;
wire req222_s2,ack222_s2;

assign req222_s2 = req222_s2_r;
assign n140s2_en = req222_s1 & ack222_s1 | cfg_valid_140[3];
assign ack222_s1 = ~req222_s2_r | ack222_s2;
always @(posedge clk or negedge reset_n) if(~reset_n) req222_s2_r <= 1'b0; else req222_s2_r <= ~ack222_s1 | req222_s1;

//stage 3
reg req222_s3_r;

assign req222 = req222_s3_r;
assign n140s3_en = req222_s2 & ack222_s2 | cfg_valid_140[3];
assign ack222_s2 = ~req222_s3_r | ack222;
always @(posedge clk or negedge reset_n) if(~reset_n) req222_s3_r <= 1'b0; else req222_s3_r <= ~ack222_s2 | req222_s2;

// node:141 join add
assign req223 = req76_0 & req112_0;
assign ack76_0 = ack223 & req112_0;
assign ack112_0 = ack223 & req76_0;
// node:142 join add
assign req224 = req78_0 & req114_0;
assign ack78_0 = ack224 & req114_0;
assign ack114_0 = ack224 & req78_0;
// node:143 join add
assign req225 = req94_0 & req130_0;
assign ack94_0 = ack225 & req130_0;
assign ack130_0 = ack225 & req94_0;
// node:144 join add
assign req226 = req96_0 & req132_0;
assign ack96_0 = ack226 & req132_0;
assign ack132_0 = ack226 & req96_0;
// node:145 join sub
assign req227 = req76_1 & req112_1;
assign ack76_1 = ack227 & req112_1;
assign ack112_1 = ack227 & req76_1;
// node:146 join sub
assign req228 = req78_1 & req114_1;
assign ack78_1 = ack228 & req114_1;
assign ack114_1 = ack228 & req78_1;
// node:147 join sub
assign req229 = req94_1 & req130_1;
assign ack94_1 = ack229 & req130_1;
assign ack130_1 = ack229 & req94_1;
// node:148 join sub
assign req230 = req96_1 & req132_1;
assign ack96_1 = ack230 & req132_1;
assign ack132_1 = ack230 & req96_1;
// node:149 join add
assign req231 = req223_0 & req225_0;
assign ack223_0 = ack231 & req225_0;
assign ack225_0 = ack231 & req223_0;
// node:150 join add
assign req232 = req224_0 & req226_0;
assign ack224_0 = ack232 & req226_0;
assign ack226_0 = ack232 & req224_0;
// node:151 join add
assign req233 = req227_0 & req230_0;
assign ack227_0 = ack233 & req230_0;
assign ack230_0 = ack233 & req227_0;
// node:152 join sub
assign req234 = req228_0 & req229_0;
assign ack228_0 = ack234 & req229_0;
assign ack229_0 = ack234 & req228_0;
// node:153 join sub
assign req235 = req223_1 & req225_1;
assign ack223_1 = ack235 & req225_1;
assign ack225_1 = ack235 & req223_1;
// node:154 join sub
assign req236 = req224_1 & req226_1;
assign ack224_1 = ack236 & req226_1;
assign ack226_1 = ack236 & req224_1;
// node:155 join sub
assign req237 = req227_1 & req230_1;
assign ack227_1 = ack237 & req230_1;
assign ack230_1 = ack237 & req227_1;
// node:156 join add
assign req238 = req228_1 & req229_1;
assign ack228_1 = ack238 & req229_1;
assign ack229_1 = ack238 & req228_1;
// node:157 m2c
assign req241 =
    (n157sel == 2'b00) ? req76_2 :
    (n157sel == 2'b01) ? req231_0 :
    (n157sel == 2'b10) ? 1 : 1;
assign ack76_2 = (n157sel != 0) | ack241;
assign ack231_0 = (n157sel != 1) | ack241;
assign ack239_0 = 1'b1;

// node:158 m2c
assign req242 =
    (n158sel == 2'b00) ? req78_2 :
    (n158sel == 2'b01) ? req232_0 :
    (n158sel == 2'b10) ? 1 : 1;
assign ack78_2 = (n158sel != 0) | ack242;
assign ack232_0 = (n158sel != 1) | ack242;
assign ack240_0 = 1'b1;

// node:159 m2c
assign req245 =
    (n159sel == 2'b00) ? req94_2 :
    (n159sel == 2'b01) ? req233_0 :
    (n159sel == 2'b10) ? 1 : 1;
assign ack94_2 = (n159sel != 0) | ack245;
assign ack233_0 = (n159sel != 1) | ack245;
assign ack243_0 = 1'b1;

// node:160 m2c
assign req246 =
    (n160sel == 2'b00) ? req96_2 :
    (n160sel == 2'b01) ? req234_0 :
    (n160sel == 2'b10) ? 1 : 1;
assign ack96_2 = (n160sel != 0) | ack246;
assign ack234_0 = (n160sel != 1) | ack246;
assign ack244_0 = 1'b1;

// node:161 m2c
assign req249 =
    (n161sel == 2'b00) ? req112_2 :
    (n161sel == 2'b01) ? req235_0 :
    (n161sel == 2'b10) ? 1 : 1;
assign ack112_2 = (n161sel != 0) | ack249;
assign ack235_0 = (n161sel != 1) | ack249;
assign ack247_0 = 1'b1;

// node:162 m2c
assign req250 =
    (n162sel == 2'b00) ? req114_2 :
    (n162sel == 2'b01) ? req236_0 :
    (n162sel == 2'b10) ? 1 : 1;
assign ack114_2 = (n162sel != 0) | ack250;
assign ack236_0 = (n162sel != 1) | ack250;
assign ack248_0 = 1'b1;

// node:163 m2c
assign req253 =
    (n163sel == 2'b00) ? req130_2 :
    (n163sel == 2'b01) ? req237_0 :
    (n163sel == 2'b10) ? 1 : 1;
assign ack130_2 = (n163sel != 0) | ack253;
assign ack237_0 = (n163sel != 1) | ack253;
assign ack251_0 = 1'b1;

// node:164 m2c
assign req254 =
    (n164sel == 2'b00) ? req132_2 :
    (n164sel == 2'b01) ? req238_0 :
    (n164sel == 2'b10) ? 1 : 1;
assign ack132_2 = (n164sel != 0) | ack254;
assign ack238_0 = (n164sel != 1) | ack254;
assign ack252_0 = 1'b1;

// node:165 join add
assign req255 = req166_0 & req202_0;
assign ack166_0 = ack255 & req202_0;
assign ack202_0 = ack255 & req166_0;
// node:166 join add
assign req256 = req168_0 & req204_0;
assign ack168_0 = ack256 & req204_0;
assign ack204_0 = ack256 & req168_0;
// node:167 join add
assign req257 = req184_0 & req220_0;
assign ack184_0 = ack257 & req220_0;
assign ack220_0 = ack257 & req184_0;
// node:168 join add
assign req258 = req186_0 & req222_0;
assign ack186_0 = ack258 & req222_0;
assign ack222_0 = ack258 & req186_0;
// node:169 join sub
assign req259 = req166_1 & req202_1;
assign ack166_1 = ack259 & req202_1;
assign ack202_1 = ack259 & req166_1;
// node:170 join sub
assign req260 = req168_1 & req204_1;
assign ack168_1 = ack260 & req204_1;
assign ack204_1 = ack260 & req168_1;
// node:171 join sub
assign req261 = req184_1 & req220_1;
assign ack184_1 = ack261 & req220_1;
assign ack220_1 = ack261 & req184_1;
// node:172 join sub
assign req262 = req186_1 & req222_1;
assign ack186_1 = ack262 & req222_1;
assign ack222_1 = ack262 & req186_1;
// node:173 join add
assign req263 = req255_0 & req257_0;
assign ack255_0 = ack263 & req257_0;
assign ack257_0 = ack263 & req255_0;
// node:174 join add
assign req264 = req256_0 & req258_0;
assign ack256_0 = ack264 & req258_0;
assign ack258_0 = ack264 & req256_0;
// node:175 join add
assign req265 = req259_0 & req262_0;
assign ack259_0 = ack265 & req262_0;
assign ack262_0 = ack265 & req259_0;
// node:176 join sub
assign req266 = req260_0 & req261_0;
assign ack260_0 = ack266 & req261_0;
assign ack261_0 = ack266 & req260_0;
// node:177 join sub
assign req267 = req255_1 & req257_1;
assign ack255_1 = ack267 & req257_1;
assign ack257_1 = ack267 & req255_1;
// node:178 join sub
assign req268 = req256_1 & req258_1;
assign ack256_1 = ack268 & req258_1;
assign ack258_1 = ack268 & req256_1;
// node:179 join sub
assign req269 = req259_1 & req262_1;
assign ack259_1 = ack269 & req262_1;
assign ack262_1 = ack269 & req259_1;
// node:180 join add
assign req270 = req260_1 & req261_1;
assign ack260_1 = ack270 & req261_1;
assign ack261_1 = ack270 & req260_1;
// node:181 m2c
assign req273 =
    (n181sel == 2'b00) ? req166_2 :
    (n181sel == 2'b01) ? req263_0 :
    (n181sel == 2'b10) ? 1 : 1;
assign ack166_2 = (n181sel != 0) | ack273;
assign ack263_0 = (n181sel != 1) | ack273;
assign ack271_0 = 1'b1;

// node:182 m2c
assign req274 =
    (n182sel == 2'b00) ? req168_2 :
    (n182sel == 2'b01) ? req264_0 :
    (n182sel == 2'b10) ? 1 : 1;
assign ack168_2 = (n182sel != 0) | ack274;
assign ack264_0 = (n182sel != 1) | ack274;
assign ack272_0 = 1'b1;

// node:183 m2c
assign req277 =
    (n183sel == 2'b00) ? req184_2 :
    (n183sel == 2'b01) ? req265_0 :
    (n183sel == 2'b10) ? 1 : 1;
assign ack184_2 = (n183sel != 0) | ack277;
assign ack265_0 = (n183sel != 1) | ack277;
assign ack275_0 = 1'b1;

// node:184 m2c
assign req278 =
    (n184sel == 2'b00) ? req186_2 :
    (n184sel == 2'b01) ? req266_0 :
    (n184sel == 2'b10) ? 1 : 1;
assign ack186_2 = (n184sel != 0) | ack278;
assign ack266_0 = (n184sel != 1) | ack278;
assign ack276_0 = 1'b1;

// node:185 m2c
assign req281 =
    (n185sel == 2'b00) ? req202_2 :
    (n185sel == 2'b01) ? req267_0 :
    (n185sel == 2'b10) ? 1 : 1;
assign ack202_2 = (n185sel != 0) | ack281;
assign ack267_0 = (n185sel != 1) | ack281;
assign ack279_0 = 1'b1;

// node:186 m2c
assign req282 =
    (n186sel == 2'b00) ? req204_2 :
    (n186sel == 2'b01) ? req268_0 :
    (n186sel == 2'b10) ? 1 : 1;
assign ack204_2 = (n186sel != 0) | ack282;
assign ack268_0 = (n186sel != 1) | ack282;
assign ack280_0 = 1'b1;

// node:187 m2c
assign req285 =
    (n187sel == 2'b00) ? req220_2 :
    (n187sel == 2'b01) ? req269_0 :
    (n187sel == 2'b10) ? 1 : 1;
assign ack220_2 = (n187sel != 0) | ack285;
assign ack269_0 = (n187sel != 1) | ack285;
assign ack283_0 = 1'b1;

// node:188 m2c
assign req286 =
    (n188sel == 2'b00) ? req222_2 :
    (n188sel == 2'b01) ? req270_0 :
    (n188sel == 2'b10) ? 1 : 1;
assign ack222_2 = (n188sel != 0) | ack286;
assign ack270_0 = (n188sel != 1) | ack286;
assign ack284_0 = 1'b1;

// node:189 join concat
assign req287 = req292_0 & req293_0 & req298_0 & req299_0 & req304_0 & req305_0 & req310_0 & req311_0;
assign ack292_0 = ack287 & req293_0 & req298_0 & req299_0 & req304_0 & req305_0 & req310_0 & req311_0;
assign ack293_0 = ack287 & req292_0 & req298_0 & req299_0 & req304_0 & req305_0 & req310_0 & req311_0;
assign ack298_0 = ack287 & req292_0 & req293_0 & req299_0 & req304_0 & req305_0 & req310_0 & req311_0;
assign ack299_0 = ack287 & req292_0 & req293_0 & req298_0 & req304_0 & req305_0 & req310_0 & req311_0;
assign ack304_0 = ack287 & req292_0 & req293_0 & req298_0 & req299_0 & req305_0 & req310_0 & req311_0;
assign ack305_0 = ack287 & req292_0 & req293_0 & req298_0 & req299_0 & req304_0 & req310_0 & req311_0;
assign ack310_0 = ack287 & req292_0 & req293_0 & req298_0 & req299_0 & req304_0 & req305_0 & req311_0;
assign ack311_0 = ack287 & req292_0 & req293_0 & req298_0 & req299_0 & req304_0 & req305_0 & req310_0;
// node:190 bs
assign req290 = req241_0;
assign ack241_0 = ack290;
assign ack288_0 = 1'b1;
// node:191 bs
assign req291 = req242_0;
assign ack242_0 = ack291;
assign ack289_0 = 1'b1;
// node:192 join round_sat
assign req292 = req290_0;
assign ack290_0 = ack292;
// node:193 join round_sat
assign req293 = req291_0;
assign ack291_0 = ack293;
// node:194 bs
assign req296 = req245_0;
assign ack245_0 = ack296;
assign ack294_0 = 1'b1;
// node:195 bs
assign req297 = req246_0;
assign ack246_0 = ack297;
assign ack295_0 = 1'b1;
// node:196 join round_sat
assign req298 = req296_0;
assign ack296_0 = ack298;
// node:197 join round_sat
assign req299 = req297_0;
assign ack297_0 = ack299;
// node:198 bs
assign req302 = req249_0;
assign ack249_0 = ack302;
assign ack300_0 = 1'b1;
// node:199 bs
assign req303 = req250_0;
assign ack250_0 = ack303;
assign ack301_0 = 1'b1;
// node:200 join round_sat
assign req304 = req302_0;
assign ack302_0 = ack304;
// node:201 join round_sat
assign req305 = req303_0;
assign ack303_0 = ack305;
// node:202 bs
assign req308 = req253_0;
assign ack253_0 = ack308;
assign ack306_0 = 1'b1;
// node:203 bs
assign req309 = req254_0;
assign ack254_0 = ack309;
assign ack307_0 = 1'b1;
// node:204 join round_sat
assign req310 = req308_0;
assign ack308_0 = ack310;
// node:205 join round_sat
assign req311 = req309_0;
assign ack309_0 = ack311;
// node:206 join concat
assign req312 = req317_0 & req318_0 & req323_0 & req324_0 & req329_0 & req330_0 & req335_0 & req336_0;
assign ack317_0 = ack312 & req318_0 & req323_0 & req324_0 & req329_0 & req330_0 & req335_0 & req336_0;
assign ack318_0 = ack312 & req317_0 & req323_0 & req324_0 & req329_0 & req330_0 & req335_0 & req336_0;
assign ack323_0 = ack312 & req317_0 & req318_0 & req324_0 & req329_0 & req330_0 & req335_0 & req336_0;
assign ack324_0 = ack312 & req317_0 & req318_0 & req323_0 & req329_0 & req330_0 & req335_0 & req336_0;
assign ack329_0 = ack312 & req317_0 & req318_0 & req323_0 & req324_0 & req330_0 & req335_0 & req336_0;
assign ack330_0 = ack312 & req317_0 & req318_0 & req323_0 & req324_0 & req329_0 & req335_0 & req336_0;
assign ack335_0 = ack312 & req317_0 & req318_0 & req323_0 & req324_0 & req329_0 & req330_0 & req336_0;
assign ack336_0 = ack312 & req317_0 & req318_0 & req323_0 & req324_0 & req329_0 & req330_0 & req335_0;
// node:207 bs
assign req315 = req273_0;
assign ack273_0 = ack315;
assign ack313_0 = 1'b1;
// node:208 bs
assign req316 = req274_0;
assign ack274_0 = ack316;
assign ack314_0 = 1'b1;
// node:209 join round_sat
assign req317 = req315_0;
assign ack315_0 = ack317;
// node:210 join round_sat
assign req318 = req316_0;
assign ack316_0 = ack318;
// node:211 bs
assign req321 = req277_0;
assign ack277_0 = ack321;
assign ack319_0 = 1'b1;
// node:212 bs
assign req322 = req278_0;
assign ack278_0 = ack322;
assign ack320_0 = 1'b1;
// node:213 join round_sat
assign req323 = req321_0;
assign ack321_0 = ack323;
// node:214 join round_sat
assign req324 = req322_0;
assign ack322_0 = ack324;
// node:215 bs
assign req327 = req281_0;
assign ack281_0 = ack327;
assign ack325_0 = 1'b1;
// node:216 bs
assign req328 = req282_0;
assign ack282_0 = ack328;
assign ack326_0 = 1'b1;
// node:217 join round_sat
assign req329 = req327_0;
assign ack327_0 = ack329;
// node:218 join round_sat
assign req330 = req328_0;
assign ack328_0 = ack330;
// node:219 bs
assign req333 = req285_0;
assign ack285_0 = ack333;
assign ack331_0 = 1'b1;
// node:220 bs
assign req334 = req286_0;
assign ack286_0 = ack334;
assign ack332_0 = 1'b1;
// node:221 join round_sat
assign req335 = req333_0;
assign ack333_0 = ack335;
// node:222 join round_sat
assign req336 = req334_0;
assign ack334_0 = ack336;
// node:20 initiator
assign i_odma_0_req = req354_0;
assign ack354_0 = i_odma_0_ack;
// node:21 initiator
assign i_odma_1_req = req356_0;
assign ack356_0 = i_odma_1_ack;
// node:23 initiator
assign i_odma_2_req = req358_0;
assign ack358_0 = i_odma_2_ack;
// node:25 initiator
assign i_odma_3_req = req359_0;
assign ack359_0 = i_odma_3_ack;
endmodule // piston_ctrl
