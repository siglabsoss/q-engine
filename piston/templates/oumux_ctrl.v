module oumux_ctrl_${local[0]}_${local[1]}
(
 <% law.oumux.map(e => { %>
 output wire                         i_k<%= e %>_req,
 input wire                          i_k<%= e %>_ack,
<% }) %>
 input wire                          t_c_req,
 output wire                         t_c_ack,

 input wire                          t_oumux_req,
 output wire                         t_oumux_ack,

 //exports
 input wire [<%= law.selou - 1 %>:0] sel,

 input wire clk, reset_n
 );

  // request
// request
<% law.oumux.map((e,i) => {
const set=law.oumux %>
assign i_k<%= e %>_req = t_oumux_req & t_c_req & (sel == <%= e %>);<% }) %>

//acknowledge
reg i_ready;
  reg invalid_op;

always @(*)
  case(sel)<% law.oumux.map((e, i) => {
        const set = law.oumux %>
        <%= set[i] %> : begin
           i_ready = i_k<%= e %>_ack;
           invalid_op = 0;
        end
        <% }) %>
    default: begin
       i_ready = 1'b0;
       invalid_op= 1;
    end
  endcase

   assign t_oumux_ack= (i_ready & t_c_req & ~invalid_op);

   assign t_c_ack= (t_oumux_req & i_ready) | (invalid_op & t_c_req);

endmodule
