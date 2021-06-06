module dma_in_dummy
  (input wire clk,
   input wire         srst,
   input wire [31:0]   ctimer, //tie to 1 and set timer_init to 1 to initialize the dma if a timer based dma is not needed
   //config
   input wire         config_valid,
   output reg        config_ready,
   input wire [31:0]   config_payload_startAddr,
   input wire [31:0]   config_payload_length,
   input wire [31:0]   config_payload_timerInit,

   input wire         dmaReset,
   output wire           busy,
   output wire           strobe_complete,
   output wire        interrupt,
   input wire         interrupt_clear,

   //mem port
   output wire [31:0] i0_addr,
   output wire [31:0] i0_data,
   output wire        i0_valid,
   input wire         i0_ready
   );

   reg [31:0]       q_cnt;
   reg [31:0]      n_cnt;
   reg          q_strobe_complete;
   reg n_strobe_complete;
   reg          q_busy;
   reg n_busy;
   reg          q_interrupt;
   reg n_interrupt;

   localparam WAIT = 0;
   localparam ENABLE = 1;
   localparam CLEAR_TIMER_INIT = 2;

   reg [1:0] q_state;
   reg [1:0] n_state;

   reg [31:0]        q_addr,n_addr;
   reg [31:0]        q_length,n_length;

   assign i0_data=q_cnt;
//   assign t0_ready = (q_state==ENABLE)?i0_ready:0;
   assign i0_valid=(q_state==ENABLE)?1:0;
   assign i0_addr=q_addr;
   assign strobe_complete=q_strobe_complete;
   assign interrupt=q_interrupt;

   always @(*) begin
      n_state=q_state;
      n_cnt=q_cnt;
      n_strobe_complete=0;
      n_busy=0;
      config_ready=0;
      n_addr=q_addr;
      n_length=q_length;
      n_interrupt=interrupt_clear?0:q_interrupt;
      case(q_state)
   WAIT: begin
      n_cnt=0;
      if(((ctimer==config_payload_timerInit) || &config_payload_timerInit) && config_valid) begin
         n_state=ENABLE;
         n_busy=1;
         config_ready=1;
         n_addr=config_payload_startAddr;
         n_length=config_payload_length;
      end
   end
   ENABLE: begin
      n_busy=1;
      n_cnt=(i0_ready)?q_cnt+1:q_cnt;
      n_addr=(i0_ready)?q_addr+1:q_addr;
      if(dmaReset)
        n_state=WAIT;
      else if(q_cnt==q_length-1 && i0_ready) begin
         n_state=WAIT;
         n_strobe_complete=1;
         n_interrupt=1;
      end
   end
   CLEAR_TIMER_INIT: begin
      n_state=WAIT;
   end
      endcase
   end

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

endmodule
