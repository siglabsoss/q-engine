module rdp_systolic_dat_${local[0]}_${local[1]} (
<% ['k8','k9','k10','k11','c'].map(e => {%>
    input        [<%= slices * dataWidth - 1 %>:0] t_<%= e %>_dat,
<% }) %>
<% ['k1','k2'].map(e => {%>
    output wire [<%= slices * dataWidth - 1 %>:0] i_<%= e %>_dat,
<% }) %>
    input  clk, reset_n
);

// data
assign i_k1_dat = t_k8_dat ^ t_k9_dat ^ t_c_dat;
assign i_k2_dat = t_k10_dat ^ t_k11_dat ^ t_c_dat;

endmodule
