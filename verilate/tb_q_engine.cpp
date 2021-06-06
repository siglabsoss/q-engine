#include <stdlib.h>
#include <iostream>
#include <vector>
// Include common routines

#include <verilated.h>

#include <sys/stat.h>  // mkdir

// Include model header, generated from Verilating "top.v"
#include "Vq_engine.h"

// If "verilator --trace" is used, include the tracing class
#if VM_TRACE
# include <verilated_vcd_c.h>
#endif
#include "dbus.hpp"


VerilatedVcdC* tfp = NULL;
// Construct the Verilated model, from Vtop.h generated from Verilating "top.v"
Vq_engine* top = new Vq_engine; // Or use a const unique_ptr, or the VL_UNIQUE_PTR wrapper
// Current simulation time (64-bit unsigned)
vluint64_t main_time = 0;
// Called by $time in Verilog
double sc_time_stamp () {
  return main_time; // Note does conversion to real, to match SystemC
}
  
void reset(int run_time) {
  for(int i=0;i<run_time;i++){
    main_time++;
    top->clk = !top->clk;
    if ((main_time % 10) == 3) {
      top->clk = 1;
    }
    if ((main_time % 10) == 8) {
      top->clk = 0;
    }
    if (main_time > 1 && main_time < 10) {
      top->srst = !0;  // Assert reset
    } else {
      top->srst = !1;  // Deassert reset
    }
#if VM_TRACE
    if(tfp) {tfp->dump(main_time);}
#endif
    top->eval();
  }
}

std::vector<int> generate_vector(int length){
  std::vector<int> dout;
  for(int i=0;i<length;i++)
    dout.push_back(rand()%256);//65536);
  return dout;
}

std::vector<int> print_vector(std::vector<int> din){
  int idx=0;
  printf("size: %d\n",din.size());
  for(std::vector<int>::iterator it=din.begin(); it!=din.end(); ++it){
    printf("idx: %d val: %x\n", idx, *it);
    idx++;
  }
}

int main(int argc, char** argv, char** env) {
  std::vector<int> output_vector;
  // This is a more complicated example, please also see the simpler examples/hello_world_c.

  // Prevent unused variable warnings
  if (0 && argc && argv && env) {}
  // Pass arguments so Verilated code can see them, e.g. $value$plusargs
  Verilated::commandArgs(argc, argv);

  // Set debug level, 0 is off, 9 is highest presently used
  Verilated::debug(0);

  // Randomization reset policy
  Verilated::randReset(2);

  //Elastic
  
					     
					     
#if VM_TRACE
  // If verilator was invoked with --trace argument,
  // and if at run time passed the +trace argument, turn on tracing
  
  const char* flag = Verilated::commandArgsPlusMatch("trace");
  if (flag && 0==strcmp(flag, "+trace")) {
    Verilated::traceEverOn(true);  // Verilator must compute traced signals
    VL_PRINTF("Enabling waves into logs/vlt_dump.vcd...\n");
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);  // Trace 99 levels of hierarchy
    mkdir("logs", 0777);
    tfp->open("logs/vlt_dump.vcd");  // Open the dump file
  }
#endif
  
  //elastic<Vcs31_top>* elastic_inst = new elastic<Vcs31_top>(top,&main_time,tfp);
  //  elastic<Vcs31_top>* elastic_inst = new elastic<Vcs31_top>(top,&main_time,tfp,&(top->clk),&(top->t0_valid),&(top->t0_ready),&(top->t0_data),&(top->i0_valid),&(top->i0_ready),&(top->i0_data));
  //mib<Vcs31_top>* mib_inst = new mib<Vcs31_top>()
  //Random number seed
  dbus<Vq_engine>* dbus_inst = new dbus<Vq_engine>(top,&main_time,tfp);
  srand(1);
  // Initialize inputs
  top->srst = 1;
  top->clk = 0;
  //top->t1_data[0U]=0x3;//0xAA55AA55;
  //top->t1_data[1U]=0x0;//0x55AA55AA;

  // Simulate until $finish
  //while (!Verilated::gotFinish()) {
  printf("before reset main time: %d\n", main_time);
  reset(50); //reset dut

  //elastic_send();
  //elastic_receive();

  printf("after main time: %d\n", main_time);
  //output_vector=elastic_inst->data_txrx(generate_vector(20),true,true);
  //static t-stream
//  top->t0_data=0xA55A1234;
  top->t0_data=0x1;
  top->t0_valid=1;
  top->i0_ready = 0;
  dbus_inst->Write(3,0xAA55AAC3,3);
  dbus_inst->Read(3);
  dbus_inst->Read(3);
  dbus_inst->Read(3);
  dbus_inst->Write(0x00080004,0x0,3);
  dbus_inst->Write(0x00080008,0x10,3);
  dbus_inst->Write(0x00080000,0x1,3);

  for (int i = 0; i < 20; i++) {
	  dbus_inst->Tick();
	  top->t0_data++;
  }
//  top->t0_data=0xdeadbeaf;
//  for (int i = 0; i < 5; i++) {
//
//  	  dbus_inst->Tick();
//    }
//  top->t0_data=0x01234657;

  /*  dbus_inst->Write(0x00080004,0x20,3);
  dbus_inst->Write(0x00080005,0x10,3);
  dbus_inst->Write(0x00080003,0x1,3);*/
  //dma out
  dbus_inst->Write(0x00080404,0x0,3);
  dbus_inst->Write(0x00080408,0x10,3);
  dbus_inst->Write(0x00080400,0x1,3);
  
  dbus_inst->Write(0x00080804,0xABCDEF,3);
  dbus_inst->Read(0x00080800);
  dbus_inst->Read(0x00080804);
  dbus_inst->Read(0x00080808);
  //  dbus_inst->Write(0x00080804,0x1,3);
  dbus_inst->Read(0x0008080C);
  dbus_inst->Read(0x00080810);
  dbus_inst->Read(0x00080814);
  dbus_inst->Read(0x00080818);
  dbus_inst->Read(0x0008081C);
  dbus_inst->Read(0x00080820);
  dbus_inst->Write(0x00080804,0xABCDEF,3);
  

  for (int i = 0; i < 5; i++) {
    	  dbus_inst->Tick();
      }
    top->i0_ready = 1;

    for (int i = 0; i < 5; i++) {
      	  dbus_inst->Tick();
        }
      top->i0_ready = 0;

      for (int i = 0; i < 5; i++) {
        	  dbus_inst->Tick();
          }
        top->i0_ready = 1;

        for (int i = 0; i < 5; i++) {
          	  dbus_inst->Tick();
            }
          top->i0_ready = 0;

          for (int i = 0; i < 5; i++) {
            	  dbus_inst->Tick();
              }
            top->i0_ready = 1;

            for (int i = 0; i < 9; i++) {
              	  dbus_inst->Tick();
                }
              top->i0_ready = 0;
  //  dbus_inst->Write(0x00010000,0x1,3);
  dbus_inst->Read(0x00040000);
  
  dbus_inst->Write(0x00008202,0x1,3);
  for(int i=0;i<500;i++) {
    //    dbus_inst->Write(0x00010000,0x1,3);
    dbus_inst->Read(0x00040000);
    dbus_inst->Read(3);
    //    dbus_inst->Write(0x00010000,0x1,3);
    dbus_inst->Read(0x00040000);
    dbus_inst->Read(3);
    dbus_inst->Write(0x00040000,0x1,3);
    dbus_inst->Read(0x00040000);
    dbus_inst->Read(3);
    dbus_inst->Write(0x00040000,0x1,3);
    dbus_inst->Read(0x00040000);
    dbus_inst->Read(3);
    dbus_inst->Write(0x00040000,0x1,3);
    dbus_inst->Read(0x00040000);
    dbus_inst->Write(0x00040000,0x1,3);
    dbus_inst->Read(0x00040000);
    dbus_inst->Read(3);
    dbus_inst->Read(3);
  }
  printf("after txn main time: %d\n", main_time);

  //wait(1000);
    
  // Read outputs
  //}

  // Final model cleanup
  top->final();

  // Close trace if opened
#if VM_TRACE
  if (tfp) { tfp->close(); }
#endif

  //  Coverage analysis (since test passed)
#if VM_COVERAGE
  mkdir("logs", 0777);
  VerilatedCov::write("logs/coverage.dat");
#endif

  // Destroy model
  delete top; top = NULL;
  //print_vector(output_vector);
  // Fin
  exit(0);
}
