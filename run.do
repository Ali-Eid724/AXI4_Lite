vlib work
vlog axi4_lite_master.sv axi4_lite_slave.sv axi4_lite_top.sv
vsim -voptargs=+acc work.axi4_lite_top_tb
add wave*
run -all
