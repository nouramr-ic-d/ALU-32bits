


module ALU_DUT( );

    reg[15:0] A2 , B2 ;
    reg [2:0] op ;
    wire [31:0] out;
    
    ALU A1( 
    .A(A2),
    .B(B2),
    .op(op),
    .Alu_out(out)
    
    );
    initial
    begin
    // Test case 1: Addition
     A2 = 16'b000 ;
     B2 = 16'b001 ;
     op = 000 ;
    #10;  // Wait 10ns for the output to stabilize
        if (out !== 32'd1) $display("Test case 1 failed");
     // Test case 2: Subtraction   
    #30 A2 = 16'd150 ;
        B2 = 16'd50 ;
        op = 001 ;
     // Test case 3: multiplication
    #20 A2 = 16'd160;
        B2 = 16'd2;
        op =010;
     // Test case 4:  division operation 
    #50 A2 = 16'd160;
        B2 = 16'd2;
        op = 011;
      // Test case 5: fractional division operation 
    #50 A2 = 16'd150;
        B2=16'd7;
        op =011;
       // Test case 6:  AND
    #40   A2 = 8'b 0001_0111;
          B2 = 8'b 0001_1110;
          op = 100; 

         // Test case 7:  OR
    #40  A2 = 8'b 0100_0001;
         B2 = 8'b 0000_0010;
         op = 101;
         // Test case 8:  Not A
    #20 A2 = 16'd100 ;
        B2 = 16'd20 ;
        op =110;
        // Test case 9:  Not B
    #10  A2 = 16'd10 ;
         B2 = 16'd20 ;
         op = 111;
    #20 $stop;
    end
     // 5) Display the output response (text or graphics (or both))
          initial
          begin
              $monitor("time = %3d: A2 = %d \t B2 = %d \t op = %1b \t out=%d ",
                       $time, A2, B2, op, out);
          end

endmodule
