//Producer is having export port 
class compA extends uvm_component;
	`uvm_component_utils (compA)
//get blocking export
uvm_blocking_get_imp #(int,compA) get_export;

function new (string name="compA",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_export=uvm_blocking_get_imp::type_id::create("export_port",this);
	get_export=new ("export_port",this);
endfunction

//get task implementation
task get(output int b); 
	 b=4;
endtask

endclass : compA
