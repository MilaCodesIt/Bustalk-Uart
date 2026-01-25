iverilog -g2012 -o sim.out ../rtl/*.v ../tb/tb_apb_uart.sv
vvp sim.out
gtkwave dump.vcd
