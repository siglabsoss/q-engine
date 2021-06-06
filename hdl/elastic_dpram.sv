module elastic_dpram
		#(parameter DEPTH = 2048)
		
		(input clk,
		input 	      srst,
		//Port 0
		input wire [10:0]  t0_addr,
		input wire [31:0]  t0_data,
		input 	      t0_we,
		input wire 	      t0_valid,
		output logic       t0_ready,
		output logic [10:0] i0_addr,
		output wire [31:0] i0_data,
		output logic       i0_valid,
		input wire 	      i0_ready,
		//Port 1
		input wire [10:0]  t1_addr,
		input wire [31:0]  t1_data,
		input wire 	      t1_we,
		input wire 	      t1_valid,
		output logic       t1_ready,
		output logic [10:0] i1_addr,
		output wire [31:0] i1_data,
		output logic       i1_valid,
		input wire 	      i1_ready
		);

	dpram #(.DEPTH (DEPTH))
		dpram_inst
		(.clk(clk),
			.addr_0(t0_addr),
			.din_0(t0_data),
			.we_0(t0_we),
			.dout_0(i0_data),
			.addr_1(t1_addr),
			.din_1(t1_data),
			.we_1(t1_we),
			.dout_1(i1_data)
		);

	assign t0_ready=i0_ready;
	assign t1_ready=i1_ready;
  
	always_ff @(posedge clk) begin
		i0_valid <= t0_valid;
		i1_valid <= t1_valid;
		i0_addr <= t0_addr;
		i1_addr <= t1_addr;
	end

endmodule

