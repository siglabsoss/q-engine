module kap_ctrl_dat_1_5
  (
   input wire [259:0] t_kap_dat,
   
   output wire [3:0]                         i_selin_dat,
   output wire [67:0]                i_perin_dat,
   output wire [195:0]                i_vmemc_dat,
   output wire [67:0]                i_perou_dat,
   output wire [3:0]                         i_selou_dat,
   
   input wire                                                  clk, reset_n
   );

   assign i_selin_dat=t_kap_dat[259:256];
   assign i_perin_dat={i_selin_dat,t_kap_dat[63:0]};
   assign i_vmemc_dat={i_selin_dat,t_kap_dat[255:64]};
   assign i_perou_dat={i_selin_dat,t_kap_dat[63:0]};
   assign i_selou_dat=t_kap_dat[259:256];
   
endmodule
