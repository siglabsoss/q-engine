`default_nettype wire

/****** MODULE DEFINITIONS ******/

module ring_bus
(
    input wire        i_sysclk, // 125 MHz
    input wire        i_srst, // system re set

    input wire [31:0] i_wr_data,
    input wire [7:0]  i_wr_addr,
    output reg        o_done_wr,
    input wire        i_start_wr,
    output reg        o_write_ready,


    output reg [31:0] o_rd_data, // message buffer
    output reg        o_rd_valid,
    input wire        i_rd_ready,
    output reg        o_rd_buf_empty, // new message flag
    output reg        o_rd_of, // read overflow flag
    input wire        i_clear_flags, // clear new message flag

    output reg        o_serial_bus,
    input wire        i_serial_bus
);

/****** LOCAL PARAMETERS ******/


/****** SIGNALS ******/

  wire     [7:0] addr;                           // bus address ( 8 bits )

  reg    [3:0] code_clk_cnt;                   // code clock counter
  reg          code_clk;                       // code clock ( i_sysclk / 3 )
  reg    [3:0] code_rst_sr;                    // code clock reset delay shift register
  wire           code_rst;                       // code clock reset
  reg   [87:0] code_sr; // shift register holding all frame symbols

  reg          data_in;                        // synchronized data input
  reg          data_out;                       // synchronized data output

  reg   [12:0] samp_buf;                       // sample buffer for synchronization
  reg    [3:0] samp_cnt;                       // sample counter

  reg          rd_clear_flag;                  // message match flag;
  reg          start_wr;                       // start write flag;

  wire      [7:0] addr_t;                        // address true
  wire      [7:0] addr_c;                        // address complementary
  wire            addr_valid;                    // valid address signal
  wire     [31:0] data_t;                        // payload data

  wire      [7:0] addr_dec;
  wire     [15:0] addr_out;

  wire     [15:0] wr_addr;
  wire     [63:0] wr_data;

   reg          write_ready,write_ready_prev;

   reg          q_rd_buf_empty_1d;

  // bump these out to verilator
`define CUSTOM_VERILATOR_PUBLIC(sig) function[1:0] get_``sig``; /*verilator public*/   begin   get_``sig`` = sig;   end endfunction

`ifdef VERILATE_DEF
   `CUSTOM_VERILATOR_PUBLIC(o_rd_of)
`endif




   always @(posedge i_sysclk or posedge i_srst) begin
      if(i_srst) begin
         q_rd_buf_empty_1d <= 0;
         o_rd_valid <= 0;
         rd_clear_flag <= 0;
      end
      else begin
         o_rd_valid <= 0;
         q_rd_buf_empty_1d <= o_rd_buf_empty;
         rd_clear_flag <= 0;
         if(q_rd_buf_empty_1d == 1 && o_rd_buf_empty == 0) begin
           o_rd_valid <= 1;
           rd_clear_flag <= 1;
         end
      end
   end

   // posedge toggle to pulse
   always @(posedge i_sysclk or posedge i_srst) begin
      if(i_srst) begin
         write_ready_prev<=0;
         o_write_ready<=0;
      end
      else begin
         write_ready_prev<=write_ready;
         o_write_ready<=0;
         if(write_ready == 1 && write_ready_prev==0)
           o_write_ready<=1;
      end
   end

/****** ASSIGNS ******/

  assign code_rst = code_rst_sr[3];

  assign addr_t = {code_sr[79], code_sr[77], code_sr[75], code_sr[73],
            code_sr[71], code_sr[69], code_sr[67], code_sr[65]};

  assign addr_c = {code_sr[78], code_sr[76], code_sr[74], code_sr[72],
            code_sr[70], code_sr[68], code_sr[66], code_sr[64]};

  // reg [7:0] address;

   // always @(posedge i_sysclk) begin
   //  if( fstate == 4 ) begin
   //    address <= addr_dec;
   //  end
   // end

  assign addr_valid = & (addr_t ^ addr_c);

  assign addr_dec = addr_t - 8'b00000001;

  assign addr_out = {addr_dec[7], ~addr_dec[7],
                     addr_dec[6], ~addr_dec[6],
                     addr_dec[5], ~addr_dec[5],
                     addr_dec[4], ~addr_dec[4],
                     addr_dec[3], ~addr_dec[3],
                     addr_dec[2], ~addr_dec[2],
                     addr_dec[1], ~addr_dec[1],
                     addr_dec[0], ~addr_dec[0]};

  assign data_t  =  {code_sr[63],
                     code_sr[61],
                     code_sr[59],
                     code_sr[57],
                     code_sr[55],
                     code_sr[53],
                     code_sr[51],
                     code_sr[49],
                     code_sr[47],
                     code_sr[45],
                     code_sr[43],
                     code_sr[41],
                     code_sr[39],
                     code_sr[37],
                     code_sr[35],
                     code_sr[33],
                     code_sr[31],
                     code_sr[29],
                     code_sr[27],
                     code_sr[25],
                     code_sr[23],
                     code_sr[21],
                     code_sr[19],
                     code_sr[17],
                     code_sr[15],
                     code_sr[13],
                     code_sr[11],
                     code_sr[9],
                     code_sr[7],
                     code_sr[5],
                     code_sr[3],
                     code_sr[1]};

  assign wr_addr  = {i_wr_addr[7],  ~i_wr_addr[7],
                     i_wr_addr[6],  ~i_wr_addr[6],
                     i_wr_addr[5],  ~i_wr_addr[5],
                     i_wr_addr[4],  ~i_wr_addr[4],
                     i_wr_addr[3],  ~i_wr_addr[3],
                     i_wr_addr[2],  ~i_wr_addr[2],
                     i_wr_addr[1],  ~i_wr_addr[1],
                     i_wr_addr[0],  ~i_wr_addr[0]};

  assign wr_data  = {i_wr_data[31], ~i_wr_data[31],
                     i_wr_data[30], ~i_wr_data[30],
                     i_wr_data[29], ~i_wr_data[29],
                     i_wr_data[28], ~i_wr_data[28],
                     i_wr_data[27], ~i_wr_data[27],
                     i_wr_data[26], ~i_wr_data[26],
                     i_wr_data[25], ~i_wr_data[25],
                     i_wr_data[24], ~i_wr_data[24],
                     i_wr_data[23], ~i_wr_data[23],
                     i_wr_data[22], ~i_wr_data[22],
                     i_wr_data[21], ~i_wr_data[21],
                     i_wr_data[20], ~i_wr_data[20],
                     i_wr_data[19], ~i_wr_data[19],
                     i_wr_data[18], ~i_wr_data[18],
                     i_wr_data[17], ~i_wr_data[17],
                     i_wr_data[16], ~i_wr_data[16],
                     i_wr_data[15], ~i_wr_data[15],
                     i_wr_data[14], ~i_wr_data[14],
                     i_wr_data[13], ~i_wr_data[13],
                     i_wr_data[12], ~i_wr_data[12],
                     i_wr_data[11], ~i_wr_data[11],
                     i_wr_data[10], ~i_wr_data[10],
                     i_wr_data[9],  ~i_wr_data[9],
                     i_wr_data[8],  ~i_wr_data[8],
                     i_wr_data[7],  ~i_wr_data[7],
                     i_wr_data[6],  ~i_wr_data[6],
                     i_wr_data[5],  ~i_wr_data[5],
                     i_wr_data[4],  ~i_wr_data[4],
                     i_wr_data[3],  ~i_wr_data[3],
                     i_wr_data[2],  ~i_wr_data[2],
                     i_wr_data[1],  ~i_wr_data[1],
                     i_wr_data[0],  ~i_wr_data[0]};

/****** LOGIC ******/

// GENERATE CODE CLOCK
//
// SYSTEM CLOCK  : 125 MHZ (NOMINAL)
//
// CODE CLOCK    : 125 MHZ / 3 = 41.67 MHZ
//   DESCRIPTION : THIS IS THE CODE CLOCK WHICH RUNS AT THE CODING RATE
//                 IT IS TWICE AS FAST AS THE DATA BUS CLOCK
//
//
    always @(posedge i_sysclk or posedge i_srst) begin
    if (1'b1 == i_srst) begin
      code_clk_cnt <= {4{1'b0}};
      code_clk <= 1'b0;
    end
    else begin
       code_clk<=0;
       code_clk_cnt <= code_clk_cnt + 1'b1;
      if(code_clk_cnt==5) begin
        code_clk_cnt <= 0;
         code_clk <= 1;
//~code_clk;
      end
    end
  end


// CODE CLOCK RESET
//
// THIS CLEARS THE CODE CLOCK RESET 4 CLOCK CYCLES AFTER SYSTEM RESET
//
//
  always @(posedge i_sysclk or posedge i_srst)
    if (1'b1 == i_srst) code_rst_sr <= {4{1'b1}};
    else code_rst_sr <= {code_rst_sr[2:0], 1'b0};


// SAMPLE SHIFT REGISTER
//
  always @(posedge i_sysclk) samp_buf <= {samp_buf[11:0], i_serial_bus};


// SAMPLE CLOCK RESET
//
// CLOCK (125 MHz) :
//  _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _   _
// | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
// | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | | |
//    -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -   -  ...
//
// SYNC SEQUENCE :
//                                                DETECT       SAMPLE_RESET
//                                                     |       |                                               |
// ________________________________________________                                                 _______________________ _______________________
//                                                 |                                               |                       |                       |
//                                                 |                                               |                       |                       |
//                                                 |                                               |                       |                       |
//                                                  ------------------------------------------------------------------------------------------------
// X   X   X   X   X   X   X   X   X   X   X   X   X   X   0   1   2   3   4   5   0   1   2   3   4   5   0   1   2   3   4   5
// ************************************************
//                   STOP BIT                      ************************************************
//                                                                     START BIT                   ************************************************
//                                                                                                   DONT CARE
//
// SUMMARY : WE SYNCRONIZE ON THE FIRST FALLING EDGE AFTER A START BIT
//
  always @(posedge i_sysclk) begin
    if (13'b1111111111110 == samp_buf || 5 == samp_cnt) samp_cnt <= 0;
    else samp_cnt <= samp_cnt + 1'b1;
  end

  always @(posedge i_sysclk or posedge i_srst)
    if (1'b1 == i_srst) begin 
      data_in <= 1'b1;
    end
    else if (3'b001 == samp_cnt) data_in <= samp_buf[0];


  // output serial bus mux
  always @(posedge i_sysclk or posedge i_srst)
    if (1'b1 == i_srst || code_rst == 1'b1) o_serial_bus <= 1'b1;
    else o_serial_bus <= data_out;


  // latch the *clear flag* signal
  // always @(posedge i_sysclk or posedge i_srst) begin
  //   if (1'b1 == i_srst) begin
  //     rd_clear_flag <= 1'b0;
  //   end
  //   else begin
  //     if (1'b1 == i_clear_flags) begin
  //       rd_clear_flag <= 1'b1;
  //     end
  //     else if (1'b1 == o_rd_buf_empty && 1'b0 == o_rd_of) begin
  //       rd_clear_flag <= 1'b0;
  //     end
  //   end
  // end


  // latch the *write start* signal
  always @(posedge i_sysclk or posedge i_srst) begin
    if (1'b1 == i_srst) start_wr <= 1'b0;
    else
      if (1'b1 == i_start_wr) start_wr <= 1'b1;
      else if (1'b0 == o_done_wr) start_wr <= 1'b0;
  end

  reg busy;
  reg [7:0] fstate; // fake debug state for tracking issues

  // input buffer which makes shift register 4 longer than it was
  // This allows us to handle the case where input ringbus goes low on the same clock cycle as
  // o_write_ready goes high (we are requesting a write)
  reg [3:0] input_buffer;



  // line shift register
  always @(posedge i_sysclk or posedge i_srst) begin
    if (i_srst) begin
      code_sr <= {88{1'b1}};
      data_out <= 1'b1;
      o_rd_buf_empty <= 1'b1;
      o_rd_of <= 1'b0;
      write_ready <= 0;
      busy<=0;
      fstate <= 8'd0;
    end else begin

      if (rd_clear_flag) begin
          fstate <= 8'd10;
          o_rd_buf_empty <= 1'b1;
          o_rd_of <= 1'b0;
      end

    else if(code_clk) begin
      
      // shift the input buffer
      input_buffer <= {input_buffer[2:0], data_in};

      fstate <= 8'd1;
      write_ready <= 0;
      // CHECK if message is valid
      if(8'b11110000 == code_sr[87:80] && 1'b1 == addr_valid) begin
        busy<=1;
        fstate <= 8'd2;
        // IF message is valid and it is for us then latch it
        if (addr_t == 8'b00000000) begin
          if (1'b1 == o_rd_buf_empty) begin
            o_rd_data <= data_t;
            o_rd_buf_empty <= 1'b0;
            fstate <= 8'd3;
          end
          else o_rd_of <= 1'b1;

          code_sr <= {88{1'b1}};
        end

        // OTHERWISE decrement the address and shift it out
        else begin
          code_sr <= {8'b1110000, addr_out, code_sr[63:0], input_buffer[3]};
          fstate <= 8'd4;
          // address <= addr_dec;
        end
      end

      // CHECK to see if SR is empty
      else if(code_sr == {88{1'b1}} && input_buffer == 4'b1111 && i_serial_bus == 1'b1) begin
        fstate <= 8'd5;
        // IF SR is empty and we have been asked to write data then latch data into SR
        if(start_wr==1'b1) begin
          fstate <= 8'd6;
          code_sr <= {8'b1110000, wr_addr, wr_data, input_buffer[3]};
          o_done_wr <= 1'b0;
          write_ready <= 1'b1;
          busy <= 1;
        end

        // IF SR is empty but we have not been asked to write data then set the *write done flag*
        else begin
          fstate <= 8'd7;
          o_done_wr <= 1'b1;
          busy <= 0;
          code_sr <= {code_sr[86:0],input_buffer[3]};
        end
      end

      // OTHERWISE just shift out data
      else if(busy) begin
        fstate <= 8'd8;
        code_sr <= {code_sr[86:0],input_buffer[3]};
      end

      else begin
        fstate <= 8'd9;
        code_sr <= {2'b11,code_sr[84:0],input_buffer[3]};
      end



      data_out <= code_sr[87];

    end
    end
  end


endmodule // ring_bus
