module inmux_ctrl_4_1
(
 
 input wire                          t_k1_req,
 output wire                         t_k1_ack,

 input wire                          t_k13_req,
 output wire                         t_k13_ack,

 input wire                          t_k15_req,
 output wire                         t_k15_ack,


 input wire                          t_c_req,
 output wire                         t_c_ack,

 output wire                         i_inmux_req,
 input wire                          i_inmux_ack,

 //exports
 input wire [3:0] sel,

 input wire                          clk, reset_n
 );

  // request
  reg i_0_valid_temp;
  reg invalid_op;

always @(*)
    case(sel)
        1 : begin
           i_0_valid_temp = t_k1_req;
           invalid_op = 0;
        end 
        5 : begin
           i_0_valid_temp = t_k13_req;
           invalid_op = 0;
        end 
        7 : begin
           i_0_valid_temp = t_k15_req;
           invalid_op = 0;
        end 
        default: begin
          i_0_valid_temp = 1'b0;
          invalid_op= 1;
        end
        endcase

assign i_inmux_req = i_0_valid_temp & t_c_req;


// acknowledge


assign t_k1_ack = ((t_c_req & (sel[3:0] == 1)) & i_inmux_ack);
assign t_k13_ack = ((t_c_req & (sel[3:0] == 5)) & i_inmux_ack);
assign t_k15_ack = ((t_c_req & (sel[3:0] == 7)) & i_inmux_ack);

assign t_c_ack = i_0_valid_temp & i_inmux_ack | invalid_op & t_c_req;

endmodule
