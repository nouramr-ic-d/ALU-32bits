
module ALU(
    
        input [15:0] A,
        input [15:0] B,
        input [2:0] op ,
        output reg[31:0]Alu_out
 
      
    );
    
    always@(*)
    begin
             case(op)
             3'b000 : Alu_out=A+B;
             3'b001 : Alu_out=A-B;
             3'b010 : Alu_out=A*B;
             3'b011: Alu_out={A%B , A/B};
             3'b100 : Alu_out=A|B;
             3'b101 : Alu_out=A&B;
             3'b110 : Alu_out=~A;
             3'b111 : Alu_out=~B;
             default: Alu_out=0;
             endcase
        
    
 end

endmodule
