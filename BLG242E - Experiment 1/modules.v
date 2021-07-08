`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2021 20:21:06
// Design Name: 
// Module Name: experiment_1
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

module orgate(
    input  input1,//a 
    input  input2,//b 
    output  out
);

    assign out = input1 | input2;//a+b
endmodule

module notgate(
    input  input1,//a  
    output  out
);

    assign out =~input1;//a'
endmodule

module part2_1(
    input  input1,//a
    input  input2,//b
    output  out
);

    wire  araKablo1;//ab

    andgate AND1(.input1(input1), .input2(input2), .out(araKablo1)); //ab
    orgate OR1(.input1(input1), .input2(araKablo1), .out(out)); // a+ab
endmodule

module part2_2(
    input  input1,//a
    input  input2,//b
    output  out
);

    wire  araKablo1;//b'
    wire  araKablo2;//a+b
    wire  araKablo3;//a+b'

    notgate NOT1(.input1(input2), .out(araKablo1)); //b'
    orgate OR1(.input1(input1), .input2(input2), .out(araKablo2)); //a+b 
    orgate OR2(.input1(input1), .input2(araKablo1), .out(araKablo3)); //a+b'
    andgate AND1(.input1(araKablo2), .input2(araKablo3), .out(out)); //(a+b)(a+b')
endmodule

module part3_1(
    input  input1,//a
    input  input2,//b
    output  out
);

    wire  araKablo1;//ab

    andgate AND1(.input1(input1), .input2(input2), .out(araKablo1)); //ab
    orgate OR1(.input1(input1), .input2(araKablo1), .out(out)); // a+ab
endmodule

module part3_2(
    input  input1,//a
    input  input2,//b
    output  out
);
    wire  araKablo1;//a+b

    orgate OR1(.input1(input1), .input2(input2), .out(araKablo1)); //a+b 
    andgate AND1(.input1(input1), .input2(araKablo1), .out(out)); //a(a+b)
endmodule

module part4(
    input  input1,//a
    input  input2,//b
    input  input3,//c
    output  out
);

    wire  araKablo1; //a'
    wire  araKablo2; //b'
    wire  araKablo3; //c'
    wire  araKablo4; //a'+b'
    wire  araKablo5; //a+c'

    notgate NOT1(.input1(input1), .out(araKablo1)); // a'
    notgate NOT2(.input1(input2), .out(araKablo2)); // b'
    notgate NOT3(.input1(input3), .out(araKablo3)); // c'
    orgate OR1(.input1(araKablo1), .input2(araKablo2), .out(araKablo4)); //a'+b'
    orgate OR2(.input1(input1), .input2(araKablo3), .out(araKablo5)); //a+c'
    andgate AND1(.input1(araKablo4), .input2(araKablo5), .out(out)); //(a'+b')(a+c')
endmodule

module part5(
    input  input1,//c
    input  input2,//d
    output  out
);
    wire  araKablo1;//c'
    wire  araKablo2;//d'
    wire  araKablo3;// d'c
    wire  araKablo4;// c'd


    notgate NOT1(.input1(input1), .out(araKablo1)); // c'
    notgate NOT2(.input1(input2), .out(araKablo2)); // d'
    andgate AND1(.input1(input1), .input2(araKablo2), .out(araKablo3)); // d'c
    andgate AND2(.input1(araKablo1), .input2(input2), .out(araKablo4)); // c'd
    orgate OR1(.input1(araKablo3), .input2(araKablo4), .out(out)); // d'c + c'd
endmodule
