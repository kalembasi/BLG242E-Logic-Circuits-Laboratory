`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 20:27:25
// Design Name: 
// Module Name: experiment_7
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

module tsb(//8-bit three state buffer 

    input [15:0] A, 
    input E, //control input/enable

    output reg [15:0]out
);

    always @(A or E) begin 
      if (E) begin
          out = A; 
      end
      else begin
          out = 16'bZ; //Z means high-impedence
      end 
    end 
endmodule 

module decoder(//part1
    input A,
    input B,
    input C,
    input D,
    input E, //enable
    output [15:0] out
);

assign out[0]=  (~A) & (~B) & (~C) & (~D) & (E) ;
assign out[1]=  (~A) & (~B) & (~C) & (D) & (E) ;
assign out[2]=  (~A) & (~B) & (C) & (~D) & (E) ;
assign out[3]=  (~A) & (~B) & (C) & (D) & (E) ;
assign out[4]=  (~A) & (B) & (~C) & (~D) & (E) ;
assign out[5]=  (~A) & (B) & (~C) & (D) & (E) ;
assign out[6]=  (~A) & (B) & (C) & (~D) & (E) ;
assign out[7]=  (~A) & (B) & (C) & (D) & (E) ;

assign out[8]=  (A) & (~B) & (~C) & (~D) & (E) ;
assign out[9]=  (A) & (~B) & (~C) & (D) & (E) ;
assign out[10]= (A) & (~B) & (C) & (~D) & (E) ;
assign out[11]= (A) & (~B) & (C) & (D) & (E) ;
assign out[12]= (A) & (B) & (~C) & (~D) & (E) ;
assign out[13]= (A) & (B) & (~C) & (D) & (E) ;
assign out[14]= (A) & (B) & (C) & (~D) & (E) ;
assign out[15]= (A) & (B) & (C) & (D) & (E) ;
endmodule

module register_line(//part1
    input [15:0] dataIn,
    input lineselect,
    input clock,
    input reset,
    output [15:0] out
);

reg [15:0] stored_data;
reg [15:0] out1;
    
    always @(negedge reset)begin
        stored_data <= 16'h00;
    end
    
    always @(posedge clock)begin

        if(clock && lineselect) begin
            stored_data <= dataIn;
        end
    end
    
    always @(*) begin
        if(lineselect) begin
            out1 <= stored_data;
        end
        else begin
            out1 <= 16'hZZ;
        end
    end
    
    assign out=out1;
endmodule

module register_file(//part2
    input [3:0] selA,
    input [3:0] selB,
    input [3:0] selWrite,
    input [15:0] dataIn,
    input reset,
    input writeEnable,
    input clock,
    output [15:0] dataA,
    output [15:0] dataB
);

    wire [15:0]dec_out;

    decoder D(selWrite[0], selWrite[1], selWrite[2], selWrite[3], writeEnable, dec_out);

        wire [15:0]reg_out1;
        wire [15:0]reg_out2;
        wire [15:0]reg_out3;
        wire [15:0]reg_out4;
        wire [15:0]reg_out5;
        wire [15:0]reg_out6;
        wire [15:0]reg_out7;
        wire [15:0]reg_out8;
        wire [15:0]reg_out9;
        wire [15:0]reg_out10;
        wire [15:0]reg_out11;
        wire [15:0]reg_out12;
        wire [15:0]reg_out13;
        wire [15:0]reg_out14;
        wire [15:0]reg_out15;
        wire [15:0]reg_out16;

    register_line RL1(dataIn, dec_out[0], clock, reset, reg_out1);
    register_line RL2(dataIn, dec_out[1], clock, reset, reg_out2);
    register_line RL3(dataIn, dec_out[2], clock, reset, reg_out3);
    register_line RL4(dataIn, dec_out[3], clock, reset, reg_out4);
    register_line RL5(dataIn, dec_out[4], clock, reset, reg_out5);
    register_line RL6(dataIn, dec_out[5], clock, reset, reg_out6);
    register_line RL7(dataIn, dec_out[6], clock, reset, reg_out7);
    register_line RL8(dataIn, dec_out[7], clock, reset, reg_out8);
    register_line RL9(dataIn, dec_out[8], clock, reset, reg_out9);
    register_line RL10(dataIn, dec_out[9], clock, reset, reg_out10);
    register_line RL11(dataIn, dec_out[10], clock, reset, reg_out11);
    register_line RL12(dataIn, dec_out[11], clock, reset, reg_out12);
    register_line RL13(dataIn, dec_out[12], clock, reset, reg_out13);
    register_line RL14(dataIn, dec_out[13], clock, reset, reg_out14);
    register_line RL15(dataIn, dec_out[14], clock, reset, reg_out15);
    register_line RL16(dataIn, dec_out[15], clock, reset, reg_out16);

    wire [15:0]selA_out;
    decoder D1(selA[0], selA[1], selA[2], selA[3], 1, selA_out);

tsb TSB0(reg_out1,selA_out[0],dataA);
tsb TSB1(reg_out2,selA_out[1],dataA);
tsb TSB2(reg_out3,selA_out[2],dataA);
tsb TSB3(reg_out4,selA_out[3],dataA);
tsb TSB4(reg_out5,selA_out[4],dataA);
tsb TSB5(reg_out6,selA_out[5],dataA);
tsb TSB6(reg_out7,selA_out[6],dataA);
tsb TSB7(reg_out8,selA_out[7],dataA);
tsb TSB8(reg_out9,selA_out[8],dataA);
tsb TSB9(reg_out10,selA_out[9],dataA);
tsb TSB10(reg_out11,selA_out[10],dataA);
tsb TSB11(reg_out12,selA_out[11],dataA);
tsb TSB12(reg_out13,selA_out[12],dataA);
tsb TSB13(reg_out14,selA_out[13],dataA);
tsb TSB14(reg_out15,selA_out[14],dataA);
tsb TSB15(reg_out16,selA_out[15],dataA);

wire [15:0]selB_out;
decoder D2(selB[0], selB[1], selB[2], selB[3], 1, selB_out);

tsb TSB16(reg_out1,selB_out[0],dataB);
tsb TSB17(reg_out2,selB_out[1],dataB);
tsb TSB18(reg_out3,selB_out[2],dataB);
tsb TSB19(reg_out4,selB_out[3],dataB);
tsb TSB20(reg_out5,selB_out[4],dataB);
tsb TSB21(reg_out6,selB_out[5],dataB);
tsb TSB22(reg_out7,selB_out[6],dataB);
tsb TSB23(reg_out8,selB_out[7],dataB);
tsb TSB24(reg_out9,selB_out[8],dataB);
tsb TSB25(reg_out10,selB_out[9],dataB);
tsb TSB26(reg_out11,selB_out[10],dataB);
tsb TSB27(reg_out12,selB_out[11],dataB);
tsb TSB28(reg_out13,selB_out[12],dataB);
tsb TSB29(reg_out14,selB_out[13],dataB);
tsb TSB30(reg_out15,selB_out[14],dataB);
tsb TSB31(reg_out16,selB_out[15],dataB);

endmodule

module ALU(//part3
    input [15:0] srcA,
    input [15:0] srcB,
    input [2:0] Op,
    input clock,
    input reset,
    output reg zeroFlag,
    output reg [15:0] dst
);

reg flag;

always @(*) begin
    case(Op) 
        3'h0: dst <= srcA & srcB; 
        3'h1: dst <= srcA | srcB; 
        3'h2: begin
            dst <= srcA + srcB;
            if(dst==0) begin
                flag=1;
            end
        end
        3'h3: begin
            dst <= srcA - srcB;
            if(dst==0) begin
                flag=1;
            end
        end
        
        3'h4: dst <= srcA ^ srcB;
        3'h5: dst <= srcA >> srcB;
        3'h6: dst <= srcA << srcB;
        3'h7: dst <= srcB;
        
        endcase
end

always @(negedge reset) begin
    zeroFlag = 1'h0;
end

always @(posedge clock)begin
    zeroFlag = flag;
end
endmodule

module inst_decoder(//part4
    input [15:0] instruction,
    output [3:0] opcode,
    output [3:0] selWrite,
    output [3:0] selA,
    output [3:0] selB,
    output [15:0] fourBitImmediate,
    output [15:0] eightBitImmediate,
    output writeEnable,
    output isLoad,
    output isImmediate,
    output isBranch,
    output isBranchNotEqual,
    output isBranchEqual
);

assign opcode = instruction[3:0];

assign writeEnable = (opcode == 4'd1) | (opcode == 4'd2) | (opcode == 4'd3) | (opcode == 4'd4) | (opcode == 4'd5) | (opcode == 4'd6) | (opcode == 4'd7) | (opcode == 4'd8) | (opcode == 4'd9) | (opcode == 4'd10) | (opcode == 4'd11) ? 1:0;
assign isLoad = (opcode == 4'd7) ? 1:0;
assign isImmediate = (opcode == 4'd8) | (opcode == 4'd9) | (opcode == 4'd10) ? 1:0;
assign isBranch = (opcode == 4'd13) | (opcode == 4'd14) | (opcode == 4'd15) ? 1:0;
assign isBranchNotEqual = (opcode == 4'd14) ? 1:0; 
assign isBranchEqual = (opcode == 4'd15) ? 1:0; 

assign selWrite = (opcode == 4'd1) | (opcode == 4'd2) | (opcode == 4'd3) | (opcode == 4'd4) | (opcode == 4'd5) | (opcode == 4'd6) | (opcode == 4'd7) | (opcode == 4'd8) | (opcode == 4'd9) | (opcode == 4'd10) | (opcode == 4'd11) ? instruction[7:4]: 4'bZ;

assign selA = (opcode == 4'd1) | (opcode == 4'd2) | (opcode == 4'd3) | (opcode == 4'd4) | (opcode == 4'd5) | (opcode == 4'd6) | (opcode == 4'd8) | (opcode == 4'd9) | (opcode == 4'd10) | (opcode == 4'd11) ? instruction[11:8] : 4'bZ;
assign selB = (opcode == 4'd1) | (opcode == 4'd2) | (opcode == 4'd3) | (opcode == 4'd4) | (opcode == 4'd5) | (opcode == 4'd6) | (opcode == 4'd11)? instruction[15:12] : 4'bZ;

assign fourBitImmediate = (opcode == 4'd8) | (opcode == 4'd9) | (opcode == 4'd10) ? {12'd0,instruction[15:12]}:16'bZ;
assign eightBitImmediate = (opcode == 4'd7) | (opcode == 4'd13) | (opcode == 4'd14) | (opcode == 4'd15) ?{8'd0, instruction[15:8]}:16'bZ;
endmodule

module program_counter(//part5
    input reset,
    input clock,
    input zeroFlag,
    input isBranch,
    input isBranchEqual,
    input isBranchNotEqual,
    input [7:0] immediateAddress,
    output reg [7:0] PC
);

    always @(negedge reset) begin
        PC <=8'h0;
    end

    always @(posedge clock) begin
   
        if(isBranch==1 && clock)begin
            PC <= immediateAddress;
        end

        else if ((isBranchEqual==1 && zeroFlag==1 && clock) || (isBranchNotEqual==1 && zeroFlag==0 && clock))begin
            PC <= PC + immediateAddress; 
        end
        else begin
            PC <= PC + 8'd1;
        end
    end
endmodule

module mini_computer(//part6
    input clock,
    input reset,
    output [15:0] instruction_o,
    output [15:0] A_data_o,
    output [15:0] B_data_o,
    output [15:0] dst_o,
    output [7:0] PC_o,
    output [15:0] srcB_o
);

wire writeEnable;
wire isLoad;
wire isImmediate;
wire isBranch;
wire isBranchNotEqual;
wire isBranchEqual;
wire [7:0] PC;
wire [15:0] instruction;
wire [3:0] opcode;
wire [3:0] selWrite;
wire [3:0] selA;
wire [3:0] selB;
wire [15:0] fourBitImmediate;
wire [15:0] eightBitImmediate;
wire zeroFlag;
wire [15:0] dst;
wire [15:0] dataA;
wire [15:0] dataB;
wire [15:0] srcB;

ProgramMemory PM(pc,instruction);

inst_decoder ID(instruction,opcode,selWrite,selA,selB,fourBitImmediate, eightBitImmediate,writeEnable,isLoad,isImmediate,isBranch,isBranchNotEqual,isBranchEqual);

register_file RF(selA, selB, selWrite, dst, reset, writeEnable, clock, dataA,dataB);

assign srcB = (isLoad | isBranch) ? eightBitImmediate: (isImmediate)? fourBitImmediate:((opcode == 4'd1) | (opcode == 4'd2) | (opcode == 4'd3) | (opcode == 4'd4) | (opcode == 4'd5) | (opcode == 4'd6) | (opcode == 4'd11))? dataB:4'bZ;

ALU A(dataA,srcB,opcode[2:0],clock,reset,zeroFlag,dst);

program_counter PC1(reset, clock, zeroFlag, isBranch,isBranchEqual, isBranchNotEqual, eightBitImmediate[8:0],PC);

assign srcB_o = srcB;
assign dst_o = dst;
assign A_data_o = dataA;
assign B_data_o = dataB;
assign PC_o= PC;
assign instruction_o = instruction;

endmodule