`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2026
// Design Name: 
// Module Name: datapath_tb
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


module datapath_tb;
    //signal declaration
    logic test_clk, test_clr, test_go;
    logic [7:0] test_xin, test_yin;
    logic [7:0] test_gcd_out;

    //instantiate circuit under test
    datapath uut (
        .clk(test_clk),
        .clr(test_clr),
        .go(test_go),
        .xin(test_xin),
        .yin(test_yin),
        .gcd_out(test_gcd_out)
    );

    //clock generation
    always
    begin
        test_clk = 1'b0;
        #5;
        test_clk = 1'b1;
        #5;
    end

    initial
    begin
        //test vector 1: GCD(15, 70) = 5 (ejemplo del PDF)
        test_clr = 1'b1;
        test_go = 1'b0;
        test_xin = 8'd15;
        test_yin = 8'd70;
        #10;
        test_clr = 1'b0;
        test_go = 1'b1;
        #300;
        //test vector 2: GCD(24, 18) = 6
        test_clr = 1'b1;
        test_go = 1'b0;
        test_xin = 8'd24;
        test_yin = 8'd18;
        #10;
        test_clr = 1'b0;
        test_go = 1'b1;
        #200;
        //stop simulation
        $stop;
    end
endmodule
