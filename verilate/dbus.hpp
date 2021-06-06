#include <stdlib.h>
#include <iostream>
#include <vector>
// Include common routines
//#include <verilated.h>

#if VM_TRACE
# include <verilated_vcd_c.h>
#endif

template <class T>
class dbus {

public:
  T *top;
  vluint64_t* main_time;
  VerilatedVcdC* tfp = NULL;
  unsigned char *clk;
  unsigned char *dBus_cmd_valid,*dBus_cmd_ready,*dBus_cmd_payload_wr;
  unsigned int *dBus_cmd_payload_address, *dBus_cmd_payload_data;
  unsigned char *dBus_cmd_payload_size;
  unsigned char *dBus_rsp_ready,*dBus_rsp_error;
  unsigned int *dBus_rsp_data;
  
  dbus(T *top, vluint64_t *main_time, VerilatedVcdC *tfp){
    this->top=top;
    this->main_time=main_time;
    this->tfp=tfp;
    clk=&(top->clk);
    dBus_cmd_valid=&(top->dBus_cmd_valid);
    dBus_cmd_ready=&(top->dBus_cmd_ready);
    dBus_cmd_payload_wr=&(top->dBus_cmd_payload_wr);
    dBus_cmd_payload_address=&(top->dBus_cmd_payload_address);
    dBus_cmd_payload_data=&(top->dBus_cmd_payload_data);
    dBus_cmd_payload_size=&(top->dBus_cmd_payload_size);
    dBus_rsp_ready=&(top->dBus_rsp_ready);
    dBus_rsp_error=&(top->dBus_rsp_error);
    dBus_rsp_data=&(top->dBus_rsp_data);
  }

  void Tick(){
    (*main_time)++;
    *clk = !*clk;
#if VM_TRACE
    if(tfp) {tfp->dump(*main_time);}
#endif
    top->eval();
    
    //extra evals
    (*main_time)++;
#if VM_TRACE
    if(tfp) {tfp->dump(*main_time);}
#endif
    top->eval();
    
    *clk = !*clk;
    (*main_time)++;
#if VM_TRACE
    if(tfp) {tfp->dump(*main_time);}
#endif
    top->eval();

    //extra evals
    (*main_time)++;
#if VM_TRACE
    if(tfp) {tfp->dump(*main_time);}
#endif
    top->eval();

  }

  void Write(unsigned int addr, unsigned int data, unsigned char size){
    Tick();
    *dBus_cmd_valid=1;
    *dBus_cmd_payload_wr=1;
    *dBus_cmd_payload_address=addr;
    *dBus_cmd_payload_data=data;
    *dBus_cmd_payload_size=size;
    Tick();
    *dBus_cmd_valid=0;
    *dBus_cmd_payload_wr=0;
    while(!*dBus_cmd_ready)
      Tick();
    *dBus_cmd_valid=0;
    *dBus_cmd_payload_wr=0;
  }
  
  unsigned int Read(unsigned int addr){
    unsigned int rdata;
    Tick();
    *dBus_cmd_valid=1;
    *dBus_cmd_payload_wr=0;
    *dBus_cmd_payload_address=addr;
    Tick();
    *dBus_cmd_valid=0;
    Tick();
    if(*dBus_rsp_ready)
      rdata=*dBus_rsp_data;
    while(!*dBus_cmd_ready)
      Tick();
  }
    
};
