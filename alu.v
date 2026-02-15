`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/02/10 12:12:45
// Design Name: 
// Module Name: alu
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


module alu(
input [31:0] a,b,
input [3:0] alu_op,
output reg [31:0] res
    );
always @(*)
begin
    case(alu_op)
    4'b0000: res = a + b;
    4'b0001: res = a - b;
    4'b0010: res = a & b;
    4'b0011: res = a | b;
    default: res = 0;
    endcase
end
endmodule
