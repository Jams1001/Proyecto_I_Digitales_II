r: testbench.v tester.v generador_de_relojes.v
	iverilog -o salida testbench.v
	vvp salida
	gtkwave generador_de_relojes.vcd

t:
	echo '`timescale 1ns/1ns\n\n`include "module.v" \n`include "tester.v" \n\nmodule testbench; \n\n\twire CLK; \n\nmodule moduleINST(/*AUTOINST*/   \n);\n\ntester testerINST(/*AUTOINST*/   \n);\n\nendmodule' > testbench.v		

a:	
	emacs --batch  testbench.v -f verilog-batch-auto
	
