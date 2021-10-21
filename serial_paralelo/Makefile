all: t1 t2 t3 t4 t5
t1:
	yosys -s serial_paralelosynth.ys
t2:
	sed -i 's/serial_paralelo/serial_paralelo_synth/' serial_paralelo_synth.v
t3:
	iverilog -o bin BancoPruebas_serial_paralelo.v cmos_cells.v
t4:
	vvp bin
t5:
	gtkwave serial_paralelo.vcd
clean:
	rm -r *.vcd bin