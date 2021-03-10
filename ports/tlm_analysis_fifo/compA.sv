//Producer is having uvm_analysis_port for writing data to consumer

class compA extends uvm_component;
`uvm_component_utils (compA);

//put blocking port
uvm_analysis_port #(int) analyis_port;

int b; 

function new (string name="compA",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_port=uvm_blocking_get_port::type_id::create("port_port",this);
		analyis_port=new ("analyis_port",this);
endfunction

//run task implementation
task run_phase(uvm_phase phase); 
	super.run_phase(phase);
	repeat(1)begin
	 b=$urandom_range(0,10);
	 $display("compA wrote :%d",b);
	 analyis_port.write(b);
	end
endtask

endclass : compA
