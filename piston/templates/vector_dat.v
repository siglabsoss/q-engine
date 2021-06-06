<%
  const range = require('lodash.range');
%>

    module vector_dat_${local[0]}_${local[1]} 
      (
       <% range(slices).map(e => { %>
       input [63:0]                           t_instr_<%= e %>_dat,
       input                                  instr_<%= e %>_valid,
       output wire                           instr_<%= e %>_ready,
       <% }) %>
                                                      <% ['k15'].map(e => { %>
       input [<%= slices * dataWidth - 1 %>:0]        t_<%= e %>_dat,
       input                                          t<%= e %>_valid,
       output wire                                   t<%= e %>_ready,
                                                      <% }) %>
                                                      <% ['k15'].map(e => { %>
       output wire [<%= slices * dataWidth - 1 %>:0] i_<%= e %>_dat,
       output wire                                   i<%= e %>_valid,
       input                                          i<%= e %>_ready,
                                                      <% }) %>
       output wire [<%= 2*law['selin']                 + slices*(law['perin']+law['baddr']) -1 %>:0] i_kap_dat,
       output wire                                   kap_valid,
       input wire                                    kap_ready,
/*                                                    <% ['selin', 'selou'].map(e => { %>
       output wire [<%= law[e]             - 1 %>:0] i_<%= e %>_dat,
       output wire                                   i_<%= e %>_valid,
       input                                          i_<%= e %>_ready,
                                                      <% }) %>
                                                      <% ['perin', 'perou', 'baddr'].map(e => { %>
       output wire [<%= slices * law[e]     - 1 %>:0] i_<%= e %>_dat,
       output wire                                   i_<%= e %>_valid,
       input                                          i_<%= e %>_ready,
                                                      <% }) %>*/
       input                                          clk, reset_n
       );

   <% range(slices).map(e => { %>
                               wire [<%= law['baddr'] +law['perin'] -1 %>:0]slice_<%= e %>_data;
<% }) %>
   wire [3:0] s_k1,s_k2;
   wire       s_valid;
   wire       s_k_ready;
   wire [<%= slices * (law['baddr'] +law['perin']) -1 %>:0]       s_slice_addr;
   
   wire [<%= slices * (law['selin'] ) -1 %>:0] selin_data;
   wire [<%= slices * (law['perin'] ) -1 %>:0] perin_data;
   wire [<%= slices * (law['baddr'] ) -1 %>:0] baddr_data;

   assign i_kap_dat={s_k1,baddr_data,s_k1,perin_data};
   assign kap_valid=s_valid;
   
   
   assign selin_data=s_k1;


   
//   assign i_selou_data=s_k;
   
`ifndef QENGINE_LITE                              
   <% range(slices).map(e => { %>

   assign perin_data[<%= (e+1)*law['perin']-1 %>:<%= e*law['perin'] %>]=s_slice_addr[<%= (e+1)*law['saddr']-1 %>:<%= e*law['saddr']+law['baddr']  %>];
   assign baddr_data[<%= (e+1)*law['baddr']-1 %>:<%= e*law['baddr'] %>]=s_slice_addr[<%= (e+1)*law['saddr']-1-law['perin'] %>:<%= e*law['saddr'] %>];

       vector_slice#(.PREDICATOR(<%= e %>)) vector_slice_<%= e%>
       (.clk(clk),
        .reset_n(reset_n),
        .t_instr_data(t_instr_<%= e %>_dat),
        .t_instr_valid(instr_<%= e %>_valid),
        .t_instr_ready(instr_<%= e %>_ready),
//      .t_instr_ready(),


        .r_data(slice_<%= (e + 1) % slices %>_data),
        .l_data(slice_<%= (e - 1 + slices) % slices %>_data),
        .o_data(slice_<%= e %>_data),

        .i0_data(s_slice_addr[<%= (e+1) * (law['baddr']+law['perin']) -1%>:<%= e*(law['baddr']+law['perin']) %>]),
        <% if(e==0) { %>
        .i0_k(s_k1),
        .i0_valid(s_valid),                   
                      <% } else if(e==8) { %>
        .i0_k(s_k2),
        .i0_valid(),
                      <% } else { %>                                           
        .i0_k(),
        .i0_valid(),                              
                  <% } %>

        .i0_ready(kap_ready),//i_baddr_ready),

        .t_k15_data(t_k15_dat[<%= (e+1)*dataWidth-1 %>:<%= e*dataWidth %>]),
        .t_k15_valid(tk15_valid),//t_k15_valid[<%= e %>]),.i0_k(s_k),   
        <% if(e==0) { %>
        .t_k15_ready(tk15_ready),//t_k15_ready[<%= e %>]),                    
        <% } else { %>
        .t_k15_ready(),//t_k15_ready[<%= e %>]),                          
        <% } %>

        .i_k15_data(i_k15_dat[<%= (e+1)*dataWidth-1 %>:<%= e*dataWidth %>]),
        .i_k15_ready(ik15_ready),//t_k15_ready[<%= e %>]),                      
        <% if(e==0) { %>
        .i_k15_valid(ik15_valid)//t_k15_valid[<%= e %>]),.i0_k(s_k),
        <% } else { %>
        .i_k15_valid()//t_k15_valid[<%= e %>]),.i0_k(s_k),
        <% } %>
        );
   <% }) %>
`endif
endmodule
