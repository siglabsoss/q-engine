module oumux_dat_2_5 (
    input wire [511:0] t_oumux_dat,

    input wire [3:0]             t_c_dat,

                                            
    output wire [511:0]    i_k8_dat,
                                            
    output wire [511:0]    i_k9_dat,
                                            
    output wire [511:0]    i_k13_dat,
                                            
    output wire [511:0]    i_k14_dat,
                                            
    output wire [511:0]    i_k15_dat,
                                            
    output wire [3:0]         sel,
    input wire                              clk, reset_n
);

   assign sel=t_c_dat;


assign i_k8_dat = t_oumux_dat; 
assign i_k9_dat = t_oumux_dat; 
assign i_k13_dat = t_oumux_dat; 
assign i_k14_dat = t_oumux_dat; 
assign i_k15_dat = t_oumux_dat; 

endmodule
