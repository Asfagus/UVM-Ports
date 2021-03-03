//Producer is having "port" port 

class compA extends uvm_component;
`uvm_component_utils (compA);

// tlm fifo port
uvm_blocking_put_port #(int) put_port;

int b; 

function new (string name="compA",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_port=uvm_blocking_get_port::type_id::create("port_port",this);
		put_port=new ("port_port",this);
endfunction

//run task implementation for fifo
task run_phase(uvm_phase phase); 
	super.run_phase(phase);
	 repeat (3) begin
	 	b=$urandom_range(1,10);	
	 	put_port.put(b);
	 	$display($time," compA writes %d",b);
	 end
endtask

endclass : compA
