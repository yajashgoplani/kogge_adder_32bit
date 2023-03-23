`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2023 02:43:50 PM
// Design Name: 
// Module Name: kogge_int
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
module kogge_int(output P2,G2,input P1,G1,P0,G0);
    wire P2,G2;
    assign P2=P1 & P0;
    assign G2=(P1&G0)|G1;
endmodule;    
