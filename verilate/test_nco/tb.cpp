#include "tb_standard_q_engine.hpp"


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
using namespace std;


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
	}
};




int main(int argc, char **argv, char **env) {
	//Verilated::randReset(2);
	Verilated::traceEverOn(true);
	Verilated::commandArgs(argc, argv);

	printf("BOOT\n");
	timespec startedAt = timer_start();

	TestDMA().run(200*500);


	uint64_t duration = timer_end(startedAt);
	cout << endl << "****************************************************************" << endl;
	cout << "Had simulate " << Workspace::cycles << " clock cycles in " << duration*1e-9 << " s (" << Workspace::cycles / (duration*1e-6) << " Khz)" << endl;
	if(Workspace::successCounter == Workspace::testsCounter)
		cout << "SUCCESS " << Workspace::successCounter << "/" << Workspace::testsCounter << endl;
	else
		cout<< "FAILURE " << Workspace::testsCounter - Workspace::successCounter << "/"  << Workspace::testsCounter << endl;
	cout << "****************************************************************" << endl << endl;


	exit(0);
}


