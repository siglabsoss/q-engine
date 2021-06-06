module oumux_ctrl_2_5
(
 
 output wire                         i_k8_req,
 input wire                          i_k8_ack,

 output wire                         i_k9_req,
 input wire                          i_k9_ack,

 output wire                         i_k13_req,
 input wire                          i_k13_ack,

 output wire                         i_k14_req,
 input wire                          i_k14_ack,

 output wire                         i_k15_req,
 input wire                          i_k15_ack,

 input wire                          t_c_req,
 output wire                         t_c_ack,

 input wire                          t_oumux_req,
 output wire                         t_oumux_ack,

 //exports
 input wire [3:0] sel,

 input wire clk, reset_n
 );

  // request
// request

assign i_k8_req = t_oumux_req & t_c_req & (sel == 8);
assign i_k9_req = t_oumux_req & t_c_req & (sel == 9);
assign i_k13_req = t_oumux_req & t_c_req & (sel == 13);
assign i_k14_req = t_oumux_req & t_c_req & (sel == 14);
assign i_k15_req = t_oumux_req & t_c_req & (sel == 15);

//acknowledge
reg i_ready;
  reg invalid_op;

always @(*)
  case(sel)
        8 : begin
           i_ready = i_k8_ack;
           invalid_op = 0;
        end
        
        9 : begin
           i_ready = i_k9_ack;
           invalid_op = 0;
        end
        
        13 : begin
           i_ready = i_k13_ack;
           invalid_op = 0;
        end
        
        14 : begin
           i_ready = i_k14_ack;
           invalid_op = 0;
        end
        
        15 : begin
           i_ready = i_k15_ack;
           invalid_op = 0;
        end
        
    default: begin
       i_ready = 1'b0;
       invalid_op= 1;
    end
  endcase

   assign t_oumux_ack= (i_ready & t_c_req & ~invalid_op);

   assign t_c_ack= (t_oumux_req & i_ready) | (invalid_op & t_c_req);

endmodule
