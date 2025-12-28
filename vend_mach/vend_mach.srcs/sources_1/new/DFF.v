`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 19:00:54
// Design Name: 
// Module Name: DFF
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


module DFF(din,q,reset,clk);
input din,reset,clk;
output reg q;
always @(posedge clk or posedge reset)
if (reset)
begin
    q<=0;
end 
else
begin
    q<=din;
end
endmodule
