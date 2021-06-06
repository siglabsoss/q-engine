// address decoder for the permutation network
// consumes destination address and produces source address
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
module perm_addr_dat_1_1 (
    input        [<%= law.selou + slices * law.perin - 1 %>:0] t_0_dat,
    output wire [<%= law.selou + slices * law.perin - 1 %>:0] i_0_dat,
    input clk, reset_n
);

   assign i_0_dat[<%= law.selou + slices * law.perin -1 %>:<%=  slices * law.perin %>]=t_0_dat[<%= law.selou + slices * law.perin -1 %>:<%=  slices * law.perin %>];
   
<%
    range(slices).map(i => {
        range(obj.log2slices - 1).map(j => {
%>
wire [${j}:0] adr_${i}_${dest(i, j + 1)};<%
        })
    })
%>

<% for (let i = 0; i < slices; i++) { %>
// Slice <%= i %>
perm_addr_slice u<%= i %> (

<% for (let j = 1; j < obj.log2slices; j++) { %>
    .i<%= j %>(adr_<%= i %>_<%= dest(i, j) %>),<% } %>
    .i<%= obj.log2slices %>(t_0_dat[<%= log2slices * (1 + i) - 1 %>:<%= log2slices * i %>]),

<% for (let j = 2; j <= obj.log2slices; j++) { %>
    .t<%= j %>(adr_<%= dest(i, j - 1) %>_<%= i %>),<% } %>

<% for (let j = 0; j < obj.log2slices; j++) { %>
    .sel<%= j + 1 %>(i_0_dat[${ obj.log2slices * i + j}]),<% } %>


    .cfg(<%= obj.log2slices %>'d<%= i %>)
);
<% } %>

endmodule
