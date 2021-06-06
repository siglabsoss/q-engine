<%

const range = require('lodash.range');

function dest (i, j) {
    const log2blockSize = obj.log2slices - j;
    const blockSize = 1 << log2blockSize;
    const log2halfBlockSize = log2blockSize - 1;
    const halfBlockSize = 1 << log2halfBlockSize;
    const offset = (i >> log2blockSize) << log2blockSize;
    const dest = i + halfBlockSize;
    return offset + (dest % blockSize);
}

%>

module operm_ctrl_${local[0]}_${local[1]} (
    input  wire      t_dat_req,
    output wire t_dat_ack,

    input  wire      t_kp_req,
    output wire t_kp_ack,

    output wire i_dat_req,
    input  wire      i_dat_ack,

    input wire [<%= law.selin -1 %>:0] k_ctrl,

    input  wire      clk, reset_n
);

reg invalid_op;

always @(*)
    case(k_ctrl)<% law.oumux.map((e, i) => {
        const set = law.oumux %>
        <%= set[i] %> : begin
           invalid_op = 0;
        end <% }) %>
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
