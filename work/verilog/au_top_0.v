/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  
  wire [(2'h2+0)-1:0] M_buttondetector_out;
  reg [(2'h2+0)-1:0] M_buttondetector_in;
  
  genvar GEN_buttondetector0;
  generate
  for (GEN_buttondetector0=0;GEN_buttondetector0<2'h2;GEN_buttondetector0=GEN_buttondetector0+1) begin: buttondetector_gen_0
    edge_detector_2 buttondetector (
      .clk(clk),
      .in(M_buttondetector_in[GEN_buttondetector0*(1)+(1)-1-:(1)]),
      .out(M_buttondetector_out[GEN_buttondetector0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [(2'h2+0)-1:0] M_buttoncond_out;
  reg [(2'h2+0)-1:0] M_buttoncond_in;
  
  genvar GEN_buttoncond0;
  generate
  for (GEN_buttoncond0=0;GEN_buttoncond0<2'h2;GEN_buttoncond0=GEN_buttoncond0+1) begin: buttoncond_gen_0
    button_conditioner_3 buttoncond (
      .clk(clk),
      .in(M_buttoncond_in[GEN_buttoncond0*(1)+(1)-1-:(1)]),
      .out(M_buttoncond_out[GEN_buttoncond0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  
  wire [16-1:0] M_aluMachine_out;
  wire [3-1:0] M_aluMachine_zvn;
  reg [16-1:0] M_aluMachine_a;
  reg [16-1:0] M_aluMachine_b;
  reg [6-1:0] M_aluMachine_alufn;
  reg [1-1:0] M_aluMachine_simError;
  alu_4 aluMachine (
    .a(M_aluMachine_a),
    .b(M_aluMachine_b),
    .alufn(M_aluMachine_alufn),
    .simError(M_aluMachine_simError),
    .out(M_aluMachine_out),
    .zvn(M_aluMachine_zvn)
  );
  
  wire [16-1:0] M_inputMachine_a_out;
  wire [16-1:0] M_inputMachine_b_out;
  wire [6-1:0] M_inputMachine_alufn_out;
  wire [1-1:0] M_inputMachine_displayState;
  reg [16-1:0] M_inputMachine_input_switches;
  reg [1-1:0] M_inputMachine_enter_button;
  inputSM_5 inputMachine (
    .clk(clk),
    .rst(rst),
    .input_switches(M_inputMachine_input_switches),
    .enter_button(M_inputMachine_enter_button),
    .a_out(M_inputMachine_a_out),
    .b_out(M_inputMachine_b_out),
    .alufn_out(M_inputMachine_alufn_out),
    .displayState(M_inputMachine_displayState)
  );
  
  wire [1-1:0] M_slowclock_value;
  counter_6 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  
  wire [16-1:0] M_autoTestMachine_a;
  wire [16-1:0] M_autoTestMachine_b;
  wire [6-1:0] M_autoTestMachine_alufn;
  wire [16-1:0] M_autoTestMachine_solution;
  wire [1-1:0] M_autoTestMachine_simError;
  autoTester_7 autoTestMachine (
    .clk(M_slowclock_value),
    .rst(rst),
    .a(M_autoTestMachine_a),
    .b(M_autoTestMachine_b),
    .alufn(M_autoTestMachine_alufn),
    .solution(M_autoTestMachine_solution),
    .simError(M_autoTestMachine_simError)
  );
  
  
  localparam MANUAL_testMode = 1'd0;
  localparam AUTO_testMode = 1'd1;
  
  reg M_testMode_d, M_testMode_q = MANUAL_testMode;
  
  always @* begin
    M_testMode_d = M_testMode_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_buttoncond_in = io_button[0+1-:2];
    M_buttondetector_in = M_buttoncond_out;
    M_inputMachine_enter_button = M_buttondetector_out[1+0-:1];
    M_inputMachine_input_switches[0+7-:8] = io_dip[0+0+7-:8];
    M_inputMachine_input_switches[8+7-:8] = io_dip[8+0+7-:8];
    
    case (M_testMode_q)
      MANUAL_testMode: begin
        if (M_buttondetector_out[0+0-:1]) begin
          M_testMode_d = AUTO_testMode;
        end else begin
          if (M_inputMachine_displayState) begin
            M_aluMachine_a = M_inputMachine_a_out;
            M_aluMachine_b = M_inputMachine_b_out;
            M_aluMachine_alufn = M_inputMachine_alufn_out;
            M_aluMachine_simError = 1'h0;
            io_led[0+0+7-:8] = M_aluMachine_out[0+7-:8];
            io_led[8+0+7-:8] = M_aluMachine_out[8+7-:8];
            io_led[16+0+2-:3] = M_aluMachine_zvn;
          end else begin
            M_aluMachine_a = 16'h0000;
            M_aluMachine_b = 16'h0000;
            M_aluMachine_alufn = 6'h00;
            M_aluMachine_simError = 1'h0;
            io_led = 24'h000000;
          end
        end
      end
      AUTO_testMode: begin
        if (M_buttondetector_out[0+0-:1]) begin
          M_testMode_d = MANUAL_testMode;
        end else begin
          M_aluMachine_a = M_autoTestMachine_a;
          M_aluMachine_b = M_autoTestMachine_b;
          M_aluMachine_alufn = M_autoTestMachine_alufn;
          M_aluMachine_simError = M_autoTestMachine_simError;
          io_led[0+0+7-:8] = M_aluMachine_out[0+7-:8];
          io_led[8+0+7-:8] = M_aluMachine_out[8+7-:8];
          io_led[16+0+2-:3] = M_aluMachine_zvn;
          io_led[16+7+0-:1] = ~(M_aluMachine_out == M_autoTestMachine_solution);
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_testMode_q <= 1'h0;
    end else begin
      M_testMode_q <= M_testMode_d;
    end
  end
  
endmodule
