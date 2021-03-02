//Consumer is having export port 
class compB extends uvm_component;
	`uvm_component_utils (compB)
//put blocking export
uvm_blocking_put_imp #(int,compB) put_export;

function new (string name="compB",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_export=uvm_blocking_get_imp::type_id::create("export_port",this);
	put_export=new ("export_port",this);
endfunction

//put task implementation
task put(input int b); 
 	 $display(b);
endtask

endclass : compB

