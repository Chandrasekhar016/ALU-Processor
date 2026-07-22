`timescale 1ns / 1ps
module alu_a_tb();
    reg [7:0] a, b;
    reg [2:0] opcode;
    wire [7:0] res;
    wire carry, zero, overflow;
    alu_a dut( .a(a), .b(b), .opcode(opcode), .res(res), .carry(carry), .zero(zero), .overflow(overflow) );  //Instantiate the ALu  
    initial begin
    //Test 1: Addition
    a = 8'h7;
    b = 8'd3;
    opcode = 3'b000; #10;
    //Test 2:Subtraction
    a = 8'h7;
    b = 8'd3;
    opcode = 3'b001; #10;
    //Test 3:AND
    a = 8'b00000111;
    b = 8'b00000011;
    opcode = 3'b010; #10;
    //Test 4:OR
    a = 8'b00000111;
    b = 8'b00000011;
    opcode = 3'b011; #10;
    //Test 5:xor
    a = 8'b00000111;
    b = 8'b00000011;
    opcode = 3'b100; #10;
    //Test 6:nOt
    a = 8'b00000111;
    opcode = 3'b101; #10;   
    //Test 7: Increment
    a = 8'd7;
    opcode = 3'b110; #10;
    //Test 8: Decrement
    a = 8'd7;
    opcode = 3'b110; #10;
    $display("a = %0d, b = %0d, opcode = %b, res = %0d, carry = %b, zero = %b, overflow = %b", a,b,opcode,res,carry,zero,overflow);
    $finish;
    end
endmodule
