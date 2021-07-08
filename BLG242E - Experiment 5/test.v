`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.04.2021 14:07:57
// Design Name: 
// Module Name: experiment5_test
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
module sr_latch_test(); // part1
    
    reg S;
    reg R;

    wire Q;
    wire Q_neg;

    sr_latch uut(S, R, Q, Q_neg);

    initial begin
  
        S=1; R=0; #200;
        S=0; R=0; #200;
        S=0; R=1; #200;
        S=0; R=0; #200;
       // S=1; R=1; #250;  (disallowed inputs)
    end
endmodule

module jk_flipflop_test();

    reg J;
	reg K;
	reg CLK;
    wire Q;
    wire Q_neg;
    
    jk_flipflop uut(J, K, CLK, Q, Q_neg);
    

initial begin 
    CLK=0;     
    J=0; K=0;  #100;
    J=0; K=1;  #100;
    J=1; K=0;  #100;
    J=1; K=1;  #100;
 end
always
    #100 CLK = ~CLK;
endmodule


module t_flipflop_test();
    reg T;
    reg CLK;
    wire Q;
    wire Q_neg;
    
    t_flipflop uut(T, CLK, Q, Q_neg);
    
    initial begin 
    CLK=0;     
    T=0;  #100;
    T=1;  #100;
 end
always
    #100 CLK = ~CLK;



endmodule




module part1_test();

    reg A;
    reg B;
    reg CLK;
    wire Q1_neg;
    wire Q0;
    wire Z;
    
    part1 uut(A, B, CLK, Q1_neg, Q0, Z);
    

initial begin 
    CLK=0;
    A=0; B=0;  #100;
    A=0; B=1;  #100;
    A=1; B=0;  #100;
    A=1; B=1;  #100;
 end
always
    #100 CLK = ~CLK;
endmodule

module part3_test();//part3
    
    reg [15:0] X;
    reg LOAD;
    reg CLEAR;
    reg CLK;
    reg direction;
    reg [2:0] value; //increment-decrement value
    wire [15:0] out;

    counter_16bit uut(X, LOAD, CLEAR, CLK, direction, value, out);
    
    initial begin
    LOAD=0;     CLK = 0;    CLEAR=1;        X=16;                     
    
/*     
    LOAD=0;             CLEAR=1;    direction=1;    value=1;        #100;
    LOAD=1;             CLEAR=1;    direction=1;    value=1;        #100;
    LOAD=1;             CLEAR=0;    direction=1;    value=1;        #100;
    LOAD=1;             CLEAR=1;    direction=1;    value=1;        #100;
    LOAD=1;             CLEAR=1;    direction=1;    value=1;        #100;   */
    
    LOAD=0;             CLEAR=1;    direction=0;    value=2;        #100;
    LOAD=1;             CLEAR=1;    direction=0;    value=2;        #100;
    LOAD=1;             CLEAR=1;    direction=0;    value=2;        #100;
    LOAD=1;             CLEAR=1;    direction=0;    value=2;        #100;
    LOAD=1;             CLEAR=1;    direction=0;    value=2;        #100;
   
   

    
    
    end 
        always
        #50 CLK = ~CLK;
 endmodule
 
 module part4_test();
    reg CLEAR;
    reg initiate;
    reg CLK;
    wire [15:0] out;
    
    part4_4 uut(CLEAR, initiate, CLK, out[15:0]);
    
    initial begin
    
    CLK=0;  initiate = 0;   CLEAR=1;    #100
    initiate = 1;   CLEAR=1;    #100;
    initiate = 1;   CLEAR=1;    #100;
    initiate = 1;   CLEAR=1;    #100;
    initiate = 1;   CLEAR=1;    #100;
    initiate = 1;   CLEAR=1;    #100;

       end
    
            always
        #50 CLK = ~CLK;
   
endmodule
    

    