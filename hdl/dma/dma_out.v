module dma_out
  #(
    parameter DEPTH = 32,
    parameter WIDTH = 32,
    parameter ALMOST_FULL = 4
    )
   (// control signals
    input wire         clk,
    input wire         srst,
    //config
    input wire         config_valid,
    output reg         config_ready,
    input wire [31:0]  config_payload_startAddr,
    input wire [31:0]  config_payload_length,
    input wire [31:0]  config_payload_timerInit,
    input wire         config_payload_reverse,
    input wire         config_payload_last,
    input wire [31:0]  ctimer, //tie to 1 and set timer_init to 1 to initialize the dma if a timer based dma is not needed

    input wire         slicer_busy,
    output reg         slicer_config_valid,
    input wire         dmaReset,
    output wire [31:0] status,
    output wire        strobe_complete,
    /* verilator lint_off SYMRSVDWORD */
    output wire        interrupt,
    input wire         interrupt_clear,
    //t0 stream -> comes from memory
    input wire [31:0]  t0_data,
    input wire         t0_valid,
    output reg         t0_ready,
    //mem port -> goes to the memory
    output wire [31:0] i0_addr,
    output wire        i0_valid,
    input wire         i0_ready,
    //outputs -> goes to the crossbar
    output wire [31:0] i1_data,
    output wire        i1_last,
    output wire        i1_valid,
    input wire         i1_ready
    );

   reg [31:0]          q_cnt,n_cnt;
   reg                 q_strobe_complete,n_strobe_complete;
   reg                 q_busy,n_busy;
   reg [31:0]          q_addr,n_addr;
   reg [31:0]          q_length,n_length;
   reg                 q_interrupt,n_interrupt;

   reg                 last;
   reg [31:0]          q_last_cnt, n_last_cnt;
   

   localparam WAIT = 0;
   localparam ENABLE = 1;
   localparam WAIT_FOR_SLICER = 2;
   localparam IDLE = 3;

   reg [1:0]           q_state;
   reg [1:0]           n_state;
   
   reg                 r_afull;

   wire                fifo_sc_afull;
   wire                fifo_sc_full;

   fwft_sc_fifo #(
                  .DEPTH        (DEPTH      ), // number of locations in the fifo
                  .WIDTH        (WIDTH   +1 ), // address width

                  .ALMOST_FULL  (ALMOST_FULL ) // number of locations for afull to be active
                  ) fifo_sc (
                             .clk          (clk         ),
                             .rst          (srst   |dmaReset    ),
                             .wren         (t0_valid        ),
                             .wdata        ({last,t0_data}),
                             .full          (fifo_sc_full),
                             .o_afull      (fifo_sc_afull     ),
                             .rden         (i1_ready        ),
                             .rdata        ({i1_last, i1_data}),
                             .rdata_vld    (i1_valid   ));

   assign i0_addr = q_addr;
   assign i0_valid=(q_state==ENABLE)?!r_afull:0;
   
//   assign busy = q_busy;
   assign strobe_complete = q_strobe_complete;
   assign interrupt=q_interrupt;


   // GENERATE LAST SIGNAL
   always @(*) begin
      last = 0;
      n_last_cnt = q_last_cnt;
      if(q_state != WAIT) begin
        if(t0_valid)
          n_last_cnt = q_last_cnt + 1;
         if(q_last_cnt == q_length -1)
           last=config_payload_last;
      end
      else
        n_last_cnt = 0;
   end // always @ (*)

   always @(posedge clk or posedge srst) begin
      if(srst) begin
         q_last_cnt <= 0;
      end
      else begin
         q_last_cnt <= n_last_cnt;
      end
   end
   
   always @(posedge clk or posedge srst) begin
      if(srst) begin
         r_afull<=0;
      end
      else begin
         if(i0_valid&i0_ready | !fifo_sc_afull)
           r_afull <= fifo_sc_afull;
      end
   end   

   always @(*) begin
      n_state=q_state;
      n_cnt=q_cnt;
      n_strobe_complete=0;
      n_busy=0;
      config_ready=0;
      n_addr=q_addr;
      n_length=q_length;
      n_interrupt=interrupt_clear?0:q_interrupt;
      slicer_config_valid=0;
      
      case(q_state)
        WAIT: begin
           n_cnt=0;
           if(((ctimer==config_payload_timerInit) || &config_payload_timerInit) && config_valid && !r_afull && config_payload_length != 0 && ~slicer_busy) begin
              n_state=ENABLE;
              n_busy=1;
              n_addr=config_payload_startAddr;
              n_length=config_payload_length;
              slicer_config_valid=1;
           end
           else if(config_valid && config_payload_length == 0)
             config_ready=1;
        end
        ENABLE: begin
           n_busy=1;
           n_cnt=(i0_ready && !r_afull)?q_cnt+1:q_cnt;
           n_addr=(i0_ready && !r_afull && ~config_payload_reverse) ? q_addr+1 :
                  (i0_ready && !r_afull && config_payload_reverse) ? q_addr-1 : q_addr;
           if(dmaReset) begin
              n_state=WAIT;
              config_ready=1;
           end
           else if(q_cnt==q_length-1 && i0_ready && !r_afull) begin
              n_state=WAIT_FOR_SLICER;
              //config_ready=1;
              //n_strobe_complete=1;
              //n_interrupt=1;
           end
        end // case: ENABLE
        WAIT_FOR_SLICER: begin
           if(~slicer_busy) begin
              n_state=WAIT;
              config_ready=1;
              n_strobe_complete=1;
              n_interrupt=1;
           end
        end
      endcase // case (q_state)
   end // always @ (*)

   always @(posedge clk or posedge srst) begin
      if(srst) begin
         q_state<=WAIT;
         q_cnt<=0;
         q_strobe_complete<=0;
         q_busy<=0;
         q_addr<=0;
         q_length<=0;
         q_interrupt<=0;
      end
      else begin
         q_state<=n_state;
         q_cnt<=n_cnt;
         q_strobe_complete<=n_strobe_complete;
         q_busy<=n_busy;
         q_addr<=n_addr;
         q_length<=n_length;
         q_interrupt<=n_interrupt;
      end
   end


// debug counter for verilator
`ifdef VERILATE_DEF
    logic [31:0]              out_count;

    always @(posedge clk or posedge srst) begin
        if(srst) begin
            out_count <= 32'h0;
        end else begin
            if( i1_valid & i1_ready ) begin
                out_count <= out_count+1;
            end
        end
    end

`endif



endmodule
