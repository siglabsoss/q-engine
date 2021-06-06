<%
  const range = require('lodash.range');
%>

module vector_ctrl_${local[0]}_${local[1]}
  (
   <% range(slices).map(e => { %>
   input wire   t_instr_<%= e %>_req,
   output wire t_instr_<%= e %>_ack,
   <% }) %>
   input wire   t_k15_req,
   output wire t_k15_ack,
   //initiators
   output wire i_k15_req,
   input wire   i_k15_ack,
   output wire i_kap_req,
   input wire   i_kap_ack,
   //exports
   <% range(slices).map(e => { %>
   output wire instr_<%= e %>_valid,
   input wire   instr_<%= e %>_ready,
   <% }) %>
                               
   output wire tk15_valid,
   input wire   tk15_ready,
   
   input wire   ik15_valid,
   output wire ik15_ready,

   input wire   kap_valid,
   output wire kap_ready,
   
   input wire   clk, reset_n
   );

   <% range(slices).map(e => { %>
   assign instr_<%= e %>_valid=t_instr_<%= e %>_req;
`ifndef QENGINE_LITE
   assign t_instr_<%= e %>_ack=instr_<%= e %>_ready;
`else
   assign t_instr_<%= e %>_ack=1;
`endif
<% }) %>
   assign tk15_valid=t_k15_req;
   assign t_k15_ack=tk15_ready;
   
   assign i_k15_req=ik15_valid;
   assign ik15_ready=i_k15_ack;

   assign i_kap_req=kap_valid;
   assign kap_ready=i_kap_ack;
   
endmodule
   
