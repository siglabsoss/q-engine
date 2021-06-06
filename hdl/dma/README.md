## Intro
  * DMA has an elastic data bus and an elastic configuration stream controlled via CSRs
  * Takes start address, vector length, init timer value from CSR (elastic stream)
  * Pull data from streaming interface
  * Writes data to memory sequentially
  * Sends interrupt when done

## Block Diagram

## Theory of Operation
The DMA-in module waits for valid coniguration over the configuration stream and when the input timer value matches the config timer value,
it initiates the transaction. The module increments the output address signal starting from start address value provided in the configuration stream
until the transaction length is reached.

The DMA-out module operates similarly to the DMA module. The module generates a stream of addresses on the i0-stream and accepts the data from the memory on the t0 stream.
There is an elastic FIFO that buffers the t0 stream and the holds off the address generation if the almost full flag in the FIFO is reached. The output of the elastic fifo
is connected to the i1-stream.

## Files
dma_in.sv \
dma_out.sv

## IO
### DMA IN

| name | width | direction | description |
|------|-------|-----------|-------------|
| clk  |   1   | input     | Clock       |
|srst  |   1   | input     | Reset       |
|config_valid|1| input     | configuration valid from config CSR stream|
|config_ready|1| output    | configuration accepted when high|
|config_payload_startAddr|32|input|DMA configuration start address|
|config_payload_length|32|input|DMA configuration length|
|config_payload_timerInit|32|input|DMA configuration timer value for txn init|
|ctimer|32|input| timer input  to kick-off a timed DMA txn|
|busy|1|output|indicates DMA txn is active|
|strobe_complete|1|output|pulses high for 1cc when DMA txn is complete|
|t0_data|32|input|input data stream payload|
|t0_valid|1|input|input data stream payload is valid|
|t0_ready|1|output|ready to accept input data|
|i0_addr|32|output|address for memory mapped data stream to memory|
|i0_data|32|output|data for memory mapped data stream to memory|
|i0_valid|1|output|memory mapped data stream to memory is valid|
|i0_ready|1|input|memory is ready to accept the i0 stream payload|

### DMA OUT
| name | width | direction | description |
|------|-------|-----------|-------------|
| clk  |   1   | input     | Clock       |
|srst  |   1   | input     | Reset       |
|config_valid|1| input     | configuration valid from config CSR stream|
|config_ready|1| output    | configuration accepted when high|
|config_payload_startAddr|32|input|DMA configuration start address|
|config_payload_length|32|input|DMA configuration length|
|config_payload_timerInit|32|input|DMA configuration timer value for txn init|
|ctimer|32|input| timer input  to kick-off a timed DMA txn|
|busy|1|output|indicates DMA txn is active|
|strobe_complete|1|output|pulses high for 1cc when DMA txn is complete|
|i0_addr|32|output|read address address for memory|
|i0_valid|1|output|read address valid|
|i0_ready|1|input|memory ready to accept read request|
|t0_data|32|input|read data from memory|
|t0_valid|1|input|read data form memory is valid|
|t0_ready|1|output|DMA out ready to accept data from memory|
|i1_data|32|output|output buffered t0 stream |
|i1_valid|1|output|i1 stream valid|
|i1_ready|1|input|ready to accept i1 stream|


## CSR map

	* BaseAddress+0 : Start addresses of vector memory
	* BaseAddress+1 : length of input stream to write to vector memory
	* BaseAddress+2 : timer value to initiate DMA transfer (write 0xFFFFFFFF to initiate transaction immediately)  	
	* BaseAddress+3 : pushes config regs (start address, length, and timer value) to queue
	* BaseAddress+4 : reports status of DMA (1-busy,0-not active)
	* BaseAddress+5 : reports the length of DMA configuration FIFO

## Synthesis results
### DMA IN
**Resource Usage Report** \
**Part: lfe5u_85f-6** \
**Register bits: 98 of 83640 (0%)**

|Details:|-|
|--------|-|
|CCU2C:   |       69|
|FD1P3IX: |       32|
|FD1S3AX: |       1|
|FD1S3IX: |       65|
|GSR:     |       1|
|ORCALUT4:|       50|
|PFUMX:   |       1|
|PUR:     |       1|
|VHI:     |       1|
|VLO:     |       1|

**Estimated Frequency: 177.1MHz**

### DMA OUT
**Resource Usage Report** \
**Part: lfe5u_85f-6** \
**Register bits: 155 of 83640 (0%)** 

|Details:|-|
|--------|-|
|CCU2C:|          74|
|DPR16X4C: |       8|
|FD1P3AX:  |      64|
|FD1P3IX: |       41|
|FD1S3AX: |       9|
|FD1S3IX: |       41|
|GSR:     |       1|
|ORCALUT4:|       89
|PUR:     |       1|
|VHI:     |       4|
|VLO:     |       4|

**Estimated Frequency: 162.7MHz**

## Test
