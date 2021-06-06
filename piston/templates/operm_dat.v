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

module operm_dat_${local[0]}_${local[1]} (
    input wire       [<%= slices * dataWidth - 1 %>:0] t_dat_dat,

    input wire       [  <%= law.selin + slices * law.perin - 1 %>:0] t_kp_dat,

    output wire [<%= slices * dataWidth - 1 %>:0] i_dat_dat,

    output wire [<%= law.selin -1 %>:0] k_ctrl,

    input wire clk, reset_n
);

  assign k_ctrl=t_kp_dat[<%= law.selin + slices * law.perin -1 %>:<%= slices * law.perin %>];


// cross links
<%
for (let i = 0; i < slices; i++) {
    for (let j = 0; j < obj.log2slices; j++) { %>
wire [<%= obj.dataWidth - 1 %>:0] dat_<%= i %>_<%= dest(i, j) %>;<%
    }
}
%>

<% for (let i = 0; i < slices; i++) { %>
wire [<%= obj.dataWidth - 1 %>:0] res<%= i %>;<% } %>

<%
for (let i = 0; i < slices; i++) {
    for (let j = 1; j < obj.log2slices; j++) { %>
wire [<%= j - 1 %>:0] adr_<%= i %>_<%= dest(i, j) %>;<%
    }
}
%>

<% for (let i = 0; i < slices; i++) { %>
// Slice <%= i %>
permutator_slice u<%= i %> (

<% for (let j = 0; j < obj.log2slices; j++) { %>
    .i<%= j %>_dat(dat_<%= i %>_<%= dest(i, j) %>),<% } %>
    .i<%= obj.log2slices %>_dat(res<%= i %>),

    .t0_dat(t_dat_dat[<%= dataWidth * (1 + i) - 1 %>:<%= dataWidth * i %>]),
<% for (let j = 1; j <= obj.log2slices; j++) { %>
    .t<%= j %>_dat(dat_<%= dest(i, j - 1) %>_<%= i %>),<% } %>

<% for (let j = 1; j < obj.log2slices; j++) { %>
    .i<%= j %>_adr(adr_<%= i %>_<%= dest(i, j) %>),<% } %>
    .i<%= obj.log2slices %>_adr(t_kp_dat[<%= log2slices * (1 + i) - 1 %>:<%= log2slices * i %>]),

<% for (let j = 2; j <= obj.log2slices; j++) { %>
    .t<%= j %>_adr(adr_<%= dest(i, j - 1) %>_<%= i %>),<% } %>


    .cfg(<%= obj.log2slices %>'d<%= i %>)
);
<% } %>

assign i_dat_dat = {<%= range(slices - 1, -1).map(e => 'res' + e).join(', ') %>};

endmodule
