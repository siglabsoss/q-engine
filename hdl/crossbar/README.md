## Intro
Crossbar is a parameterized module and arbitrates the memory accesses to multiple block rams. Q-engine uses the crossbar to
arbitrate the input DMAs, output DMAs and north memory access from the riscv processor.

## Block Diagram

## Theory of Operation
The crossbar uses the least significant n-bits (IADDR_WIDTH-OADDR_WITH) to determine access bank of VMEM. For instance, 
32 slice q-engine uses 5 bits to determine bank mapping (2^5=32). The inputs streams have a fixed priority depending on their position
in the stream array; index 0 is the highest priority. Since most memory accesses are interleaved (bank address increments at each transaction), 
the maximum delay at collision is deterministic at 1\*(array_index) clock cycles. For read accesses, the crossbar keeps track of requester using
the DMA_OUT_STAGES parameter and return the data to the correct requestor.


## Files
crossbar.sv

## PARAMETERS

|Parameter|description|
|---------|-----------|
|INPUTS | number peripherals that need to access VMEM|
|OUTPUTS | number of VMEMs|
|IADDR_WIDTH| width of input address signal|
|OADDR_WIDTH| width of output address signal|
|DATA_WIDTH| width of data|
|DMA_OUT_STAGES|pipline stages in crossbar-vmem-crossbar read access route|


## IO

| name | width | direction | description |
|------|-------|-----------|-------------|
| clk  |   1   | input     | Clock       |
|srst  |   1   | input     | Reset       |
|t_addr[INPUTS]|IADDR_WIDTH|input|peripheral access request address|
|t_data[INPUTS]|DATA_WIDTH|input|peripheral access request data|
|t_we[INPUTS]|1|input|peripheral access request write enable|
|t_valid[INPUTS]|1|input|peripheral access request valid|
|t_ready[INPUTS]|1|output|peripheral acess request accepted|
|i_addr[OUTPUTS]|OADDR_WIDTH|input|arbitrated access to VMEM address|
|i_data[OUTPUTS]|DATA_WIDTH|input|arbitrated access to VMEM data|
|i_we[OUTPUTS]|1|input|arbitrated access to VMEM write enable|
|i_valid[OUTPUTS]|1|input|arbitrated access to VMEM valid|
|i_ready[OUTPUTS]|1|output|arbitrated access to VMEM accepted|
|t_mem_addr[OUTPUTS]|OADDR_WIDTH|input|return read from VMEM address|
|t_mem_data[OUTPUTS]|DATA_WIDTH|input|return read from VMEM data|
|t_mem_ready[OUTPUTS]|1|output|ready to accept return read from VMEM|
|i_dma_out_data[INPUTS]|DATA_WIDTH|input|read output data from VMEM to perihperal|
|i_dma_out_valid[INPUTS]|1|input|read output data valid|
|i_dma_out_ready[INPUTS]|1|output|perihperal ready to accept read data from VMEM|


## Synthesis results
INPUT parameter set to 2
**Resource Usage Report** \
**Part: lfe5u_85f-6**\
**Register bits: 28 of 83640 (0%)**

|Details:|-|
|--------|-|
|FD1S3AX: |       1|
|FD1S3IX: |       27|
|GSR:     |       1|
|INV:     |       1|
|L6MUX21: |       474|
|ORCALUT4:|       2640|
|PFUMX:   |       544|
|PUR:     |       1|
|VHI:     |       1|
|VLO:     |       1|

## Test
