// Xbaseband macro instructions

#ifndef __XBASEBAND_H__
#define __XBASEBAND_H__

#include "sig_utils.h"





#define VLEN (16)
#define KLEN (32)
#define NREGS (16)
#define MVL (32)
#define NSLICES (16)

// how many addresses of a 32-bit memory is there
#define MEM_SIZE (2048)

// how many vex-riscv registers are there?
#define VEX_REGS (32)
#define N_K_REGS (16)

#define N_VECTOR_OPS (16)
//
#define OPCODE_NOP       (0x0)
#define OPCODE_ADD       (0x1)
#define OPCODE_SUB       (0x2)
#define OPCODE_AND       (0x3)
#define OPCODE_OR        (0x4)
#define OPCODE_XOR       (0x5)
#define OPCODE_MV        (0x6)
#define OPCODE_ROL       (0x8)
#define OPCODE_ROR       (0x9)
#define OPCODE_MV_X_V    (0xA) //Move EXT to VREG
#define OPCODE_MV_K15_V  (0xB) //Move K15 scratch to VREG
#define OPCODE_MV_V_K15   (0xF)  //Move VREG to scratch K7




// These define the locaiton and width of opcode bitfields


#define OPCODE_DS_SHIFT (7)
#define OPCODE_DS_MASK (0xF)

#define OPCODE_OP_SHIFT (7+4)
#define OPCODE_OP_MASK (0xF)

#define OPCODE_RS1_SHIFT (7+4+4)
#define OPCODE_RS1_MASK (0x1F)

#define OPCODE_RS2_SHIFT (20)
#define OPCODE_RS2_MASK (0x1F)

#define OPCODE_S2_SHIFT (7+4+4+5)
#define OPCODE_S2_MASK (0xF)

#define OPCODE_K_SHIFT (7+4+4+5+4)
#define OPCODE_K_MASK (0xF)

#define OPCODE_S1_SHIFT (7+4+4+5+4+4)
#define OPCODE_S1_MASK (0xF)


// bank address
#define MEMORY_ADDR_SHIFT (0)
#define MEMORY_ADDR_MASK  (0x7FF)

#define MEMORY_PERMUTATION_SHIFT (11)
#define MEMORY_PERMUTATION_MASK  (0x1F)


#define V0 0
#define V1 1
#define V2 2
#define V3 3
#define V4 4
#define V5 5
#define V6 6
#define V7 7


#define V8 8
#define V9 9
#define V10 10
#define V11 11
#define V12 12
#define V13 13
#define V14 14
#define V15 15


// static const int log2slices = 5;
// static const int slices = 32;
// static const int permShift = 12;

<% [VOP_NOP, VOP_ADD, VOP_SUB, VOP_AND, VOP_OR, VOP_XOR, VOP_MV, VOP_ROL, VOP_ROR, VOP_MVXV, VOP_MVK15V, VOP_MVVK15].map(vop => { %>

<% [KOP_NOP, KOP_SK1, KOP_SK2, KOP_SK13, KOP_SK15, KOP_LK8, KOP_LK9, KOP_LK10, KOP_LK11, KOP_LK13, KOP_LK14, KOP_LK15].map(kop => { %>



<% if(((vop.args==3)||(vop.args==2)||(vop.args==206))&&(kop.args==1)){%>
/*
========================
Generating for <%= vop.n %> - <%= kop.n %>
========================
*/
#define _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(_1, _2, _3, _4, NAME, ...) NAME
      
#define <%= vop.n %>_<%= kop.n %>(...) _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(__VA_ARGS__, <%= vop.n %>_<%= kop.n %>_p, <%= vop.n %>_<%= kop.n %>_np)(__VA_ARGS__)
      
#define <%= vop.n %>_<%= kop.n %>_p(ds, s1, s2, rs1)   asm   (".word(((" _XSTR(s1) ") << " _XSTR(OPCODE_S1_SHIFT) ") | (<%=kop.v%><<" _XSTR(OPCODE_K_SHIFT) ") | ((" _XSTR(s2) ") <<" _XSTR(OPCODE_S2_SHIFT) ") | ((<%=r2i.zero%>) << " _XSTR(OPCODE_RS1_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))" : : "r" (rs1))

#define <%= vop.n %>_<%= kop.n %>_np(ds, s1, s2)   asm   (".word(((" _XSTR(s1) ") << " _XSTR(OPCODE_S1_SHIFT) ") | (<%=kop.v%><<" _XSTR(OPCODE_K_SHIFT) ") | ((" _XSTR(s2) ") <<" _XSTR(OPCODE_S2_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))")
<% } %>

<% if((vop.args==3)&&(kop.args==0)){%>
/*
========================
Generating for <%= vop.n %> - <%= kop.n %>
========================
*/

#define _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(_1, _2, _3, _4, NAME, ...) NAME
      
#define <%= vop.n %>_<%= kop.n %>(...) _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(__VA_ARGS__, <%= vop.n %>_<%= kop.n %>_p, <%= vop.n %>_<%= kop.n %>_np)(__VA_ARGS__)

      
#define <%= vop.n %>_<%= kop.n %>_p(ds, s1, s2, rs1)   asm   (".word(((" _XSTR(s1) ") << " _XSTR(OPCODE_S1_SHIFT) ") | ((" _XSTR(s2) ") <<" _XSTR(OPCODE_S2_SHIFT) ") | ((<%=r2i.zero%>) << " _XSTR(OPCODE_RS1_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))" : : "r" (rs1))

#define <%= vop.n %>_<%= kop.n %>_np(ds, s1, s2)   asm   (".word(((" _XSTR(s1) ") << " _XSTR(OPCODE_S1_SHIFT) ") | ((" _XSTR(s2) ") <<" _XSTR(OPCODE_S2_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))")
<% } %>


<% if((vop.args==2||vop.args==206)&&(kop.args==0)){%>
/*
========================
Generating for <%= vop.n %> - <%= kop.n %>
========================
*/

#define _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(_1, _2, _3, NAME, ...) NAME
      
#define <%= vop.n %>_<%= kop.n %>(...) _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(__VA_ARGS__, <%= vop.n %>_<%= kop.n %>_p, <%= vop.n %>_<%= kop.n %>_np)(__VA_ARGS__)


#define <%= vop.n %>_<%= kop.n %>_p(ds, s2, rs1)   asm   (".word(((" _XSTR(s2) ") <<" _XSTR(OPCODE_S2_SHIFT) ") | ((<%=r2i.zero%>) << " _XSTR(OPCODE_RS1_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))" : : "r" (rs1))

#define <%= vop.n %>_<%= kop.n %>_np(ds, s2)   asm   (".word(((" _XSTR(s2) ") <<" _XSTR(OPCODE_S2_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))")
<% } %>

<% if((vop.args==0)&&(kop.args==1)){%>
/*
========================
Generating for <%= vop.n %> - <%= kop.n %>
========================
*/

#define <%= vop.n %>_<%= kop.n %>(s1)   asm   (".word(((" _XSTR(s1) ") << " _XSTR(OPCODE_S1_SHIFT) ") | (<%=kop.v%><<" _XSTR(OPCODE_K_SHIFT) ") | (0x0b))")
<% } %>

<% if((vop.args==0)&&(kop.args==0)){%>
/*
========================
Generating for <%= vop.n %> - <%= kop.n %>
========================
*/

#define <%= vop.n %>_<%= kop.n %>   asm   (".word((0x0b))")
<% } %>

<% if((vop.args==111)&&(kop.args==1)){%>
/*
========================
Generating for <%= vop.n %> - <%= kop.n %>
========================
*/

#define _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(_1, _2, _3, NAME, ...) NAME
      
#define <%= vop.n %>_<%= kop.n %>(...) _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(__VA_ARGS__, <%= vop.n %>_<%= kop.n %>_p, <%= vop.n %>_<%= kop.n %>_np)(__VA_ARGS__)


#define <%= vop.n %>_<%= kop.n %>_p(ds, s1, rs1)   asm   (".word(((" _XSTR(s1) ") << " _XSTR(OPCODE_S1_SHIFT) ") | (<%=kop.v%><<" _XSTR(OPCODE_K_SHIFT) ") | ((<%=r2i.zero%>) << " _XSTR(OPCODE_RS1_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))" : : "r" (rs1))

#define <%= vop.n %>_<%= kop.n %>_np(ds, s1)   asm   (".word(((" _XSTR(s1) ") << " _XSTR(OPCODE_S1_SHIFT) ") | (<%=kop.v%><<" _XSTR(OPCODE_K_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))")
<% } %>

<% if((vop.args==111)&&(kop.args==0)){%>
/*
========================
Generating for <%= vop.n %> - <%= kop.n %>
========================
*/

#define _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(_1, _2, NAME, ...) NAME
      
#define <%= vop.n %>_<%= kop.n %>(...) _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(__VA_ARGS__, <%= vop.n %>_<%= kop.n %>_p, <%= vop.n %>_<%= kop.n %>_np)(__VA_ARGS__)


#define <%= vop.n %>_<%= kop.n %>_p(ds, rs1)   asm   (".word(((<%=r2i.zero%>) << " _XSTR(OPCODE_RS1_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))" : : "r" (rs1))

#define <%= vop.n %>_<%= kop.n %>_np(ds)   asm   (".word((<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))")
<% } %>

<% if((vop.args==115)&&(kop.args==1)){%>
/*
========================
Generating for <%= vop.n %> - <%= kop.n %>
========================
*/

#define <%= vop.n %>_<%= kop.n %>(s1, s2)   asm   (".word(((" _XSTR(s1) ") << " _XSTR(OPCODE_S1_SHIFT) ") | (<%=kop.v%><<" _XSTR(OPCODE_K_SHIFT) ") | ((" _XSTR(s2) ") <<" _XSTR(OPCODE_S2_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | | (0x0b))")
<% } %>

<% if((vop.args==115)&&(kop.args==0)){%>
/*
========================
Generating for <%= vop.n %> - <%= kop.n %>
========================
*/

#define <%= vop.n %>_<%= kop.n %>(s2)   asm   (".word(((" _XSTR(s2) ") <<" _XSTR(OPCODE_S2_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | (0x0b))")
<% } %>

<% if((vop.args==210)&&(kop.args==1)){%>
/*
========================
Generating for <%= vop.n %> - <%= kop.n %>
========================
*/

#define _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(_1, _2, _3, NAME, ...) NAME
      
#define <%= vop.n %>_<%= kop.n %>(...) _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(__VA_ARGS__, <%= vop.n %>_<%= kop.n %>_p, <%= vop.n %>_<%= kop.n %>_np)(__VA_ARGS__)


#define <%= vop.n %>_<%= kop.n %>_p(ds, rs1, s1)   asm   (".word(((" _XSTR(s1) ") << " _XSTR(OPCODE_S1_SHIFT) ") | (<%=kop.v%><<" _XSTR(OPCODE_K_SHIFT) ") | ((<%=r2i.zero%>) << " _XSTR(OPCODE_RS1_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))" : : "r" (rs1))

#define <%= vop.n %>_<%= kop.n %>_np(ds, s1)   asm   (".word(((" _XSTR(s1) ") << " _XSTR(OPCODE_S1_SHIFT) ") | (<%=kop.v%><<" _XSTR(OPCODE_K_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))")
<% } %>

<% if((vop.args==210)&&(kop.args==0)){%>
/*
========================
Generating for <%= vop.n %> - <%= kop.n %>
========================
*/

#define _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(_1, _2, NAME, ...) NAME
      
#define <%= vop.n %>_<%= kop.n %>(...) _GET_OVERRIDE_<%= vop.n %>_<%= kop.n %>(__VA_ARGS__, <%= vop.n %>_<%= kop.n %>_p, <%= vop.n %>_<%= kop.n %>_np)(__VA_ARGS__)


#define <%= vop.n %>_<%= kop.n %>_p(ds, rs1)   asm   (".word(((<%=r2i.zero%>) << " _XSTR(OPCODE_RS1_SHIFT) ") | (<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))" : : "r" (rs1))

#define <%= vop.n %>_<%= kop.n %>_np(ds)   asm   (".word((<%=vop.v %>  <<" _XSTR(OPCODE_OP_SHIFT) ") | ((" _XSTR(ds) ") <<" _XSTR(OPCODE_DS_SHIFT) ") | (0x0b))")
<% } %>

<% }) %>

<% }) %>



#endif /* XBASEBAND_H */
