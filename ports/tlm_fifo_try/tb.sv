import uvm_pkg::*;
`include "compA.sv"
`include "compB.sv"


class my_test extends uvm_test;
	`uvm_component_utils(my_test);
	compA a;
	compB b;
	
	uvm_tlm_fifo #(int) tlm_fifo;
	
	function new (string name = "my_test",uvm_component parent = null);
		super.new (name,parent);
	endfunction : new
	
	function void build_phase (uvm_phase phase);
		super.build_phase(phase);
		a=compA::type_id::create("a",this);
		b=compB::type_id::create("b",this);
		tlm_fifo=new ("tlm_fifo",this,3);
	endfunction : build_phase
	
	function void connect_phase (uvm_phase phase);
		super.connect_phase(phase);
		a.put_port.connect(tlm_fifo.put_export); //first is the "port" port object, here b , second is the export 
		b.get_port.connect(tlm_fifo.get_export); //first is the "port" port object, here b , second is the export 
	endfunction : connect_phase
	
	task run_phase(uvm_phase phase); 
		super.run_phase(phase);
		phase.raise_objection(this);
		 #1000;
		phase.drop_objection(this);
	endtask

endclass


module tb;
import uvm_pkg::*;


initial begin
	run_test("my_test");
end


endmodule




