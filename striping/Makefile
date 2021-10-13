all: t1 t2 t3 t4 t5
t1:
	yosys -s stripingsynth.ys
t2:
	sed -i 's/striping/striping_synth/' striping_synth.v
t3:
	iverilog -o bin BancoPruebas_striping.v cmos_cells.v
t4:
	vvp bin
t5:
	gtkwave striping.vcd
clean:
	rm -r *.vcd bin