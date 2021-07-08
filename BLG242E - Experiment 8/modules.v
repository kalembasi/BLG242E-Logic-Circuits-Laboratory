`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.05.2021 19:49:59
// Design Name: 
// Module Name: exp8
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
module CharDecoder(
    input [7:0] char, //ASCII code of the character
    output [25:0] decodedChar //Decoded output of the character
);
    wire [7:0] tempChar;
    assign tempChar=char-8'd65;

    reg [25:0] tempDecoded;
    integer x=0;
    integer y=1;
    integer k;
    
    always @(*) begin
        tempDecoded=26'd0;

        for (k=0; k<8; k=k+1)begin
            x=x+tempChar[k]*y;
            y=y*2;
        end
        tempDecoded[x]=1;
    end

    assign decodedChar=tempDecoded;

endmodule

module CharEncoder(
    input [25:0] decodedChar, //Decoded input of the character
    output [7:0] char //ASCII code of the character
);
    reg [7:0]tempChar;
    integer k;
    integer x;

    always@(*)begin
        k=0;
        tempChar=8'd0;

        for(k=0; k<26; k=k+1)begin
            if(decodedChar[k]==1)begin
                x=k;
            end
        end
        k=0;

        while(x!=0)begin
            if(x%2==1)begin
                tempChar[k]=1;
            end

            k=k+1;
            x=x/2;
        end
    end

    assign char=tempChar+8'd65;

endmodule

module CircularRightShift(
    input [25:0] data,
    input [4:0] shiftAmount,
    output [25:0] out
);
    
    reg[7:0]k;
    wire [7:0]tempData;

    CharEncoder CE(data, tempData);

    always @(*) begin
        k=tempData;
        k=k-shiftAmount;

        while(k<65)begin
            k=k+1;
        end
    end

    CharDecoder CD(k,out);

endmodule

module CircularLeftShift(
    input [25:0] data,
    input [4:0] shiftAmount,
    output [25:0] out
);
    wire [7:0]tempData;
    reg [7:0]k;
    
    CharEncoder CE(data, tempData);

    always @(*) begin
        k=tempData;
        k=k+shiftAmount;

        while(k>90)begin
            k=k-26;
        end
    end

    CharDecoder CD(k, out);
endmodule

module CaesarEncryption(
    input [7:0] plainChar,
    input [4:0] shiftCount,
    output [7:0] chipherChar
);

    wire [24:0] tempChar;
    wire [24:0] tempChar2;

    CharDecoder D(plainChar,tempChar);
    CircularRightShift RS(tempChar, shiftCount,tempChar2);
    CharEncoder E(tempChar2, chipherChar);

endmodule

module CaesarDecryption(
    input [7:0] chipherChar,
    input [4:0] shiftCount,
    output [7:0] decryptedChar
);

    wire [24:0] tempChar;
    wire [24:0] tempChar2;

    CharDecoder D(chipherChar,tempChar);
    CircularLeftShift LS(tempChar, shiftCount,tempChar2);
    CharEncoder E(tempChar2, decryptedChar);

endmodule

module CaesarEnvironment(
    input [7:0] plainChar,
    input [4:0] shiftCount,
    output [7:0] chipherChar,
    output [7:0] decryptedChar
);

    wire [7:0] tempChipherChar;

    CaesarEncryption CE(plainChar,shiftCount,tempChipherChar);
    CaesarDecryption CD(tempChipherChar, shiftCount, decryptedChar);

    assign chipherChar=tempChipherChar;
endmodule

module VigenereEncryption(
    input [7:0] plainChar,
    input [79:0] keyInput,
    input LOAD,
    input CLK,
    output reg [7:0] chipherChar
);

reg [9:0] keyRegister;

always @(posedge CLK) begin
    if(LOAD)begin
        keyRegister=keyInput;
    end

    else begin
        // Shift key register only one character
        chipherChar=(plainChar+keyRegister)%26; //C_i = (P_i + K_i) mod 26
    end
end

endmodule

module VigenereDecryption(
    input [7:0] chipherChar,
    input [79:0] keyInput,
    input LOAD,
    input CLK,
    output reg [7:0] decryptedChar
);

reg [9:0] keyRegister;

always @(posedge CLK) begin
    if(LOAD)begin
        keyRegister=keyInput;
    end

    else begin
        // Shift key register only one character
        decryptedChar=(chipherChar-keyRegister)%26; //D_i = (C_i - K_i) mod 26
    end
end

endmodule

module VigenereEnvironment(
    input [7:0] plainChar,
    input [79:0] keyInput,
    input LOAD,
    input CLK,
    output [7:0] chipherChar,
    output [7:0] decryptedChar
);

    wire [7:0] tempChipherChar;

    VigenereEncryption VE(plainChar, keyInput, LOAD, CLK, tempChipherChar);
    VigenereDecryption VD(tempChipherChar, keyInput, LOAD, CLK, decryptedChar);
    
    assign chipherChar=tempChipherChar;
endmodule


