`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/02/14 20:10:27
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst_n
    );
    wire [31:0] curr_pc;
    wire [31:0] next_pc;
    wire [31:0] inst;
    wire write_en;
    wire alu_src;
    wire [3:0] alu_op;
    wire [31:0] rs1_data;
    wire [31:0] rs2_data;
    wire [31:0] imm_ext;
    wire [31:0] alu_in_b;
    wire [31:0] alu_res;
    pc u_pc(
        .clk     (clk),
        .rst_n   (rst_n),
        .curr_pc (curr_pc)
    );
    controller u_ctrl(
        .opcode    (inst[6:0]),
        .funct3    (inst[14:12]),
        .funct7_30 (inst[30]),
        .write_en  (write_en),
        .alu_src   (alu_src),
        .alu_op    (alu_op)
    );
    imm_gen u_imm(
        .inst    (inst),
        .imm_ext (imm_ext)
    );
    regfile u_regs(
        .clk      (clk),
        .write_en (write_en),
        .r_addr1  (inst[19:15]),
        .r_addr2  (inst[24:20]),
        .w_addr   (inst[11:7]),
        .w_data   (alu_res),
        .data1    (rs1_data),
        .data2    (rs2_data)
    );
    assign alu_in_b = (alu_src) ? imm_ext : rs2_data;
    alu u_alu(
        .a      (rs1_data),
        .b      (alu_in_b),
        .alu_op (alu_op),
        .res    (alu_res)
    );
    IMem u_imem(
        .addr (curr_pc),
        .inst (inst)
    );
endmodule
