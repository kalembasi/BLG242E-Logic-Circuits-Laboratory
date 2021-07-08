`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2021 23:19:42
// Design Name: 
// Module Name: experiment6_test
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

module tsb_test();
    
    reg [7:0]A;
    reg E;
    wire [7:0]out;
    
    tsb uut(A, E, out);
    
    initial begin
    
    A=8'h2;     E=1;    #100;
    A=8'h2;     E=0;    #100;
    A=8'h4;     E=1;    #100;
    A=8'h4;     E=0;    #100;
    A=8'h6;     E=1;    #100;
    A=8'h6;     E=0;    #100;
    A=8'h8;     E=1;    #100;
    A=8'h8;     E=0;    #100;

    end
endmodule

module part1_test();

    reg [7:0]D1;
    reg [7:0]D2;
    reg S;
    
    wire [7:0]out;
    
    part1 uut(D1, D2, S, out);
    
    initial begin
    
    D1=8'h3;    D2=8'h2;    S=1;      #100;
    D1=8'h3;    D2=8'h2;    S=0;      #100;
    D1=8'h4;    D2=8'h7;    S=1;      #100;
    D1=8'h4;    D2=8'h7;    S=0;      #100;
    D1=8'h2;    D2=8'h8;    S=1;      #100;
    D1=8'h2;    D2=8'h8;    S=0;      #100;
    D1=8'h1;    D2=8'h3;    S=1;      #100;
    D1=8'h1;    D2=8'h3;    S=0;      #100;
    D1=8'h5;    D2=8'h6;    S=1;      #100;
    D1=8'h5;    D2=8'h6;    S=0;      #100;
    
    end    
endmodule

module part2_test();
    
    reg [7:0] D1;
    reg [7:0] D2;
    reg S; //select
    
    wire [7:0] out;
    wire [7:0] out2;
    
    part2 uut(D1, D2, S, out, out2);
    
    initial begin
    
    D1=8'h3;    D2=8'h2;    S=1;      #100;
    D1=8'h3;    D2=8'h2;    S=0;      #100;
    D1=8'h4;    D2=8'h7;    S=1;      #100;
    D1=8'h4;    D2=8'h7;    S=0;      #100;
    D1=8'h2;    D2=8'h8;    S=1;      #100;
    D1=8'h2;    D2=8'h8;    S=0;      #100;
    D1=8'h1;    D2=8'h3;    S=1;      #100;
    D1=8'h1;    D2=8'h3;    S=0;      #100;
    D1=8'h5;    D2=8'h6;    S=1;      #100;
    D1=8'h5;    D2=8'h6;    S=0;      #100;
    
    end
 endmodule
 
 module part3_test();
 
    reg [7:0] D;
    reg R; //reset
    reg LS; //line select
    reg RE; //read enable
    reg WE; //write enable
    reg CLK;
    wire [7:0] out;
    
    memory_line uut(D, R, LS, RE, WE, CLK,  out);  
    
    initial begin
    
    CLK=0;  R=0;
    
    D=8'h20;     RE=0;     WE=0;    LS=1;   #100;
    D=8'h20;     RE=1;     WE=0;    #100;
    D=8'h9;      RE=1;     WE=1;    #100;
    D=8'h1;      RE=0;     WE=1;    #100;
    D=8'h7;      RE=1;     WE=0;    #100;  
    D=8'h13;     RE=1;     WE=1;    #100;
    D=8'h4;      RE=1;     WE=1;    #100;
    D=8'h6;      RE=1;     WE=0;    LS=0;   #100;
    D=8'h5;      RE=1;     WE=1;    #100;
    D=8'h11;     RE=1;     WE=1;    #100;
    end 
    
    always
    #50 CLK = ~CLK;  
    
    always
    #500 R = ~R; 
    
endmodule


module part4_test();

    reg [7:0] D;
    reg CS; //chip select
    reg [2:0] A; //address
    reg R;//reset
    reg RE; //read enable
    reg WE;//write enable
    reg CLK;
    wire [7:0] out;
    
    memory_8byte uut(D, CS, A, R, RE, WE, CLK, out);

    initial begin
    
    CLK=0;  R=0;
    
    D=8'h20;     RE=1;     WE=1;    A=2'd2;    CS=1;    #100;
    D=8'h20;     RE=1;     WE=0;               CS=1;    #100;
    D=8'h9;      RE=1;     WE=1;    #100;
    D=8'h1;      RE=0;     WE=1;    A=2'd0;    CS=1;    #100;
    D=8'h7;      RE=1;     WE=0;    #100;  
    D=8'h13;     RE=1;     WE=1;    #100;
    D=8'h4;      RE=1;     WE=1;    #100;
    D=8'h6;      RE=1;     WE=0;    A=2'd3;    CS=0;    #100;
    D=8'h5;      RE=1;     WE=1;    #100;
    D=8'h11;     RE=1;     WE=1;    #100;
    
    
    
    
    end
    always
    #50 CLK = ~CLK;  
    
    always
    #500 R = ~R; 
endmodule

module part5_test ();

    reg [7:0] D;
    reg [4:0] A; //chip selection(2) and line selection(3)
    reg R; //reset
    reg RE; //read enable
    reg WE; //write enable
    reg CLK;
    wire [7:0] out;
    
    memory_32byte uut(D, A, R, RE, WE, CLK, out);
    
    initial begin
    
    CLK=0; R=0;
    
    D=8'h25;    WE=1;   RE=0;   A=5'b11101;      #100;
    D=8'h25;    WE=0;   RE=1;   A=5'b11101;      #100;
    D=8'h15;    WE=1;   RE=0;   A=5'b10011;      #100;
    D=8'h15;    WE=1;   RE=0;   A=5'b10011;      #100;
                WE=0;   RE=1;   A=5'b01011;      #100;
    D=8'h18;    WE=1;   RE=0;   A=5'b01001;      #100;
                WE=0;   RE=1;   A=5'b01110;      #100;
                WE=0;   RE=1;   A=5'b 01001;     #100;
    
    end
    always
    #50 CLK = ~CLK;  
    
endmodule

module part6_test();
    
    reg [31:0] D;
    reg [4:0] A; //address
    reg R; //reset
    reg RE; //read enable
    reg WE; //write enable
    reg CLK;
    wire [31:0] out;
    
    memory_128byte uut(D, A, R, RE, WE, CLK, out);
    
    initial begin
    
    CLK=0;  R=0;
    D=32'h20;     RE=1;     WE=0;    A=5'd2;        #100;
    D=32'h20;     RE=1;     WE=1;    A=5'd2;        #100;
    D=32'h9;      RE=1;     WE=1;                   #100;
    D=32'h1;      RE=0;     WE=1;    A=5'd2;        #100;
    D=32'h7;      RE=1;     WE=0;    A=5'd11;       #100;  
    D=32'h13;     RE=1;     WE=1;                   #100;
    D=32'h4;      RE=1;     WE=1;                   #100;
    D=32'h6;      RE=1;     WE=0;    A=5'd7;        #100;
    D=32'h5;      RE=1;     WE=1;                   #100;
    D=32'h11;     RE=1;     WE=1;                   #100;
    
    end
    always
    #50 CLK = ~CLK;  
    
    always
    #500 R = ~R; 
endmodule

