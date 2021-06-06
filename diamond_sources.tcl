
# This file contains the tcl commands to add the sources needed to incorporate this module into a higher level design (i.e. FPGA top level)

set abs_path [ file dirname [ file normalize [ info script ] ] ]; # ABSOLUTE PATH TO THE DIRECTORY THIS SCRIPT IS RESIDING IN


#
# PUT LATTICE DIAMOND PROJECT TCL COMMANDS BELOW HERE TO ADD THE SOURCES REQUIRED FOR USING THIS MODULE IN A PROJECT
#
# Example: prj_src add $abs_path/hdl/my_module.sv
#
# See Lattice Diamond HTML help (Reference Guides --> Tcl Command Reference Guide --> Diamond Tool Tcl Command Syntax --> Diamond Project Tcl Commands for more info)
#
# If you have a pre-compiled IP you need to also append to the path to .ngo file directory to the macro_search_path variable.
#
# Example: append macro_search_path "$abs_path/path_to_ip_ngo;" (NOTE THE ; AT THE END OF THE PATH!)
#


# DON'T FORGET to pre-pend $abs_path to the path to your sources
# DON'T FORGET the ; at the end of the path to your pre-compiled IP .ngo file directory

# prj_src add $abs_path/hdl/dpram.sv
prj_src add $abs_path/hdl/scalar_memory.v
prj_src add $abs_path/hdl/dma/dma_in.v
prj_src add $abs_path/hdl/dma/dma_in_dummy.v
prj_src add $abs_path/hdl/ring_bus/ring_bus.v

prj_src add $abs_path/hdl/nco/nco.v
prj_src add $abs_path/hdl/nco/nco_gen.v

prj_src add $abs_path/hdl/dma/dma_out.v
prj_src add $abs_path/hdl/q_engine.v
prj_src add $abs_path/../../fpgas/common/modules/demapper/demapper.sv
prj_src add $abs_path/hdl/slicer.v

prj_src add $abs_path/piston/hdl/k15_op.v
prj_src add $abs_path/piston/hdl/round_sat_dat_1_1.v
prj_src add $abs_path/piston/hdl/eb15_ctrl.v
prj_src add $abs_path/piston/hdl/eb17_ctrl.v
prj_src add $abs_path/piston/hdl/eb_fifo_ctrl.v
prj_src add $abs_path/piston/hdl/memory_slice.v
prj_src add $abs_path/piston/hdl/permutator_slice.v
prj_src add $abs_path/piston/hdl/iperm_ctrl_2_1.v
prj_src add $abs_path/piston/hdl/iperm_dat_2_1.v
prj_src add $abs_path/piston/hdl/operm_ctrl_2_1.v
prj_src add $abs_path/piston/hdl/operm_dat_2_1.v
prj_src add $abs_path/piston/hdl/kap_ctrl_ctrl_1_5.v
prj_src add $abs_path/piston/hdl/kap_ctrl_dat_1_5.v
prj_src add $abs_path/piston/hdl/piston.v
prj_src add $abs_path/piston/hdl/vector_slice.v
prj_src add $abs_path/piston/hdl/vector_dat_17_2.v
prj_src add $abs_path/piston/hdl/inmux_dat_4_1.v
prj_src add $abs_path/piston/hdl/oumux_dat_2_5.v
prj_src add $abs_path/piston/hdl/funnel_dat_2_2.v
prj_src add $abs_path/piston/hdl/defunnel_dat_3_1.v
prj_src add $abs_path/piston/hdl/bs_dat_2_1.v
prj_src add $abs_path/piston/hdl/vector_ctrl_17_2.v
prj_src add $abs_path/piston/hdl/inmux_ctrl_4_1.v
prj_src add $abs_path/piston/hdl/oumux_ctrl_2_5.v
prj_src add $abs_path/piston/hdl/defunnel_ctrl_3_1.v
prj_src add $abs_path/piston/hdl/funnel_ctrl_2_2.v
prj_src add $abs_path/piston/hdl/vmem_ctrl_6_5.v
prj_src add $abs_path/piston/hdl/vmem_dat_6_5.v
prj_src add $abs_path/piston/hdl/cfg_ctrl.v
prj_src add $abs_path/piston/hdl/cfg_dat.v
prj_src add $abs_path/piston/hdl/ka_decode_dat_1_3.v
prj_src add $abs_path/piston/hdl/ka_decode_ctrl_1_3.v
prj_src add $abs_path/piston/hdl/p_decode_dat_1_2.v
prj_src add $abs_path/piston/hdl/p_decode_ctrl_1_2.v
prj_src add $abs_path/piston/hdl/perm_full_addr_dat_1_1.v
prj_src add $abs_path/piston/hdl/perm_full_data_dat_2_1.v
prj_src add $abs_path/piston/hdl/perm_addr_dat_1_1.v
prj_src add $abs_path/piston/hdl/perm_addr_slice.v
prj_src add $abs_path/piston/hdl/perm_data_dat_2_1.v
prj_src add $abs_path/piston/hdl/perm_data_slice.v
prj_src add $abs_path/verilate/scalar0.mif
prj_src add $abs_path/verilate/scalar1.mif
prj_src add $abs_path/verilate/scalar2.mif
prj_src add $abs_path/verilate/scalar3.mif

# prj_src add $abs_path/piston/hdl/inmux_ctrl_4_1.sv
# prj_src add $abs_path/piston/hdl/inmux_dat_4_1.sv
# prj_src add $abs_path/piston/hdl/oumux_ctrl_2_6.sv
# prj_src add $abs_path/piston/hdl/oumux_dat_2_6.sv
#append macro_search_path "$abs_path/ip/lattice/ddr3_ip/inst1;"
