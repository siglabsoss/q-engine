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

module perm_data_dat_2_1 (
    input        [<%= slices * dataWidth - 1 %>:0] t_data_dat,

    input        [ <%= slices * law.perin - 1 %>:0] t_addr_dat,

    output wire [<%= slices * dataWidth - 1 %>:0] i_data_dat,

    input clk, reset_n
);

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

<% for (let i = 0; i < slices; i++) { %>
// Slice <%= i %>
perm_data_slice u<%= i %> (

<% for (let j = 0; j < obj.log2slices; j++) { %>
    .i<%= j %>_dat(dat_<%= i %>_<%= dest(i, j) %>),<% } %>
    .i<%= obj.log2slices %>_dat(res<%= i %>),

<% for (let j = 1; j <= obj.log2slices; j++) { %>
    .t<%= j %>_dat(dat_<%= dest(i, j - 1) %>_<%= i %>),<% } %>
<% for (let j = 0; j < obj.log2slices; j++) { %>
    .sel<%= j + 1 %>(t_addr_dat[${obj.log2slices * i + j}]),<% } %>

    .t0_dat(t_data_dat[<%= dataWidth * (1 + i) - 1 %>:<%= dataWidth * i %>])
);
<% } %>

assign i_data_dat = {<%= range(slices - 1, -1).map(e => 'res' + e).join(', ') %>};

endmodule
