<%
const range = require('lodash.range');
%>
module ka_decode_dat_${local[0]}_${local[1]} (
    input [<%= law.selou + slices * law.baddr - 1 %>:0]       t_ka_dat,
    output wire [<%= law.selou - 1 %>:0] 		      i_k_sk_dat,
    output wire [<%= law.selou - 1 %>:0] 		      i_k_lk_dat,
    output wire [<%= law.selou + slices * law.baddr - 1 %>:0] i_ka_dat,
    output wire [<%= law.selou -1 %>:0]                       k_ctrl,
    input 						      clk, reset_n
);

   assign i_k_sk_dat=t_ka_dat[<%=law.selou+ slices * law.baddr -1 %>:<%= slices * law.baddr %>];
   assign i_k_lk_dat=t_ka_dat[<%=law.selou+ slices * law.baddr -1 %>:<%= slices * law.baddr %>];
   assign i_ka_dat=t_ka_dat;
   
   assign k_ctrl=t_ka_dat[<%=law.selou+ slices * law.baddr -1 %>:<%= slices * law.baddr %>];
   
endmodule
