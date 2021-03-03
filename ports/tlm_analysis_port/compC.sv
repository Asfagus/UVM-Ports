//Consumer is having export port 
class compC extends uvm_component;
	`uvm_component_utils (compC)
		
//analysis "export" port
uvm_analysis_imp #(int,compC) analysis_export_1;

function new (string name="compC",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_export=uvm_blocking_get_imp::type_id::create("export_port",this);
	analysis_export_1=new ("analysis_export_1",this);
endfunction

//write function implementation
function void write(input int b); 
 	 $display("displaying from C",b);
endfunction : write

endclass : compC

