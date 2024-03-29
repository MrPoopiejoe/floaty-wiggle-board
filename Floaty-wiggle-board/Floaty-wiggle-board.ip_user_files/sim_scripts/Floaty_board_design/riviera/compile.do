vlib work
vlib riviera

vlib riviera/xilinx_vip
vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/smartconnect_v1_0
vlib riviera/axi_protocol_checker_v2_0_3
vlib riviera/axi_vip_v1_1_3
vlib riviera/processing_system7_vip_v1_0_5
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/lib_cdc_v1_0_2
vlib riviera/lib_pkg_v1_0_2
vlib riviera/axi_timer_v2_0_19
vlib riviera/proc_sys_reset_v5_0_12
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_19
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_register_slice_v2_1_17
vlib riviera/fifo_generator_v13_2_2
vlib riviera/axi_data_fifo_v2_1_16
vlib riviera/axi_crossbar_v2_1_18
vlib riviera/axi_protocol_converter_v2_1_17

vmap xilinx_vip riviera/xilinx_vip
vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap smartconnect_v1_0 riviera/smartconnect_v1_0
vmap axi_protocol_checker_v2_0_3 riviera/axi_protocol_checker_v2_0_3
vmap axi_vip_v1_1_3 riviera/axi_vip_v1_1_3
vmap processing_system7_vip_v1_0_5 riviera/processing_system7_vip_v1_0_5
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap axi_timer_v2_0_19 riviera/axi_timer_v2_0_19
vmap proc_sys_reset_v5_0_12 riviera/proc_sys_reset_v5_0_12
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_19 riviera/axi_gpio_v2_0_19
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_register_slice_v2_1_17 riviera/axi_register_slice_v2_1_17
vmap fifo_generator_v13_2_2 riviera/fifo_generator_v13_2_2
vmap axi_data_fifo_v2_1_16 riviera/axi_data_fifo_v2_1_16
vmap axi_crossbar_v2_1_18 riviera/axi_crossbar_v2_1_18
vmap axi_protocol_converter_v2_1_17 riviera/axi_protocol_converter_v2_1_17

vlog -work xilinx_vip  -sv2k12 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/axi_vip_if.sv" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/clk_vip_if.sv" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/D_Programs/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work smartconnect_v1_0  -sv2k12 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/sc_util_v1_0_vl_rfs.sv" \

vlog -work axi_protocol_checker_v2_0_3  -sv2k12 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/03a9/hdl/axi_protocol_checker_v2_0_vl_rfs.sv" \

vlog -work axi_vip_v1_1_3  -sv2k12 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/b9a8/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_5  -sv2k12 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/Floaty_board_design/ip/Floaty_board_design_processing_system7_0_0/sim/Floaty_board_design_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/cced/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_timer_v2_0_19 -93 \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/0a2c/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Floaty_board_design/ip/Floaty_board_design_axi_timer_0_0/sim/Floaty_board_design_axi_timer_0_0.vhd" \

vcom -work proc_sys_reset_v5_0_12 -93 \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/f86a/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Floaty_board_design/ip/Floaty_board_design_rst_ps7_0_50M_0/sim/Floaty_board_design_rst_ps7_0_50M_0.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/8e66/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_19 -93 \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/c193/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/Floaty_board_design/ip/Floaty_board_design_axi_gpio_0_0/sim/Floaty_board_design_axi_gpio_0_0.vhd" \
"../../../bd/Floaty_board_design/ip/Floaty_board_design_axi_gpio_1_0/sim/Floaty_board_design_axi_gpio_1_0.vhd" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_17  -v2k5 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/6020/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/7aff/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_2 -93 \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_2  -v2k5 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/7aff/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_16  -v2k5 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/247d/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_18  -v2k5 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/15a3/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/Floaty_board_design/ip/Floaty_board_design_xbar_0/sim/Floaty_board_design_xbar_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/Floaty_board_design/sim/Floaty_board_design.vhd" \

vlog -work axi_protocol_converter_v2_1_17  -v2k5 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ccfb/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/ec67/hdl" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/5bb9/hdl/verilog" "+incdir+../../../../Floaty-wiggle-board.srcs/sources_1/bd/Floaty_board_design/ipshared/70fd/hdl" "+incdir+D:/D_Programs/Xilinx/Vivado/2018.2/data/xilinx_vip/include" \
"../../../bd/Floaty_board_design/ip/Floaty_board_design_auto_pc_0/sim/Floaty_board_design_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

