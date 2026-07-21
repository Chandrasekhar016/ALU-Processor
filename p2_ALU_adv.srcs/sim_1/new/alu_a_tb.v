`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2026 05:26:45 PM
// Design Name: 
// Module Name: alu_a_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_a_tb();
    reg [7:0]a;
    reg [7:0]b;
    reg [2:0]opcode;
    wire [7:0]res;
    wire carry;
    wire zero;
    wire overflow;
    
    //Instantiate the ALu
    alu_a dut( .a(a), .b(b), .opcode(opcode), .res(res), .carry(carry), .zero(zero), .overflow(overflow) );
    
    initial begin
    
    //Test 1: Addition
    a = 8'h20;
    b = 8'd10;
    opcode = 3'b000;
    #10;
    
    //Test 2:Subtraction
    a = 8'h20;
    b = 8'd5;
    opcode = 3'b001;
    #10;
    
    //Test 3:AND
    a = 8'b11000101;
    b = 8'b11110001;
    opcode = 3'b010;
    #10;
    
    //Test 4:OR
    a = 8'b10101101;
    b = 8'b10011101;
    opcode = 3'b011;
    #10;
    
    //Test 5:xor
    a = 8'b00101001;
    b = 8'b01001101;
    opcode = 3'b100;
    #10;
    
    //Test 6:nOt
    a = 8'b10101101;
    opcode = 3'b101;
    #10;
    
    //Test 7: Increment
    a = 8'd25;
    opcode = 3'b110;
    #10;
    
    //Test 8: Decrement
    a = 8'd20;
    opcode = 3'b110;
    #10;
    $display("a = %0d, b = %0d, opcode = %b, res = %0d, carry = %b, zero = %b, overflow = %b", a,b,opcode,res,carry,zero,overflow);

    $finish;
    end

endmodule
