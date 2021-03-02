//Consumer is having "port" port 
class compB extends uvm_component;
`uvm_component_utils (compB);
//get blocking port
uvm_blocking_get_port #(int) get_port;

int out; 

function new (string name="compB",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_port=uvm_blocking_get_port::type_id::create("port_port",this);
		get_port=new ("port_port",this);
endfunction

//run task implementation
task run_phase(uvm_phase phase); 
	super.run_phase(phase);
	 get_port.get(out);
	 $display(out);
endtask



endclass : compB
