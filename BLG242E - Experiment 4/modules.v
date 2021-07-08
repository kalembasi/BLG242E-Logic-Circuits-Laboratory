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

module sr_latch(//part1
    
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

module sr_latch_with_en(//part2
    
    input S,
    input R,
    input EN,
    
    output Q,
    output Q_neg
);

    wire araKablo1;
    wire araKablo2;
    wire araKablo3 = Q;
    wire araKablo4 = Q_neg;
 
    
    nandgate NAND1(S, EN, araKablo1);
    nandgate NAND2(EN, R, araKablo2);
    nandgate NAND3(araKablo1, araKablo4, Q);
    nandgate NAND4(araKablo3, araKablo2, Q_neg);
    
endmodule

module Dlatch( //part3
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

module pulse_generator(
    input wire [15:0] loaded_value,
    input CLK,
    input LOAD,
    output reg output1
    );

    reg most_significant_bit;
    reg [15:0] output2;

    always @(posedge CLK)
    begin 
        if(~LOAD) begin
            most_significant_bit = output2[15];
            output2 = output2<<1;
            output1 = most_significant_bit;
            output2[0] = most_significant_bit;
        end
        
        else begin
            output1 = loaded_value[15];
            output2 = loaded_value;
        end
      end
      
endmodule
