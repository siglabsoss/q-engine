module inmux_ctrl_${local[0]}_${local[1]}
(
 <% law.inmuxReal.map(e => { %>
 input wire                          t_k<%= e %>_req,
 output wire                         t_k<%= e %>_ack,
<% }) %>

 input wire                          t_c_req,
 output wire                         t_c_ack,

 output wire                         i_inmux_req,
 input wire                          i_inmux_ack,

 //exports
 input wire [<%= law.selin - 1 %>:0] sel,

 input wire                          clk, reset_n
 );

  // request
  reg i_0_valid_temp;
  reg invalid_op;

always @(*)
    case(sel)<% law.inmuxReal.map((e, i) => {
        const set = law.inmux %>
        <%= set[i] %> : begin
           i_0_valid_temp = t_k<%= e %>_req;
           invalid_op = 0;
        end <% }) %>
        default: begin
          i_0_valid_temp = 1'b0;
          invalid_op= 1;
        end
        endcase

assign i_inmux_req = i_0_valid_temp & t_c_req;


// acknowledge

<% law.inmuxReal.map((e,i) => {
const set = law.inmux %>
assign t_k<%= e %>_ack = ((t_c_req & (sel[<%= law.selin - 1 %>:0] == <%= set[i] %>)) & i_inmux_ack);<% }) %>

assign t_c_ack = i_0_valid_temp & i_inmux_ack | invalid_op & t_c_req;

endmodule
