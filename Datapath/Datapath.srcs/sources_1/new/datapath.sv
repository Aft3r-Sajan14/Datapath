`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2026
// Design Name: 
// Module Name: datapath
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


module datapath(
    input logic clk, clr, go,
    input logic [7:0] xin, yin,
    output logic [7:0] gcd_out
    );

    //signal declaration
    logic xsel, ysel, xld, yld, gld;
    logic eqflg, ltflg;
    logic [7:0] x1, y1, x, y, xr, yr;

    //instantiate control unit
    control_unit u_control_unit (
        .clk(clk),
        .clr(clr),
        .go(go),
        .eqflg(eqflg),
        .ltflg(ltflg),
        .xsel(xsel),
        .ysel(ysel),
        .gld(gld),
        .yld(yld),
        .xld(xld)
    );

    //instantiate multiplexers
    multiplexer xmux (
        .in_0(xr),
        .in_1(xin),
        .sel(xsel),
        .mux_out(x1)
    );

    multiplexer ymux (
        .in_0(yr),
        .in_1(yin),
        .sel(ysel),
        .mux_out(y1)
    );

    //instantiate registers
    register xreg (
        .clk(clk),
        .clr(clr),
        .ld(xld),
        .d(x1),
        .q(x)
    );

    register yreg (
        .clk(clk),
        .clr(clr),
        .ld(yld),
        .d(y1),
        .q(y)
    );

    register greg (
        .clk(clk),
        .clr(clr),
        .ld(gld),
        .d(x),
        .q(gcd_out)
    );

    //instantiate subtractors
    subtractor xsubstractor (
        .a(x),
        .b(y),
        .r(xr)
    );

    subtractor ysubstractor (
        .a(y),
        .b(x),
        .r(yr)
    );

    //instantiate comparator
    comparator compare (
        .x(x),
        .y(y),
        .eqflg(eqflg),
        .ltflg(ltflg)
    );

endmodule
