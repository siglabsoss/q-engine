module kap_ctrl_dat_${local[0]}_${local[1]}
  (
   input wire [<%= law.selin + slices*(law.baddr + law.perin) -1 %>:0] t_kap_dat,
   
   output wire [<%= law.selin -1 %>:0]                         i_selin_dat,
   output wire [<%= law.selin+slices*law.perin -1 %>:0]                i_perin_dat,
   output wire [<%= law.selin+slices*law.baddr -1 %>:0]                i_vmemc_dat,
   output wire [<%= law.selin+slices*law.perin -1 %>:0]                i_perou_dat,
   output wire [<%= law.selin -1 %>:0]                         i_selou_dat,
   
   input wire                                                  clk, reset_n
   );

   assign i_selin_dat=t_kap_dat[<%= law.selin + slices*(law.baddr + law.perin) -1 %>:<%= slices*(law.baddr +law.perin) %>];
   assign i_perin_dat={i_selin_dat,t_kap_dat[<%= slices*law.perin -1 %>:0]};
   assign i_vmemc_dat={i_selin_dat,t_kap_dat[<%= slices*(law.baddr + law.perin) -1 %>:<%= slices*law.perin %>]};
   assign i_perou_dat={i_selin_dat,t_kap_dat[<%= slices*law.perin -1 %>:0]};
   assign i_selou_dat=t_kap_dat[<%= law.selin + slices*(law.baddr + law.perin) -1 %>:<%= slices*(law.baddr +law.perin) %>];
   
endmodule
