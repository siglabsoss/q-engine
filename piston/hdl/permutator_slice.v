module permutator_slice (

    // stage 0
    input        [31:0] t0_dat,
    output wire [31:0] i0_dat,

    // stage 1
    input        [31:0] t1_dat,
    output wire [31:0] i1_dat,

    input        [0:0] i1_adr,

    // stage 2
    input        [31:0] t2_dat,
    output wire [31:0] i2_dat,

    output wire [0:0] t2_adr,
    input        [1:0] i2_adr,

    // stage 3
    input        [31:0] t3_dat,
    output wire [31:0] i3_dat,

    output wire [1:0] t3_adr,
    input        [2:0] i3_adr,

    // stage 4
    input        [31:0] t4_dat,
    output wire [31:0] i4_dat,

    output wire [2:0] t4_adr,
    input        [3:0] i4_adr,

    input [3:0] cfg
);


    wire [0:0] adr1;

    wire [1:0] adr2;

    wire [2:0] adr3;

    wire [3:0] adr4;



    wire adr_lsb1, sel1;
    assign sel1 = adr_lsb1 ^ (cfg[3]);

    wire adr_lsb2, sel2;
    assign sel2 = adr_lsb2 ^ (cfg[2]);

    wire adr_lsb3, sel3;
    assign sel3 = adr_lsb3 ^ (cfg[1]);

    wire adr_lsb4, sel4;
    assign sel4 = adr_lsb4 ^ (cfg[0]);



    wire [0:0] adr_rest2, adr_back2;
    assign adr_back2 = adr_rest2 & ~{1{sel2}};
    assign t2_adr    = adr_rest2 &  {1{sel2}};

    wire [1:0] adr_rest3, adr_back3;
    assign adr_back3 = adr_rest3 & ~{2{sel3}};
    assign t3_adr    = adr_rest3 &  {2{sel3}};

    wire [2:0] adr_rest4, adr_back4;
    assign adr_back4 = adr_rest4 & ~{3{sel4}};
    assign t4_adr    = adr_rest4 &  {3{sel4}};



    assign adr_lsb1 = adr1;

    assign {adr_rest2, adr_lsb2} = adr2;

    assign {adr_rest3, adr_lsb3} = adr3;

    assign {adr_rest4, adr_lsb4} = adr4;



    assign adr1 = i1_adr | adr_back2;

    assign adr2 = i2_adr | adr_back3;

    assign adr3 = i3_adr | adr_back4;

    assign adr4 = i4_adr;



    assign i0_dat = t0_dat;

    assign i1_dat = sel1 ? t1_dat : i0_dat;

    assign i2_dat = sel2 ? t2_dat : i1_dat;

    assign i3_dat = sel3 ? t3_dat : i2_dat;

    assign i4_dat = sel4 ? t4_dat : i3_dat;


endmodule
