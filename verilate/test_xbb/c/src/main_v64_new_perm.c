
// #include "xbaseband.h"
// #include "apb_bus.h"
// #include "csr_control.h"
// #include "bootloader.h"
// #include "pass_fail.h"

// #define VMEM_SECTION __attribute__((section(".vmem_constant.data")))
// #define VMEM_SECTION_OFFSET __attribute__((section(".vmem_offset.data")))

// #define VMEM_SECTION_OFFSET_WORDS(x) \
// VMEM_SECTION_OFFSET unsigned int __vmem_section_offset_words[x] = {}; \
// unsigned int vmem_load_offset = x;

// // call this ONLY ONE TIME per project to offset the beginning of vmem allocation
// VMEM_SECTION_OFFSET_WORDS(0);

// //xbb_64fft()
// VMEM_SECTION unsigned int data_cfg[16] = {0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x020202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
// VMEM_SECTION unsigned int tw0[16] = {0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000};
// VMEM_SECTION unsigned int tw1[16] = {0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0xe7823b21, 0xd2bf2d41, 0xc4df187e, 0x00004000, 0xd2bf2d41, 0xc0000000, 0xd2bfd2bf, 0x00004000, 0xc4df187e, 0xd2bfd2bf, 0x187ec4df};

// VMEM_SECTION unsigned int tw20[16] = {0x00004000, 0x00004000, 0x00004000, 0x00004000, 0x00004000, 0xe7823b21, 0xd2bf2d41, 0xc4df187e, 0x00004000, 0xd2bf2d41, 0xc0000000, 0xd2bfd2bf, 0x00004000, 0xc4df187e, 0xd2bfd2bf, 0x187ec4df};
// VMEM_SECTION unsigned int tw21[16] = {0x00004000, 0xf9ba3fb1, 0xf3843ec5, 0xed6c3d3f, 0x00004000, 0xe1d53871, 0xcac9238e, 0xc04f0646, 0x00004000, 0xce87289a, 0xc13bf384, 0xe1d5c78f, 0x00004000, 0xc2c11294, 0xdc72cac9, 0x289ace87};
// VMEM_SECTION unsigned int tw22[16] = {0x00004000, 0xf3843ec5, 0xe7823b21, 0xdc723537, 0x00004000, 0xdc723537, 0xc4df187e, 0xc13bf384, 0x00004000, 0xcac9238e, 0xc4dfe782, 0xf384c13b, 0x00004000, 0xc13b0c7c, 0xe782c4df, 0x3537dc72};
// VMEM_SECTION unsigned int tw23[16] = {0x00004000, 0xed6c3d3f, 0xdc723537, 0xce87289a, 0x00004000, 0xd7663179, 0xc13b0c7c, 0xc78fe1d5, 0x00004000, 0xc78f1e2b, 0xcac9dc72, 0x0646c04f, 0x00004000, 0xc04f0646, 0xf384c13b, 0x3d3fed6c};



// VMEM_SECTION unsigned int data0[16] = {0x00000000,0x00000010,0x00000020,0x00000030,0x00000040,0x00000050,0x00000060,0x00000070,0x00000080,0x00000090,0x000000a0,0x000000b0,0x000000c0,0x000000d0,0x000000e0,0x000000f0};
// VMEM_SECTION unsigned int data1[16] = {0x00000100,0x00000110,0x00000120,0x00000130,0x00000140,0x00000150,0x00000160,0x00000170,0x00000180,0x00000190,0x000001a0,0x000001b0,0x000001c0,0x000001d0,0x000001e0,0x000001f0};
// VMEM_SECTION unsigned int data2[16] = {0x00000200,0x00000210,0x00000220,0x00000230,0x00000240,0x00000250,0x00000260,0x00000270,0x00000280,0x00000290,0x000002a0,0x000002b0,0x000002c0,0x000002d0,0x000002e0,0x000002f0};
// VMEM_SECTION unsigned int data3[16] = {0x00000300,0x00000310,0x00000320,0x00000330,0x00000340,0x00000350,0x00000360,0x00000370,0x00000380,0x00000390,0x000003a0,0x000003b0,0x000003c0,0x000003d0,0x000003e0,0x000003f0};
// //VMEM_SECTION unsigned int data[64] = {0x06861236, 0x0f14f4cc, 0xf6f9fc66, 0xfcbff084, 0x0c61f6b7, 0xe3242475, 0x02d20463, 0x04eafb24, 0xfded0847, 0x106de78a, 0xfe4123c6, 0x0206f8db, 0x13330410, 0x0bfde11d, 0x0feb1054, 0x0c8f1d5b, 0x106ce3f9, 0x1b33ede3, 0xf5450763, 0x10a0f933, 0xe5fe0a61, 0x02bffc8a, 0xfc120039, 0x14c90678, 0xdcddf209, 0xffe403a1, 0x08b6eee9, 0xecd7ef6b, 0x0c2c1094, 0x0f571154, 0x09060c4a, 0x00cefd5a, 0xfbb40b74, 0x05430d36, 0xfe8c0db7, 0xedc700c6, 0xf8ed06a0, 0xffd80dff, 0x0828f007, 0xfe612978, 0x097a1326, 0xfc450c13, 0xee43ee5b, 0xfa21f64b, 0xe667e654, 0x1e4401f8, 0x092a04ff, 0xf3462700, 0xee17fd0c, 0xf366fe7e, 0xf5ae00db, 0x01a5ebd2, 0x04aa0e08, 0x1d5bfe42, 0x0b980370, 0x068113f6, 0x093df5bf, 0x0675fa0f, 0xf010fef3, 0x1018edc2, 0xf4fb0b46, 0xfe82ecc0, 0xe0f1f83f, 0xfe9cfe68};



// void xbb_64fft()
// {
//   register volatile unsigned int x3 asm("x3");
//   int rs1;

//   //reordering
//   loworder2skewoneplus(7, 4);
//   for(int index=0;index<64;index++)
//   {
//   	x3=vector_memory[112+index];
//   }

//   MVXV_KNOP(V3, 0);
//   VNOP_LK14(V3);

//   //stage 0
//   MVXV_KNOP(V3, 1); //twddle factor
//   MVXV_KNOP(V4, 0);
//   MVXV_KNOP(V5, 1<<12);
//   rs1 = 0xfffffffe;
//   for(int index_addr=0;index_addr<16;index_addr++)
//   {
// 	MVXV_KNOP(V6, index_addr%4+7);
// 	MV_KNOP(V7, V6, rs1);
// 	rs1=(rs1<<1)+1;
//   }
//   MV_KNOP(V0, V7, 0);
  
//   for(int index=0;index<4;index++)
//   {
//     VNOP_LK8(V3);

//     ADD_KNOP(V1, V0, V4, 0);
//     VNOP_LK9(V1);
//     ROL_KNOP(V0, V0, 0);
//     ADD_KNOP(V4, V4, V5, 0);

//     MVXV_KNOP(V2, index+7+4);
//     VNOP_SK1(V2);
//   }
//   for(int index=0;index<64;index++)
//   {
//   	x3=vector_memory[176+index];
//   }

//   //stage 1
//   rs1 = 0xfffffffe;
//   int temp;
//   for(int index=0;index<16;index++)
//   {
//     MVXV_KNOP(V6, (0<<12)+0);
//     MV_KNOP(V7, V6, rs1);

//     temp=((index>>2)+(index<<2))&0x0000000f;
//     temp=temp-index;
//     if (temp<0)
//     {
//       temp=temp+16;
//     }
//     MVXV_KNOP(V6, (temp<<12));
//     MV_KNOP(V5, V6, rs1);

//     rs1=(rs1<<1)+1;
//   }
//   MV_KNOP(V6, V7, 0);
//   MV_KNOP(V4, V5, 0);

//   for(int index=0;index<4;index++)
//   {
//   	 MVXV_KNOP(V0,2);
//      ADD_KNOP(V0, V0, V6, 0);
//      VNOP_LK8(V0);

//      MVXV_KNOP(V0,11+index);
//      ADD_KNOP(V0, V0, V4, 0);
//      VNOP_LK9(V0);

//      MVXV_KNOP(V0,15+index);
//      ADD_KNOP(V0, V0, V4, 0);
//      VNOP_SK1(V0);
//   }

//   for(int index=0;index<64;index++)
//   {
//   	x3=vector_memory[240+index];
//   }

//   //stage 2
//   loworder2skewoneplus(15, 4);

//   MVXV_KNOP(V3, 0);
//   VNOP_LK14(V3);
  
//   rs1 = 0xfffffffe;
//   for(int index_addr=0;index_addr<16;index_addr++)
//   {
// 	MVXV_KNOP(V6, index_addr%4);
// 	MV_KNOP(V7, V6, rs1);
// 	rs1=(rs1<<1)+1;
//   }
//   MV_KNOP(V0, V7, 0);

//   MVXV_KNOP(V4, 0);
//   MVXV_KNOP(V5, 1<<12);
//   MVXV_KNOP(V6, 0);

  
//   for(int index=0;index<4;index++)
//   {
//   	MVXV_KNOP(V3, 3+index); //twddle factor
//     VNOP_LK8(V3);

//     MVXV_KNOP(V3, 15);
//     ADD_KNOP(V2, V0, V3, 0);
//     ADD_KNOP(V1, V2, V4, 0);
//     VNOP_LK9(V1);
    

//     MVXV_KNOP(V3, 19);
//     ADD_KNOP(V2, V0, V3, 0);
//     ADD_KNOP(V1, V2, V6, 0);
//     VNOP_SK1(V1);


//     ROL_KNOP(V0, V0, 0);
//     ADD_KNOP(V4, V4, V5, 0);
//     SUB_KNOP(V6, V6, V5, 0);
//   }

//   skewoneplus2loworder(19, 4);
  
//   // show results
//   for(int index=0;index<64;index++)
//   {
//   	x3=vector_memory[19*16+index];
//   }
 


// }

// int loworder2skewoneplus(int start_row, int num_row)
// {
  
//   register volatile unsigned int check_value asm("x3");
//   int rs1;

//   int block=num_row>>4;
//   MVXV_KNOP(V0, (start_row));
//   MVXV_KNOP(V1, 1);
//   MV_KNOP(V2, V0, 0);
//   MVXV_KNOP(V3, (1-(1<<12)));
//   MVXV_KNOP(V4, ((1<<12)));

//   for(unsigned int index_block=0; index_block<block; index_block++)
//   {
//     for(unsigned int index_row = 0; index_row<16; index_row++)
//     {
//       ADD_LK15(V0,V0, V1, 0);
//       asm("nop");
//       asm("nop");
//       asm("nop");
//       ADD_SK15(V2,V2, V3, 0);
//       asm("nop");
//       asm("nop");
//       asm("nop");
//     }

//     SUB_KNOP(V2, V2, V4, 0);
//   }

//   for(unsigned int index_row = 0; index_row<16; index_row++)
//     {
//       ADD_LK15(V0,V0, V1, 0);
//       asm("nop");
//       asm("nop");
//       asm("nop");
//       ADD_SK15(V2,V2, V3, 0);
//       asm("nop");
//       asm("nop");
//       asm("nop");
//     }

//   return 1;
// }

// int skewoneplus2loworder(int start_row, int num_row)
// {
  
//   register volatile unsigned int check_value asm("x3");
//   int rs1;

//   int block=num_row>>4;
//   MVXV_KNOP(V0, (start_row));
//   MVXV_KNOP(V1, 1);
//   MV_KNOP(V2, V0, 0);
//   MVXV_KNOP(V3, (+1+(1<<12)));
//   MVXV_KNOP(V4, ((1<<12)));

//   for(unsigned int index_block=0; index_block<block; index_block++)
//   {
//     for(unsigned int index_row = 0; index_row<16; index_row++)
//     {
//       ADD_LK15(V0,V0, V1, 0);
//       asm("nop");
//       asm("nop");
//       asm("nop");
//       ADD_SK15(V2,V2, V3, 0);
//       asm("nop");
//       asm("nop");
//       asm("nop");
//     }

//     ADD_KNOP(V2, V2, V4, 0);
//   }

//   for(unsigned int index_row = 0; index_row<16; index_row++)
//     {
//       ADD_LK15(V0,V0, V1, 0);
//       asm("nop");
//       asm("nop");
//       asm("nop");
//       ADD_SK15(V2,V2, V3, 0);
//       asm("nop");
//       asm("nop");
//       asm("nop");
//     }

//   return 1;
// }



// int main_v64_new_perm(void)
// {

//   xbb_64fft();

//   return 0;
// }
