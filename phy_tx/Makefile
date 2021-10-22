p: testbench.v phy_tx_tester.v phy_tx.v
	iverilog -o salida testbench.v
	vvp salida
	gtkwave phy_tx.vcd

t:
	echo '`timescale 1ns/1ns\n\n`include "module.v" \n`include "tester.v" \n\nmodule testbench; \n\n\twire CLK; \n\nmodule moduleINST(/*AUTOINST*/   \n);\n\ntester testerINST(/*AUTOINST*/   \n);\n\nendmodule' > testbench.v		

a:	
	emacs --batch  testbench.v -f verilog-batch-auto
	
s:
	yosys -s sintetizado.ys

c:
	sed -i 's/conv_32b_8b/conv_32b_8b_synth/g' phy_tx_synth.v
	sed -i 's/paralelo_serial/paralelo_serial_synth/g' phy_tx_synth.v
	sed -i 's/striping/striping_synth/g' phy_tx_synth.v
	sed -i 's/phy_tx/phy_tx_synth/g' phy_tx_synth.v
