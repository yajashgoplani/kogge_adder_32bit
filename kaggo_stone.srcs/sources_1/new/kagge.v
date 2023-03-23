`timescale 1ns / 1ps
module kagge #(parameter WIDTH=32)
  (
   input  [WIDTH-1:0] A,
   input  [WIDTH-1:0] B,
   output [WIDTH-1:0] prop0,
   output [WIDTH-1:0] gen0,
   output [WIDTH-1:0] prop1,
   output [WIDTH-1:0] gen1,
   output [WIDTH-1:0] prop2,
   output [WIDTH-1:0] gen2,
   output [WIDTH-1:0] prop3,
   output [WIDTH-1:0] gen3,
   output [WIDTH-1:0] prop4,
   output [WIDTH-1:0] gen4,
   output [WIDTH:0] sum
   
   
  );

  wire [WIDTH-1:0] P0, G0;
  wire [WIDTH-1:0] P1, G1;
  wire [WIDTH-1:0] P2, G2;
  wire [WIDTH-1:0] P3,G3;
  wire [WIDTH-1:0] P4,G4;
  wire [WIDTH-1:0] P5,G5;
    genvar i,j;
    generate 
    for(i=0;i<WIDTH;i=i+1) begin
        xor xor1(P0[i],A[i],B[i]);
        and and1(G0[i],A[i],B[i]);
    end
    endgenerate 
    //stage 1
    generate
        for(i=0;i<1;i=i+1)
        begin
            buffer b1(G1[i],G0[i]);
        end
        for(i=1;i<2;i=i+1)
        begin
            greycell g1(G1[i],P0[i],G0[i],G0[i-1]);
        end   
        for(i=2;i<WIDTH;i=i+1)
        begin
            blackcell bl1(P1[i],G1[i],P0[i],G0[i],P0[i-1],G0[i-1]);
        end   
   endgenerate     
   
   //stage 2
   generate
        for(i=0;i<2;i=i+1)
        begin
            buffer b2(G2[i],G1[i]);
        end
        for(i=2;i<4;i=i+1)
        begin
            greycell g2(G2[i],P1[i],G1[i],G1[i-2]);
        end   
        for(i=4;i<WIDTH;i=i+1)
        begin
            blackcell bl2(P2[i],G2[i],P1[i],G1[i],P1[i-2],G2[i-2]);
        end   
   endgenerate   
    
   //stage 3
   generate
        for(i=0;i<4;i=i+1)
        begin
            buffer b3(G3[i],G2[i]);
        end
        for(i=4;i<8;i=i+1)
        begin
            greycell g3(G3[i],P2[i],G2[i],G2[i-4]);
        end   
        for(i=8;i<WIDTH;i=i+1)
        begin
            blackcell bl3(P3[i],G3[i],P2[i],G2[i],P2[i-4],G2[i-4]);
        end   
   endgenerate   
   
   
      //stage 4
   generate
        for(i=0;i<8;i=i+1)
        begin
            buffer b4(G4[i],G3[i]);
        end
        for(i=8;i<16;i=i+1)
        begin
            greycell g4(G4[i],P3[i],G3[i],G3[i-8]);
        end   
        for(i=16;i<WIDTH;i=i+1)
        begin
            blackcell bl4(P4[i],G4[i],P3[i],G3[i],P3[i-8],G3[i-8]);
        end   
   endgenerate  
         //stage 5
   generate
        for(i=0;i<16;i=i+1)
        begin
            buffer b5(G5[i],G4[i]);
        end
        for(i=16;i<32;i=i+1)
        begin
            greycell g5(G5[i],P4[i],G4[i],G4[i-16]);
        end   
        for(i=32;i<WIDTH;i=i+1)
        begin
            blackcell bl4(P5[i],G5[i],P4[i],G4[i],P4[i-16],G4[i-16]);
        end   
   endgenerate  
   
   
   
   
   
   
   assign sum[0]=P0[0]^1'b0;
   generate 
        for(i=1;i<WIDTH;i=i+1)
        begin
            sum s0(sum[i],P0[i],G3[i-1]);
        end
   endgenerate;
   assign sum[32]=G4[31];         
//    generate 
//        for(i=1;i<2;i=i+1)
//        begin 
//            for(j=2**i;j<WIDTH;j=j+1)
//            begin
//                kogge_int(P[i][j],G[i][j],P[i-1][j],G[i-1][j],P[i-1][j-1],G[i-1][j-1]);
//            end     
//            assign P[i][0]=P[i-1][0];
//            assign G[i][0]=G[i-1][0];
//        end
//    endgenerate    
  assign prop0=P0;
  assign gen0=G0;       
  assign prop1=P1;
  assign gen1=G1; 
  assign prop2=P2;
  assign gen2=G2; 
  assign prop3=P3;
  assign gen3=G3;  
  assign prop4=P4;
  assign gen4=G4;      
endmodule




