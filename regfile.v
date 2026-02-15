`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/02/12 23:57:31
// Design Name: 
// Module Name: regfile
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


module regfile(
    input clk,
    input write_en,
    input [4:0] r_addr1, r_addr2,
    input [4:0] w_addr,
    input [31:0] w_data,
    output [31:0] data1, data2
    );
    reg [31:0] rf [31:0];
    assign data1 = (r_addr1 == 5'b0) ? 32'b0 : rf[r_addr1];
    assign data2 = (r_addr2 == 5'b0) ? 32'b0 : rf[r_addr2];
    always @(posedge clk)
    begin
        if (write_en)
        begin
            rf[w_addr] <= w_data;
        end
    end
endmodule
