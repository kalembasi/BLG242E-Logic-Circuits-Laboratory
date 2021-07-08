`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2021 15:25:18
// Design Name: 
// Module Name: experiment_2
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

module nandgate(
    input  input1,//a 
    input  input2,//b 
    output  out
);

    wire araKablo1;//ab

    andgate AND1(.input1(input1), .input2(input2), .out(araKablo1)); //ab
    notgate NOT1(.input1(araKablo1), .out(out)); //(ab)'
endmodule

module andgate3(
    input  input1,//a 
    input  input2,//b 
    input  input3,//c
    output  out
);

    assign out = input1 & input2 & input3;//abc
endmodule

module andgate4(
    input  input1,//a 
    input  input2,//b 
    input  input3,//c
    input  input4,//d
    output  out
);

    assign out = input1 & input2 & input3 & input4;//abcd
endmodule

module orgate4(
    input  input1,//a 
    input  input2,//b 
    input  input3,//c
    input  input4,//d
    output  out
);

    assign out = input1 | input2 | input3 | input4;//a+b+c+d
endmodule


module multiplexer8_1(
    input  input1,//a
    input  input2,//b
    input  input3,//c
    input  I0,
    input  I1,
    input  I2,
    input  I3,
    input  I4,
    input  I5,
    input  I6,
    input  I7,
    output  out
);

    wire  araKablo1; //a'
    wire  araKablo2; //b'
    wire  araKablo3; //c'
    wire  araKablo4; //
    wire  araKablo5; //
    wire  araKablo6; //
    wire  araKablo7; //
    wire  araKablo8; //
    wire  araKablo9; //
    wire  araKablo10;//
    wire  araKablo11;//
    wire  araKablo12;//
    wire  araKablo13;//


    notgate NOT1(.input1(input1), .out(araKablo1)); // a'
    notgate NOT2(.input1(input2), .out(araKablo2)); // b'
    notgate NOT3(.input1(input3), .out(araKablo3)); // c'
    andgate4 AND1(.input1(araKablo1), .input2(araKablo2), .input3(araKablo3), .input4(I0), .out(araKablo4));
    andgate4 AND2(.input1(araKablo1), .input2(araKablo2), .input3(input3), .input4(I1), .out(araKablo5));
    andgate4 AND3(.input1(araKablo1), .input2(input2), .input3(araKablo3), .input4(I2), .out(araKablo6));
    andgate4 AND4(.input1(araKablo1), .input2(input2), .input3(input3), .input4(I3), .out(araKablo7));
    orgate4 OR1(.input1(araKablo4), .input2(araKablo5), .input3(araKablo6), .input4(araKablo7), .out(araKablo8));
    andgate4 AND5(.input1(input1), .input2(araKablo2), .input3(araKablo3), .input4(I4), .out(araKablo9));
    andgate4 AND6(.input1(input1), .input2(araKablo2), .input3(input3), .input4(I5), .out(araKablo10));
    andgate4 AND7(.input1(input1), .input2(input2), .input3(araKablo3), .input4(I6), .out(araKablo11));
    andgate4 AND8(.input1(input1), .input2(input2), .input3(input3), .input4(I7), .out(araKablo12));
    orgate4 OR2(.input1(araKablo9), .input2(araKablo10), .input3(araKablo11), .input4(araKablo12), .out(araKablo13));
    orgate OR3(.input1(araKablo8), .input2(araKablo13), .out(out));
endmodule


module decoder3_8(
    input input1,//a
    input input2,//b
    input input3,//c
    output D0,//a'b'c'
    output D1,//a'b'c
    output D2,//a'bc'
    output D3,//a'bc
    output D4,//ab'c'
    output D5,//ab'c
    output D6,//abc'
    output D7//abc
);
    
    wire  araKablo1; //a'
    wire  araKablo2; //b'
    wire  araKablo3; //c'

    notgate NOT1(.input1(input1), .out(araKablo1)); // a'
    notgate NOT2(.input1(input2), .out(araKablo2)); // b'
    notgate NOT3(.input1(input3), .out(araKablo3)); // c'
    andgate3 AND1(.input1(araKablo1), .input2(araKablo2), .input3(araKablo3), .out(D0));//a'b'c'
    andgate3 AND2(.input1(araKablo1), .input2(araKablo2), .input3(input3), .out(D1));//a'b'c
    andgate3 AND3(.input1(araKablo1), .input2(input2), .input3(araKablo3), .out(D2));//a'bc'
    andgate3 AND4(.input1(araKablo1), .input2(input2), .input3(input3), .out(D3));//a'bc
    andgate3 AND5(.input1(input1), .input2(araKablo2), .input3(araKablo3), .out(D4));//ab'c'
    andgate3 AND6(.input1(input1), .input2(araKablo2), .input3(input3), .out(D5));//ab'c
    andgate3 AND7(.input1(input1), .input2(input2), .input3(araKablo3), .out(D6));//abc'
    andgate3 AND8(.input1(input1), .input2(input2), .input3(input3), .out(D7));//abc
endmodule



module part_1(
    input  input1,//a
    input  input2,//b
    input  input3,//c
    input  input4,//d
    output  out
);

    wire  araKablo1; //a'
    wire  araKablo2; //b'
    wire  araKablo3; //c'
    wire  araKablo4; //d'
    wire  araKablo5; //a'b'
    wire  araKablo6; //ad'
    wire  araKablo7; //bc'
    wire  araKablo8; //bc'd
    wire  araKablo9; //a'b'+ad'
    

    notgate NOT1(.input1(input1), .out(araKablo1)); // a'
    notgate NOT2(.input1(input2), .out(araKablo2)); // b'
    notgate NOT3(.input1(input3), .out(araKablo3)); // c'
    notgate NOT4(.input1(input4), .out(araKablo4)); // d'
    andgate AND1(.input1(araKablo1), .input2(araKablo2), .out(araKablo5));//a'b'
    andgate AND2(.input1(input1), .input2(araKablo4), .out(araKablo6));//ad'
    andgate AND3(.input1(input2), .input2(araKablo3), .out(araKablo7));//bc'
    andgate AND4(.input1(araKablo7), .input2(input4), .out(araKablo8));//bc'd
    orgate OR1(.input1(araKablo5), .input2(araKablo6), .out(araKablo9));//a'b'+ad'
    orgate OR2(.input1(araKablo9), .input2(araKablo8), .out(out));//a'b'+ad'+bc'd

endmodule

module part_2(
    input  input1,//a
    input  input2,//b
    input  input3,//c
    input  input4,//d
    output  out
);

    wire  araKablo1; //a'
    wire  araKablo2; //b'
    wire  araKablo3; //c'
    wire  araKablo4; //d'
    wire  araKablo5; //a+b
    wire  araKablo6; //a'+d
    wire  araKablo7; //a'b'+ad'
    wire  araKablo8; //(a+b)(a'+d)
    wire  araKablo9; //b'+c
    wire  araKablo10;//bc'
    wire  araKablo11;//b'+c+d'

    nandgate NAND1(.input1(input1), .input2(input1), .out(araKablo1)); // a'
    nandgate NAND2(.input1(input2), .input2(input2), .out(araKablo2)); // b'
    nandgate NAND3(.input1(input3), .input2(input3), .out(araKablo3)); // c'
    nandgate NAND4(.input1(input4), .input2(input4), .out(araKablo4)); // d'
    nandgate NAND5(.input1(araKablo1), .input2(araKablo2), .out(araKablo5)); //a+b
    nandgate NAND6(.input1(input1), .input2(araKablo4), .out(araKablo6)); //a'+d
    nandgate NAND7(.input1(araKablo5), .input2(araKablo6), .out(araKablo7));//a'b'+ad'
    nandgate NAND8(.input1(araKablo7), .input2(araKablo7), .out(araKablo8));//(a+b)(a'+d)
    nandgate NAND9(.input1(input2), .input2(araKablo3), .out(araKablo9));//b'+c
    nandgate NAND10(.input1(araKablo9), .input2(araKablo9), .out(araKablo10));//bc'
    nandgate NAND11(.input1(araKablo10), .input2(input4), .out(araKablo11));//b'+c+d'
    nandgate NAND12(.input1(araKablo8), .input2(araKablo11), .out(out));//a'b'+ad'+bc'd
endmodule

module part_3(
    input  input1,//a
    input  input2,//b
    input  input3,//c
    input  input4,//d
    output  out
);

    wire  araKablo1; //d'

    notgate NOT(.input1(input4), .out(araKablo1)); // d'
    multiplexer8_1 MUX(.input1(input1), .input2(input2), .input3(input3), .I0(1), .I1(1), .I2(input4), .I3(0), .I4(araKablo1), .I5(1), .I6(1), .I7(araKablo1),  .out(out));
endmodule

module part_4(
    input input1,//a
    input input2,//b
    input input3,//c
    output F2,//abc'+a'c
    output F3//ab'c'+bc
);

    wire  araKablo1; //a'b'c'
    wire  araKablo2; //a'b'c
    wire  araKablo3; //a'bc'
    wire  araKablo4; //a'bc
    wire  araKablo5; //ab'c'
    wire  araKablo6; //ab'c
    wire  araKablo7; //abc'
    wire  araKablo8; //abc
    wire araKablo9;
    wire araKablo10;

    decoder3_8 DEC1(.input1(input1), .input2(input2), .input3(input3), .D0(araKablo1), .D1(araKablo2), .D2(araKablo3), .D3(araKablo4), .D4(araKablo5), .D5(araKablo6), .D6(araKablo7), .D7(araKablo8));
    orgate OR1(.input1(araKablo2), .input2(araKablo4), .out(araKablo9));
    orgate OR2(.input1(araKablo9), .input2(araKablo7), .out(F2));
    orgate OR3(.input1(araKablo4), .input2(araKablo8), .out(araKablo10));
    orgate OR4(.input1(araKablo10), .input2(araKablo5), .out(F3));
endmodule








