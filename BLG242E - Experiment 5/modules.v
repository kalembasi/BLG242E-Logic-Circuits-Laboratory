`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2021 17:12:04
// Design Name: 
// Module Name: experiment_4
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

module andgate_3(
    input  input1,//a 
    input  input2,//b 
    input input3,//c
    output  out
);

    assign out = input1 & input2 & input3;//abc
endmodule

module andgate_4(
    input  input1,//a 
    input  input2,//b 
    input input3,//c
    input input4,//d
    output  out
);

    assign out = input1 & input2 & input3 & input4;//abcd
endmodule

module andgate_5(
    input  input1,//a 
    input  input2,//b 
    input input3,//c
    input input4,//d
    input input5,//e
    output  out
);

    assign out = input1 & input2 & input3 & input4 & input5;//abcde
endmodule


module orgate(
    input  input1,//a 
    input  input2,//b 
    output  out
);

    assign out = input1 | input2;//a+b
endmodule

module orgate_4(
    input  input1,//a 
    input  input2,//b 
    input input3,//c
    input input4,//d
    output  out
);

    assign out = input1 | input2 | input3 |input4;//a+b+c+d
endmodule

module orgate_5(
    input  input1,//a 
    input  input2,//b 
    input input3,//c
    input input4,//d
    input input5,//e
    output  out
);

    assign out = input1 | input2 | input3 | input4 | input5;//a+b+c+d+e
endmodule

module orgate_6(
    input  input1,//a 
    input  input2,//b 
    input input3,//c
    input input4,//d
    input input5,//e
    input input6,//f
    output  out
);

    assign out = input1 | input2 | input3 | input4 | input5;//a+b+c+d+e+f
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

module nandgate_3(
    input A,
    input B,
    input C,
    output out
);

    wire araKablo1;
    andgate_3 AND1(A, B, C, araKablo1);
    notgate NOT1(araKablo1, out);
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

module sr_latch(
    
    input S,
    input R,
    
    output Q,
    output Q_neg
);

    wire araKablo1 = Q;
    wire araKablo2 = Q_neg;
    wire araKablo3; //S'
    wire araKablo4; //R'


    nandgate NAND1(S, S, araKablo3);
    nandgate NAND2(R, R, araKablo4); 
    nandgate NAND3(araKablo3, araKablo2, Q);
    nandgate NAND4(araKablo1, araKablo4, Q_neg);
endmodule

module Dlatch( 
    input D,
    input E,
    output Q,
    output Qn  
);

    wire araKablo1;
    wire araKablo2; //D'
    wire araKablo3;
    wire araKablo4 = Q;
    wire araKablo5 = Qn;

    nandgate NAND1(D, E, araKablo1);
    nandgate NAND2(D, D, araKablo2);
    nandgate NAND3(araKablo2, E, araKablo3);
    nandgate NAND4(araKablo1, araKablo5, Q);
    nandgate NAND5(araKablo3, araKablo4, Qn);
endmodule

module Dflipflop( //part3
    input D,
    input CLK,
    output Q,
    output Qn
);
    wire araKablo1; //CLK'
    wire araKablo2; //Qm
    wire araKablo3; 


    notgate NOT1(CLK, araKablo1);
    Dlatch DL1(D, araKablo1, araKablo2, araKablo3);
    Dlatch DL2(araKablo2, CLK, Q, Qn);
endmodule


module jk_flipflop(
	input J,
	input K,
	input CLK,
    output Q,
    output Q_neg
);

    wire araKablo1 = Q;
    wire araKablo2 = Q_neg;
	wire araKablo3; // J*clk*Qn
	wire araKablo4; //K*clk*Q
	


	andgate_3 AND1(J, CLK, araKablo2, araKablo3);
	andgate_3 AND2(K, CLK, araKablo1, araKablo4);
	sr_latch SR(araKablo3, araKablo4, Q, Q_neg);
	
endmodule


module t_flipflop(
    input T,
    input CLK,
    output Q,
    output Q_neg
);

    wire araKablo1=Q;
    wire araKablo2;

    xorgate XOR1(T, araKablo1, araKablo2);
    Dlatch DL1(araKablo2, CLK, Q, Q_neg);
endmodule

module part1(
    input A,
    input B,
    input CLK,
    output Q1_neg,
    output Q0,
    output Z
);

    wire araKablo1;
    wire araKablo2;
    wire araKablo3;
    wire araKablo4=Q1_neg;
    wire araKablo5=Q0;
    wire araKablo6;//Q1
    wire araKablo7;
    wire araKablo8;
    wire araKablo9;//Q0'
    wire araKablo10;

    nandgate NAND1(A, B, araKablo1);
    orgate OR1(A, B, araKablo2);
    andgate AND1(araKablo2, araKablo4, araKablo3);
    t_flipflop T(araKablo3, CLK, araKablo6, Q1_neg);
    orgate OR2(araKablo1, araKablo5, araKablo7);
    orgate OR3(araKablo1, araKablo4, araKablo8);
    jk_flipflop JK(araKablo7, araKablo8, CLK, Q0, araKablo9);
    andgate AND2(araKablo1, araKablo9, araKablo10);
    orgate OR4(araKablo10, araKablo4, Z);
endmodule

module part2(
    input X,
    input CLK,
    output Q0,
    output Q1,
    output Q2,
    output Q3
);

    wire araKablo1=Q0;
    wire araKablo2=Q1;
    wire araKablo3=Q2;
    wire araKablo4=Q3;
    wire araKablo5; //Q0'
    wire araKablo6; //Q1'
    wire araKablo7; //Q2'
    wire araKablo8; //Q3'
    wire araKablo9; //X'
    wire araKablo10;
    wire araKablo11;
    wire araKablo12;
    wire araKablo13;
    wire araKablo14;
    wire araKablo15;
    wire araKablo16;//D3
    wire araKablo17;
    wire araKablo18;
    wire araKablo19;
    wire araKablo20;
    wire araKablo21;
    wire araKablo22;
    wire araKablo23;//D2
    wire araKablo24;
    wire araKablo25;
    wire araKablo26;
    wire araKablo27;
    wire araKablo28;
    wire araKablo29;//D1
    wire araKablo30;
    wire araKablo31;
    wire araKablo32;
    wire araKablo33;
    wire araKablo34;//D0
    wire araKablo35;
    wire araKablo36;
    wire araKablo37;
    wire araKablo38;

    notgate NOT1(araKablo1, araKablo5);
    notgate NOT2(araKablo2, araKablo6);
    notgate NOT3(araKablo3, araKablo7);
    notgate NOT4(araKablo4, araKablo8);
    notgate NOT5(X, araKablo9);

    //D3 = Q0Q3 + Q0Q1'X + Q0Q1Q2' + Q0Q2X' + Q1Q2Q3X + Q0'Q1'Q2'Q3'X'

    andgate AND1(araKablo1, araKablo4, araKablo10);
    andgate_3 AND2(araKablo1, araKablo5, X, araKablo11);
    andgate_3 AND3(araKablo1, araKablo2, araKablo7, araKablo12);
    andgate_3 AND4(araKablo1, araKablo3, araKablo9, araKablo13);
    andgate_4 AND5(araKablo2, araKablo3, araKablo4, X, araKablo14);
    andgate_5 AND6(araKablo5, araKablo6, araKablo7, araKablo8, araKablo9, araKablo15);
    orgate_6 OR1(araKablo10, araKablo11, araKablo12, araKablo13, araKablo14, araKablo15, araKablo16); // D3

    //D2 = Q1Q2'X + Q1Q2'Q3 + Q1Q2X' + Q1'Q2'Q3'X' + Q1'Q2Q3X + Q0'Q1Q3'X

    andgate_3 AND7(araKablo2, araKablo7, X, araKablo17);
    andgate_3 AND8(araKablo2, araKablo7, araKablo4, araKablo18);
    andgate_3 AND9(araKablo3, araKablo4, araKablo9, araKablo19);
    andgate_4 AND10(araKablo6, araKablo7, araKablo8, araKablo9, araKablo20);
    andgate_4 AND11(araKablo6, araKablo3, araKablo4, X, araKablo21);
    andgate_4 AND12(araKablo5, araKablo2, araKablo8, X, araKablo22);
    orgate_6 OR2(araKablo17, araKablo18, araKablo19, araKablo20, araKablo21, araKablo22, araKablo23); // D2

    //D1 = Q2'Q3'X' + Q2'Q3X + Q2Q3X' + Q0'Q2Q3'X + Q1'Q2Q3'X

    andgate_3 AND13(araKablo7, araKablo8, araKablo9, araKablo24);
    andgate_3 AND14(araKablo7, araKablo4, X, araKablo25);
    andgate_3 AND15(araKablo3, araKablo4, araKablo9, araKablo26);
    andgate_4 AND16(araKablo5, araKablo3, araKablo8, X, araKablo27);
    andgate_4 AND17(araKablo6, araKablo3, araKablo8, X, araKablo28);
    orgate_5 OR3(araKablo24, araKablo25, araKablo26, araKablo27, araKablo28, araKablo29);//D1

    //D0 = Q0'Q3'X + Q2Q3'X' + Q1Q2'Q3' + Q0Q1'Q3'

    andgate_3 AND18(araKablo5, araKablo8, X, araKablo30);
    andgate_3 AND19(araKablo3, araKablo8, araKablo9, araKablo31);
    andgate_3 AND20(araKablo2, araKablo7, araKablo8, araKablo32);
    andgate_3 AND21(araKablo1, araKablo6, araKablo8, araKablo33);
    orgate_4 OR4(araKablo30, araKablo31, araKablo32, araKablo33, araKablo34);//D0

    Dflipflop D3(araKablo16, CLK, Q3, araKablo35);
    Dflipflop D2(araKablo23, CLK, Q2, araKablo36);
    Dflipflop D1(araKablo29, CLK, Q1, araKablo37);
    Dflipflop D0(araKablo34, CLK, Q0, araKablo38);
endmodule


module counter_16bit(//part3
    input [15:0] X,
    input LOAD,
    input CLEAR,
    input CLK,
    input direction,
    input [2:0] value, //increment-decrement value
    output [15:0] out
);

    reg [15:0] up_down_counter;

    always @(posedge CLK) begin
        
        if(~CLEAR) begin
            up_down_counter<=16'h0;
        end
        else if(~LOAD) begin
            up_down_counter<=X;
        end
        else if(LOAD)begin

            if(~direction) begin
            
            up_down_counter<=up_down_counter-value;
   
            end
            else begin
            
            up_down_counter<=up_down_counter+value;

            end
                
                    
        end
                
    end

    assign out=up_down_counter;
endmodule

module part4_1( //0 to 40 in circular way with increment value 2
    input CLEAR,
    input initiate,
    input CLK,
    output [15:0] out
);

    wire direction=1; //up
    reg [2:0] value=3'd2; //increment-decrement value
    reg [15:0] X = 16'd0;

    counter_16bit C1(X, initiate, CLEAR, CLK, direction, value, out);

endmodule

module part4_2( //350 to 371 in circular way with increment value 3
    input CLEAR,
    input initiate,
    input CLK,
    output [15:0] out
);

    wire direction=1; //up
    reg [2:0] value=3'd3; //increment-decrement value
    reg [15:0] X= 16'd350;

    counter_16bit C1(X, initiate, CLEAR, CLK, direction, value, out);

endmodule
module part4_3( //93 to 5 in circular way with decrement value 4
    input CLEAR,
    input initiate,
    input CLK,
    output [15:0] out
);

    wire direction=0; //down
    reg [2:0] value=3'd4; //increment-decrement value
    reg [15:0] X= 16'd93;

    counter_16bit C1(X, initiate, CLEAR, CLK, direction, value, out);

endmodule

module part4_4( ////22525 to 22535 in circular way with increment value 1
    input CLEAR,
    input initiate,
    input CLK,
    output [15:0] out
);

    wire direction=1; //up
    reg [2:0] value=3'd1; //increment-decrement value
    reg [15:0] X= 16'd22525;

    counter_16bit C1(X, initiate, CLEAR, CLK, direction, value, out);

endmodule

    