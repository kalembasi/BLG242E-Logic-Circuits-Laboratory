`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2021 19:02:47
// Design Name: 
// Module Name: experiment_3_test
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

module xorgate_test();
    reg A;
    reg B;

    wire C;

    xorgate uut(.input1(A), .input2(B), .out(C));

    initial begin
        A=0; B=0; #250;
        A=0; B=1; #250;
        A=1; B=0; #250;
        A=1; B=1; #250;
    end
endmodule

module part2_test();
    reg A;
    reg B;

    wire carry;
    wire sum;

    halfadder uut(A, B, carry, sum);

    initial begin
        A=0; B=0; #250;
        A=0; B=1; #250;
        A=1; B=0; #250;
        A=1; B=1; #250;
    end
endmodule

module part3_test();
    reg A;
    reg B;
    reg carry_in;

    wire carry_out;
    wire sum;

    fulladder_1 uut(A, B, carry_in, carry_out, sum);

    initial begin
        A=0; B=0; carry_in=0; #125;
        A=0; B=1; carry_in=0; #125;
        A=1; B=0; carry_in=0; #125;
        A=1; B=1; carry_in=0; #125;
        A=0; B=0; carry_in=1; #125;
        A=0; B=1; carry_in=1; #125;
        A=1; B=0; carry_in=1; #125;
        A=1; B=1; carry_in=1; #125;
    end
endmodule

module part4_test();
    reg [3:0] A;
    reg [3:0] B;

    reg carry_in; //Carry in

    wire carry_out; //Carry out
    
    wire [3:0] S;
 

   fulladder_4 uut(A, B, carry_in, carry_out, S);

    initial begin
        
        A=7;    B=1;              carry_in=0;     #100;       // 7 + 1
        A=2;    B=8;              carry_in=0;     #100;       // 2 + 8
        A=2;    B=3;              carry_in=0;     #100;       // 2 + 3
		A=14;   B=10;             carry_in=0;     #100;       // 14 + 10
		A=10;   B=5;              carry_in=0;     #100;       // 10 + 5
	    A=15;   B=4;              carry_in=0;     #100;       // 15 + 4
        A=6;    B=5;              carry_in=0;     #100;       // 6 + 5
        A=8;    B=5;              carry_in=0;     #100;       // 8 + 5

    end
endmodule

module part5_test();
    reg [15:0] A;
    reg [15:0] B;
    reg carry_in;
    
    wire carry_out;  //C12-15
    wire [15:0] S;
    
    fulladder_16 uut(A, B, carry_in, carry_out, S);
    
    initial begin
        
        A=29;       B=3;                carry_in=0;     #100;       // 29 + 3
        A=21;       B=83;               carry_in=0;     #100;       // 21 + 83
        A=16800;    B=16900;            carry_in=0;     #100;       // 16800 + 16900
		A=65534;    B=65100;            carry_in=0;     #100;       // 65534 + 65100
		A=202;      B=97;               carry_in=0;     #100;       // 202 + 97
	    A=44;       B=19;               carry_in=0;     #100;       // 44 + 19 
        A=644;      B=255;              carry_in=0;     #100;       // 644 + 255
        A=86;       B=572;              carry_in=0;     #100;       // 86 + 572

    end
endmodule


module part6_test();
 
reg [15:0]A;
reg [15:0]B;
reg op;  //operation
reg s;  //selection
 
wire [15:0]sum;
wire cout;
    
    fulladdersubstractor_16 uut(A, B, op, s, sum, cout);
 
    initial begin
   
        A=29;       B=3;                  s=0;    op=0;         #100;       // 29 - 3
        A=21;       B=83;                 s=0;    op=1;         #100;       // 21 + 83
        A=16800;    B=16900;              s=1;    op=1;         #100;       // 16800 + 16900
		A=65534;    B=65100;              s=0;    op=0;         #100;       // 103 - 145
		A=202;      B=97;                 s=0;    op=1;     #100;       // 202 + 97
	    A=44;       B=19;                 s=1;    op=1;     #100;       // 32400 + 32200
        A=644;      B=255;                s=0;    op=0;         #100;       // 6478 - 2585 
        A=86;       B=572;                s=0;    op=0;         #100;       // 8 - 52
    
    end     
endmodule

module part7_test();

    reg [15:0]A;
    reg [15:0]B;
    reg op;
    reg s; //selection
    
    wire cout;
    wire [15:0]sum;
    
    part7 uut(A, B, op, s, cout, sum);
     
    initial begin
   
        A=3105;       B=11275;                  s=1;    op=0;         #100;       
        A=21;         B=83;                     s=1;    op=1;         #100;     
        A=24;         B=32;                     s=1;    op=1;         #100;       
		A=16386;      B=353;                    s=1;    op=0;         #100;       
		A=202;        B=97;                     s=1;    op=1;         #100;      
	    A=44;         B=9;                      s=1;    op=1;         #100;       
        A=64;         B=65535;                  s=1;    op=0;         #100;       
        A=8;          B=52;                     s=1;    op=0;         #100;       
    
    end 

endmodule