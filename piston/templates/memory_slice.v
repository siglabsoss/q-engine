<%
  const range = require('lodash.range');
%>

    module memory_slice #(parameter MEMINIT = "vmem0.mif")
   (
    input              clk, reset_n,
    //Port 0
    input wire [11:0]  t0_addr,
    input wire [31:0]  t0_data,
    input              t0_we,
    input wire         t0_valid,
    output wire        t0_ready,
    output reg [11:0]  i0_addr,
    output wire [31:0] i0_data,
    output reg         i0_valid,
    input wire         i0_ready,
    //Port 1
    input wire [11:0]  t1_addr,
    input wire [31:0]  t1_data,
    input wire         t1_we,
    input wire         t1_valid,
    output wire        t1_ready,
    output reg [11:0]  i1_addr,
    output reg [31:0]  i1_data,
    output reg         i1_valid,
    input wire         i1_ready
    );

   wire [31:0]         i1_data_nxt;
   reg                 i1_valid_nxt;
   reg [11:0]          i1_addr_nxt;
   wire                re_0;
   
   
   dpram
     #(.MEMINIT(MEMINIT))
   dpram_inst
     (.clk(clk),
      .addr_0(t0_addr),
      .din_0(t0_data),
      .we_0(t0_we),
      .re_0(re_0),
      .dout_0(i0_data),
      .addr_1(t1_addr),
      .din_1(t1_data),
      .we_1(t1_we),
      .dout_1(i1_data_nxt)
      );

   
   
   assign t0_ready=~i0_valid|i0_ready;
   assign t1_ready=~i1_valid|i1_ready;
   assign re_0 = (~t0_we && t0_valid)&t0_ready;
   
   always @(posedge clk) begin
      i0_valid <= (~t0_we && t0_valid)|~t0_ready;
      i1_valid_nxt <= (~t1_we && t1_valid)|~t1_ready;
      i1_valid <= i1_valid_nxt;
      i1_data <= i1_data_nxt;
      i0_addr <= t0_addr;
      i1_addr_nxt <= t1_addr;
      i1_addr <= i1_addr_nxt;
   end

endmodule

module dpram
  #(parameter DEPTH=4096,
    parameter MEMINIT="vmem0.mif")
   (input clk,
    input [11:0]      addr_0,
    input [31:0]      din_0,
    input             we_0,
    input             re_0,
    output reg [31:0] dout_0,
    input [11:0]      addr_1,
    input [31:0]      din_1,
    input             we_1,
    output reg [31:0] dout_1
    );
   
   
   reg [31:0]         mem [DEPTH-1:0] /* synthesis syn_ramstyle = block_ram */ ;
`ifdef LOAD_VMEM
   initial       $readmemh(MEMINIT,mem);
`endif

`ifdef verilator
   function[31:0] rtn_mem;
      //verilator public
      input [31:0]    index;
      begin
         rtn_mem = mem[index];
      end
   endfunction
`endif
   
   always @(posedge clk) begin
      if(re_0)
        dout_0<= mem[addr_0];
      if (we_0) begin
         mem[addr_0] <= din_0;
         dout_0 <= din_0;
      end
   end

   always @(posedge clk) begin
      dout_1<= mem[addr_1];
      if (we_1) begin
         mem[addr_1] <= din_1;
         dout_1 <= din_1;
      end
   end

endmodule
