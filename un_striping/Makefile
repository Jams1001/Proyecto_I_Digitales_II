all: t1 t2 t3 t4 t5
t1:
	yosys -s unstripinsynth.ys
t2:
	sed -i 's/un_stripring/unstriping_synth/' unstriping_synth.v
t3:
	iverilog -o bin BancoPruebas_unstriping.v 
t4:
	vvp bin
t5:
	gtkwave unstriping.vcd
clean:
	rm -r *.vcd bin unstriping_synth.v


	