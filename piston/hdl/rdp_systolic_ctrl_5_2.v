module rdp_systolic_ctrl_5_2 (

    input                 t_k8_req,
    output wire          t_k8_ack,

    input                 t_k9_req,
    output wire          t_k9_ack,

    input                 t_k10_req,
    output wire          t_k10_ack,

    input                 t_k11_req,
    output wire          t_k11_ack,

    input                 t_c_req,
    output wire          t_c_ack,


    output wire          i_k1_req,
    input                 i_k1_ack,

    output wire          i_k2_req,
    input                 i_k2_ack,

    input  clk, reset_n
);

// request
assign i_k1_req = t_k8_req & t_k9_req & t_c_req;
assign i_k2_req = t_k10_req & t_k11_req & t_c_req;

// acknowledge
assign t_k8_ack = i_k1_ack & t_k9_req & t_c_req;
assign t_k9_ack = i_k1_ack & t_k8_req & t_c_req;
assign t_k10_ack = i_k2_ack & t_k11_req & t_c_req;
assign t_k11_ack = i_k2_ack & t_k10_req & t_c_req;
assign t_c_ack = i_k1_ack & i_k2_ack & t_k8_req & t_k9_req & t_k10_req & t_k11_req;

endmodule
