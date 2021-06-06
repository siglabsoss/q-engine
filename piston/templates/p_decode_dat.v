<%
const range = require('lodash.range');
%>
module p_decode_dat_${local[0]}_${local[1]} (
    input [<%= law.selou + slices * law.perin - 1 %>:0] t_kp_dat,
    output wire [<%= slices * law.perin - 1 %>:0] 	i_p_sk_dat,
    output wire [<%= slices * law.perin - 1 %>:0] 	i_p_lk_dat,
    output wire [<%= law.selou-1%>:0] 			k_ctrl,
    input 						clk, reset_n
);

   assign i_p_sk_dat=t_kp_dat[<%= slices*law.perin-1 %>:0];
   assign i_p_lk_dat=t_kp_dat[<%= slices*law.perin-1 %>:0];

   assign k_ctrl=t_kp_dat[<%= law.selou + slices * law.perin -1 %>:<%= slices*law.perin %>];

endmodule
