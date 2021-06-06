
module perm_addr_slice (

    input        [0:0] i1,

    output wire  [0:0] t2,
    input        [1:0] i2,

    output wire  [1:0] t3,
    input        [2:0] i3,

    output wire  [2:0] t4,
    input        [3:0] i4,

    output wire sel1, sel2, sel3, sel4,

    input [3:0] cfg
);

    wire adr_lsb1, adr_lsb2, adr_lsb3, adr_lsb4;



    wire [0:0] adr1;
    wire [1:0] adr2;
    wire [2:0] adr3;
    wire [3:0] adr4;



    wire [0:0] adr_rest2, adr_back2;
    assign adr_back2 = adr_rest2 & ~{1{sel2}};
    assign t2    = adr_rest2 &  {1{sel2}};

    wire [1:0] adr_rest3, adr_back3;
    assign adr_back3 = adr_rest3 & ~{2{sel3}};
    assign t3    = adr_rest3 &  {2{sel3}};

    wire [2:0] adr_rest4, adr_back4;
    assign adr_back4 = adr_rest4 & ~{3{sel4}};
    assign t4    = adr_rest4 &  {3{sel4}};



    assign adr1 = i1 | adr_back2;

    assign adr2 = i2 | adr_back3;

    assign adr3 = i3 | adr_back4;

    assign adr4 = i4;



    assign adr_lsb1 = adr1;

    assign {adr_rest2, adr_lsb2} = adr2;

    assign {adr_rest3, adr_lsb3} = adr3;

    assign {adr_rest4, adr_lsb4} = adr4;



    assign sel1 = adr_lsb1 ^ cfg[3];
    assign sel2 = adr_lsb2 ^ cfg[2];
    assign sel3 = adr_lsb3 ^ cfg[1];
    assign sel4 = adr_lsb4 ^ cfg[0];

endmodule
