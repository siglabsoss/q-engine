#include "tb_standard_q_engine.hpp"

using namespace std;

#define HEX_STRING(n) std::hex << (n) << std::dec


#define THREAD_COUNT 1
// #define ISA_TEST
// #define REDO (10)

// #define BASE_PATH "/mnt/overflow/work/VexRiscv/src/test/"


#undef IBUS_SIMPLE
#undef DBUS_SIMPLE

//#define USE_CPP_IMEM

// #define IBUS SIMPLE
// #define DBUS SIMPLE
// #define CSR=no MMU=no
// #DEBUG_PLUGIN=no MUL=no DIV=no DHRYSTONE=no REDO=2
// #define TRACE yes




#define RESET srst

struct timespec timer_get(){
    struct timespec start_time;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
    return start_time;
}



#define TEXTIFY(A) #A

#define assertEq(x,ref) if(x != ref) {\
	printf("\n*** %s is %d but should be %d ***\n\n",TEXTIFY(x),x,ref);\
	throw std::exception();\
}

class success : public std::exception { };


void Workspace::pass(){ throw success();}
void Workspace::fail(){ throw std::exception();}


void Workspace::setIStall(bool enable) { iStall = enable; }
void Workspace::setDStall(bool enable) { dStall = enable; }

Workspace::Workspace(string name){
	staticMutex.lock();
	testsCounter++;
	staticMutex.unlock();
	this->name = name;
	top = new top_t;
	#ifdef TRACE_ACCESS
		regTraces.open (name + ".regTrace");
		memTraces.open (name + ".memTrace");
	#endif
	logTraces.open (name + ".logTrace");
	fillSimELements();
	clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &start_time);
}

Workspace::~Workspace(){
	delete top;
	#ifdef TRACE
	delete tfp;
	#endif

	for(SimElement* simElement : simElements) {
		delete simElement;
	}
}

Workspace* Workspace::loadHex(string path){
	return this;
}

Workspace* Workspace::setCyclesPerSecond(double value){
	cyclesPerSecond = value;
	return this;
}

Workspace* Workspace::bootAt(uint32_t pc) { bootPc = pc;}

Workspace* Workspace::noInstructionReadCheck(){
	withInstructionReadCheck = false; return this;
}
void Workspace::dump(int i){
	#ifdef TRACE
	if(i/2 >= TRACE_START) tfp->dump(i);
	#endif
}
Workspace* Workspace::run(uint64_t timeout){
//		cout << "Start " << name << endl;

	currentTime = 4;
	// init trace dump
	#ifdef TRACE
	Verilated::traceEverOn(true);
	tfp = new VerilatedVcdC;
	top->trace(tfp, 99);
	tfp->open((string(name)+ ".vcd").c_str());
	#endif

top->RESET = 1;
	// Reset
for( int hq = 0; hq < 50; hq++)
{
		top->clk = 0;
  top->eval();
  top->clk = 1;
  top->eval();
	}
top->clk = 0;
top->RESET = 0;


	top->eval(); currentTime = 3;
	for(SimElement* simElement : simElements) simElement->onReset();

	top->RESET = 1;
	top->eval();
	#ifdef CSR
	top->timerInterrupt = 0;
	top->externalInterrupt = 1;
	#endif
	#ifdef DEBUG_PLUGIN_EXTERNAL
	top->timerInterrupt = 0;
	top->externalInterrupt = 0;
	#endif
	dump(0);
	top->RESET = 0;
	for(SimElement* simElement : simElements) simElement->postReset();

	top->eval(); currentTime = 2;


	postReset();

	resetDone = true;

	// #ifdef  REF
	// if(bootPc != -1) VEX_TOP->core->prefetch_pc = bootPc;
	// #else
	// if(bootPc != -1) VEX_TOP->prefetch_PcManagerSimplePlugin_pcReg = bootPc;
	// #endif


	try {
		// run simulation for 100 clock periods
		for (i = 16; i < timeout*2; i+=2) {
			while(allowedCycles <= 0.0){
				struct timespec end_time;
				clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &end_time);
				uint64_t diffInNanos = end_time.tv_sec*1e9 + end_time.tv_nsec -  start_time.tv_sec*1e9 - start_time.tv_nsec;
				start_time = end_time;
				double dt = diffInNanos*1e-9;
				allowedCycles += dt*cyclesPerSecond;
				if(allowedCycles > cyclesPerSecond/100) allowedCycles = cyclesPerSecond/100;
			}
			allowedCycles-=1.0;


			#ifndef REF_TIME
			mTime = i/2;
			#endif
			#ifdef CSR
			top->timerInterrupt = mTime >= mTimeCmp ? 1 : 0;
			//if(mTime == mTimeCmp) printf("SIM timer tick\n");
			#endif

			currentTime = i;




			// dump variables into VCD file and toggle clock

			dump(i);
			//top->eval();
			top->clk = 0;
			top->eval();


			dump(i + 1);



			// if(VEX_TOP->writeBack_RegFilePlugin_regFileWrite_valid == 1 && VEX_TOP->writeBack_RegFilePlugin_regFileWrite_payload_address != 0){
			// 	regTraces <<
			// 		#ifdef TRACE_WITH_TIME
			// 		currentTime <<
			// 		 #endif
			// 		 " PC " << hex << setw(8) <<  VEX_TOP->writeBack_PC << " : reg[" << dec << setw(2) << (uint32_t)VEX_TOP->writeBack_RegFilePlugin_regFileWrite_payload_address << "] = " << hex << setw(8) << VEX_TOP->writeBack_RegFilePlugin_regFileWrite_payload_data << endl;
			// }

			for(SimElement* simElement : simElements) simElement->preCycle();

			// if(withInstructionReadCheck){
			// 	if(VEX_TOP->decode_arbitration_isValid && !VEX_TOP->decode_arbitration_haltItself){
			// 		uint32_t expectedData;
			// 		bool dummy;
			// 		iBusAccess(VEX_TOP->decode_PC, &expectedData, &dummy);
			// 		assertEq(VEX_TOP->decode_INSTRUCTION,expectedData);
			// 	}
			// }

			checks();
			//top->eval();
			top->clk = 1;
			top->eval();
			checks_posedge();
			instanceCycles += 1;

			for(SimElement* simElement : simElements) simElement->postCycle();



			if (Verilated::gotFinish())
				exit(0);
		}
		cout << "timeout" << endl;
		fail();
	} catch (const success e) {
		staticMutex.lock();
		cout <<"SUCCESS " << name <<  endl;
		successCounter++;
		cycles += instanceCycles;
		staticMutex.unlock();
	} catch (const std::exception& e) {
		staticMutex.lock();
		cout << "FAIL " <<  name << endl;
		cycles += instanceCycles;
		staticMutex.unlock();
	}

	// top->riscv_baseband->q_engine->mem;

	// currently we have two dedicated pass/fail variables, 32 bits each
	// if the ld file MEMORY section changes, these may change 
	// uint32_t pf0 = (0x7ff8) / 4;
	// uint32_t pf1 = (0x7ffc) / 4;

	// uint32_t pass_fail_0 = (MEM_BANK_3[pf0]<<24) |
	// 				   (MEM_BANK_2[pf0]<<16) |
	// 				   (MEM_BANK_1[pf0]<< 8) | MEM_BANK_0[pf0];

	// uint32_t pass_fail_1 = (MEM_BANK_3[pf1]<<24) |
	// 				   (MEM_BANK_2[pf1]<<16) |
	// 				   (MEM_BANK_1[pf1]<< 8) | MEM_BANK_0[pf1];

	// cout << "Test Value: 0x" <<  HEX_STRING(pass_fail_0) << endl;

	dump(i);
	dump(i+10);
	#ifdef TRACE
	tfp->close();
	#endif
	return this;
}




void Workspace::fillSimELements(){

}

mutex Workspace::staticMutex;
uint64_t Workspace::cycles = 0;
uint32_t Workspace::testsCounter = 0, Workspace::successCounter = 0;






struct timespec timer_start(){
    struct timespec start_time;
    clock_gettime(CLOCK_REALTIME, &start_time); //CLOCK_PROCESS_CPUTIME_ID
    return start_time;
}

long timer_end(struct timespec start_time){
    struct timespec end_time;
    clock_gettime(CLOCK_REALTIME, &end_time);
    uint64_t diffInNanos = end_time.tv_sec*1e9 + end_time.tv_nsec -  start_time.tv_sec*1e9 - start_time.tv_nsec;
    return diffInNanos;
}

#define redo(count,that) for(uint32_t xxx = 0;xxx < count;xxx++) that
#include <pthread.h>
#include <queue>
#include <functional>
#include <thread>


static void multiThreading(queue<std::function<void()>> *lambdas, std::mutex *mutex){
	while(true){
		mutex->lock();
		if(lambdas->empty()){
			mutex->unlock();
			break;
		}
		std::function<void()> lambda = lambdas->front();
		lambdas->pop();
		mutex->unlock();

		lambda();
	}
}


static void multiThreadedExecute(queue<std::function<void()>> &lambdas){
	std::mutex mutex;
	std::thread * t[THREAD_COUNT];
	for(int id = 0;id < THREAD_COUNT;id++){
		t[id] = new thread(multiThreading,&lambdas,&mutex);
	}
	for(int id = 0;id < THREAD_COUNT;id++){
		t[id]->join();
		delete t[id];
	}
}

