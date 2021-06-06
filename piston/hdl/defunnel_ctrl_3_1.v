

module defunnel_ctrl_3_1 (


    input        t_0_req,
    output       t_0_ack,

    input        t_1_req,
    output       t_1_ack,

    input        t_cfg_req,
    output       t_cfg_ack,

    output       i_0_req,
    input        i_0_ack,

    output       [7:0] enable,
    input        [7:0] mode,
    input clk, reset_n
);

wire [1:0] reduct; assign reduct = mode[1:0];

wire t_req; assign t_req = (
    reduct[0] ? (t_0_req) :
    reduct[1] ? (t_0_req & t_1_req) :
    1'b0
);

reg [3:0] valid;
wire [3:0] valid_nxt; // data valid bit

wire t_ack; assign t_ack = i_0_ack | (~&valid);

wire progress; assign progress = t_req & ((~&valid) | (&valid & i_0_ack));

reg [1:0] state;
wire [1:0] state_nxt; assign state_nxt = state + reduct;

assign valid_nxt = ((i_0_ack & (state === 'b0)) ? 4'b0 : valid) | enable[3:0];

always @(posedge clk or negedge reset_n)
    if (~reset_n)      state <= 2'b0;
    else if (progress) state <= state_nxt;

always @(posedge clk or negedge reset_n)
    if (~reset_n) valid <= 4'b0;
    else          valid <= valid_nxt;


assign enable = {4{progress}} & (
    reduct[0] ? (1'b1 << state):
    reduct[1] ? (2'b11 << state):
    1'b0
);


assign t_0_ack = t_req & (
    reduct[1] ? t_ack :
    reduct[0] ? t_ack :
    1'b1
);

assign t_1_ack = t_req & (
    reduct[1] ? t_ack :
    1'b1
);


assign t_cfg_ack = 1'b1;

assign i_0_req = &valid;

endmodule
