<%
    const range = require('lodash.range');
%>
module perm_addr_slice (
<%
    range(obj.log2slices + 1).map(i => {
        if (i === 0) { } else if (i === 1) {
%>
    input        [<%= i - 1 %>:0] i${i},
<%
        } else {
%>
    output wire  [<%= i - 2 %>:0] t${i},
    input        [<%= i - 1 %>:0] i${i},
<%
        }
    })
%>
    output wire <%=
        range(obj.log2slices).map(i => `sel${i + 1}`).join(', ')
%>,

    input [<%= obj.log2slices - 1 %>:0] cfg
);

    wire <%= range(obj.log2slices).map(i => `adr_lsb${i + 1}`).join(', ') %>;


<% range(obj.log2slices).map(i => { %>
    wire [${i}:0] adr${i + 1};<% }); %>


<% range(obj.log2slices - 1).map(i => i + 2).map(i => { %>
    wire [${i - 2}:0] adr_rest${i}, adr_back${i};
    assign adr_back${i} = adr_rest${i} & ~{${i - 1}{sel${i}}};
    assign t${i}    = adr_rest${i} &  {${i - 1}{sel${i}}};
<% }) %>

<% range(obj.log2slices).map(i => i + 1).map(i => { if (i === obj.log2slices) { %>
    assign adr${i} = i${i};
<% } else { %>
    assign adr${i} = i${i} | adr_back${i + 1};
<% }}) %>

<% range(obj.log2slices).map(i => i + 1).map(i => { if (i === 1) { %>
    assign adr_lsb${i} = adr${i};
<% } else { %>
    assign {adr_rest${i}, adr_lsb${i}} = adr${i};
<% }}) %>

<% range(obj.log2slices).map(i => { %>
    assign sel${i + 1} = adr_lsb${i + 1} ^ cfg[${obj.log2slices - i - 1}];<% }); %>

endmodule
