# don't put paths in this file that are pure relative (ie ../foler/file.v)
# make sure all paths start with a variable that is not found in this file


# including file must set these
# Q_ENGINE_REPO=../q-engine
# IP_LIBRARY_REPO=../ip-library
# RISCV_BASEBAND_REPO=.
# DATAPATH_REPO=


ifndef IP_LIBRARY_REPO
$(error Please define IP_LIBRARY_REPO before including q-engine/make_include/verilog_paths.mk)
endif
ifndef DATAPATH_REPO
$(error Please define DATAPATH_REPO before including q-engine/make_include/verilog_paths.mk)
endif
ifndef Q_ENGINE_REPO
$(error Please define Q_ENGINE_REPO before including q-engine/make_include/verilog_paths.mk)
endif
ifndef RISCV_BASEBAND_REPO
$(error Please define RISCV_BASEBAND_REPO before including q-engine/make_include/verilog_paths.mk)
endif


Q_ENGINE_ALL_VERILOG= \
$(RISCV_BASEBAND_REPO)/hdl/generated/XbbRiscv.v \
$(Q_ENGINE_REPO)/piston/hdl/k15_op.v \
$(Q_ENGINE_REPO)/piston/hdl/round_sat_dat_1_1.v \
$(Q_ENGINE_REPO)/piston/hdl/bs_dat_2_1.v \
$(Q_ENGINE_REPO)/piston/hdl/cfg_ctrl.v \
$(Q_ENGINE_REPO)/piston/hdl/cfg_dat.v \
$(Q_ENGINE_REPO)/piston/hdl/defunnel_ctrl_3_1.v \
$(Q_ENGINE_REPO)/piston/hdl/defunnel_dat_3_1.v \
$(Q_ENGINE_REPO)/piston/hdl/eb15_ctrl.v \
$(Q_ENGINE_REPO)/piston/hdl/eb17_ctrl.v \
$(Q_ENGINE_REPO)/piston/hdl/eb_fifo_ctrl.v \
$(Q_ENGINE_REPO)/piston/hdl/funnel_ctrl_2_2.v \
$(Q_ENGINE_REPO)/piston/hdl/funnel_dat_2_2.v \
$(Q_ENGINE_REPO)/piston/hdl/p_decode_dat_1_2.v \
$(Q_ENGINE_REPO)/piston/hdl/p_decode_ctrl_1_2.v \
$(Q_ENGINE_REPO)/piston/hdl/ka_decode_dat_1_3.v \
$(Q_ENGINE_REPO)/piston/hdl/ka_decode_ctrl_1_3.v \
$(Q_ENGINE_REPO)/piston/hdl/perm_full_addr_dat_1_1.v \
$(Q_ENGINE_REPO)/piston/hdl/perm_full_data_dat_2_1.v \
$(Q_ENGINE_REPO)/piston/hdl/perm_addr_dat_1_1.v \
$(Q_ENGINE_REPO)/piston/hdl/perm_addr_slice.v \
$(Q_ENGINE_REPO)/piston/hdl/perm_data_dat_2_1.v \
$(Q_ENGINE_REPO)/piston/hdl/perm_data_slice.v \
$(Q_ENGINE_REPO)/piston/hdl/inmux_ctrl_4_1.v \
$(Q_ENGINE_REPO)/piston/hdl/inmux_dat_4_1.v \
$(Q_ENGINE_REPO)/piston/hdl/iperm_ctrl_2_1.v \
$(Q_ENGINE_REPO)/piston/hdl/iperm_dat_2_1.v \
$(Q_ENGINE_REPO)/piston/hdl/kap_ctrl_ctrl_1_5.v \
$(Q_ENGINE_REPO)/piston/hdl/kap_ctrl_dat_1_5.v \
$(Q_ENGINE_REPO)/piston/hdl/memory_slice.v \
$(Q_ENGINE_REPO)/piston/hdl/operm_ctrl_2_1.v \
$(Q_ENGINE_REPO)/piston/hdl/operm_dat_2_1.v \
$(Q_ENGINE_REPO)/piston/hdl/oumux_ctrl_2_5.v \
$(Q_ENGINE_REPO)/piston/hdl/oumux_dat_2_5.v \
$(Q_ENGINE_REPO)/piston/hdl/permutator_slice.v \
$(Q_ENGINE_REPO)/piston/hdl/piston.v \
$(Q_ENGINE_REPO)/piston/hdl/vector_ctrl_17_2.v \
$(Q_ENGINE_REPO)/piston/hdl/vector_dat_17_2.v \
$(Q_ENGINE_REPO)/piston/hdl/vector_slice.v \
$(Q_ENGINE_REPO)/piston/hdl/vmem_ctrl_6_5.v \
$(Q_ENGINE_REPO)/piston/hdl/vmem_dat_6_5.v \
$(Q_ENGINE_REPO)/hdl/scalar_memory.v \
$(Q_ENGINE_REPO)/hdl/slicer.v \
$(Q_ENGINE_REPO)/hdl/dma/dma_in.v \
$(Q_ENGINE_REPO)/hdl/dma/dma_out.v \
$(Q_ENGINE_REPO)/hdl/dma/dma_in_dummy.v \
$(Q_ENGINE_REPO)/hdl/nco/nco_gen.v \
$(Q_ENGINE_REPO)/hdl/nco/nco.v \
$(Q_ENGINE_REPO)/hdl/q_engine.v \
$(Q_ENGINE_REPO)/hdl/ring_bus/ring_bus.v \
$(IP_LIBRARY_REPO)/fwft_fifos/sc_fifo/hdl/fwft_sc_fifo.v \
$(IP_LIBRARY_REPO)/fwft_fifos/sc_fifo/hdl/generic_dpram.v \
$(IP_LIBRARY_REPO)/fwft_fifos/sc_fifo/hdl/generic_fifo_sc_a.v \
$(DATAPATH_REPO)/rtl/muladdsub.v 


# if we change how this project is verilated, this will change
Q_ENGINE_VERILATOR_TOP=q_engine




RISCV_C_INC_PATH=$(RISCV_BASEBAND_REPO)/c/inc
LD_STANDARD_PATH=$(RISCV_C_INC_PATH)/ld_standard
CRT_STANDARD_PATH=$(RISCV_C_INC_PATH)/crt_standard.S
