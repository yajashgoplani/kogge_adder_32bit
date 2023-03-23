`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2023 11:05:11 PM
// Design Name: 
// Module Name: kaggetest
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


module kaggetest(

    );
    reg [31:0] A,B;
    wire [31:0] prop0,gen0,prop1,gen1,prop2,gen2,prop3,gen3,prop4,gen4;
    wire [32:0] sum;
    kagge kg(A,B,prop0,gen0,prop1,gen1,prop2,gen2,prop3,gen3,prop4,gen4,sum);
    initial 
    begin
        A=32'haaccbbbb;B=32'hccccbbee;
        #10 $finish;
    end    
    
endmodule
