`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2021 19:51:56
// Design Name: 
// Module Name: exp8_test
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


module testCharDecoder();
    reg [7:0] char;
    wire [25:0] decodedChar;

    CharDecoder uut(char, decodedChar);

    initial begin
        char=8'b1000001;               #100;//65-A
        char=8'b1000111;               #100;//71-G
        char=8'b1010000;               #100;//80-P
        char=8'b1011010;               #100;//90-Z

    end
endmodule

module testCharEncoder();
    reg [25:0] decodedChar;
    wire [7:0] char;

    CharEncoder uut(decodedChar, char);

    initial begin
        decodedChar=26'h0000020;                #100;//F
        decodedChar=26'h0000400;                #100;//K
        decodedChar=26'h0020000;                #100;//R
    end
endmodule

module testCircularRightShift();
    reg [25:0] data;
    reg [4:0] shiftAmount;
    wire [25:0] out;

    CircularRightShift uut(data, shiftAmount, out);

    initial begin
        data=26'h0000020;        shiftAmount=00011;             #100;
        data=26'h0000020;        shiftAmount=01111;             #100;
        data=26'h0000400;        shiftAmount=00110;             #100;
        data=26'h0000400;        shiftAmount=01010;             #100;
    end
endmodule

module testCircularLeftShift();
    reg [25:0] data;
    reg [4:0] shiftAmount;
    wire [25:0] out;

    CircularLeftShift uut(data, shiftAmount, out);

    initial begin
        data=26'h0000020;        shiftAmount=5'h1;             #100;
        data=26'h0000020;        shiftAmount=5'h2;             #100;
        data=26'h0000400;        shiftAmount=5'h10;            #100;
        data=26'h0000400;        shiftAmount=5'h12;            #100;
    end
endmodule

module testCaesarEnvironment();
    reg [7:0] plainChar;
    reg [4:0] shiftCount;
    wire [7:0] chipherChar;
    wire [7:0] decryptedChar;

    CaesarEnvironment uut(plainChar, shiftCount, chipherChar, decryptedChar);

    initial begin
        plainChar=8'b1000001;         shiftCount=00011;        #100;
        plainChar=8'b1000111;         shiftCount=00110;        #100;
        plainChar=8'b1010000;         shiftCount=01000;        #100;
        plainChar=8'b1011010;         shiftCount=01001;        #100;

    end
endmodule

module testVigenereEnvironment();
    reg [7:0] plainChar;
    reg [79:0] keyInput;
    reg LOAD;
    reg CLK;
    wire [7:0] chipherChar;
    wire [7:0] decryptedChar;

    VigenereEnvironment uut(plainChar, keyInput, LOAD, CLK, chipherChar, decryptedChar);

    initial begin
        CLK=0;
        plainChar=8'b1000001;          keyInput=79'b10;       LOAD=1;        #100;
        plainChar=8'b1000111;          keyInput=79'b10;       LOAD=0;        #100;
        plainChar=8'b1010000;          keyInput=79'b10;       LOAD=0;        #100;
        plainChar=8'b1011010;          keyInput=79'b10;       LOAD=0;        #100;
    end

    always
    #50 CLK = ~CLK;
endmodule
