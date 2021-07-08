`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2021 13:36:26
// Design Name: 
// Module Name: experiment_3
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


module andgate(
    input  input1,//a 
    input  input2,//b 
    output  out
);

    assign out = input1 & input2;//ab
endmodule

module andgate3(
    input  input1,//a 
    input  input2,//b 
    input input3,//c
    output  out
);

    assign out = input1 & input2 & input3;//abc
endmodule

module andgate_16(
    input  [15:0] input1,//a 
    input  [15:0] input2,//b 
    output  [15:0] out
);

    assign out = input1 & input2;//ab
endmodule

module orgate(
    input  input1,//a 
    input  input2,//b 
    output  out
);

    assign out = input1 | input2;//a+b
endmodule

module orgate_16(
    input  [15:0] input1,//a 
    input  [15:0] input2,//b 
    output  [15:0] out
);

    assign out = input1 | input2;//a+b
endmodule

module notgate(
    input  input1,//a  
    output  out
);

    assign out =~input1;//a'
endmodule

module notgate_16(
    input  [15:0] input1,//a  
    output  [15:0] out
);

    assign out =~input1;//a'
endmodule

module xorgate(
    input input1,//a
    input input2,//b
    output out
);

    wire araKablo1;//a'
    wire araKablo2;//b'
    wire araKablo3;//ab'
    wire araKablo4;//a'b

    notgate NOT1(.input1(input1), .out(araKablo1));
    notgate NOT2(.input1(input2), .out(araKablo2));
    andgate AND1(.input1(input1), .input2(araKablo2), .out(araKablo3));
    andgate AND2(.input1(araKablo1), .input2(input2), .out(araKablo4));
    orgate OR1(.input1(araKablo3), .input2(araKablo4), .out(out));//ab'+a'b
endmodule

module xorgate_16(
    input [15:0] input1,//a
    input [15:0] input2,//b
    output [15:0] out
);

    wire [15:0] araKablo1;//a'
    wire [15:0] araKablo2;//b'
    wire [15:0] araKablo3;//ab'
    wire [15:0] araKablo4;//a'b

    notgate_16 NOT1(input1[15:0], araKablo1[15:0]);
    notgate_16 NOT2(input2[15:0], araKablo2[15:0]);
    andgate_16 AND1(input1[15:0], araKablo2[15:0], araKablo3[15:0]);
    andgate_16 AND2(araKablo1[15:0], input2[15:0], araKablo4[15:0]);
    orgate_16 OR1(araKablo3[15:0], araKablo4[15:0], out[15:0]);//ab'+a'b
endmodule

module halfadder(//part2
    input input1,
    input input2,
    output carry,
    output sum
);

    andgate AND1(.input1(input1), .input2(input2), .out(carry));
    xorgate XOR1(.input1(input1), .input2(input2), .out(sum));
endmodule

module fulladder_1(//part3
    input input1,
    input input2,
    input carry_in,
    output carry_out,
    output sum
);

    wire araKablo1;// s1
    wire araKablo2;// c1
    wire araKablo3;// c2

    halfadder HA1(.input1(input1), .input2(input2), .sum(araKablo1), .carry(araKablo2));
    halfadder HA2(.input1(araKablo1), .input2(carry_in), .sum(sum), .carry(araKablo3));
    orgate OR1(.input1(araKablo2), .input2(araKablo3), .out(carry_out));
    
    endmodule

module fulladder_4(//part4
    input [3:0] A,
    input [3:0] B,
    input cin,
    output cout, //C3
    output [3:0] sum
);

    wire araKablo1;//C0
    wire araKablo2;//C1
    wire araKablo3;//C2

    fulladder_1 FULLADDER1(A[0:0], B[0:0], cin, araKablo1, sum[0:0]);
    fulladder_1 FULLADDER2(A[1:1], B[1:1], araKablo1, araKablo2, sum[1:1]);
    fulladder_1 FULLADDER3(A[2:2], B[2:2], araKablo2, araKablo3, sum[2:2]);
    fulladder_1 FULLADDER4(A[3:3], B[3:3], araKablo3, cout, sum[3:3]);
endmodule

module fulladder_16(//part5
    input [15:0] A,
    input [15:0] B,
    input cin,
    output [15:0] S,
    output cout//C12-15

);

    wire araKablo1;//C0-3
    wire araKablo2;//C4-7
    wire araKablo3;//C8-11

    fulladder_4 FULLADDER4_1(A[3:0], B[3:0], cin, araKablo1, S[3:0]);
    fulladder_4 FULLADDER4_2(A[7:4], B[7:4], araKablo1, araKablo2, S[7:4]);
    fulladder_4 FULLADDER4_3(A[11:8], B[11:8], araKablo2, araKablo3, S[11:8]);
    fulladder_4 FULLADDER4_4(A[15:12], B[15:12], araKablo3, cout, S[15:12]);
endmodule

module fulladdersubstractor_16(//part6

input [15:0]A,
input [15:0]B,
input op,  //operation
input s,  //selection

output [15:0]S,
output cout
);

wire [15:0] c;


xorgate_16 XOR_0(B[15:0], op, c[15:0]);

fulladder_16 FA(A, c, op, S, cout);

endmodule

module part7(
    input [15:0]A,
    input [15:0]B,
    input op,
    input S, //selection
    output cout,
    output [15:0]sum
  
);

    wire [15:0]sum1; 
    wire [15:0]sum2; 
    wire cout1; 
    wire cout2; 


    fulladdersubstractor_16 FAS1(A[15:0], B[15:0], 1, S, sum1[15:0], cout1);//A-B
    fulladdersubstractor_16 FAS2(sum1[15:0], sum1[15:0], 0, S, sum2[15:0], cout2);//2A-2B
    fulladdersubstractor_16 FAS3(A[15:0], araKablo3, 0, S, sum[15:0], cout);//3A-2B
    
endmodule









