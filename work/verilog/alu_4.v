/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_4 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out,
    output reg [2:0] zvn
  );
  
  
  
  wire [16-1:0] M_bodyOfAdder_out;
  wire [1-1:0] M_bodyOfAdder_z;
  wire [1-1:0] M_bodyOfAdder_v;
  wire [1-1:0] M_bodyOfAdder_n;
  reg [16-1:0] M_bodyOfAdder_a;
  reg [16-1:0] M_bodyOfAdder_b;
  reg [6-1:0] M_bodyOfAdder_alufn;
  adder_7 bodyOfAdder (
    .a(M_bodyOfAdder_a),
    .b(M_bodyOfAdder_b),
    .alufn(M_bodyOfAdder_alufn),
    .out(M_bodyOfAdder_out),
    .z(M_bodyOfAdder_z),
    .v(M_bodyOfAdder_v),
    .n(M_bodyOfAdder_n)
  );
  
  wire [16-1:0] M_bodyOfShifter_out;
  reg [16-1:0] M_bodyOfShifter_a;
  reg [4-1:0] M_bodyOfShifter_b;
  reg [6-1:0] M_bodyOfShifter_alufn;
  shifter_8 bodyOfShifter (
    .a(M_bodyOfShifter_a),
    .b(M_bodyOfShifter_b),
    .alufn(M_bodyOfShifter_alufn),
    .out(M_bodyOfShifter_out)
  );
  
  wire [16-1:0] M_bodyOfBoolean_out;
  reg [16-1:0] M_bodyOfBoolean_a;
  reg [16-1:0] M_bodyOfBoolean_b;
  reg [6-1:0] M_bodyOfBoolean_alufn;
  boolean_9 bodyOfBoolean (
    .a(M_bodyOfBoolean_a),
    .b(M_bodyOfBoolean_b),
    .alufn(M_bodyOfBoolean_alufn),
    .out(M_bodyOfBoolean_out)
  );
  
  wire [16-1:0] M_bodyOfCompare_out;
  reg [1-1:0] M_bodyOfCompare_z;
  reg [1-1:0] M_bodyOfCompare_v;
  reg [1-1:0] M_bodyOfCompare_n;
  reg [6-1:0] M_bodyOfCompare_alufn;
  compare_10 bodyOfCompare (
    .z(M_bodyOfCompare_z),
    .v(M_bodyOfCompare_v),
    .n(M_bodyOfCompare_n),
    .alufn(M_bodyOfCompare_alufn),
    .out(M_bodyOfCompare_out)
  );
  
  reg z;
  
  reg v;
  
  reg n;
  
  always @* begin
    M_bodyOfAdder_alufn = alufn;
    M_bodyOfAdder_a = a;
    M_bodyOfAdder_b = b;
    z = M_bodyOfAdder_z;
    v = M_bodyOfAdder_v;
    n = M_bodyOfAdder_n;
    zvn[0+0-:1] = z;
    zvn[1+0-:1] = v;
    zvn[2+0-:1] = n;
    M_bodyOfCompare_alufn = alufn;
    M_bodyOfCompare_z = z;
    M_bodyOfCompare_v = v;
    M_bodyOfCompare_n = n;
    M_bodyOfBoolean_alufn = alufn;
    M_bodyOfBoolean_a = a;
    M_bodyOfBoolean_b = b;
    M_bodyOfShifter_alufn = alufn;
    M_bodyOfShifter_a = a;
    M_bodyOfShifter_b = b[0+3-:4];
    
    case (alufn[4+1-:2])
      2'h0: begin
        out = M_bodyOfAdder_out;
      end
      2'h1: begin
        out = M_bodyOfBoolean_out;
      end
      2'h2: begin
        out = M_bodyOfShifter_out;
      end
      2'h3: begin
        out = M_bodyOfCompare_out;
      end
      default: begin
        out = 16'h0000;
      end
    endcase
  end
endmodule
