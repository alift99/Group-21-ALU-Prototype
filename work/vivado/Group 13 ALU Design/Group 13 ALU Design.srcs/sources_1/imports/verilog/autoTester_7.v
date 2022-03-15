/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module autoTester_7 (
    input clk,
    input rst,
    output reg [15:0] a,
    output reg [15:0] b,
    output reg [5:0] alufn,
    output reg [15:0] solution,
    output reg simError
  );
  
  
  
  localparam A_ROM = 128'h000a0040000580172e2b000601000000;
  
  localparam B_ROM = 128'h00050018000400014563800501000004;
  
  localparam ALUFN_ROM = 48'h001823616cf5;
  
  localparam SOLUTION_ROM = 128'h000f00280050c00b0423800300010001;
  
  
  localparam TESTCASE1_testState = 3'd0;
  localparam TESTCASE2_testState = 3'd1;
  localparam TESTCASE3_testState = 3'd2;
  localparam TESTCASE4_testState = 3'd3;
  localparam TESTCASE5_testState = 3'd4;
  localparam TESTCASE6_testState = 3'd5;
  localparam TESTCASE7_testState = 3'd6;
  localparam TESTCASE8_testState = 3'd7;
  
  reg [2:0] M_testState_d, M_testState_q = TESTCASE1_testState;
  
  always @* begin
    M_testState_d = M_testState_q;
    
    a = 16'h0000;
    b = 16'h0000;
    alufn = 6'h00;
    solution = 16'h0000;
    simError = 1'h0;
    
    case (M_testState_q)
      TESTCASE1_testState: begin
        a = 16'h0000;
        b = 16'h0004;
        alufn = 6'h35;
        solution = 16'h0001;
        simError = 1'h0;
        M_testState_d = TESTCASE2_testState;
      end
      TESTCASE2_testState: begin
        a = 16'h0100;
        b = 16'h0100;
        alufn = 6'h33;
        solution = 16'h0001;
        simError = 1'h1;
        M_testState_d = TESTCASE3_testState;
      end
      TESTCASE3_testState: begin
        a = 16'h0006;
        b = 16'h8005;
        alufn = 6'h16;
        solution = 16'h8003;
        simError = 1'h0;
        M_testState_d = TESTCASE4_testState;
      end
      TESTCASE4_testState: begin
        a = 16'h2e2b;
        b = 16'h4563;
        alufn = 6'h18;
        solution = 16'h0423;
        simError = 1'h1;
        M_testState_d = TESTCASE5_testState;
      end
      TESTCASE5_testState: begin
        a = 16'h8017;
        b = 16'h0001;
        alufn = 6'h23;
        solution = 16'hc00b;
        simError = 1'h0;
        M_testState_d = TESTCASE6_testState;
      end
      TESTCASE6_testState: begin
        a = 16'h0005;
        b = 16'h0004;
        alufn = 6'h20;
        solution = 16'h0050;
        simError = 1'h1;
        M_testState_d = TESTCASE7_testState;
      end
      TESTCASE7_testState: begin
        a = 16'h0040;
        b = 16'h0018;
        alufn = 6'h01;
        solution = 16'h0028;
        simError = 1'h0;
        M_testState_d = TESTCASE8_testState;
      end
      TESTCASE8_testState: begin
        a = 16'h000a;
        b = 16'h0005;
        alufn = 6'h00;
        solution = 16'h000f;
        simError = 1'h1;
        M_testState_d = TESTCASE1_testState;
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_testState_q <= 1'h0;
    end else begin
      M_testState_q <= M_testState_d;
    end
  end
  
endmodule
