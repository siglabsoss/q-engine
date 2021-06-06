#include "xbaseband.h"
#include "apb_bus.h"
#include "csr_control.h"
#include "bootloader.h"


// if the ld file MEMORY section changes, these may change
unsigned int volatile *pass_fail_0 = (unsigned int *) 0x7ff8;
unsigned int volatile *pass_fail_1 = (unsigned int *) 0x7ffc;

// void handle_int(void)
// {
// 	int val;
// 	CSR_READ(INTERRUPT_ACTIVE, val);
// 	vector_memory[0] = val;
// }

void enable_machine_interrupts(void)
{
	// Enable RiscV Interrupts (was in crt.S)
	CSR_WRITE(mie, RINGBUS_ENABLE_BIT | DMA_0_ENABLE_BIT | DMA_1_ENABLE_BIT);
	CSR_WRITE(mip, RINGBUS_ENABLE_BIT | DMA_0_ENABLE_BIT | DMA_1_ENABLE_BIT);
	CSR_WRITE(mstatus, 0x008);
}

void nco_example(void)
{
	enable_machine_interrupts();
	int cause;
	int i;
	int temp;

	CSR_WRITE(NCO_START_ANGLE, 0);
	CSR_WRITE(NCO_LENGTH, 1024);
	CSR_WRITE(NCO_DELTA, 0x1 << 24);  // start right away
	CSR_WRITE(NCO_PUSH_SCHEDULE, 0); // any value

	CSR_WRITE(DMA_2_START_ADDR, 0);
	CSR_WRITE(DMA_2_LENGTH, 1024);
	CSR_WRITE(DMA_2_TIMER_VAL, 0xffffffff);  // start right away
	CSR_WRITE(DMA_2_PUSH_SCHEDULE, 0); // any value

}

void atan_test(void){
  SET_REG(x3, 0x40004000);
  ATAN(3);
}

int main(void)
{
  //nco_example();
  atan_test();
}
