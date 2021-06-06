module k15_op (
    // per node (target / initiator)
    input              clk,
    input              reset_n,
    input       [23:0] t_k15_op_dat,
    input              t_k15_op_req,
    output             t_k15_op_ack,
    output      [23:0] i_k15_op_dat,
    output             i_k15_op_req,
    input              i_k15_op_ack
);
// per edge
wire      [23:0] dat0, dat0_nxt;
wire      [23:0] dat1, dat1_nxt;
wire      [23:0] dat2, dat2_nxt;
// per node
// node:0 is target port
assign dat0_nxt = t_k15_op_dat;

// node:1 equality
assign dat1_nxt = dat0;

// node:2 equality
assign dat2_nxt = dat1;

// node:3 is initiator port
assign i_k15_op_dat = dat2;

// per edge

// edge:0 EB1.5
wire en0_0, en0_1, sel0;
reg [23:0] dat0_r0, dat0_r1;
always @(posedge clk) if (en0_0) dat0_r0 <= dat0_nxt;
always @(posedge clk) if (en0_1) dat0_r1 <= dat0_nxt;

assign dat0 = sel0 ? dat0_r1 : dat0_r0;


// edge:1 EB1
wire en1;
reg [23:0] dat1_r;
always @(posedge clk) if (en1) dat1_r <= dat1_nxt;
assign dat1 = dat1_r;


// edge:2 EB1.5
wire en2_0, en2_1, sel2;
reg [23:0] dat2_r0, dat2_r1;
always @(posedge clk) if (en2_0) dat2_r0 <= dat2_nxt;
always @(posedge clk) if (en2_1) dat2_r1 <= dat2_nxt;

assign dat2 = sel2 ? dat2_r1 : dat2_r0;

k15_op_ctrl uctrl (
    .clk(clk),
    .reset_n(reset_n),
    .t_k15_op_req(t_k15_op_req),
    .t_k15_op_ack(t_k15_op_ack),
    .i_k15_op_req(i_k15_op_req),
    .i_k15_op_ack(i_k15_op_ack),
    .en0_0(en0_0),
    .en0_1(en0_1),
    .sel0(sel0),
    .en1(en1),
    .en2_0(en2_0),
    .en2_1(en2_1),
    .sel2(sel2)
);
endmodule // k15_op

module k15_op_ctrl (
    // per node (target / initiator)
    input              clk,
    input              reset_n,
    input              t_k15_op_req,
    output             t_k15_op_ack,
    output             i_k15_op_req,
    input              i_k15_op_ack,
    output             en0_0,
    output             en0_1,
    output             sel0,
    output             en1,
    output             en2_0,
    output             en2_1,
    output             sel2
);
// per edge
wire             req0, ack0, ack0_0, req0_0;
wire             req1, ack1, ack1_0, req1_0;
wire             req2, ack2, ack2_0, req2_0;
// node:t_k15_op target
assign req0 = t_k15_op_req;
assign t_k15_op_ack = ack0;

// edge:0 EB1.5
wire ack0m, req0m;
eb15_ctrl uctrl_0 (
    .t_0_req(req0), .t_0_ack(ack0),
    .i_0_req(req0m), .i_0_ack(ack0m),
    .en0(en0_0), .en1(en0_1), .sel(sel0),
    .clk(clk), .reset_n(reset_n)
);


// edge:0 fork


assign req0_0 = req0m;

assign ack0m = ack0_0;



// edge:1 EB1
wire ack1m;
reg req1m;
assign en1 = req1 & ack1;
assign ack1 = ~req1m | ack1m;
always @(posedge clk or negedge reset_n) if (~reset_n) req1m <= 1'b0; else req1m <= ~ack1 | req1;


// edge:1 fork


assign req1_0 = req1m;

assign ack1m = ack1_0;



// edge:2 EB1.5
wire ack2m, req2m;
eb15_ctrl uctrl_2 (
    .t_0_req(req2), .t_0_ack(ack2),
    .i_0_req(req2m), .i_0_ack(ack2m),
    .en0(en2_0), .en1(en2_1), .sel(sel2),
    .clk(clk), .reset_n(reset_n)
);


// edge:2 fork


assign req2_0 = req2m;

assign ack2m = ack2_0;


// node:1 join undefined
assign req1 = req0_0;
assign ack0_0 = ack1;
// node:2 join undefined
assign req2 = req1_0;
assign ack1_0 = ack2;
// node:3 initiator
assign i_k15_op_req = req2_0;
assign ack2_0 = i_k15_op_ack;
endmodule // k15_op_ctrl
