//Consumer is having export port 

//Im gonna be receiving multiple ports 
`uvm_blocking_put_imp_decl(_a); //im gonna be coming from compA
`uvm_blocking_put_imp_decl(_c); //im gonna be coming from compC

class compB extends uvm_component;
	`uvm_component_utils (compB)

//custom put blocking export
uvm_blocking_put_imp_a #(int,compB) put_export;
uvm_blocking_put_imp_c #(int,compB) put_export_1;

function new (string name="compB",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase (uvm_phase phase);
	super.build_phase(phase);
	//typeid doesnot work
	//get_export=uvm_blocking_get_imp::type_id::create("export_port",this);
	put_export=new ("export_port",this);
	put_export_1=new ("export_port_1",this);
	
endfunction

//put task implementation for compA
task put_a(input int b); 
 	 $display("I am reading from compA %d",b);
endtask : put_a

//put task implementation for compC
task put_c(input int b); 
 	 $display("I am reading from compC %d",b);
endtask : put_c


endclass : compB

