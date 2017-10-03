module testebench_alu();
	reg[31:0] a,b;
	reg[1:0] ALUControl;
	wire[31:0] Result;
	wire[3:0] ALUFlags;

alu u1(a, b, ALUControl, Result, ALUFlags);

initial begin
    $monitor("  %b [%b] %b = %b  [%b]", a, ALUControl, b, Result, ALUFlags);

    $display("TESTE SUM");
    a <= 'h 1FFF_FFFF; b <= 'h 1FFF_FFFF; ALUControl <= 'b 00;
    #100;

    $display("TESTE PORTA AND");
    a <= 'h FF0F_FFFF; b <= 'h FFFF_FFFF; ALUControl <= 'b 10;
    #100;

    $display("TESTE PORTA OR");
    a <= 'h F0F0_F0F0; b <= 'h 0F0F_0F0F; ALUControl <= 'b 11;
    #100;
  end
endmodule


	