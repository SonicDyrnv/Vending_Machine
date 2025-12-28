`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2025 22:15:48
// Design Name: 
// Module Name: vending_mach
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

module vending_mach(reset,confirm,money_in,purchase_in,money_return,invalid);
input reset, confirm;
input [1:0]money_in;
input [3:0]purchase_in;
output reg [3:0]money_return;
output reg invalid;
wire [3:0]sumouts;
wire cin;
wire [3:0]qouts;
wire [3:0]couts;
reg [3:0]bs1,bs;
wire [3:0]bs0;
reg clk;
FullAdder F0(confirm, qouts[0], bs[0], sumouts[0], couts[0]);
DFF D0(sumouts[0],qouts[0],reset,clk);
FullAdder F1(couts[0], qouts[1], bs[1], sumouts[1], couts[1]);
DFF D1(sumouts[1],qouts[1],reset,clk);
FullAdder F2(couts[1], qouts[2], bs[2], sumouts[2], couts[2]);
DFF D2(sumouts[2],qouts[2],reset,clk);
FullAdder F3(couts[2], qouts[3], bs[3], sumouts[3], couts[3]);
DFF D3(sumouts[3],qouts[3],reset,clk);
handelling_of_bs BS0(money_in,bs0);
always@(*)
begin
    if(money_in[0]|money_in[1]|(purchase_in!=4'b0000))
    begin
        clk<=1'b1;
    end
    else
    begin
        clk<=1'b0;
    end 
end
always@(*)
begin
    if(confirm)
    begin
        bs<=bs1;
    end
    else
    begin
        bs<=bs0;
    end
end
always@(*)
begin
    bs1=~purchase_in;    
end 
always@(*)
begin
    money_return = qouts;
end
always@(*)
begin
    invalid<=((couts[3])&(~confirm)); // If invalid becomes 1 then reset should trigger automatically
    // and machine should return all amount without giving any-products, and session should terminate.
end
endmodule   
