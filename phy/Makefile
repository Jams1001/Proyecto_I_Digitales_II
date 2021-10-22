p: testbench.v phy_tester.v phy.v
	iverilog -o salida testbench.v
	vvp salida
	gtkwave phy.vcd

t:
	echo '`timescale 1ns/1ns\n\n`include "module.v" \n`include "tester.v" \n\nmodule testbench; \n\n\twire CLK; \n\nmodule moduleINST(/*AUTOINST*/   \n);\n\ntester testerINST(/*AUTOINST*/   \n);\n\nendmodule' > testbench.v		

a:	
	emacs --batch  testbench.v -f verilog-batch-auto
	
clean:
	rm -f *.o
	rm -f *.vcd





