all: t1 t2 t3 t4 t5
t1:
	yosys -s paralelo_serialsynth.ys
t2:
	sed -i 's/paralelo_serial/paralelo_serial_synth/' paralelo_serial_synth.v
t3:
	iverilog -o bin BancoPruebas_paralelo_serial.v cmos_cells.v
t4:
	vvp bin
t5:
	gtkwave paralelo_serial.vcd
clean:
	rm -r *.vcd bin