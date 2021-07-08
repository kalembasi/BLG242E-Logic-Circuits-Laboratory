`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.03.2021 21:11:33
// Design Name: 
// Module Name: experiment_1_test
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
module andgate_test();
    reg A;
    reg B;

    wire C;

    andgate uut(.input1(A), .input2(B), .out(C));

    initial begin
        A=0; B=0; #250;
        A=0; B=1; #250;
        A=1; B=0; #250;
        A=1; B=1; #250;
    end
endmodule

module orgate_test();
    reg A;
    reg B;

    wire C;

    orgate uut(.input1(A), .input2(B), .out(C));

    initial begin
        A=0; B=0; #250;
        A=0; B=1; #250;
        A=1; B=0; #250;
        A=1; B=1; #250;
    end
endmodule

module notgate_test();
    reg A;

    wire B;

    notgate uut(.input1(A), .out(B));

    initial begin
        A=0; #250;
        A=1; #250;
    end
endmodule

module part2_1_test ();
    reg A; 
    reg B; 
    wire C;

    part2_1 uut(.input1(A), .input2(B), .out(C));

    initial begin
        A= 0; B= 0; #250;
        A= 0; B= 1; #250;
        A= 1; B= 0; #250;
        A= 1; B= 1; #250;
    end
endmodule

module part2_2_test();
    reg A;
    reg B;

    wire C;
    
    part2_2 uut(.input1(A), .input2(B), .out(C));

    initial begin
        A=0; B=0; #250;
        A=0; B=1; #250;
        A=1; B=0; #250;
        A=1; B=1; #250;
    end
endmodule

module part3_1_test();
    reg A;
    reg B;

    wire C;

    part3_1 uut(.input1(A), .input2(B), .out(C));

    initial begin
        A=0; B=0; #250;
        A=0; B=1; #250;
        A=1; B=0; #250;
        A=1; B=1; #250;
    end
endmodule

module part3_2_test();
    reg A;
    reg B;

    wire C;

    part3_2 uut(.input1(A), .input2(B), .out(C));

    initial begin
        A=0; B=0; #250;
        A=0; B=1; #250;
        A=1; B=0; #250;
        A=1; B=1; #250;
    end
endmodule

module part4_test();
    reg A;
    reg B;
    reg C;

    wire D;

    part4 uut(.input1(A), .input2(B), .input3(C), .out(D));

    initial begin
        A=0; B=0; C=0; #250;
        A=0; B=0; C=1; #250;
        A=0; B=1; C=0; #250;
        A=0; B=1; C=1; #250;
        A=1; B=0; C=0; #250;
        A=1; B=0; C=1; #250;
        A=1; B=1; C=0; #250;
        A=1; B=1; C=1; #250;
    end
endmodule

module part5_test();
    reg A;
    reg B;

    wire C;

    part5 uut(.input1(A), .input2(B), .out(C));

    initial begin
        A=0; B=0; #250;
        A=0; B=1; #250;
        A=1; B=0; #250;
        A=1; B=1; #250;
    end
endmodule