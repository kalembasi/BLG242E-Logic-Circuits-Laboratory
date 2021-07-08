`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ITU BBF
// Engineer: Kadir Ozlem
// 
// Create Date: 04/30/2021 04:44:25 PM
// Design Name: ROM Module
// Module Name: modules
// Project Name: Experiment 7 - LogicLab2021
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

//Please put it in your modules.v 
module ProgramMemory(
    input wire[7:0] address,
    output reg[15:0] instruction
    );
    //Declaration of the ROM area
    reg [15:0] ROM_Data [0:255];
    //Read ROM data from the file
    initial $readmemh("ROM.mem", ROM_Data);
    //Read the selected data from ROM
    always @(*) begin
        instruction <= ROM_Data[address];
    end
endmodule
