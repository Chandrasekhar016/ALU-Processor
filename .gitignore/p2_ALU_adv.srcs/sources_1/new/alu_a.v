module alu_a(
    input [7:0]a,
    input [7:0]b,
    input [2:0]opcode,
    output reg [7:0]res,
    output reg carry,
    output reg zero,
    output reg overflow);
    always @(*) begin
    // Default values
    res   = 8'b00000000;
    carry    = 1'b0;
    overflow = 1'b0;
    case(opcode)
    3'b000: begin
        {carry, res} = a + b;
        overflow = (~(a[7] ^ b[7])) & (a[7] ^ res[7]);
    end                                     //Addition
    3'b001: begin
        {carry, res} = a - b;
        overflow = (a[7] ^ b[7]) & (a[7] ^ res[7]);
    end                                      //Subtraction
    3'b010: res= a & b;                      //AND
    3'b011: res= a | b;                      //OR
    3'b100: res= a ^ b;                      //XOR
    3'b101: res= ~a ;                        //NOT
    3'b110: begin {carry, res} = a + 1;
    overflow = (~a[7]) & res[7];
    end                                     //Increment
    3'b111: begin {carry,res} = a - 1 ;
    overflow = a[7] & (~res[7]);
    end                                     //Decrement
    default: begin
    res = 8'b0;
    carry = 0;
    overflow = 0;
    end
    endcase
    end
 endmodule
