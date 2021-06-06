module rdp_systolic_ctrl_${local[0]}_${local[1]} (
<% ['k8','k9','k10','k11','c'].map(e => {%>
    input                 t_<%= e %>_req,
    output wire          t_<%= e %>_ack,
<% }) %>
<% ['k1','k2'].map(e => {%>
    output wire          i_<%= e %>_req,
    input                 i_<%= e %>_ack,
<% }) %>
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
