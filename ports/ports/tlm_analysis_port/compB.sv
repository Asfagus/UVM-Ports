//Consumer is having export port 
class compB extends uvm_component;
	`uvm_component_utils (compB)
		
//analysis "export" port
uvm_analysis_imp #(int,compB) analysis_export;

function new (string name="compB",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_export=uvm_blocking_get_imp::type_id::create("export_port",this);
	analysis_export=new ("analysis_export",this);
endfunction

//write function implementation
function void write(input int b); 
 	 $display("displaying from B",b);
endfunction : write

endclass : compB

