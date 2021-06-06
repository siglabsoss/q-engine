#include "tb_standard_q_engine.hpp"

#define HEX_STRING(n) std::hex << (n) << std::dec
using namespace std;

#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <stdint.h>
#include <cstring>
#include <string.h>
#include <iostream>
#include <fstream>
#include <vector>
#include <mutex>
#include <iomanip>
#include <time.h>
#include <iomanip>

#include "Vq_engine.h"
#include "Vq_engine__Syms.h"
#include "cpp_utils.hpp"

typedef Vq_engine_vmem_dat_6_5 node_t;
void hexdump(node_t * node, string msg, unsigned int start, unsigned int len);
#define NSLICES (16)
#define HEX32_STRING(n) setfill('0') << setw(8) << std::hex << (n) << std::dec

#include "verilator_pass_fail.h"

#define run_time 300000

class TestDMA : public Workspace{
public:


	uint32_t regFileWriteRefIndex = 0;
	uint32_t dma_input;

	uint32_t prev_ready;
	uint32_t ready;

	TestDMA() : Workspace("testFirst") {

		withInstructionReadCheck = false;

		dma_input = 0x0f0f0000;

	}

	virtual void checks(){
			
		if( i >= 150 )
		{
			top->t0_data = dma_input;
			top->t0_valid = 1;
		}

		// prev_ready = ready;
	}

	// due to how valid /ready works
	// we added this checks_posedge which runs after the clock goes posedge
	virtual void checks_posedge(){
		top->i0_ready = 1;
		if( i >= 150 )
		{
			if(top->t0_ready) {
				dma_input++;
			}
		}

		if( i == run_time*2-4 )
		{

            node_t * dut_node = top->q_engine->piston_inst->unode28;


  			hexdump(dut_node,"ALL", 0, 4096);

			cout << "at the end" << endl;

			uint32_t pf0 = MEM_ACCESS(PASS_FAIL_0_ADDR);

			cout << "pass (0xffffffff) fail (0x00000000): " << HEX_STRING(pf0) << endl;

			uint32_t latency_clk = MEM_ACCESS(PASS_FAIL_1_ADDR);

			cout << "clock cycles: " << latency_clk << endl;

			

			// MEM_ACCESS
		}
	}
};




int main(int argc, char **argv, char **env) {
	//Verilated::randReset(2);
	Verilated::traceEverOn(true);
	Verilated::commandArgs(argc, argv);

	printf("BOOT\n");
	timespec startedAt = timer_start();

	TestDMA().run(run_time);


	uint64_t duration = timer_end(startedAt);
	cout << endl << "****************************************************************" << endl;
	// cout << "Had simulate " << Workspace::cycles << " clock cycles in " << duration*1e-9 << " s (" << Workspace::cycles / (duration*1e-6) << " Khz)" << endl;
	// if(Workspace::successCounter == Workspace::testsCounter)
	// 	cout << "SUCCESS " << Workspace::successCounter << "/" << Workspace::testsCounter << endl;
	// else
	// 	cout<< "FAILURE " << Workspace::testsCounter - Workspace::successCounter << "/"  << Workspace::testsCounter << endl;
	     
	cout << "****************************************************************" << endl << endl;


	exit(0);
}



void hexdump(node_t * node, string msg, unsigned int start, unsigned int len){    
  unsigned int vmem_start = start/NSLICES;
  cout << msg << endl;
  cout << "hexdump... " << endl;
  cout << "start : 0x" << HEX32_STRING(start) << endl;
  cout << "length: 0x" << HEX32_STRING(len) << endl;
  for (auto i = vmem_start; i < vmem_start + len; i++){

  	//output left column (currently lists cpu int* address)
    cout << "0x" << HEX32_STRING(((i*NSLICES)<<2)+0x40000) << ": ";


    cout << HEX32_STRING( node->mem_slice_0->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_1->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_2->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_3->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_4->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_5->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_6->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_7->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_8->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_9->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_10->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_11->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_12->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_13->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_14->dpram_inst->rtn_mem(i) ) << " ";
    cout << HEX32_STRING( node->mem_slice_15->dpram_inst->rtn_mem(i) ) << " ";
    cout << endl;
  }
  cout << endl;
  }
