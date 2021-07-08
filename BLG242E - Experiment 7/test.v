`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.05.2021 23:35:20
// Design Name: 
// Module Name: experiment7_test
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
module part1_decoder_test();

    reg A;
    reg B;
    reg C;
    reg D;
    reg E; //enable
    
    wire [15:0] out;
    
    decoder uut(A, B, C, D, E, out); 

    initial begin  
    
    A=0;     B=0;     C=0;     D=0;     E=1;     #100;
    A=0;     B=0;     C=0;     D=1;     E=1;     #100;
    A=0;     B=0;     C=1;     D=1;     E=1;     #100;
    A=0;     B=1;     C=0;     D=0;     E=0;     #100;
    A=1;     B=1;     C=0;     D=1;     E=1;     #100;
    A=1;     B=0;     C=0;     D=0;     E=1;     #100;
    A=0;     B=1;     C=1;     D=0;     E=0;     #100;
    A=1;     B=0;     C=0;     D=1;     E=1;     #100;
    A=1;     B=1;     C=0;     D=1;     E=1;     #100;
    A=1;     B=0;     C=1;     D=1;     E=1;     #100;
   
    end
endmodule

module part1_test();//part1
    reg [15:0] dataIn;
    reg lineselect;
    reg clock;
    reg reset;
    wire [15:0] out;
    
    register_line uut(dataIn, lineselect, clock, reset, out);
    
    initial begin
    
    clock=0;    reset=1;
    
    dataIn=16'd144;        lineselect=1;        #100;
    dataIn=16'd24;         lineselect=0;        #100;
    dataIn=16'd123;        lineselect=1;        #100;
    dataIn=16'd41;         lineselect=1;        #100;
    dataIn=16'd18;         lineselect=1;        #100;
    dataIn=16'd14;         lineselect=0;        #100;
    dataIn=16'd15;         lineselect=1;        #100;
    dataIn=16'd16;         lineselect=1;        #100;
    dataIn=16'd1200;       lineselect=1;        #100;
    dataIn=16'd1444;       lineselect=1;        #100;
       
    end  
    
    always
    #50 clock = ~clock;  
    
    always
    #400 reset = ~reset; 
endmodule


module part2_test();//part2
    reg [3:0] selA;
    reg [3:0] selB;
    reg [3:0] selWrite;
    reg [15:0] dataIn;
    reg reset;
    reg writeEnable;
    reg clock;
    wire [15:0] dataA;
    wire [15:0] dataB;
    
    register_file uut(selA, selB, selWrite, dataIn, reset, writeEnable, clock, dataA, dataB);

    initial begin 
    
    clock=0;    reset=1;
    
    selA=4'b0000;   selB=4'b1110;   selWrite=4'b0001;   dataIn=16'd106;     writeEnable=1;      #100;
    selA=4'b0001;   selB=4'b0001;   selWrite=4'b0001;   dataIn=16'd114;     writeEnable=1;      #100;
    selA=4'b0000;   selB=4'b0000;   selWrite=4'b0001;   dataIn=16'd144;     writeEnable=0;      #100;
    selA=4'b1111;   selB=4'b1111;   selWrite=4'b0111;   dataIn=16'd105;     writeEnable=1;      #100;
    selA=4'b0000;   selB=4'b0000;   selWrite=4'b0000;   dataIn=16'd152;     writeEnable=1;      #100;
    selA=4'b0100;   selB=4'b0100;   selWrite=4'b0100;   dataIn=16'd177;     writeEnable=1;      #100;
    selA=4'b0100;   selB=4'b0100;   selWrite=4'b0010;   dataIn=16'd148;     writeEnable=0;      #100;
    selA=4'b0101;   selB=4'b1100;   selWrite=4'b0000;   dataIn=16'd144;     writeEnable=1;      #100;
    selA=4'b0000;   selB=4'b0000;   selWrite=4'b0000;   dataIn=16'd144;     writeEnable=1;      #100;
    selA=4'b1011;   selB=4'b1111;   selWrite=4'b1111;   dataIn=16'd144;     writeEnable=1;      #100;
     
    end
    
    always
    #50 clock = ~clock;  
    
    always
    #400 reset = ~reset; 
endmodule

module part3_test();//part3
    reg [15:0] srcA;
    reg [15:0] srcB;
    reg [2:0] Op;
    reg clock;
    reg reset;
    wire zeroFlag;
    wire [15:0] dst;
    
    ALU uut(srcA, srcB, Op, clock, reset, zeroFlag, dst);
    
    initial begin
    
    clock=0;    reset=1;
    
    srcA=16'd120;      srcB=16'd100;      Op=8'd0;     #100;
    srcA=16'd120;      srcB=16'd100;      Op=8'd1;     #100;
    srcA=16'd120;      srcB=16'd100;      Op=8'd2;     #100;
    srcA=16'd120;      srcB=16'd100;      Op=8'd3;     #100;
    srcA=16'd120;      srcB=16'd100;      Op=8'd4;     #100;
    srcA=16'd120;      srcB=16'd100;      Op=8'd5;     #100;
    srcA=16'd120;      srcB=16'd100;      Op=8'd6;     #100;
    srcA=16'd120;      srcB=16'd100;      Op=8'd7;     #100;
    srcA=16'd333;      srcB=16'd100;      Op=8'd2;     #100;
    srcA=16'd444;      srcB=16'd100;      Op=8'd3;     #100;
           
    end
    
    always
    #50 clock = ~clock;  
    
    always
    #400 reset = ~reset; 
endmodule

module part4_test();//part4
    reg [15:0] instruction;
    wire [3:0] opcode;
    wire [3:0] selWrite;
    wire [3:0] selA;
    wire [3:0] selB;
    wire [15:0] fourBitImmediate;
    wire [15:0] eightBitImmediate;
    wire writeEnable;
    wire isLoad;
    wire isImmediate;
    wire isBranch;
    wire isBranchNotEqual;
    wire isBranchEqual;
    
    inst_decoder uut(instruction, opcode, selWrite, selA, selB, fourBitImmediate, eightBitImmediate, writeEnable, isLoad, isImmediate, isBranch, isBranchNotEqual, isBranchEqual);
    
    initial begin
            
    instruction=16'b0000101011110000;      #100;
    instruction=16'b1000111101110001;      #100;
    instruction=16'b1001000010010010;      #100;
    instruction=16'b0110110011100011;      #100;
    instruction=16'b1001101011111000;      #100;
    instruction=16'b1111111111111001;      #100;
    instruction=16'b0100101011110110;      #100;
    instruction=16'b0111101011110000;      #100;
    instruction=16'b1001101011111110;      #100;
    instruction=16'b1111011110011111;      #100;
 
 end  
 endmodule    
 
 module part5_test();//part5
    reg reset;
    reg clock;
    reg zeroFlag;
    reg isBranch;
    reg isBranchEqual;
    reg isBranchNotEqual;
    reg [7:0] immediateAddress;
    wire [7:0] PC;
    
    program_counter uut(reset, clock, zeroFlag, isBranch, isBranchEqual, isBranchNotEqual, immediateAddress,PC);
    
    initial begin  
    
    clock=0;    reset=1;
    
    immediateAddress=8'd16;    isBranch=1;     isBranchEqual=0;       isBranchNotEqual=0;      zeroFlag=0;      #100;
    immediateAddress=8'd16;    isBranch=0;     isBranchEqual=1;       isBranchNotEqual=0;      zeroFlag=0;      #100;
    immediateAddress=8'd16;    isBranch=0;     isBranchEqual=0;       isBranchNotEqual=0;      zeroFlag=1;      #100;
    immediateAddress=8'd16;    isBranch=0;     isBranchEqual=0;       isBranchNotEqual=1;      zeroFlag=0;      #100;
    immediateAddress=8'd16;    isBranch=0;     isBranchEqual=0;       isBranchNotEqual=1;      zeroFlag=1;      #100;
    immediateAddress=8'd16;    isBranch=0;     isBranchEqual=0;       isBranchNotEqual=0;      zeroFlag=0;      #100;
    immediateAddress=8'd16;    isBranch=1;     isBranchEqual=0;       isBranchNotEqual=0;      zeroFlag=1;      #100;
    immediateAddress=8'd16;    isBranch=1;     isBranchEqual=0;       isBranchNotEqual=0;      zeroFlag=0;      #100;
    immediateAddress=8'd16;    isBranch=0;     isBranchEqual=1;       isBranchNotEqual=0;      zeroFlag=1;      #100;
    immediateAddress=8'd16;    isBranch=0;     isBranchEqual=1;       isBranchNotEqual=1;      zeroFlag=0;      #100;
    
    end
    
    always
    #50 clock = ~clock;  
    
    always
    #400 reset = ~reset; 
 endmodule
 
 module part6_test();
 
    reg clock;
    reg reset;
    wire [15:0] instruction_o;
    wire [15:0] A_data_o;
    wire [15:0] B_data_o;
    wire [15:0] dst_o;
    wire [7:0] PC_o;
    wire [15:0] srcB_o;

    mini_computer uut(clock, reset, instruction_o, A_data_o, B_data_o, dst_o, PC_o, srcB_o);
    

    initial begin  
    clock=0; reset=1; #100;
    end

    always
    #50 clock = ~clock;  
    
    always
    #400 reset = ~reset; 
 endmodule
