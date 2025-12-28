`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2025 19:02:38
// Design Name: 
// Module Name: handelling_of_bs
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

module handelling_of_bs(money_in,bout);
input [1:0]money_in;
output reg [3:0]bout;
always@(money_in)
begin
case(money_in)
    2'b00:bout=4'b0000;
    2'b01:bout=4'b0001;
    2'b10:bout=4'b0010;
    2'b11:bout=4'b0101;
endcase
end 
endmodule
