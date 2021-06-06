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

void interrupt_example(void)
{
	enable_machine_interrupts();
	int cause;
	int i;
	int temp;

	CSR_WRITE(GPIO_WRITE,1);
	CSR_WRITE(GPIO_WRITE_EN,1);
	CSR_READ(GPIO_READ,temp);
	CSR_WRITE(GPIO_WRITE_EN,0);
	CSR_READ(GPIO_READ,temp); 
	CSR_WRITE(GPIO_WRITE_EN,1);
	CSR_READ(GPIO_READ,temp); 
	CSR_WRITE(GPIO_WRITE_EN,0);
	CSR_READ(GPIO_READ,temp); 
	
	for(i=0;i<10;i++)
	  asm("nop");
	CSR_WRITE(RINGBUS_WRITE_ADDR,2);
	CSR_WRITE(RINGBUS_WRITE_DATA,0xABCDEF01);
	CSR_WRITE(RINGBUS_WRITE_EN,0);

	for(i=0;i<1;i++)
	  asm("nop");

	CSR_WRITE(DMA_0_START_ADDR, 0);
	CSR_WRITE(DMA_0_LENGTH, 100);
	CSR_WRITE(DMA_0_TIMER_VAL, 0xffffffff);  // start right away
	CSR_WRITE(DMA_0_PUSH_SCHEDULE, 0); // any value

	CSR_WRITE(DMA_2_START_ADDR, 100);
	CSR_WRITE(DMA_2_LENGTH, 100);
	CSR_WRITE(DMA_2_TIMER_VAL, 0xffffffff);  // start right away
	CSR_WRITE(DMA_2_PUSH_SCHEDULE, 0); // any value

	for(i=0;i<3;i++)
	  asm("nop");

	CSR_WRITE(DMA_1_START_ADDR, 0);
	CSR_WRITE(DMA_1_LENGTH, 200);
	CSR_WRITE(DMA_1_TIMER_VAL, 0xffffffff);  // start right away
	CSR_WRITE(DMA_1_PUSH_SCHEDULE, 0); // any value

	/*	CSR_WRITE(DMA_2_START_ADDR, 0);
	CSR_WRITE(DMA_2_LENGTH, 100);
	CSR_WRITE(DMA_2_TIMER_VAL, 0xffffffff);  // start right away
	CSR_WRITE(DMA_2_PUSH_SCHEDULE, 0); // any value*/

	asm("wfi");
	CSR_READ(mcause,cause);
	CSR_WRITE(DMA_0_INTERRUPT_CLEAR,0); // any value
	// mcause will have bit 0x8000000 set for interrupts
	cause &= MCAUSE_INTERRUPT_FLAG;

	// This switch will only handle if one or the other interupt has fired not both
	switch(cause)
	{
		case DMA_0_MCAUSE:
			// handle dma 0
			vector_memory[0] = 1;
			break;
		case DMA_1_MCAUSE:
			// handle dma 1
			vector_memory[0] = 2;
			break;
		default:
			vector_memory[0] = 0xf0;
			break;

	}

	CSR_WRITE(DMA_1_START_ADDR, 0);
	CSR_WRITE(DMA_1_LENGTH, 16);
	CSR_WRITE(DMA_1_TIMER_VAL, 0xffffffff);  // start right away
	CSR_WRITE(DMA_1_PUSH_SCHEDULE, 0); // any value


	asm("wfi");
	CSR_READ(mcause,cause);
	CSR_WRITE(DMA_1_INTERRUPT_CLEAR,0);
	cause &= MCAUSE_INTERRUPT_FLAG;

	switch(cause)
	{
		case DMA_0_MCAUSE:
			// handle dma 0
			vector_memory[0] = 3;
			break;
		case DMA_1_MCAUSE:
			// handle dma 1
			vector_memory[0] = 4;
			break;
		default:
			vector_memory[0] = 0xf1;
			break;
	}



}

void no_interrupt_example(void)
{
	int i;

	register volatile unsigned int check_dma asm("a7");

	int read1, read2;

	// Setup first trigger of in-dma
	CSR_WRITE(DMA_0_START_ADDR, 0x20);
	CSR_WRITE(DMA_0_LENGTH, 16);
	CSR_WRITE(DMA_0_TIMER_VAL, 0xffffffff);  // start right away
	CSR_WRITE(DMA_0_PUSH_SCHEDULE, 0); // any value


	// Setup second trigger of in-dma
	// only need to write values that are different from first trigger
	CSR_WRITE(DMA_0_START_ADDR, 16);
	CSR_WRITE(DMA_0_PUSH_SCHEDULE, 0);


	// if we want, we can read written values
	int read_back;
	CSR_READ(DMA_0_LENGTH, read_back);

	// wait a bit
	for(int i = 0; i < 40/2; i++)
	{
		asm("nop");
	}

	asm("nop");
	asm("nop");
	CSR_READ(TIMER_VALUE, read1); // if this is 0x120
	CSR_READ(TIMER_VALUE, read2); // this will be 0x124  (4 clock cycles later)

	CSR_WRITE(TIMER_CLEAR, 1);

	CSR_READ(TIMER_VALUE, read1); // starts at 0
	CSR_READ(TIMER_VALUE, read2); // gets 4

	check_dma = read1;
	check_dma = read2;

	// vector_memory[0] = read1;
	// vector_memory[0] = read2;


	// check_dma = vector_memory[0];
	// check_dma = vector_memory[1];
	// check_dma = vector_memory[2];
	// check_dma = vector_memory[3];

	
	
	return;
}


int main(void)
{
	if(0) {
		no_interrupt_example();
	} else {
		interrupt_example();
	}
}
