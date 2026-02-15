`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/02/13 21:25:05
// Design Name: 
// Module Name: controller
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


module controller(
    input [6:0] opcode,
    input [2:0] funct3,
    input funct7_30, //第30位，决定加减法
    output reg  write_en,
    output reg  alu_src, //alu选0寄存器还是1立即数
    output reg  [3:0] alu_op
    );
    always @(*)
    begin
        case(opcode)
        7'b0110011:
        begin
            write_en = 1'b1;
            alu_src = 1'b0;
            case(funct3)
                3'b000: alu_op = (funct7_30) ? 4'b0001 : 4'b0000;//减、加
                3'b111: alu_op = 4'b0010;//and
                3'b110: alu_op = 4'b0011;//or
            endcase
        end
        7'b0010011:
        begin
            write_en = 1'b1;
            alu_src = 1'b1;
            case(funct3)
                3'b000: alu_op = 4'b0000;
                3'b111: alu_op = 4'b0010;
                3'b110: alu_op = 4'b0011;
            endcase
        end
        default:
        begin
            write_en = 1'b0;
            alu_src = 1'b0;
            alu_op = 4'b0000;
        end
        endcase
    end
endmodule
