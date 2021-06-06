module dpram
  #(parameter DEPTH=2048)
   (input clk,
    input [10:0]  addr_0,
    input [31:0]  din_0,
    input 	  we_0,
    output logic [31:0] dout_0,
    input [10:0]  addr_1,
    input [31:0]  din_1,
    input 	  we_1,
    output logic [31:0] dout_1
   );
   
   
  logic [31:0] 	  mem [DEPTH-1:0] /* synthesis syn_ramstyle = "block_ram */ ;

  always_ff @(posedge clk) begin
     dout_0<= mem[addr_0];
      if (we_0) begin
         mem[addr_0] <= din_0;
         dout_0 <= din_0;
      end
  end

  always_ff @(posedge clk) begin
     dout_1<= mem[addr_1];
      if (we_1) begin
         mem[addr_1] <= din_1;
         dout_1 <= din_1;
      end
   end

endmodule
