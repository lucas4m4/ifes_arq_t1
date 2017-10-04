module testebench_alu();
	reg[31:0] a,b;
	reg[1:0] ALUControl;
	wire[31:0] Result;
	wire[3:0] ALUFlags;
	integer file, i;
	reg mem[65:0];
alu u1(a, b, ALUControl, Result, ALUFlags);

initial begin
	file = $fopen("file_name.vec", "r");
end

initial begin
	$fread(mem, file);
end

initial begin
   for (i = 0; i < 2; i = i + 1) begin
    	ALUControl[i] = mem[i];
    end
    for (i = 2; i < 34; i = i + 1) begin
    	a[i-2] = mem[i];
    end
    for (i = 34; i < 66; i = i + 1) begin
    	b[i-34] = mem[i];
    end
end

initial  begin
     $dumpfile ("file_teste.vcd"); 
     $dumpvars; 
    end
initial begin
    $monitor("  %b [%b] %b = %b  [%b]", a, ALUControl, b, Result, ALUFlags);

    $display("TESTE SUM");
 
  
    #400;

    $display("TESTE PORTA AND");
    a <= 'h FF0F_FFFF; b <= 'h FFFF_FFFF; ALUControl <= 'b 10;
    #100;

    $display("TESTE PORTA OR");
    a <= 'h F0F0_F0F0; b <= 'h 0F0F_0F0F; ALUControl <= 'b 11;
    #100;
  end

endmodule


	
