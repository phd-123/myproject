`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/02/14 16:31:31
// Design Name: 
// Module Name: pc
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


module pc(
    input clk,
    input rst_n,
    output reg [31:0] curr_pc
    );
    always @(posedge clk or negedge rst_n)
    begin
        if(!rst_n)
            curr_pc <= 32'b0;
        else
            curr_pc <= curr_pc + 4;
    end
endmodule
