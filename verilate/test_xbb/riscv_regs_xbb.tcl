lappend system "clk"
lappend system "reset"

set num_added [ gtkwave::addSignalsFromList $system ]

gtkwave::/Edit/Insert_Comment "--- iBus ---"

lappend iBus "VexRiscv.iBus_cmd_valid"
lappend iBus "VexRiscv.iBus_cmd_ready"
lappend iBus "VexRiscv.iBus_cmd_payload_pc"
lappend iBus "VexRiscv.iBus_rsp_ready"
lappend iBus "VexRiscv.iBus_rsp_error"
lappend iBus "VexRiscv.iBus_rsp_inst"

set num_added [ gtkwave::addSignalsFromList $iBus ]

gtkwave::/Edit/Insert_Comment "--- dBus ---"

lappend dBus "VexRiscv.dBus_cmd_valid"
lappend dBus "VexRiscv.dBus_cmd_ready"
lappend dBus "VexRiscv.dBus_cmd_payload_wr"
lappend dBus "VexRiscv.dBus_cmd_payload_address"
lappend dBus "VexRiscv.dBus_cmd_payload_data"
lappend dBus "VexRiscv.dBus_cmd_payload_size"
lappend dBus "VexRiscv.dBus_rsp_ready"
lappend dBus "VexRiscv.dBus_rsp_error"
lappend dBus "VexRiscv.dBus_rsp_data"

set num_added [ gtkwave::addSignalsFromList $dBus ]

gtkwave::/Edit/Insert_Comment "--- PC ---"

lappend writeback "VexRiscv.writeBack_PC"

set num_added [ gtkwave::addSignalsFromList $writeback ]


gtkwave::/Edit/Insert_Comment "--- INTS ---"

lappend interrupts "VexRiscv.CsrPlugin_mcause_exceptionCode"
lappend interrupts "VexRiscv.externalInterrupt"
lappend interrupts "TOP.q_engine.VexRiscv.CsrPlugin_exception"
lappend interrupts "TOP.q_engine.VexRiscv.writeBack_REGFILE_WRITE_VALID"

set num_added [ gtkwave::addSignalsFromList $interrupts ]


gtkwave::/Edit/Insert_Comment "--- REGS ---"
# omit zero
# lappend bundle4 "TOP.riscv_baseband.VexRiscv.RegFilePlugin_regFile(0)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(1)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(2)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(3)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(4)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(5)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(6)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(7)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(8)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(9)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(10)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(11)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(12)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(13)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(14)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(15)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(16)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(17)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(18)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(19)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(20)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(21)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(22)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(23)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(24)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(25)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(26)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(27)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(28)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(29)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(30)"
lappend bundle4 "TOP.q_engine.VexRiscv.RegFilePlugin_regFile(31)"
set num_added [ gtkwave::addSignalsFromList $bundle4 ]


gtkwave::/Edit/Insert_Comment "--- Instructions ---"
lappend instructions "TOP.q_engine.VexRiscv.writeBack_RegFilePlugin_regFileWrite_payload_address"
lappend instructions "TOP.q_engine.VexRiscv.writeBack_RegFilePlugin_regFileWrite_payload_data"
lappend instructions "TOP.q_engine.VexRiscv.writeBack_RegFilePlugin_regFileWrite_valid"
set num_added [ gtkwave::addSignalsFromList $instructions ]

gtkwave::/Edit/Insert_Comment "--- XBB ---"
lappend bundle9 "TOP.q_engine.VexRiscv.xbaseband_cmd_valid"
lappend bundle9 "TOP.q_engine.VexRiscv.xbaseband_cmd_ready"
lappend bundle9 "TOP.q_engine.VexRiscv.xbaseband_cmd_payload_instruction"
lappend bundle9 "TOP.q_engine.VexRiscv.xbaseband_cmd_payload_rs1"
set num_added [ gtkwave::addSignalsFromList $bundle9 ]

gtkwave::/Edit/Insert_Comment "--- Slice 0 ---"
lappend bundle8 "TOP.q_engine.piston_inst.vector_logic.vector_slice_0.vreg(0)"
lappend bundle8 "TOP.q_engine.piston_inst.vector_logic.vector_slice_0.vreg(1)"
lappend bundle8 "TOP.q_engine.piston_inst.vector_logic.vector_slice_0.vreg(2)"
lappend bundle8 "TOP.q_engine.piston_inst.vector_logic.vector_slice_0.vreg(3)"
lappend bundle8 "TOP.q_engine.piston_inst.vector_logic.vector_slice_0.vreg(4)"
lappend bundle8 "TOP.q_engine.piston_inst.vector_logic.vector_slice_0.vreg(5)"
lappend bundle8 "TOP.q_engine.piston_inst.vector_logic.vector_slice_0.vreg(6)"
lappend bundle8 "TOP.q_engine.piston_inst.vector_logic.vector_slice_0.vreg(7)"
set num_added [ gtkwave::addSignalsFromList $bundle8 ]

# gtkwave::/Edit/Insert_Comment "--- VMEM Bus ---"
# lappend bundle6 "TOP.q_engine.t_crossbar_addr(0)"
# lappend bundle6 "TOP.q_engine.t_crossbar_addr(1)"
# lappend bundle6 "TOP.q_engine.t_crossbar_addr(2)"
# lappend bundle6 "TOP.q_engine.t_crossbar_data(0)"
# lappend bundle6 "TOP.q_engine.t_crossbar_data(1)"
# lappend bundle6 "TOP.q_engine.t_crossbar_data(2)"
# set num_added [ gtkwave::addSignalsFromList $bundle6 ]
# gtkwave::/Edit/Insert_Comment "--- VMEM ---"

# lappend bundle5 "TOP.q_engine.i_mem_data(1)"
# lappend bundle5 "TOP.q_engine.i_mem_data(2)"
# lappend bundle5 "TOP.q_engine.i_mem_data(3)"
# lappend bundle5 "TOP.q_engine.i_mem_data(4)"
# lappend bundle5 "TOP.q_engine.i_mem_data(5)"
# lappend bundle5 "TOP.q_engine.i_mem_data(6)"
# lappend bundle5 "TOP.q_engine.i_mem_data(7)"
# lappend bundle5 "TOP.q_engine.i_mem_data(8)"
# lappend bundle5 "TOP.q_engine.i_mem_data(9)"
# lappend bundle5 "TOP.q_engine.i_mem_data(10)"
# lappend bundle5 "TOP.q_engine.i_mem_data(11)"
# lappend bundle5 "TOP.q_engine.i_mem_data(12)"
# lappend bundle5 "TOP.q_engine.i_mem_data(13)"
# lappend bundle5 "TOP.q_engine.i_mem_data(14)"
# lappend bundle5 "TOP.q_engine.i_mem_data(15)"
# lappend bundle5 "TOP.q_engine.i_mem_data(16)"
# lappend bundle5 "TOP.q_engine.i_mem_data(17)"
# lappend bundle5 "TOP.q_engine.i_mem_data(18)"
# lappend bundle5 "TOP.q_engine.i_mem_data(19)"
# lappend bundle5 "TOP.q_engine.i_mem_data(20)"
# lappend bundle5 "TOP.q_engine.i_mem_data(21)"
# lappend bundle5 "TOP.q_engine.i_mem_data(22)"
# lappend bundle5 "TOP.q_engine.i_mem_data(23)"
# lappend bundle5 "TOP.q_engine.i_mem_data(24)"
# lappend bundle5 "TOP.q_engine.i_mem_data(25)"
# lappend bundle5 "TOP.q_engine.i_mem_data(26)"
# lappend bundle5 "TOP.q_engine.i_mem_data(27)"
# lappend bundle5 "TOP.q_engine.i_mem_data(28)"
# lappend bundle5 "TOP.q_engine.i_mem_data(29)"
# lappend bundle5 "TOP.q_engine.i_mem_data(30)"
# lappend bundle5 "TOP.q_engine.i_mem_data(31)"
# set num_added [ gtkwave::addSignalsFromList $bundle5 ]

gtkwave::setZoomFactor -4