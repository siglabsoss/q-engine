/****************************************************************************
 * vector_slice.v
 ****************************************************************************/

/**
 * Module: vector_slice
 *
 * Singe cycle implementation of a pipeline design.
 *
 * TODO: Need to implement elastic logic
 *
 * What's done in single cycle.  ADD, SUB, AND, OR, XOR, MV, ROL, ROR
 *
 * R-type use 3 registers as operands: ADD, SUB, AND, OR, XOR
 */
module vector_slice #(
                      //Do not override.  Only meant to make code more readable.
                      parameter PREDICATOR = 0,
                      parameter AWIDTH     = 11,
                      parameter OPWIDTH    = 64,  // Maximum vector length
                      parameter XREGWIDTH  = 32,  //current width of a Vector register in bits
                      parameter VLEN       = 16,  //current width of a Vector register in bits
                      parameter NREGS      = 16   // number of vector registers
                      )
   (
    // T-block for ISA
    input wire [OPWIDTH-1:0] t_instr_data,
    input wire 		     t_instr_valid,
    output wire 	     t_instr_ready,

    input wire [VLEN-1:0]    r_data, //Right
    input wire [VLEN-1:0]    l_data, //Left
    output wire [VLEN-1:0]   o_data, //Source 2

    output wire [VLEN-1:0]   i0_data, //source 1  - {15:11 - perm,10:0 - baddr}
    output wire [3:0] 	     i0_k,
    output wire 	     i0_valid,
    input wire 		     i0_ready,

    output wire [2*VLEN-1:0] i_k15_data, //k15 out
    output wire 	     i_k15_valid,
    input wire 		     i_k15_ready,

    input wire [2*VLEN-1:0]  t_k15_data, //k15 in
    input wire 		     t_k15_valid,
    output wire 	     t_k15_ready,

    input wire 		     clk,
    input wire 		     reset_n
    );

   localparam                        OPER_WIDTH = 4;
   //   localparam                        VWIDTH     = $clog2(NREGS);

   // ISA
   localparam                        BIT_0 = 0; // TODO : PLACE HOLDERS RENAME
   localparam                        BIT_1 = 1; // TODO : PLACE HOLDERS RENAME
   localparam                        BIT_2 = 2; // TODO : PLACE HOLDERS RENAME
   localparam                        BIT_3 = 3; // TODO : PLACE HOLDERS RENAME
   localparam                        BIT_4 = 4; // TODO : PLACE HOLDERS RENAME
   localparam                        BIT_5 = 5; // TODO : PLACE HOLDERS RENAME

   reg [VLEN-1:0] 	     vreg         [NREGS-1:0]; /* synthesis syn_ramstyle = block_ram */

   // Instruction split
   reg [3:0] 		     s_src1,q_src1;
   reg [3:0] 		     s_kscratch,q_kscratch,q_kscratch_1d;
   reg [3:0] 		     s_src2,q_src2;
   reg [4:0] 		     s_xsrc,q_xsrc;
   reg [3:0] 		     s_funct,q_funct;
   reg [3:0] 		     s_dest,q_dest;
   reg [XREGWIDTH-1:0] 	     s_xrs,q_xrs;

   // Assignment logic
   reg [VLEN-1:0] 	     src1_value;
   reg [VLEN-1:0] 	     src2_value;
   reg [VLEN-1:0] 	     src2_reg;
   reg [VLEN-1:0] 	     xrs_reg;
   wire 		     predicate;

   reg [3:0] 		     dest_reg;
   reg [VLEN-1:0] 	     right_reg;
   reg [VLEN-1:0] 	     left_reg;

   // ALU outputs
   reg [VLEN-1:0] 	     t_alu_data;

   //K15
   reg [2*VLEN-1:0] 	     k15_data;
   reg 			     k15_valid;

   always @(*) begin
      s_xrs        = t_instr_valid?t_instr_data[63:32]:q_xrs;
      s_src1       = t_instr_valid?t_instr_data[31:28]:q_src1; // The regfile address for source 1
      s_kscratch   = t_instr_valid?t_instr_data[27:24]:q_kscratch; // The s_dest register into scratchpad. // selin and selou
      s_src2       = t_instr_valid?t_instr_data[23:20]:q_src2; // The regfile address for source 2
      s_xsrc       = t_instr_valid?t_instr_data[19:15]:q_xsrc; // The register from the vex machine to pass into the register rs1
      s_funct      = t_instr_valid?t_instr_data[14:11]:q_funct; // The operation code
      s_dest       = t_instr_valid?t_instr_data[10:7]:q_dest;  // The s_dest of resultant.  Either a final s_dest in regfile or index derived from address stored in regfile.
   end
   always @(posedge clk or negedge reset_n) begin
      if(~reset_n) begin
         q_xrs<=0;
         q_src1<=0;
         q_kscratch<=0;
         q_kscratch_1d<=0;
         q_src2<=0;
         q_xsrc<=0;
         q_funct<=0;
         q_dest<=0;
      end
      else begin
         q_xrs<=s_xrs;
         q_src1<=s_src1;
         q_kscratch<=s_kscratch;
         q_kscratch_1d<=q_kscratch;
         q_src2<=s_src2;
         q_xsrc<=s_xsrc;
         q_funct<=s_funct;
         q_dest<=s_dest;
      end // else: !if(~reset_n)
   end





   assign i0_k = s_kscratch;

   // CONTROL LOGIC
   // typedef enum                      logic [3:0] {
   //                                        NOP       =4'h0,
   //                                        ADD       =4'h1,
   //                                        SUB       =4'h2,
   //                                        AND       =4'h3,
   //                                        OR        =4'h4,
   //                                        XOR       =4'h5,
   //                                        MV        =4'h6,
   //                                        ROL       =4'h8,
   //                                        ROR       =4'h9,
   //                                        MV_X_V    =4'hA, //Move EXT to VREG
   //                                        MV_K15_V  =4'hB, //Move K15 scratch to VREG
   //                                        MV_V_K15  =4'hF  //Move VREG to scratch K7
   //                                        } funct_reg_t;
   // funct_reg_t funct_reg;


   localparam    NOP       =4'h0;
   localparam    ADD       =4'h1;
   localparam    SUB       =4'h2;
   localparam    AND       =4'h3;
   localparam    OR        =4'h4;
   localparam    XOR       =4'h5;
   localparam    MV        =4'h6;
   localparam    ROL       =4'h8;
   localparam    ROR       =4'h9;
   localparam    MV_X_V    =4'hA; //Move EXT to VREG
   localparam    MV_K15_V  =4'hB; //Move K15 scratch to VREG
   localparam    MV_V_K15  =4'hF;  //Move VREG to scratch K7

   reg [3:0] funct_reg;

   reg 	     i_valid;

   reg 	     op_valid_reg,kop_valid_reg,kop_valid_reg_1d;



   wire      t1, t2, t3;

   wire      vreg_dest_we;
   wire [VLEN-1:0] vreg_data;

   reg 		   i0_latched;
   reg 		   k15_latched;

   wire [23:0] 	   t_k15_op_dat;
   wire 	   t_k15_op_valid;
   wire 	   t_k15_op_ready;
   wire [23:0] 	   i_k15_op_dat;
   wire 	   i_k15_op_valid;
   wire 	   i_k15_op_ready;
   
   
   //----------------- BEGIN LOGIC --------

   assign predicate    = !(s_xrs[PREDICATOR] & !(s_funct == MV_X_V));

   assign t1              = (s_funct == MV_V_K15) ? i_k15_ready : 1'b1;
   assign t2              = (s_funct == MV_K15_V) ? t_k15_valid  : 1'b1;
   //   assign t3              = (s_kscratch == 4'h7 ) ? (k15_valid & i_k15_ready) |k15_latched: 1'b1;
   
   assign t_instr_ready        = t_instr_valid? t1 & t2 & (i0_ready | i0_latched):1'b1;
   assign i0_valid = t_instr_valid & (s_kscratch!=0) & ~i0_latched;

   always @(posedge clk)
     if(t_instr_ready)
       i0_latched<=0;
     else if(i0_valid&i0_ready)
       i0_latched<=1;
   

   always @(posedge clk) 
     if(t_instr_ready) begin
	k15_latched<=0;
     end
     else if(i_k15_valid & i_k15_ready) begin
	k15_latched<=1;

     end
   
   always @(posedge clk) 	k15_data<=t_k15_data;

   assign i0_data         = src1_value;
   assign o_data          = src2_value;

   //s_dest mux control
   assign vreg_data = (funct_reg==MV) ? src2_reg :
                      (funct_reg==ROR)       ? right_reg :
                      (funct_reg==ROL)       ? left_reg :
                      (funct_reg==MV_X_V)    ? xrs_reg :
                      (funct_reg==MV_K15_V)  ? k15_data :
                      t_alu_data;  //default

   //s_dest valid control
   assign vreg_dest_we = (funct_reg==MV_V_K15)  ? 1'b0 :
                         (funct_reg==NOP)  ? 1'b0 :
                         op_valid_reg;  //default

   //Data Memory Bus


   // 3-port
   // Port A, B
   always @(*) src1_value = (vreg_dest_we && dest_reg == s_src1)? vreg_data:vreg[s_src1];
   always @(*) src2_value = (vreg_dest_we && dest_reg == s_src2)? vreg_data:vreg[s_src2];

   reg                     q_vreg_dest_we;

   always @(posedge clk) begin /* verilator lint_off ALWCOMBORDER */
      q_vreg_dest_we<=vreg_dest_we;
      if (vreg_dest_we) begin
         vreg[dest_reg] <= vreg_data;
      end
   end

   

   
   assign i_k15_data = src2_reg;
   assign i_k15_valid = (funct_reg==MV_V_K15 & ~k15_latched);
   
   assign t_k15_ready = (funct_reg==MV_K15_V);
   
   
   //Pipeline registers
   always @(posedge clk) begin
      src2_reg     <= src2_value;
      right_reg    <= r_data;
      left_reg     <= l_data;
      //      k15_reg      <= t_valid?t_k15_data:
      //                     (funct_reg==MV_V_K15 && i_k15_ready)?src2_value;
      dest_reg     <= s_dest;
      xrs_reg      <= s_xrs[VLEN-1:0];
      // funct_reg    <= funct_reg_t'(s_funct);
      funct_reg    <= s_funct;
   end

   always @(posedge clk or negedge reset_n) begin
      if (~reset_n) begin
         op_valid_reg <= 1'b0;
      end else begin
         op_valid_reg <= 1'b0;
         if (t_instr_valid && predicate && t_instr_ready) begin
            op_valid_reg <= 1'b1;
         end
      end
   end

   // ALU BLOCK AND IT'S ELASTIC LOGIC

   always @(posedge clk or negedge reset_n) begin
      if (~reset_n)  begin
         i_valid <= 1'b0;
      end else begin
         i_valid <= 1'b0;
         if (t_instr_valid && predicate && t_instr_ready) begin
            i_valid <= 1'b1;
         end
      end
   end

   always @(posedge clk) begin
      case (s_funct)
        ADD: begin
           t_alu_data[15:12] <= src1_value[15:12] + src2_value[15:12];
           t_alu_data[11:0 ] <= src1_value[11:0] + src2_value[11:0];
        end
        SUB: begin
           t_alu_data[15:12] <= src1_value[15:12] - src2_value[15:12];
           t_alu_data[11:0 ] <= src1_value[11:0] - src2_value[11:0];
        end
        AND: t_alu_data <= src1_value &  src2_value;
        OR : t_alu_data <= src1_value |  src2_value;
        XOR: t_alu_data <= src1_value ^  src2_value;
        default: t_alu_data <= t_alu_data;
      endcase
   end

endmodule
