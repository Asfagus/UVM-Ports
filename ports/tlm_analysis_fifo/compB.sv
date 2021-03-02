//Consumer is having uvm_tlm_analysis_fifo port for reading data from producer
 
class compB extends uvm_component;
	`uvm_component_utils (compB)
//analysis fifo
uvm_tlm_analysis_fifo #(int) analyis_fifo;

int out;

function new (string name="compB",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_export=uvm_blocking_get_imp::type_id::create("export_port",this);
	analyis_fifo=new ("analyis_fifo",this);
endfunction

//run task implementation
task run_phase(uvm_phase phase); 
	super.run_phase(phase);
	repeat(3)begin
	 analyis_fifo.get(out);
	 $display("compB read :%d",out);
	end
endtask


endclass : compB

