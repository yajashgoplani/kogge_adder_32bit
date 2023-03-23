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
module blackcell(output P1,G1,input P0,G0,P0_prev,G0_prev);
    wire P1,G1;
    assign P1=P0_prev & P0;
    assign G1=(P0&G0_prev)|G0;
endmodule;    
