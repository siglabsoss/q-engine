<%

const range = require('lodash.range');
const slices = obj.slices;
const addrWidth = Math.log2(slices);
const dataWidth = obj.dataWidth;

%>
module perm_full_data_dat_2_1 (
    input  [${ slices * dataWidth - 1 }:0] t_data_dat,
    input  [ ${slices * law.perin - 1 }:0] t_addr_dat,
    output [${ slices * dataWidth - 1 }:0] i_data_dat,
    input clk, reset_n
);

wire [${dataWidth - 1}:0] <%= range(slices).map(slice => `t_data${slice}`).join(', ') %>;

assign {<%= range(slices).reverse().map(slice => `t_data${slice}`).join(', ') %>} = t_data_dat;

wire [${addrWidth - 1}:0] <%= range(slices).map(slice => `t_addr${slice}`).join(', ') %>;

assign {<%= range(slices).reverse().map(slice => `t_addr${slice}`).join(', ') %>} = t_addr_dat;

wire [${dataWidth - 1}:0] <%= range(slices).map(slice => `i_data${slice}`).join(', ') %>;

<% range(slices).map(slice => { %>
assign i_data${slice} = (<% range(slices).map(source => { %>
    (t_addr${slice} == ${addrWidth}'h${source.toString(16)}) ? t_data${ (slice + source) % slices } :<% }); %>
    t_data0
);<% }); %>

assign i_data_dat = {<%= range(slices).reverse().map(e => 'i_data' + e).join(', ') %>};

endmodule
