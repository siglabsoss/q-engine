#ifndef __TB_STANDARD_Q_ENGINE_HPP__
#define __TB_STANDARD_Q_ENGINE_HPP__


#include "Vq_engine.h"
#include "Vq_engine__Syms.h"
#include "verilated.h"
#include "verilated_vcd_c.h"
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
#include "verilator_pass_fail.h"


class SimElement{
public:
	virtual ~SimElement(){}
	virtual void onReset(){}
	virtual void postReset(){}
	virtual void preCycle(){}
	virtual void postCycle(){}
};




#define MEM_BANK_0 top->q_engine->mem->mem0
#define MEM_BANK_1 top->q_engine->mem->mem1
#define MEM_BANK_2 top->q_engine->mem->mem2
#define MEM_BANK_3 top->q_engine->mem->mem3

#define MEM_ACCESS(x) (MEM_BANK_3[((x)/4)]<<24) | (MEM_BANK_2[((x)/4)]<<16) | (MEM_BANK_1[((x)/4)]<< 8) | MEM_BANK_0[((x)/4)];



#define RESET srst


typedef Vq_engine top_t;







class Workspace{
public:
	static std::mutex staticMutex;
	static uint32_t testsCounter, successCounter;
	static uint64_t cycles;
	uint64_t instanceCycles = 0;
	std::vector<SimElement*> simElements;
	std::string name;
	uint64_t currentTime = 22;
	uint64_t mTimeCmp = 0;
	uint64_t mTime = 0;
	top_t* top;
	bool resetDone = false;
	uint64_t i;
	double cyclesPerSecond = 10e6;
	double allowedCycles = 0.0;
	uint32_t bootPc = -1;
	uint32_t iStall = 1,dStall = 1;
	#ifdef TRACE
	VerilatedVcdC* tfp;
	#endif

	bool withInstructionReadCheck = true;
	void setIStall(bool enable);
	void setDStall(bool enable);

	std::ofstream regTraces;
	std::ofstream memTraces;
	std::ofstream logTraces;

	struct timespec start_time;


	Workspace(std::string name);

	virtual ~Workspace();

	Workspace* loadHex(std::string path);

	Workspace* setCyclesPerSecond(double value);

    Workspace* bootAt(uint32_t pc);

	virtual void postReset() {}
	virtual void checks(){}
	virtual void checks_posedge(){}
	virtual void pass();
	virtual void fail();
    virtual void fillSimELements();
    Workspace* noInstructionReadCheck();
	void dump(int i);
	Workspace* run(uint64_t timeout = 5000);
};


// naked function
struct timespec timer_start();
long timer_end(struct timespec start_time);


#endif