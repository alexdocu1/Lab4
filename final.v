`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2023 01:37:27 PM
// Design Name: 
// Module Name: Adder4
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

module final(
    input [3:0] A,
    input [3:0] B,
    input sel,
    output [6:0] display
   // output [3:0] an
    );
    
    wire[3:0]Sum;
    wire[3:0]y;
    wire[3:0]Co;
    Adder4 adder4(.A(A),.B(B),.Sum(Sum),.Nc(Co));
    mux2to1 mux2(.C(Co),.y(y),.sel(sel),.sum(Sum));
    Seven_Seg seg0(.s(y),.seg(display));
    //assign an = 4'b0111;
    endmodule
    
    
    
    
module Adder4(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum,
    output Nc
   
    
    );
    wire[3:0] Co;
    wire Ci;
    wire Cout;
    assign Ci = 1'b0;
    
    Adder add0(.A(A[0]),.B(B[0]),.Ci(Ci),.Sum(Sum[0]),.Co(Co[0]));
    Adder add1(.A(A[1]),.B(B[1]),.Ci(Co[0]),.Sum(Sum[1]),.Co(Co[1]));
    Adder add2(.A(A[2]),.B(B[2]),.Ci(Co[1]),.Sum(Sum[2]),.Co(Co[2]));
    Adder add3(.A(A[3]),.B(B[3]),.Ci(Co[2]),.Sum(Sum[3]),.Co(Co[3]));
   
    assign Cout=Co[3];
    assign Nc = {3'b0,Cout};
    
   
endmodule

module Adder(
    input A,
    input B,
    input Ci,
    output reg Co,
    output reg Sum
    );
    always@(*)
   begin 
   
   case({A,B,Ci})
    3'b000:  Sum = 1'b0;
    3'b001:  Sum = 1'b1;
    3'b010: Sum = 1'b1;
    3'b011: Sum = 1'b0;
    3'b100:  Sum = 1'b1;
    3'b101: Sum = 1'b0;
    3'b110:  Sum = 1'b0;
    3'b111: Sum = 1'b1;
    endcase
    
   case({A,B,Ci})
    3'b000:  Co = 1'b0;
    3'b001:  Co = 1'b0;
    3'b010: Co = 1'b0;
    3'b011: Co = 1'b1;
    3'b100:  Co = 1'b0;
    3'b101: Co = 1'b1;
    3'b110:  Co = 1'b1;
    3'b111: Co = 1'b1;
    endcase
   end
  
endmodule

module Seven_Seg(
    //input s,
    input [3:0] s,
    output reg [6:0] seg
);  

always@(*)
   begin 
   case(s)
            4'b0000 : seg = 7'b0000001;
            4'b0001 : seg = 7'b1001111;
            4'b0010 : seg = 7'b0010010;
            4'b0011 : seg = 7'b0000110;
            4'b0100 : seg = 7'b1001100;
            4'b0101 : seg = 7'b0100100;
            4'b0110 : seg = 7'b0100000;
            4'b0111 : seg = 7'b0001111;
            4'b1000 : seg = 7'b0000000;
            4'b1001 : seg = 7'b0000100;
   // 1'b0:  display = 7'b0000001;
   // 1'b1:  display = 7'b1001111;
   endcase
   end
endmodule

module mux2to1(
input sel,
input [3:0]sum,
input [3:0]C,
output reg [3:0]y
);
always@(*)
   begin 
   case(sel)
            1'b0 : y = sum;
            1'b1 : y = C;     
   endcase
   
   end


endmodule

 
    
    


