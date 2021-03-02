//chipverify page for tlm analysis fifo
//https://verificationguide.com/uvm/tlm-analysis-fifo-example/

import uvm_pkg::*;
`include "compA.sv"
`include "compB.sv"


class my_test extends uvm_test;
	`uvm_component_utils(my_test);
	compA a;
	compB b;
	
	function new (string name = "my_test",uvm_component parent = null);
		super.new (name,parent);
	endfunction : new
	
	function void build_phase (uvm_phase phase);
		super.build_phase(phase);
		a=compA::type_id::create("a",this);
		b=compB::type_id::create("b",this);
	endfunction : build_phase
	
	function void connect_phase (uvm_phase phase);
		super.connect_phase(phase);
		a.analyis_port.connect(b.analyis_fifo.analysis_export);//add magic keyword .analysis_export
	endfunction : connect_phase

endclass


module tb;
import uvm_pkg::*;


initial begin
	run_test("my_test");
end


endmodule
