// slicer.v

module slicer
  (// control signals
   input wire         clk,
   input wire         srst,
   input wire         dmaReset,
   //config
   input wire [31:0]  config_payload_slice,
   input wire [31:0]  config_payload_length,
   input wire [3:0]   config_payload_demapper_constellation,
   input wire         config_valid,
   output reg         slicer_busy,

   //inputs -> comes from slicer
   input wire [31:0]  t0_data,
   input wire [31:0]  t0_last,
   input wire         t0_valid,
   output wire        t0_ready,
   //outputs -> goes to the crossbar
   output wire [31:0] i0_data,
   output wire        i0_last,
   output wire        i0_valid,
   input wire         i0_ready
   );

   // wire                config_payload_slice = 1;
   reg [31:0]         r_config_payload_slice;
   reg [31:0]         r_txn_cnt;
   

   reg [15:0]         r_shift;
   reg [15:0]         q_shift;
   wire [15:0]        n_shift;

   reg                q_last;
   wire               n_last;
   reg [31:0]         q_data;
   wire [31:0]        n_data;
   reg                q_valid;
   wire               n_valid;
   wire               enable_out;

   wire               junk;

   reg                busy;

   
   assign i0_data = q_data;
   assign i0_last = q_last;
   
   always @(posedge clk) r_config_payload_slice <= config_payload_slice;
   always @(posedge clk) q_valid <= (~t0_ready || t0_valid);

   assign t0_ready = ~q_valid || i0_ready;

   assign i0_valid = enable_out&&q_valid;

   assign enable_out = (r_config_payload_slice==0)?1:
                       (r_config_payload_slice==1)?r_shift[15]: //16:1
                       (r_config_payload_slice==2)?|{r_shift[15],r_shift[7]}: //8:1
                       (r_config_payload_slice==4)?|{r_shift[15],r_shift[11],r_shift[7],r_shift[3]}: // 4:1
                       (r_config_payload_slice==8)?|{r_shift[15],r_shift[13],r_shift[11],r_shift[9],r_shift[7],r_shift[5],r_shift[3],r_shift[1]}: //2:1
                       0; //default    

   always @(posedge clk) begin
      if(srst || dmaReset) begin
         q_last <= 0;
         q_data<=0;
         q_shift<=1;
         r_shift<=16'd0;
         r_txn_cnt<=0;
         busy<=0;
         slicer_busy<=0;
      end else begin
         slicer_busy<=busy|~t0_ready;
         if(config_valid)
           busy<=1;
         if (t0_valid && t0_ready) begin
            q_data<=n_data;
            q_last<=n_last;
            q_shift<=n_shift;
            r_shift<=q_shift;
            r_txn_cnt<=r_txn_cnt+1;
            if(config_payload_demapper_constellation != 0) begin
               if(t0_last) begin
                  r_txn_cnt<=0;
                  busy<=0;
               end
            end
            else begin
               if(r_txn_cnt==config_payload_length-1) begin
                  r_txn_cnt<=0;
                  busy<=0;
               end
            end
         end 
      end
   end

   assign n_last = t0_last;

   assign n_data  = (r_config_payload_slice==0)?t0_data:
                    (r_config_payload_slice==1)?{{t0_data[31],t0_data[15]},q_data[31:2]}: //16:1
                    (r_config_payload_slice==2)?{{t0_data[31:30],t0_data[15:14]},q_data[31:4]}: //8:1
                    (r_config_payload_slice==4)?{{t0_data[31:28],t0_data[15:12]},q_data[31:8]}: //4:1
                    (r_config_payload_slice==8)?{{t0_data[31:24],t0_data[15:8]},q_data[31:16]}: //2:1
                    0; //default

   assign n_shift =  (r_config_payload_slice==0)?q_shift:
                     {q_shift[14:0], q_shift[15]};


endmodule
