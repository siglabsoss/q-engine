module oumux_dat_${local[0]}_${local[1]} (
    input wire [<%= slices * dataWidth - 1 %>:0] t_oumux_dat,

    input wire [<%= law.selou - 1 %>:0]             t_c_dat,

                                            <% law.oumux.map(e => { %>
    output wire [<%= slices * dataWidth -1 %>:0]    i_k<%= e %>_dat,
                                            <% }) %>
    output wire [<%= law.selou - 1 %>:0]         sel,
    input wire                              clk, reset_n
);

   assign sel=t_c_dat;

<% law.oumux.map((e, i) => { %>
assign i_k<%= e %>_dat = t_oumux_dat; <% }) %>

endmodule
