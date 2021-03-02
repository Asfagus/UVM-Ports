//Q: Is get task system defined as virtual?
//Producer is having "port" port 

class compA extends uvm_component;
`uvm_component_utils (compA);

//put blocking port
uvm_blocking_put_port #(int) put_port;

int b=7; 

function new (string name="compA",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_port=uvm_blocking_get_port::type_id::create("port_port",this);
		put_port=new ("port_port",this);
endfunction

//run task implementation
task run_phase(uvm_phase phase); 
	super.run_phase(phase);
	 put_port.put(b);
endtask

endclass : compA
