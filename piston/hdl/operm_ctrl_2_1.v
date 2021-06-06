

module operm_ctrl_2_1 (
    input  wire      t_dat_req,
    output wire t_dat_ack,

    input  wire      t_kp_req,
    output wire t_kp_ack,

    output wire i_dat_req,
    input  wire      i_dat_ack,

    input wire [3:0] k_ctrl,

    input  wire      clk, reset_n
);

reg invalid_op;

always @(*)
    case(k_ctrl)
        8 : begin
           invalid_op = 0;
        end 
        9 : begin
           invalid_op = 0;
        end 
        13 : begin
           invalid_op = 0;
        end 
        14 : begin
           invalid_op = 0;
        end 
        15 : begin
           invalid_op = 0;
        end 
        default: begin
          invalid_op= 1;
        end
        endcase


// request
assign i_dat_req = t_dat_req & t_kp_req & ~invalid_op;

// acknowlege
assign t_dat_ack = t_kp_req & i_dat_ack;
assign t_kp_ack = (t_dat_req & i_dat_ack) | (invalid_op & t_kp_req);


endmodule
