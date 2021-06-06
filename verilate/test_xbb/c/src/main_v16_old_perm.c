
// #include "xbaseband.h"
// #include "apb_bus.h"
// #include "csr_control.h"
// #include "bootloader.h"
// #include "pass_fail.h"

// // #define VMEM_SECTION __attribute__((section(".vmem_constant.data")))
// // #define VMEM_SECTION_OFFSET __attribute__((section(".vmem_offset.data")))

// // #define VMEM_SECTION_OFFSET_WORDS(x) \
// // VMEM_SECTION_OFFSET unsigned int __vmem_section_offset_words[x] = {}; \
// // unsigned int vmem_load_offset = x;

// // // call this ONLY ONE TIME per project to offset the beginning of vmem allocation
// // VMEM_SECTION_OFFSET_WORDS(0);

// // //xbb_16fft()
// // VMEM_SECTION unsigned int data_cfg[16] = {0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x020202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
// // VMEM_SECTION unsigned int tw0[16] = {0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0x4000};
// // VMEM_SECTION unsigned int tw1[16] = {0x4000, 0x4000, 0x4000, 0x4000, 0x4000, 0xe7823b21, 0xd2bf2d41, 0xc4df187e, 0x4000, 0xd2bf2d41, 0xc0000000, 0xd2bfd2bf, 0x00004000, 0xc4df187e, 0xd2bfd2bf, 0x187ec4df};
// // //VMEM_SECTION unsigned int data[16] = {0,0x100,0x200,0x300,0x400,0x500,0x600,0x700,0x800,0x900,0xa00,0xb00,0xc00,0xd00,0xe00,0xf00};
// // //VMEM_SECTION unsigned int data[16] = {0,0x01000100,0x02000200,0x03000300,0x04000400,0x05000500,0x06000600,0x07000700,0x08000800,0x09000900,0x0a000a00,0x0b000b00,0x0c000c00,0x0d000d00,0x0e000e00,0x0f000f00};
// // VMEM_SECTION unsigned int data[16] = {0x040e179f,0xfd27fe40,0x118700d3,0xeba00982,0x00c2161f,0x1331f537,0xfb97f91d,0xea4800c9,0xfc7b1744,0xfc04e58b,0x09d20dfa,0x1c531146,0xeda102b1,0xf56c102f,0xf812fe1b,0x05460034};

// //xbb_datapath()
// // VMEM_SECTION unsigned int data_cfg[16] = {0x05050505, 0x05050505, 0x05050505, 0x05050505, 0x020202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
// // VMEM_SECTION unsigned int data1[16] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
// // VMEM_SECTION unsigned int data2[16] = {0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100, 0x100};
// // VMEM_SECTION unsigned int data3[16] = {0x200, 0x200, 0x200, 0x200, 0x200, 0x200, 0x200, 0x200, 0x200, 0x200, 0x200, 0x200, 0x200, 0x200, 0x200, 0x200};

// //VMEM_SECTION unsigned int data_cfg[32] = {0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x0f0f0f0f, 0x040404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
// //VMEM_SECTION unsigned int data_cfg[32] = {0, 0, 0, 0, 0, 0, 0, 0, 0x040404, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

// void xbb_16fft()
// {
//    register volatile unsigned int x3 asm("x3");


//    //reordering
//    int temp;
//    for(int index=0;index<16;index++)
//    {
//     temp=((index>>2)+(index<<2))&0x0000000f;
//     //vector_memory[index+64] = vector_memory[temp+48];
//     vector_memory[index+64] = vector_memory[index+48]; 
//    }
//    for(int index=0;index<16;index++)
//    {
//       x3=vector_memory[index+64];
//    }

//    // stage 0
//   int rs1 = 0xfffffffe;
//   for(int index=0;index<16;index++)
//   {
//     MVXV_KNOP(V6, (index<<12)+0);
//     MV_KNOP(V7, V6, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   MV_KNOP(V6, V7, 0);

//   MVXV_KNOP(V0,0);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK14(V0);

//   MVXV_KNOP(V0,1);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK8(V0);

//   MVXV_KNOP(V0,4);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK9(V0);

//   MVXV_KNOP(V0,5);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_SK1(V0);

//   for(int index=0;index<16;index++)
//    {
//       x3=vector_memory[index+80];
//    }

//   //reordering
//    for(int index=0;index<16;index++)
//    {
//     temp=((index>>2)+(index<<2))&0x0000000f;
//     vector_memory[index+96] = vector_memory[temp+80]; 
//    }

//   //stage 1

//   MVXV_KNOP(V0,2);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK8(V0);

//   MVXV_KNOP(V0,6);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK9(V0);

//   MVXV_KNOP(V0,7);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_SK1(V0);

//   //reordering
//    for(int index=0;index<16;index++)
//    {
//     temp=((index>>2)+(index<<2))&0x0000000f;
//     vector_memory[index+128] = vector_memory[temp+112]; 
//    }

//   for(int index=0;index<16;index++)
//    {
//       x3=vector_memory[index+128];
//    }

   

// }

// void xbb_permutation()
// {
//   register volatile unsigned int x3 asm("x3");

//   int rs1 = 0xfffffffe;
//   for(int index=0;index<16;index++)
//   {
//     MVXV_KNOP(V6, (index<<12)+0);
//     MV_KNOP(V7, V6, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   MV_KNOP(V6, V7, 0);

//   MVXV_KNOP(V0,1);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK8(V0);


//   rs1 = 0xfffffffe;
//   int temp;
//   x3=0x11111111;
//   for(int index=0;index<16;index++)
//   {
//     temp=((index>>2)+(index<<2))&0x0000000f;
//     x3 = temp;
//     MVXV_KNOP(V6, (temp<<12));
//     MV_KNOP(V7, V6, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   MV_KNOP(V6, V7, 0);

//   MVXV_KNOP(V0,1);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK9(V0);



// }

// void xbb_datapath()
// {
//   register volatile unsigned int x3 asm("x3");

//   int rs1=0;
  
//   // load address
//   rs1 = 0xfffffffe;
//   for(int index=0;index<16;index++)
//   {
//     MVXV_KNOP(V6, (index<<12)+0);
//     MV_KNOP(V7, V6, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   MV_KNOP(V6, V7, 0);

//   MVXV_KNOP(V0,0);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK14(V0);

//   MVXV_KNOP(V0,1);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK8(V0);

//   MVXV_KNOP(V0,2);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK9(V0);

  

//   for(int index_nop=0;index_nop<16;index_nop++)
//   {
//     asm("nop");
//   }

  

//   MVXV_KNOP(V0,1);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK8(V0);

//   MVXV_KNOP(V0,3);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_LK9(V0);


//   for(int index_nop=0;index_nop<32;index_nop++)
//   {
//     asm("nop");
//   }

//   MVXV_KNOP(V0,4);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_SK1(V0);

//   MVXV_KNOP(V0,5);
//   ADD_KNOP(V0, V0, V6, 0);
//   VNOP_SK1(V0);

//   // for(int index_nop=0;index_nop<16;index_nop++)
//   // {
//   //   asm("nop");
//   //}

//   x3=0x11111111;

//   for(int index=0;index<32;index++)
//   {
//     x3=vector_memory[64+index];
//   }
  

// }




// // void xbb_vmem_constant()
// // {
// //   register volatile unsigned int x3 asm("x3");
// //   x3=0x11111111;
// //   int pass_fail_flag = 1;
// //   for(unsigned int index=vmem_load_offset; index<vmem_load_offset+32;index++)
// //   {
// //     x3=vector_memory[index];
// //     x3=data1[index-vmem_load_offset];
// //     x3=data1 + (index-vmem_load_offset);
// //     if (vector_memory[index]!=data1[index-vmem_load_offset])
// //     {
// //       pass_fail_flag=0;
// //       break;
// //     } 
// //   }
// //   if(pass_fail_flag==1)
// //   {
// //     *pass_fail_0=0xffffffff;
// //   }

// // }

// void xbb_example(void)
// {
//   *pass_fail_0=0x00000000;
//   // // // // // // --- 0
//   // // individual opcode test   
//   int rs1=0;
//   unsigned int a, b, c;
//   a = 0x10;
//   MVXV_KNOP(V0, a);
//   b = 0x11;
//   MVXV_KNOP(V1, b);
//   c = 0x13;
//   MVXV_KNOP(V2, c);
//   ADD_KNOP(V2, V1, V0, rs1);
//   // for demo pass/fail purpose
//   MVVK15_KNOP(V2);
//   MVXV_KNOP(V0,0);
//   VNOP_SK15(V0);
//   asm("nop");
//   int answer0=a+b;
//   if(vector_memory[0]==answer0)
//   {
//     *pass_fail_0 = *pass_fail_0 | 0x1;
//   }
  

//   // // // // //--- 1
//   // // add overflow test 
//   rs1=0x0;
//   a = 0xf7ff;
//   MVXV_KNOP(V0, a);
//   b = 0xfdff;
//   MVXV_KNOP(V1, b);
//   ADD_KNOP(V2, V1, V0, rs1); 
//   // for demo pass/fail purpose
//   MVVK15_KNOP(V2);
//   MVXV_KNOP(V0,0);
//   VNOP_SK15(V0);
//   asm("nop");
//   int c1 = a+b;
//   int d1 = c1 & 0x00000fff;
//   int e1 = ((a&0x0000f000)+(b&0x0000f000));
//   int answer1 = (e1&0x0000f000)+d1;
//   if(vector_memory[0]==answer1)
//   {
//     *pass_fail_0 = *pass_fail_0 | 0x2;
//   }


//   // // // // // --- 2
//   // // sub test 
//   rs1=0x0;
//   a = 0x4;
//   MVXV_KNOP(V1, a);
//   b = 0x100;
//   MVXV_KNOP(V0, b);
//   SUB_KNOP(V2, V1, V0, rs1); 
//   // for demo pass/fail purpose
//   MVVK15_KNOP(V2);
//   MVXV_KNOP(V0,0);
//   VNOP_SK15(V0);
//   asm("nop");
//   int c2 = a-b;
//   int d2 = c2 & 0x00000fff;
//   int e2 = ((a&0x0000f000)-(b&0x0000f000));
//   int answer2 = (e2&0x0000f000)+d2;
//   if(vector_memory[0]==answer2)
//   {
//     *pass_fail_0 = *pass_fail_0 | 0x4;
//   }

//   // // // // // // --- 3
//   // // // simple datapath test
//   // int flag3=1;
//   // vector_memory[0]=0xffffffff;
//   // for(int i=1;i<0x000000ff;i++)
//   // {
//   //   vector_memory[i]=i-1;
//   // }
//   // MVXV_KNOP(V0, 1);
//   // VNOP_LK8(V0);
//   // MVXV_KNOP(V0, 2);
//   // VNOP_LK9(V0);
//   // MVXV_KNOP(V0, 3);
//   // VNOP_LK10(V0);
//   // MVXV_KNOP(V0, 4);
//   // VNOP_LK11(V0);
//   // MVXV_KNOP(V0, 0);
//   // VNOP_LK14(V0);
//   // VNOP_SK1(V0);
//   // // for demo pass/fail purpose
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // if(vector_memory[0]!=0xffffffdf)
//   // {
//   //   flag3=0;
//   // }
//   // VNOP_SK2(V0);
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // asm("nop");
//   // if(vector_memory[0]!=0xffffffdf)
//   // {
//   //   flag3=0;
//   // }
//   // if(flag3==1)
//   // {
//   //   *pass_fail_0 = *pass_fail_0 | 0x8;
//   // }


//   // // // // // --- 4
//   // // compound opcode test
//   int flag4 = 1;
//   for(int i=0;i<0x000000ff;i++)
//   {
//     vector_memory[i]=i;
//   }
//   a=0x0;
//   b=0x4;
//   MVXV_KNOP(V0, a);
//   MVXV_KNOP(V1, b);
//   SUB_LK8(V4, V1, V0, 0);
//   c=0x1;
//   MVXV_KNOP(V0, c);
//   ADD_LK9(V3, V1, V0, 0);
//   // for demo pass/fail purpose
//   MVVK15_KNOP(V4);
//   MVXV_KNOP(V0, 0);
//   VNOP_SK15(V0);
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   if(vector_memory[0]!=b-a)
//   {
//     flag4=0;
//   }
//   MVVK15_KNOP(V3);
//   MVXV_KNOP(V0, 0);
//   VNOP_SK15(V0);
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   asm("nop");
//   if(vector_memory[0]!=b+c)
//   {
//     flag4=0;
//   }
//   if(flag4==1)
//   {
//     *pass_fail_0 = *pass_fail_0 | 0x10;
//   }


//   // // // // // 
//   // // permutation network test --- load
//   // rs1 = 0xfffffffe;
//   // for(int i=0;i<32;i++)
//   // {
//   //   //test one
//   //   // MVXV_KNOP(V2, (i<<11)+i);
//   //   // MV_KNOP(V0, V2, rs1);
//   //   // rs1=(rs1<<1)+1;
    
//   //   //test two
//   //   //MVXV_KNOP(V0, 0x1000);

//   //   //test three
//   //   // MVXV_KNOP(V2, ((31-i)<<11));
//   //   // MV_KNOP(V0, V2, rs1);
//   //   // rs1=(rs1<<1)+1;

//   //   //test four
//   //   // MVXV_KNOP(V2, ((i%4)<<11));
//   //   // MV_KNOP(V0, V2, rs1);
//   //   // rs1=(rs1<<1)+1;

//   //   //test five
//   //   // MVXV_KNOP(V2, ((i>>2)<<11));
//   //   // MV_KNOP(V0, V2, rs1);
//   //   // rs1=(rs1<<1)+1;

//   //   //test six
//   //   MVXV_KNOP(V2, ((i%4)<<11)+i);
//   //   MV_KNOP(V0, V2, rs1);
//   //   rs1=(rs1<<1)+1;
//   // }
//   // for(unsigned int i=0;i<0x00000400;i++)
//   // {
//   //   vector_memory[i]=i;
//   // }
//   // VNOP_LK15(V0);

//   // // // // // --- 5
//   // // permutation network test ---  load & store
//   int flag5 = 1;
//   rs1 = 0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, (i<<12));
//     MV_KNOP(V0, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   for(unsigned int i=0;i<0x00000010;i++)
//   {
//     vector_memory[i]=i;
//   }
//   VNOP_LK15(V0);
  
//   rs1 = 0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, ((i)<<12)+1);
//     MV_KNOP(V1, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   VNOP_SK15(V1);
//   // for demo pass/fail purpose
//   asm("nop");
//   asm("nop");
//   asm("nop");
 

//   for(int i=0;i<16;i++)
//   {
//     if(vector_memory[0x10+i]!=i)
//       flag5=0;
//   }
//   if(flag5==1)
//   {
//     *pass_fail_0 = *pass_fail_0 | 0x20;
//   }



//   // // // // // --- 6
//   // // permutation network test ---  load & store
//   int flag6 = 1;
//   rs1 = 0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, (i<<12));
//     MV_KNOP(V0, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   for(unsigned int i=0;i<0x000000ff;i++)
//   {
//     vector_memory[i]=i;
//   }
//   VNOP_LK15(V0);

//   rs1 = 0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, (i<<12));
//     MV_KNOP(V1, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   VNOP_SK15(V1);
//   // for demo pass/fail purpose
//   asm("nop");
//   for(int i=0;i<16;i++)
//   {
//     if(vector_memory[i]!=(i))
//       flag6=0;
//   }
//   if(flag6==1)
//   {
//     *pass_fail_0 = *pass_fail_0 | 0x40;
//   }

  
//   // // // // // --- 7
//   // // permutation network test ---  load & store
//   int flag7 = 1;
//   rs1 = 0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, (i<<12)+i);
//     MV_KNOP(V0, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   for(unsigned int i=0;i<0x00000400;i++)
//   {
//     vector_memory[i]=i;
//   }
//   VNOP_LK15(V0);

//   rs1 = 0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, (i<<12));
//     MV_KNOP(V1, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   VNOP_SK15(V1);
//   // for demo pass/fail purpose
//   asm("nop");
//   for(int i=0;i<16;i++)
//   {
//     if(vector_memory[i]!=(0x10*i+i))
//       flag7=0;
//   }
//   if(flag7==1)
//   {
//     *pass_fail_0 = *pass_fail_0 | 0x80;
//   }

//   // // // // // --- 8
//   // // ROR test
//   int flag8 = 1;
//   rs1=0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, i);
//     MV_KNOP(V0, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   ROR_KNOP(V7,V0, 0x0);
//   // for demo pass/fail purpose
//   MVVK15_KNOP(V7);
//   rs1=0xfffffffe;
//   // int aaaa[32];
//   // aaaa[0]=4;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, i<<12);
//     MV_KNOP(V0, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   VNOP_SK15(V0);
//   for(int i=0;i<16;i++)
//   {
//     if(vector_memory[i]!=(i+1)%16)
//       flag8=0;
//   }
//   if(flag8==1)
//   {
//     *pass_fail_0 = *pass_fail_0 | 0x100;
//   }


//   // // // // // --- 9
//   // // ROL test
//   int flag9 = 1;
//   rs1=0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, i);
//     MV_KNOP(V0, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   ROL_KNOP(V7,V0, 0x0);
//   // for demo pass/fail purpose
//   MVVK15_KNOP(V7);
//   rs1=0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, i<<12);
//     MV_KNOP(V0, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   VNOP_SK15(V0);
//   for(int i=0;i<16;i++)
//   {
//     if(vector_memory[i]!=(i-1+16)%16)
//       flag9=0;
//   }
//   if(flag9==1)
//   {
//     *pass_fail_0 = *pass_fail_0 | 0x200;
//   }

//   // // // // // // --- 10
//   // // // double load and store
//   int flag10 = 1; 

//   for(unsigned int i=0;i<0x00000400;i++)
//   {
//     vector_memory[i]=i;
//   }

//   rs1 = 0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, (i<<12)+0);
//     MV_KNOP(V0, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   VNOP_LK15(V0);

//   // rs1 = 0xfffffffe;
//   // for(int i=0;i<16;i++)
//   // {
//   //   MVXV_KNOP(V2, (i<<12)+5);
//   //   MV_KNOP(V0, V2, rs1);
//   //   rs1=(rs1<<1)+1;
//   // }
//   // VNOP_SK15(V0);

//   rs1 = 0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, (i<<12)+1);
//     MV_KNOP(V0, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   VNOP_LK15(V0);


//   rs1 = 0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, (i<<12)+5);
//     MV_KNOP(V0, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   VNOP_SK15(V0);

 
//   rs1 = 0xfffffffe;
//   for(int i=0;i<16;i++)
//   {
//     MVXV_KNOP(V2, (i<<12)+6);
//     MV_KNOP(V0, V2, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   VNOP_SK15(V0);
  
//   asm("nop");
//   asm("nop");
//   asm("nop");

//   for(int i=0;i<16*2;i++)
//   {
//     if(vector_memory[i+16*5]!=i)
//       flag10=0;
//   }


//   if(flag10==1)
//   {
//     *pass_fail_0 = *pass_fail_0 | 0x400;
//   }

// }

// int loworder2highorder_inplace(int source_row, int num_row, int num_row_log2)
// { 
//   register volatile unsigned int check_value asm("x3");
//   int rs1=0;
//   int destination_row=source_row;
//   unsigned short bank_address_mask = 0;
//   for(unsigned short index=0; index<num_row_log2;index++)
//   {
//     bank_address_mask+=(1<<index);
//   }
  
//   //initial load address
//   rs1 = 0xfffffffe;
//   for(int index=0;index<16;index++)
//   {
//     MVXV_KNOP(V6, (15-index));
//     MV_KNOP(V0, V6, rs1);
//     MV_KNOP(V3, V6, rs1);
//     MVXV_KNOP(V6, (index<<12));
//     MV_KNOP(V1, V6, rs1);
//     MVXV_KNOP(V6, ((15-index)<<12));
//     MV_KNOP(V4, V6, rs1);
//     rs1=(rs1<<1)+1;
//   }

//   //initial store address


//   for(unsigned int index=0;index<num_row;index++)
//   {
    
//     ADD_KNOP(V2, V1, V0, 0);
//     MVXV_KNOP(V7, source_row);
//     ADD_KNOP(V2, V2, V7, 0);
//     VNOP_LK15(V2);

//     asm("nop");
//     asm("nop");
//     asm("nop");
    
    
//     ROR_KNOP(V0, V0, 0);
//     MVXV_KNOP(V7, bank_address_mask);
//     AND_KNOP(V0, V0, V7, 0);
    
//     ADD_KNOP(V5, V3, V4, 0);
//     MVXV_KNOP(V7, destination_row);
//     ADD_KNOP(V5, V5, V7, 0);
//     VNOP_SK15(V5);

//     asm("nop");
//     asm("nop");
//     asm("nop");

//     ROR_KNOP(V3, V3, 0);
//     ROR_KNOP(V4, V4, 0);
//   }

//   return 1;
// }

// void xbb_loworder2highorder()
// {
//    register volatile unsigned int check_value asm("x3");

//   *pass_fail_0=0x00000000;

//   for(int i=0;i<0x0000fff;i++)
//   { 
//     vector_memory[i]=i;
//   }

//   asm("nop");
//   int rs1=0;
//   unsigned int source_row = 3;
//   unsigned int destination_row=source_row;
//   unsigned int num_row = 16;
//   unsigned int num_row_log2 = 4;
//   unsigned int length= num_row*16;
  
//   int data_benchmark[length];
//   int data_temp[length];

//   //int block=num_row>>5;
  
//   //int rotation_step=0;
  

//   check_value=0x11111111;
//   for(unsigned int index=0;index<length;index++)
//   {
//     data_temp[index] = vector_memory[source_row*16+index];
//   }
  
//   for(unsigned int index=0;index<num_row;index++)
//   {
//     for(unsigned int index1=0; index1<16;index1++)
//     {
//       data_benchmark[index*16+index1]=data_temp[index+index1*num_row];
//     }
//   }

      
//   check_value=0x22222222;

//   for(int index=0;index<length;index++)
//     check_value=data_benchmark[index];
//   check_value=0x33333333;

  

//   int pass_fail_flag = loworder2highorder_inplace(source_row, num_row, num_row_log2); //32

//   for(int index=0;index<length;index++)
//     check_value=vector_memory[destination_row*16+index];
//   check_value=0x44444444;
  
//   if(pass_fail_flag==1)
//   {
//     for(unsigned int index=0;index<length;index++)
//     {

//       if(vector_memory[destination_row*16+index]!=data_benchmark[index])
//       {
//         pass_fail_flag=0;
//         break;
//       }
//     }
//   }
//   if(pass_fail_flag==1)
//   {
//     *pass_fail_0=0xffffffff;
//   }
// }

// int loworder2skewoneplus(int start_row, int num_row)
// {
  
//   register volatile unsigned int check_value asm("x3");
//   int rs1;

//   int block=num_row>>4;
//   rs1 = 0xfffffffe;
//   for(int index=0;index<16;index++)
//   {
//     MVXV_KNOP(V6, (index<<12)+(start_row));
//     MV_KNOP(V0, V6, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   MVXV_KNOP(V1, 1);
//   MV_KNOP(V2, V0, 0);
//   MVXV_KNOP(V3, (1-(1<<11)));

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

//     ROL_KNOP(V2, V2, 0);
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

 

//   check_value=0xdeadbeef;

//   return 1;
// }

// void xbb_loworder2skewoneplus()
// {
//    register volatile unsigned int check_value asm("x3");

//   *pass_fail_0=0x00000000;

//   for(int i=0;i<0x00008ff;i++)
//   { 
//     vector_memory[i]=i;
//   }

//   asm("nop");
//   int rs1=0;
//   unsigned int start_row = 7;
//   unsigned int num_row = 11;
//   unsigned int length= num_row*16;
  
//   int data_benchmark[length];
//   int data_temp[16];
//   int data_temp_temp[16];

//   int block=num_row>>4;
  
//   int rotation_step=0;
//   int row_indicator = start_row;

//   check_value=0x11111111;

//   for(unsigned int index_block=0;index_block<block;index_block++)
//   {
//       for(unsigned int index_row=0; index_row<16;index_row++) //32 row
//       {
//           for(unsigned int index_word=0;index_word<16;index_word++)
//           {
//             data_temp[index_word]=vector_memory[(row_indicator)*16+index_word];
//           }
   
//           for(unsigned int index_rotation=0; index_rotation<rotation_step;index_rotation++)
//           {
            
//             for(unsigned int index_word=0; index_word<16;index_word++)
//             {
//               data_temp_temp[index_word] = data_temp[index_word];
//             }

//             for(unsigned int index_word=1;index_word<16;index_word++)
//             {
//               data_temp[16-index_word]=data_temp_temp[16-index_word-1];
//             }
//             data_temp[0]=data_temp_temp[15];
//           }

//           for(unsigned int index_word=0;index_word<16;index_word++)
//           {
//             data_benchmark[(row_indicator-start_row)*16+index_word]=data_temp[index_word];
//           } 

//           row_indicator++;
//           rotation_step++;
//       }
      
//       rotation_step++;

//   }
//  check_value=0x22222222;
//   for(unsigned int index_row=0; index_row<(num_row%16);index_row++) //32 row
//       {
//           for(unsigned int index_word=0;index_word<16;index_word++)
//           {
//             data_temp[index_word]=vector_memory[(row_indicator)*16+index_word];
//           }
   
//           for(unsigned int index_rotation=0; index_rotation<rotation_step;index_rotation++)
//           {
//             for(unsigned int index_word=0; index_word<16;index_word++)
//             {
//               data_temp_temp[index_word] = data_temp[index_word];
//             }

//             for(unsigned int index_word=1;index_word<16;index_word++)
//             {
//               data_temp[16-index_word]=data_temp_temp[16-index_word-1];
//             }
//             data_temp[0]=data_temp_temp[15];
//           }

//           for(unsigned int index_word=0;index_word<16;index_word++)
//           {
//             data_benchmark[(row_indicator-start_row)*16+index_word]=data_temp[index_word];
//           } 

//           row_indicator++;
//           rotation_step++;
//       }
      
//   check_value=0x33333333;

//   for(int index=0;index<length;index++)
//     check_value=data_benchmark[index];
//   check_value=0x44444444;

//   for(int index=0;index<length;index++)
//     check_value=vector_memory[start_row*16+index];
//   check_value=0x55555555;

//   int pass_fail_flag = loworder2skewoneplus(start_row, num_row);
  
//   if(pass_fail_flag==1)
//   {
//     for(unsigned int index=0;index<length;index++)
//     {

//       if(vector_memory[start_row*16+index]!=data_benchmark[index])
//       {
//         pass_fail_flag=0;
//         break;
//       }
//     }
//   }
//   if(pass_fail_flag==1)
//   {
//     *pass_fail_0=0xffffffff;
//   }
// }

// int memcopy16(unsigned int source_address, unsigned int destination_address)
// {
//   register volatile unsigned int check_value asm("x3");

//   int rs1=0;

//   MVXV_KNOP(V0,1);
  
//   // load address
//   MVXV_KNOP(V1, source_address>>4);
//   rs1=0xffffffff;
//   rs1=rs1<<source_address%16;
//   //check_value=rs1;
//   ADD_KNOP(V1, V1, V0, rs1);
//   rs1 = 0xfffffffe;
//   for(int index=0;index<16;index++)
//   {
//     MVXV_KNOP(V6, (index<<12)+0);
//     MV_KNOP(V7, V6, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   MV_KNOP(V6, V7, 0);
//   for(int index=0;index<source_address%16;index++)
//   {
//     ROR_KNOP(V6, V6, 0);
//   }
//   ADD_KNOP(V1, V1, V6, 0);
//   /////////////////////////////////////////////////
//   VNOP_LK15(V1);
  
//   // store address
//   MVXV_KNOP(V2, destination_address>>4);
  
//   rs1=0xffffffff;
//   rs1=rs1<<destination_address%16;
//   //check_value=rs1;
//   ADD_KNOP(V2, V2, V0, rs1);
//   rs1 = 0xfffffffe;
//   for(int index=0;index<16;index++)
//   {
//     MVXV_KNOP(V6, (index<<12)+0);
//     MV_KNOP(V7, V6, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   MV_KNOP(V6, V7, 0);
//   for(int index=0;index<destination_address%16;index++)
//   {
//     ROL_KNOP(V6, V6, 0);
//   }
//   ADD_KNOP(V2, V2, V6, 0);
//   ////////////////////////////////////////
  
//   VNOP_SK15(V2);
//   ////////////////////////////////////////////

  
//   return 1;
// }

// int memcopy_smaller_16(unsigned int source_address, unsigned int destination_address, unsigned int length)
// {
//   int rs1=0;

//   MVXV_KNOP(V0,1);
  
//   // load address
//   MVXV_KNOP(V1, source_address>>4);
//   rs1=0xffffffff;
//   rs1=rs1<<source_address%16;
//   //check_value=rs1;
//   ADD_KNOP(V1, V1, V0, rs1);
//   rs1 = 0xfffffffe;
//   for(int index=0;index<16;index++)
//   {
//     MVXV_KNOP(V6, (index<<12)+0);
//     MV_KNOP(V7, V6, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   MV_KNOP(V6, V7, 0);
//   for(int index=0;index<source_address%16;index++)
//   {
//     ROR_KNOP(V6, V6, 0);
//   }
//   ADD_KNOP(V1, V1, V6, 0);
//   /////////////////////////////////////////////////
//   VNOP_LK15(V1);
  
//   // store address
//   MVXV_KNOP(V2, destination_address>>4);
  
//   rs1=0xffffffff;
//   rs1=rs1<<destination_address%16;
//   //check_value=rs1;
//   ADD_KNOP(V2, V2, V0, rs1);
//   rs1 = 0xfffffffe;
//   for(int index=0;index<16;index++)
//   {
//     MVXV_KNOP(V6, (index<<12)+0);
//     MV_KNOP(V7, V6, rs1);
//     rs1=(rs1<<1)+1;
//   }
//   MV_KNOP(V6, V7, 0);
//   for(int index=0;index<destination_address%16;index++)
//   {
//     ROL_KNOP(V6, V6, 0);
//   }
//   ADD_KNOP(V2, V2, V6, 0);
//   // go to trash
//   MVXV_KNOP(V3, 10);
//   rs1=0;
//   for(unsigned int index=0; index<length;index++)
//   {
//     rs1+=(1<<((destination_address+index)%16));
//   }
//   ADD_KNOP(V2, V2, V3, rs1);
//   ////////////////////////////////////////
  
//   VNOP_SK15(V2);
//   ////////////////////////////////////////////


//   return 1;
// }

// int  memcopy(unsigned int source_address, unsigned int destination_address, unsigned int length)
// {
//   int return_value=0;
//   unsigned int full16word_num=length>>4;
//   unsigned int source_addr;
//   unsigned int destination_addr;
  

//   if(source_address<destination_address)
//   {
//     for(unsigned int index=0; index<full16word_num; index++)
//     {
//       source_addr=source_address+length-(index+1)*16;
//       destination_addr= destination_address+length-(index+1)*16;  
//       return_value = memcopy16(source_addr, destination_addr);
//     }
//     if(length%16>0)
//     { 
//       source_addr = source_address;
//       destination_addr = destination_address;
//       return_value = memcopy_smaller_16(source_addr, destination_addr, length%16);
//     }
//   }
//   else if (source_address>destination_address)
//   {
//     for(unsigned int index=0; index<full16word_num; index++)
//     {
//       source_addr=source_address+index*16;
//       destination_addr= destination_address+index*16;  
//       return_value = memcopy16(source_addr, destination_addr);
//     }
//     if(length%16>0)
//     {
//       source_addr=source_address+full16word_num*16;
//       destination_addr= destination_address+full16word_num*16;  
//       return_value = memcopy_smaller_16(source_addr, destination_addr, length%16);
//     }
    
//   }

//   return return_value;
// }

// void xbb_memcopy()
// {
//   register volatile unsigned int check_value asm("x3");

//   *pass_fail_0=0x00000000;

//   for(int i=0;i<0x0000fff;i++)
//   { 
//     if(i<16)
//     {
//       vector_memory[i]=i<<12;
//     }
//     else
//     {
//       vector_memory[i]=i;
//     }

//   }

//   asm("nop");

//   unsigned int source_address=0x39;
//   unsigned int destination_address=0x41;
//   unsigned int length=129;

//   int data_benchmark[length];
//   for(unsigned int index=0;index<length;index++)
//   {
//     data_benchmark[index]=vector_memory[source_address+index];
//   }
  
//   int pass_fail_flag = memcopy(source_address, destination_address, length);
  
//   if(pass_fail_flag==1)
//   {
//     for(unsigned int index=0;index<length;index++)
//     {

//       if(vector_memory[destination_address+index]!=data_benchmark[index])
//       {
//         pass_fail_flag=0;
//         break;
//       }
//     }
//   }
//   if(pass_fail_flag==1)
//   {
//     *pass_fail_0=0xffffffff;
//   }
// }

// int main_v16_old_perm(void)
// {
//   //xbb_permutation();
//   //xbb_example();
//   //xbb_loworder2highorder();
//   //xbb_loworder2skewoneplus();
//   //xbb_memcopy();
//   //xbb_vmem_constant();
//   //xbb_datapath();
//   xbb_16fft();
//   return 0;
// }
