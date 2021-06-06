// Xbaseband macro instructions

#ifndef __XVCORDIC_H__
#define __XVCORDIC_H__

#include "sig_utils.h"



#define OPCODE_DS_SHIFT (7)
#define OPCODE_DS_MASK (0xF)

#define OPCODE_OP_SHIFT (7+4)
#define OPCODE_OP_MASK (0xF)

#define OPCODE_RS1_SHIFT (7+4+4)
#define OPCODE_RS1_MASK (0x1F)

#define OPCODE_RS2_SHIFT (20)
#define OPCODE_RS2_MASK (0x1F)


#define ATAN(dst, src1, src2) asm(".word(" \
"((<%=r2i.zero%>) << " _XSTR(OPCODE_DS_SHIFT) ") | " \
"((<%=r2i.one%>) << " _XSTR(OPCODE_RS1_SHIFT) " ) | " \
"((<%=r2i.two%>) << " _XSTR(OPCODE_RS2_SHIFT) " )  | (0x2b))" : "=r" (dst) : "r" (src1) , "r" (src2) )

#endif /* XVCORDIC */
