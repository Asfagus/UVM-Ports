import uvm_pkg::*;
`include "compA.sv"
`include "compB.sv"
`include "compC.sv"


class my_test extends uvm_test;
	`uvm_component_utils(my_test);
	compA a;	//Producer
	compB b;	//Consumer1
	compC c;	//Consumer2
	
	
	function new (string name = "my_test",uvm_component parent = null);
		super.new (name,parent);
	endfunction : new
	
	function void build_phase (uvm_phase phase);
		super.build_phase(phase);
		a=compA::type_id::create("a",this);
		b=compB::type_id::create("b",this);
		c=compC::type_id::create("c",this);
		
	endfunction : build_phase
	
	function void connect_phase (uvm_phase phase);
		super.connect_phase(phase);
		a.analysis_port.connect(b.analysis_export); //first is the "port" port object, here b , second is the export 
		a.analysis_port.connect(c.analysis_export_1); //first is the "port" port object, here b , second is the export 
		
	endfunction : connect_phase

endclass


module tb;
import uvm_pkg::*;


initial begin
	run_test("my_test");
end


endmodule
