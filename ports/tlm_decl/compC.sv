//Producer is having "port" port 

class compC extends uvm_component;
`uvm_component_utils (compC);

//put blocking port
uvm_blocking_put_port #(int) put_port_1;

int b=10; 

function new (string name="compC",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_port=uvm_blocking_get_port::type_id::create("port_port",this);
		put_port_1=new ("put_port_1",this);
endfunction

//run task implementation
task run_phase(uvm_phase phase); 
	super.run_phase(phase);
	 put_port_1.put(b);
endtask

endclass : compC
