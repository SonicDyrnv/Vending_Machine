`timescale 1ns / 1ps

module testbench_vending_machine;
    reg reset;
    reg confirm;
    reg [1:0] money_in;
    reg [3:0] purchase_in;
    wire [3:0] money_return;
    wire invalid;
    vending_mach uut (.reset(reset),.confirm(confirm),.money_in(money_in),.purchase_in(purchase_in), 
        .money_return(money_return),.invalid(invalid));
    initial 
    begin
        reset = 1;
        confirm = 0;
        money_in = 2'b00;
        purchase_in = 4'b0000;
        force uut.clk = 1'b0; //This will help me in making initial value of clock is 0
        // Which will of course be true in case of vending machine
        #10 reset = 0;
        #10 release uut.clk;
        // TEST SCENARIO: Add Money
        money_in = 2'b01; #10;
        money_in = 2'b00; #10;
        money_in = 2'b10; #10;
        money_in = 2'b00; #10;
        money_in = 2'b10; #10;
        money_in = 2'b00; #10;
        #20;
        confirm = 1; // Proceed with current amount of money
        // Which is 5(50Rs) at present.
        #5;
        purchase_in = 4'b0011; #10;
        purchase_in = 4'b0000; #10;
        confirm = 0; 
        // At every negativeedge money_return amount should be returned & Reset should be triggered.
        // Now vending machine should return amount.(2(20Rs))
        #50;
        // Starting new Session.
        reset = 1;
        #10 reset = 0;
        #10 money_in = 2'b11;
        #10 money_in = 2'b00;
        #10 money_in = 2'b11;
        #10 money_in = 2'b00;
        #10 money_in = 2'b11;
        #10 money_in = 2'b00;
        #10 confirm = 1;
        // This simulates invalid = 1, since money overload because more than 100Rs is not allowd
        // We need to return every money to customer and reset the machine
        #10 confirm = 0; reset = 1;
        #10 reset = 0;
        #10 money_in = 2'b11;
        #10 money_in = 2'b00;
        #10 money_in = 2'b11;
        #10 money_in = 2'b00;
        #10 confirm = 1;
        #10 purchase_in = 4'b0101;
        #10 purchase_in = 4'b0000;
        #10 purchase_in = 4'b0001;
        #10 purchase_in = 4'b0000;
        #10 confirm = 0;
        #50
        $finish;
    end

endmodule