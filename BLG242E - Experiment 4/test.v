`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2021 17:41:31
// Design Name: 
// Module Name: experiment4_test
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

module sr_latch_with_en_test(); // part2
    
    reg S;
    reg R;
    reg EN;

    wire Q;
    wire Q_neg;

    sr_latch_with_en uut(S, R, EN, Q, Q_neg);

    initial begin
        S=1; R=0; EN=1; #100;  
        S=1; R=0; EN=0; #100; 
        
        S=0; R=0; EN=1; #100;  
        S=0; R=0; EN=0; #100;
         
        S=0; R=1; EN=1; #100;
        S=0; R=1; EN=0; #100;
        
        S=0; R=0; EN=1; #100;
        S=0; R=0; EN=0; #100;
        
   //   S=1; R=1; EN=1; #100;   (disallowed inputs)
   //   S=1; R=1; EN=0; #100;   (disallowed inputs)
    end
endmodule

module part3_test();

    reg D;
    reg CLK;
    
    wire Q;
    wire Q_neg;
    
    Dflipflop uut(D, CLK, Q, Q_neg);
    

initial begin 
    CLK=0;
    D=0;  #100;
    D=1;  #100;
    D=0;  #100;
    D=1;  #100;
 end
always
    #50 CLK = ~CLK;
endmodule

module part4_test();
    reg [15:0] loaded_value;
    reg CLK;
    reg LOAD;
    wire output1;
    pulse_generator uut(loaded_value[15:0], CLK, LOAD, output1);
initial begin 
    CLK=0;      loaded_value = 16'b1111111111100000; LOAD=1; #50;
    LOAD=0;     loaded_value = 16'd1;    #50;
    LOAD=0;     loaded_value = 16'd2;    #50;
    LOAD=0;     loaded_value = 16'd3;    #50;
    LOAD=0;     loaded_value = 16'd4;    #50;
    LOAD=0;     loaded_value = 16'd5;    #50;
    LOAD=0;     loaded_value = 16'd6;    #50;
    LOAD=0;     loaded_value = 16'd7;    #50;
    LOAD=0;     loaded_value = 16'd8;    #50;
    LOAD=0;     loaded_value = 16'd9;    #50;
    LOAD=0;     loaded_value = 16'd10;   #50;
    LOAD=0;     loaded_value = 16'd11;   #50;
    LOAD=0;     loaded_value = 16'd12;   #50;
    LOAD=0;     loaded_value = 16'd13;   #50;
    LOAD=0;     loaded_value = 16'd14;   #50;
    LOAD=1;     loaded_value = 16'd15;   #50;
end

always begin
    CLK <= ~CLK;    #5.555555555555555555555555; 
    CLK <= ~CLK;    #44.44444444444444444444444; 
end
endmodule

