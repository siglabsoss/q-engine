// address decoder for the permutation network
// consumes destination address and produces source address
<%

const addrWidth = Math.log2(slices);

%>
module perm_full_addr_dat_1_1 (
    input  [<%= law.selou + slices * law.perin - 1 %>:0] t_0_dat,
    output [<%= law.selou + slices * law.perin - 1 %>:0] i_0_dat,
    input clk, reset_n
);

assign i_0_dat = t_0_dat;

endmodule
