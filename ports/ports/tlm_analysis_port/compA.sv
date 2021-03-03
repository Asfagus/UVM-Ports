//Producer is having "port" port 

class compA extends uvm_component;
`uvm_component_utils (compA);

//analysis port
uvm_analysis_port #(int) analysis_port;

int b=12; 

function new (string name="compA",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_port=uvm_blocking_get_port::type_id::create("port_port",this);
	analysis_port=new ("analysis_port",this);
endfunction

//run task implementation
task run_phase(uvm_phase phase); 
	super.run_phase(phase);
	 analysis_port.write(b);
endtask

endclass : compA
