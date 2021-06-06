module permutator_slice (
<%
for (let i = 0; i <= obj.log2slices; i++) {
%>
    // stage <%= i %>
    input        [<%= obj.dataWidth - 1 %>:0] t<%= i %>_dat,
    output wire [<%= obj.dataWidth - 1 %>:0] i<%= i %>_dat,
<%
    if (i === 0) { } else if (i === 1) {
%>
    input        [<%= i - 1 %>:0] i<%= i %>_adr,
<%
    } else {
%>
    output wire [<%= i - 2 %>:0] t<%= i %>_adr,
    input        [<%= i - 1 %>:0] i<%= i %>_adr,
<%
    }
}
%>
    input [<%= obj.log2slices - 1 %>:0] cfg
);

<% for (let i = 1; i <= obj.log2slices; i++) { %>
    wire [<%= i - 1%>:0] adr<%= i %>;
<% } %>

<% for (let i = 1; i <= obj.log2slices; i++) { %>
    wire adr_lsb<%= i %>, sel<%= i %>;
    assign sel<%= i %> = adr_lsb<%= i %> ^ (cfg[<%= obj.log2slices - i %>]);
<% } %>

<% for (let i = 2; i <= obj.log2slices; i++) { %>
    wire [<%= i - 2 %>:0] adr_rest<%= i %>, adr_back<%= i %>;
    assign adr_back<%= i %> = adr_rest<%= i %> & ~{<%= i - 1 %>{sel<%= i %>}};
    assign t<%= i %>_adr    = adr_rest<%= i %> &  {<%= i - 1 %>{sel<%= i %>}};
<% } %>

<% for (let i = 1; i <= obj.log2slices; i++) { if (i === 1) { %>
    assign adr_lsb<%= i %> = adr<%= i %>;
<% } else { %>
    assign {adr_rest<%= i %>, adr_lsb<%= i %>} = adr<%= i %>;
<% }} %>

<% for (let i = 1; i <= obj.log2slices; i++) { if (i === obj.log2slices) { %>
    assign adr<%= i %> = i<%= i %>_adr;
<% } else { %>
    assign adr<%= i %> = i<%= i %>_adr | adr_back<%= i + 1 %>;
<% }} %>

<% for (let i = 0; i <= obj.log2slices; i++) { if (i === 0 ) { %>
    assign i<%= i %>_dat = t<%= i %>_dat;
<% } else { %>
    assign i<%= i %>_dat = sel<%= i %> ? t<%= i %>_dat : i<%= i - 1 %>_dat;
<% }} %>

endmodule
