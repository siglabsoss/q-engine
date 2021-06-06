module nco_gen
  (input wire[31:0] config_payload_startAngle,
   input wire [31:0]  config_payload_delta,
   input wire [31:0]  config_payload_length,
   input wire 	      config_valid,
   output reg 	      config_ready,

   input wire 	      ncoReset,
   output wire 	      busy,
   //
   output wire [31:0] i_nco_data,
   output wire 	      i_nco_valid,
   input wire 	      i_nco_ready,

   input wire 	      clk,srst
   );
   
   reg [31:0]        q_cnt,n_cnt;
   reg               q_strobe_complete,n_strobe_complete;
   reg               q_busy,n_busy;
   reg               q_interrupt,n_interrupt;

   localparam WAIT = 0;
   localparam ENABLE = 1;
   localparam CLEAR_TIMER_INIT = 2;

   reg [1:0]         q_state,n_state;
   reg [31:0]        q_length,n_length;

   reg [31:0]        q_angle,n_angle;
   wire              s_angle_valid;
   wire              s_angle_ready;
   
   nco nco_inst
     (.t_angle_dat(q_angle),
      .t_angle_req(s_angle_valid),
      .t_angle_ack(s_angle_ready),
      .i_nco_dat(i_nco_data),
      .i_nco_req(i_nco_valid),
      .i_nco_ack(i_nco_ready),
      .clk(clk),
      .reset_n(~srst)
      );

   assign s_angle_valid=(q_state==ENABLE)?1:0;

   always @(*) begin
      n_state=q_state;
      n_cnt=q_cnt;
      n_busy=0;
      config_ready=0;
      n_angle=q_angle;
      n_length=q_length;
      case(q_state)
        WAIT: begin
           n_cnt=0;
	   if(config_valid && config_payload_length==0)
	     config_ready=1;
           else if(config_valid) begin
              n_state=ENABLE;
              n_busy=1;
              n_angle=config_payload_startAngle;
              n_length=config_payload_length;
           end
        end
        ENABLE: begin
           n_busy=1;
           n_cnt=(s_angle_ready)?q_cnt+1:q_cnt;
           n_angle=(s_angle_ready)?q_angle+config_payload_delta:q_angle;
           if(ncoReset) begin
              n_state=WAIT;
              config_ready=1;
           end
           else if(q_cnt==q_length-1 && s_angle_ready) begin
              n_state=WAIT;
              config_ready=1;
           end
        end
        CLEAR_TIMER_INIT: begin
           n_state=WAIT;
        end
      endcase // case (q_state)
   end // always @ (*)

   always @(posedge clk or posedge srst) begin
      if(srst) begin
         q_state<=WAIT;
         q_cnt<=0;
         q_busy<=0;
         q_angle<=0;
         q_length<=0;
      end
      else begin
         q_state<=n_state;
         q_cnt<=n_cnt;
         q_busy<=n_busy;
         q_angle<=n_angle;
         q_length<=n_length;
      end // else: !if(srst)
   end // always @ (posedge clk or posedge srst)
endmodule
      
