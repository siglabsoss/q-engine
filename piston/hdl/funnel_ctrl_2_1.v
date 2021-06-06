

module funnel_ctrl_2_1 (
    input        t_0_req,
    output       t_0_ack,
    input        t_cfg_req,
    output       t_cfg_ack,

    output       i_0_req,
    input        i_0_ack,

    output       [7:0] sel,
    input        [7:0] mode,
    input clk, reset_n
);

// 8:4
// reduct   state    sel    req0    req1    req2    req3
// 4        0        000    req     req     req     req
// 4        4        001    req     req     req     req

// 8:2
// reduct   state    sel    req0    req1    req2    req3
// 2        0        000    req     req     0       0
// 2        2        010    req     req     0       0
// 2        4        001    req     req     0       0
// 2        6        011    req     req     0       0

// 8:1
// reduct   state    sel    req0    req1    req2    req3
// 1        0        000    req     0       0       0
// 1        1        100    req     0       0       0
// 1        2        010    req     0       0       0
// 1        3        110    req     0       0       0
// 1        4        001    req     0       0       0
// 1        5        101    req     0       0       0
// 1        6        011    req     0       0       0
// 1        7        111    req     0       0       0

wire [0:0] reduct; assign reduct = mode[0:0];

wire progress; assign progress = (
    reduct[0] ? (t_0_req & i_0_ack) :
    1'b0
);

reg [0:0] state;
wire [0:0] state_nxt; assign state_nxt = state + reduct;

always @(posedge clk or negedge reset_n)
    if (~reset_n)      state <= 1'b0;
    else if (progress) state <= state_nxt;

wire last; assign last = (state_nxt == 1'b0);

assign t_0_ack = last & (
    reduct[0] ? (i_0_ack) :
    1'b0
);

assign sel = {state[0]}; // reverse order


assign i_0_req = t_0_req & reduct[0];

assign t_cfg_ack = 1'b1;

endmodule
