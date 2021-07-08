`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.04.2021 15:20:05
// Design Name: 
// Module Name: experiment6
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


module notgate(
    input  input1,//a  
    output  out
);

    assign out =~input1;//a'
endmodule

module tsb(//8-bit three state buffer 
    input [7:0]A, 
    input E, //control input/enable
    output reg [7:0]out
);

    always @(A or E) begin 
      if (E) begin
          out = A; 
      end
      else begin
          out = 8'bZ; //Z means high-impedence
      end 
    end 
endmodule 

module part1(
    input [7:0] D1,
    input [7:0] D2,
    input S, //select
    output reg [7:0] out
);

    wire S_neg;
    notgate NOT1(S, S_neg);


    wire [7:0]out1;
    wire [7:0]out2;
    tsb TS1(D2, S, out1);
    tsb TS2(D1, S_neg, out2);

    always @(*) begin 
        if(S==1) begin
            out=out1; 
        end
        else begin
            out=out2;
        end
    end
endmodule

module part2(
    input [7:0] D1,
    input [7:0] D2,
    input S, //select
    output reg [7:0] out1,
    output reg [7:0] out2
);

    wire [7:0]O1;
    wire [7:0]O2;
    wire [7:0]output1;
    wire [7:0]output2;

    wire S_neg;
    notgate NOT1(S, S_neg);

    tsb TSB_O2(D2, S, O2);
    tsb TSB_I2(O2, S, output2);

    tsb TSB_O1(D1, S_neg, O1);
    tsb TSB_I1(O1, S_neg, output1);
    

    always @(*) begin 
        if(S)begin
            out2=output2;
        end
        else begin
            out1=output1;
        end
    end
endmodule

module memory_line(//part3

    input wire [7:0]D,
    input wire R,
    input wire LS,
    input wire RE,
    input wire WE,
    input wire CLK,
    
    output wire [7:0] out 
);

    reg [7:0] out1;
    
    initial begin
    
    out1=8'dZ;
    end
    
    always @(posedge CLK) begin
        
        if (WE==1 && LS==1) begin
            out1 <= D; 
        end
    end
    
    always @(negedge R) begin
        
        out1 <= 8'dZ;
    end 
    
    assign out = (RE==1 && LS==1) ? out1 : 8'dZ;
    
endmodule

module memory_8byte(//part4
    input [7:0] D,
    input CS, //chip select
    input [2:0] A, //address
    input R, //reset
    input RE, //read enable
    input WE, //write enable
    input CLK,
    output reg [7:0] out
);

    wire [7:0]out1;
    wire [7:0]out2;
    wire [7:0]out3;
    wire [7:0]out4;
    wire [7:0]out5;
    wire [7:0]out6;
    wire [7:0]out7;
    wire [7:0]out8;

    memory_line ML1(D,R,1,RE,WE,CLK,out1);
    memory_line ML2(D,R,1,RE,WE,CLK,out2);
    memory_line ML3(D,R,1,RE,WE,CLK,out3);
    memory_line ML4(D,R,1,RE,WE,CLK,out4);
    memory_line ML5(D,R,1,RE,WE,CLK,out5);
    memory_line ML6(D,R,1,RE,WE,CLK,out6);
    memory_line ML7(D,R,1,RE,WE,CLK,out7);
    memory_line ML8(D,R,1,RE,WE,CLK,out8);

    always @(*) begin
        if(CS==1)begin
            case(A)
            3'b000:out=out1;
            
            3'b001:out=out2;
            
            3'b010:out=out3;

            3'b011:out=out4;
            
            3'b100:out=out5;

            3'b101:out=out6;
           
            3'b110:out=out7;
          
            3'b111:out=out8;
 
            endcase
        end
        else begin
                out=8'd0;
        end
    end

endmodule

module memory_32byte(//part5
    input [7:0] D,
    input [4:0] A, //chip selection(2) and line selection(3)
    input R, //reset
    input RE, //read enable
    input WE, //write enable
    input CLK,
    output reg [7:0] out
);

wire [7:0]out1;
wire [7:0]out2;
wire [7:0]out3;
wire [7:0]out4;

memory_8byte M0(D,1,A[4:2],R,RE,WE,CLK,out1); //first chip
memory_8byte M1(D,1,A[4:2],R,RE,WE,CLK,out2);//second chip
memory_8byte M2(D,1,A[4:2],R,RE,WE,CLK,out3); //third chip
memory_8byte M3(D,1,A[4:2],R,RE,WE,CLK,out4); //fourth chip

always @(*) begin
case(A[1:0])

    2'b00:begin
        out=out1;
    end

    2'b01:begin
        out=out2;
    end
    
    2'b10:begin
        out=out3;
    end

    2'b11:begin
        out=out4;
    end
endcase
end
endmodule

module memory_128byte(//part6
    input [31:0] D,
    input [4:0] A, //address
    input R, //reset
    input RE, //read enable
    input WE, //write enable
    input CLK,
    output reg [31:0] out
);

wire [7:0] out1_1;
wire [7:0] out1_2;
wire [7:0] out1_3;
wire [7:0] out1_4;
wire [7:0] out2_1;
wire [7:0] out2_2;
wire [7:0] out2_3;
wire [7:0] out2_4;
wire [7:0] out3_1;
wire [7:0] out3_2;
wire [7:0] out3_3;
wire [7:0] out3_4;
wire [7:0] out4_1;
wire [7:0] out4_2;
wire [7:0] out4_3;
wire [7:0] out4_4;

    memory_32byte M1(D[7:0],A[4:0],R,RE,WE,CLK,out1_1[7:0]);
    memory_32byte M2(D[15:8],A[4:0],R,RE,WE,CLK,out1_2[7:0]);
    memory_32byte M3(D[23:16],A[4:0],R,RE,WE,CLK,out1_3[7:0]);
    memory_32byte M4(D[31:24],A[4:0],R,RE,WE,CLK,out1_4[7:0]);

    memory_32byte M5(D[7:0],A[4:0],R,RE,WE,CLK,out2_1[7:0]);
    memory_32byte M6(D[15:8],A[4:0],R,RE,WE,CLK,out2_2[7:0]);
    memory_32byte M7(D[23:16],A[4:0],R,RE,WE,CLK,out2_3[7:0]);
    memory_32byte M8(D[31:24],A[4:0],R,RE,WE,CLK,out2_4[7:0]);

    memory_32byte M9(D[7:0],A[4:0],R,RE,WE,CLK,out3_1[7:0]);
    memory_32byte M10(D[15:8],A[4:0],R,RE,WE,CLK,out3_2[7:0]);
    memory_32byte M11(D[23:16],A[4:0],R,RE,WE,CLK,out3_3[7:0]);
    memory_32byte M12(D[31:24],A[4:0],R,RE,WE,CLK,out3_4[7:0]);

    memory_32byte M13(D[7:0],A[4:0],R,RE,WE,CLK, out4_1[7:0]);
    memory_32byte M14(D[15:8],A[4:0],R,RE,WE,CLK, out4_2[7:0]);
    memory_32byte M15(D[23:16],A[4:0],R,RE,WE,CLK, out4_3[7:0]);
    memory_32byte M16(D[31:24],A[4:0],R,RE,WE,CLK, out4_4[7:0]);

always @(*) begin
case(A[1:0])

    2'b00:begin //first chip
        out[7:0]=out1_1;
        out[15:8]=out1_2;
        out[23:16]=out1_3;
        out[31:24]=out1_4;
    end

    2'b01:begin//second chip
        out[7:0]=out2_1;
        out[15:8]=out2_2;
        out[23:16]=out2_3;
        out[31:24]=out2_4;
    end
    
    2'b10:begin//third chip
        out[7:0]=out3_1;
        out[15:8]=out3_2;
        out[23:16]=out3_3;
        out[31:24]=out3_4;
    end

    2'b11:begin //fourth chip
        out[7:0]=out4_1;
        out[15:8]=out4_2;
        out[23:16]=out4_3;
        out[31:24]=out4_4;
    end
endcase
end
endmodule







