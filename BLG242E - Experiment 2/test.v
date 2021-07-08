`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2021 15:49:49
// Design Name: 
// Module Name: experiment_2_test
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


module nandgate_test();
    reg A;
    reg B;

    wire C;

    nandgate uut(.input1(A), .input2(B), .out(C));

    initial begin
        A=0; B=0; #250;
        A=0; B=1; #250;
        A=1; B=0; #250;
        A=1; B=1; #250;
    end
endmodule

module andgate3_test();
    reg A;
    reg B;
    reg C;

    wire D;

    andgate3 uut(.input1(A), .input2(B), .input3(C), .out(D));

    initial begin
        A=0; B=0; C=0; #125;
        A=0; B=0; C=1; #125;
        A=0; B=1; C=0; #125;
        A=0; B=1; C=1; #125;
        A=1; B=0; C=0; #125;
        A=1; B=0; C=1; #125;
        A=1; B=1; C=0; #125;
        A=1; B=1; C=1; #125;
    end
endmodule

module andgate4_test();
    reg A;
    reg B;
    reg C;
    reg D;

    wire E;

    andgate4 uut(.input1(A), .input2(B), .input3(C), .input4(D), .out(E));

    initial begin
        A=0; B=0; C=0; D=0; #62;
        A=0; B=0; C=1; D=0; #62;
        A=0; B=1; C=0; D=0; #62;
        A=0; B=1; C=1; D=0; #62;
        A=1; B=0; C=0; D=0; #62;
        A=1; B=0; C=1; D=0; #62;
        A=1; B=1; C=0; D=0; #62;
        A=1; B=1; C=1; D=0; #62;
        A=0; B=0; C=0; D=1; #62;
        A=0; B=0; C=1; D=1; #62;
        A=0; B=1; C=0; D=1; #62;
        A=0; B=1; C=1; D=1; #62;
        A=1; B=0; C=0; D=1; #62;
        A=1; B=0; C=1; D=1; #62;
        A=1; B=1; C=0; D=1; #62;
        A=1; B=1; C=1; D=1; #62;
    end
endmodule

module orgate4_test();
    reg A;
    reg B;
    reg C;
    reg D;

    wire E;

    orgate4 uut(.input1(A), .input2(B), .input3(C), .input4(D), .out(E));

    initial begin
        A=0; B=0; C=0; D=0; #62;
        A=0; B=0; C=1; D=0; #62;
        A=0; B=1; C=0; D=0; #62;
        A=0; B=1; C=1; D=0; #62;
        A=1; B=0; C=0; D=0; #62;
        A=1; B=0; C=1; D=0; #62;
        A=1; B=1; C=0; D=0; #62;
        A=1; B=1; C=1; D=0; #62;
        A=0; B=0; C=0; D=1; #62;
        A=0; B=0; C=1; D=1; #62;
        A=0; B=1; C=0; D=1; #62;
        A=0; B=1; C=1; D=1; #62;
        A=1; B=0; C=0; D=1; #62;
        A=1; B=0; C=1; D=1; #62;
        A=1; B=1; C=0; D=1; #62;
        A=1; B=1; C=1; D=1; #62;
    end
endmodule



module part_1_test();
    reg A;
    reg B;
    reg C;
    reg D;

    wire E;

    part_1 uut(.input1(A), .input2(B), .input3(C), .input4(D), .out(E));

    initial begin
        A=0; B=0; C=0; D=0; #62;
        A=0; B=0; C=1; D=0; #62;
        A=0; B=1; C=0; D=0; #62;
        A=0; B=1; C=1; D=0; #62;
        A=1; B=0; C=0; D=0; #62;
        A=1; B=0; C=1; D=0; #62;
        A=1; B=1; C=0; D=0; #62;
        A=1; B=1; C=1; D=0; #62;
        A=0; B=0; C=0; D=1; #62;
        A=0; B=0; C=1; D=1; #62;
        A=0; B=1; C=0; D=1; #62;
        A=0; B=1; C=1; D=1; #62;
        A=1; B=0; C=0; D=1; #62;
        A=1; B=0; C=1; D=1; #62;
        A=1; B=1; C=0; D=1; #62;
        A=1; B=1; C=1; D=1; #62;
    end
endmodule

module part_2_test();
    reg A;
    reg B;
    reg C;
    reg D;

    wire E;

    part_2 uut(.input1(A), .input2(B), .input3(C), .input4(D), .out(E));

    initial begin
        A=0; B=0; C=0; D=0; #62;
        A=0; B=0; C=1; D=0; #62;
        A=0; B=1; C=0; D=0; #62;
        A=0; B=1; C=1; D=0; #62;
        A=1; B=0; C=0; D=0; #62;
        A=1; B=0; C=1; D=0; #62;
        A=1; B=1; C=0; D=0; #62;
        A=1; B=1; C=1; D=0; #62;
        A=0; B=0; C=0; D=1; #62;
        A=0; B=0; C=1; D=1; #62;
        A=0; B=1; C=0; D=1; #62;
        A=0; B=1; C=1; D=1; #62;
        A=1; B=0; C=0; D=1; #62;
        A=1; B=0; C=1; D=1; #62;
        A=1; B=1; C=0; D=1; #62;
        A=1; B=1; C=1; D=1; #62;
    end
endmodule

module part_3_test();
    reg A;
    reg B;
    reg C;
    reg D;

    wire E;

    part_3 uut(.input1(A), .input2(B), .input3(C), .input4(D), .out(E));

    initial begin
        A=0; B=0; C=0; D=0; #62;
        A=0; B=0; C=1; D=0; #62;
        A=0; B=1; C=0; D=0; #62;
        A=0; B=1; C=1; D=0; #62;
        A=1; B=0; C=0; D=0; #62;
        A=1; B=0; C=1; D=0; #62;
        A=1; B=1; C=0; D=0; #62;
        A=1; B=1; C=1; D=0; #62;
        A=0; B=0; C=0; D=1; #62;
        A=0; B=0; C=1; D=1; #62;
        A=0; B=1; C=0; D=1; #62;
        A=0; B=1; C=1; D=1; #62;
        A=1; B=0; C=0; D=1; #62;
        A=1; B=0; C=1; D=1; #62;
        A=1; B=1; C=0; D=1; #62;
        A=1; B=1; C=1; D=1; #62;
    end
endmodule

module part_4_test();
    reg A;
    reg B;
    reg C;

    wire D;
    wire E;

    part_4 uut(.input1(A), .input2(B), .input3(C), .F2(D), .F3(E));

    initial begin
        A=0; B=0; C=0; #125;
        A=0; B=0; C=1; #125;
        A=0; B=1; C=0; #125;
        A=0; B=1; C=1; #125;
        A=1; B=0; C=0; #125;
        A=1; B=0; C=1; #125;
        A=1; B=1; C=0; #125;
        A=1; B=1; C=1; #125;
    end
endmodule
