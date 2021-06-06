module inmux_dat_${local[0]}_${local[1]} (
<% law.inmuxReal.map(e => { %>
    input wire       [<%= slices * dataWidth - 1 %>:0] t_k<%= e %>_dat,
<% }) %>
<% ['c'].map(e => {%>
    input wire          [<%= law.selin - 1 %>:0] t_<%= e %>_dat,
<% }) %>
    output reg [<%= slices * dataWidth - 1 %>:0] i_inmux_dat,

    output wire [<%= law.selin -1 %>:0] sel,
    input  wire               clk, reset_n
);

  assign sel=t_c_dat;

// data
always @(*)
    case(t_c_dat) <% law.inmuxReal.map((e,i) => {
const set = law.inmux %>
        <%= set[i] %> :     i_inmux_dat = t_k<%= e %>_dat;<% }) %>
        default i_inmux_dat = 'bx;
    endcase

endmodule
