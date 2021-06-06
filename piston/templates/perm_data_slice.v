<%
    const range = require('lodash.range');
%>
module perm_data_slice (
<%
    for (let i = 0; i <= obj.log2slices; i++) {
%>
    // stage <%= i %>
    input        [<%= obj.dataWidth - 1 %>:0] t<%= i %>_dat,
    output wire [<%= obj.dataWidth - 1 %>:0] i<%= i %>_dat,
<%
    }
%>
    input <%= range(obj.log2slices).map(i => `sel${i + 1}`).join(', ') %>
);

<% range(obj.log2slices + 1).map(i => { if (i === 0 ) { %>
    assign i<%= i %>_dat = t<%= i %>_dat;
<% } else { %>
    assign i<%= i %>_dat = sel<%= i %> ? t<%= i %>_dat : i<%= i - 1 %>_dat;
<% }}); %>

endmodule
