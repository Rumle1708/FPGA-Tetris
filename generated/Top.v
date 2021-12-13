module ClockDivider(
  input   clock,
  input   reset,
  output  io_tick
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] cntReg; // @[ClockDivider.scala 8:25]
  wire [2:0] _T_2 = $signed(cntReg) - 3'sh1; // @[ClockDivider.scala 11:22]
  assign io_tick = cntReg[2]; // @[ClockDivider.scala 12:16]
  always @(posedge clock) begin
    if (reset) begin // @[ClockDivider.scala 8:25]
      cntReg <= 3'sh2; // @[ClockDivider.scala 8:25]
    end else if (cntReg[2]) begin // @[ClockDivider.scala 12:35]
      cntReg <= 3'sh2; // @[ClockDivider.scala 13:16]
    end else begin
      cntReg <= _T_2; // @[ClockDivider.scala 11:12]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cntReg = _RAND_0[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module HorizontalCounter(
  input   clock,
  input   reset,
  input   io_pxlCLK,
  output  io_horSync,
  output  io_dispTime,
  output  io_enVCnt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] cntReg; // @[HorizontalCounter.scala 24:23]
  reg  outputReg1; // @[HorizontalCounter.scala 25:27]
  reg  outputReg2; // @[HorizontalCounter.scala 26:27]
  wire [15:0] _T_1 = cntReg + 16'h1; // @[HorizontalCounter.scala 35:22]
  wire  _T_3 = ~outputReg2; // @[HorizontalCounter.scala 37:21]
  wire  _GEN_0 = cntReg == 16'h27f ? ~outputReg2 : outputReg2; // @[HorizontalCounter.scala 36:42 HorizontalCounter.scala 37:18 HorizontalCounter.scala 26:27]
  wire  _T_5 = ~outputReg1; // @[HorizontalCounter.scala 40:21]
  wire  _GEN_1 = cntReg == 16'h28f ? ~outputReg1 : outputReg1; // @[HorizontalCounter.scala 39:56 HorizontalCounter.scala 40:18 HorizontalCounter.scala 25:27]
  wire  _GEN_2 = cntReg == 16'h2ef ? _T_5 : _GEN_1; // @[HorizontalCounter.scala 42:69 HorizontalCounter.scala 43:18]
  wire  _T_8 = cntReg == 16'h31f; // @[HorizontalCounter.scala 45:17]
  wire  _GEN_4 = cntReg == 16'h31f ? _T_3 : _GEN_0; // @[HorizontalCounter.scala 45:82 HorizontalCounter.scala 47:18]
  wire  _GEN_7 = io_pxlCLK ? _GEN_4 : outputReg2; // @[HorizontalCounter.scala 34:19 HorizontalCounter.scala 26:27]
  wire  _GEN_8 = io_pxlCLK ? _GEN_2 : outputReg1; // @[HorizontalCounter.scala 34:19 HorizontalCounter.scala 25:27]
  assign io_horSync = outputReg1; // @[HorizontalCounter.scala 29:14]
  assign io_dispTime = outputReg2; // @[HorizontalCounter.scala 30:15]
  assign io_enVCnt = io_pxlCLK & _T_8; // @[HorizontalCounter.scala 34:19 HorizontalCounter.scala 32:13]
  always @(posedge clock) begin
    if (reset) begin // @[HorizontalCounter.scala 24:23]
      cntReg <= 16'h0; // @[HorizontalCounter.scala 24:23]
    end else if (io_pxlCLK) begin // @[HorizontalCounter.scala 34:19]
      if (cntReg == 16'h31f) begin // @[HorizontalCounter.scala 45:82]
        cntReg <= 16'h0; // @[HorizontalCounter.scala 46:14]
      end else begin
        cntReg <= _T_1; // @[HorizontalCounter.scala 35:12]
      end
    end
    outputReg1 <= reset | _GEN_8; // @[HorizontalCounter.scala 25:27 HorizontalCounter.scala 25:27]
    outputReg2 <= reset | _GEN_7; // @[HorizontalCounter.scala 26:27 HorizontalCounter.scala 26:27]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cntReg = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  outputReg1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  outputReg2 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module VerticalCounter(
  input   clock,
  input   reset,
  input   io_enVCnt,
  output  io_verSync,
  output  io_dispTime
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [15:0] cntReg; // @[VerticalCounter.scala 22:23]
  reg  outputReg1; // @[VerticalCounter.scala 23:27]
  reg  outputReg2; // @[VerticalCounter.scala 24:27]
  wire [15:0] _T_1 = cntReg + 16'h1; // @[VerticalCounter.scala 32:22]
  wire  _T_3 = ~outputReg2; // @[VerticalCounter.scala 34:21]
  wire  _GEN_0 = cntReg == 16'h1df ? ~outputReg2 : outputReg2; // @[VerticalCounter.scala 33:42 VerticalCounter.scala 34:18 VerticalCounter.scala 24:27]
  wire  _T_5 = ~outputReg1; // @[VerticalCounter.scala 37:21]
  wire  _GEN_1 = cntReg == 16'h1e9 ? ~outputReg1 : outputReg1; // @[VerticalCounter.scala 36:56 VerticalCounter.scala 37:18 VerticalCounter.scala 23:27]
  wire  _GEN_2 = cntReg == 16'h1eb ? _T_5 : _GEN_1; // @[VerticalCounter.scala 39:69 VerticalCounter.scala 40:18]
  wire  _GEN_4 = cntReg == 16'h20c ? _T_3 : _GEN_0; // @[VerticalCounter.scala 42:82 VerticalCounter.scala 44:18]
  wire  _GEN_6 = io_enVCnt ? _GEN_4 : outputReg2; // @[VerticalCounter.scala 31:19 VerticalCounter.scala 24:27]
  wire  _GEN_7 = io_enVCnt ? _GEN_2 : outputReg1; // @[VerticalCounter.scala 31:19 VerticalCounter.scala 23:27]
  assign io_verSync = outputReg1; // @[VerticalCounter.scala 27:14]
  assign io_dispTime = outputReg2; // @[VerticalCounter.scala 28:15]
  always @(posedge clock) begin
    if (reset) begin // @[VerticalCounter.scala 22:23]
      cntReg <= 16'h0; // @[VerticalCounter.scala 22:23]
    end else if (io_enVCnt) begin // @[VerticalCounter.scala 31:19]
      if (cntReg == 16'h20c) begin // @[VerticalCounter.scala 42:82]
        cntReg <= 16'h0; // @[VerticalCounter.scala 43:14]
      end else begin
        cntReg <= _T_1; // @[VerticalCounter.scala 32:12]
      end
    end
    outputReg1 <= reset | _GEN_7; // @[VerticalCounter.scala 23:27 VerticalCounter.scala 23:27]
    outputReg2 <= reset | _GEN_6; // @[VerticalCounter.scala 24:27 VerticalCounter.scala 24:27]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cntReg = _RAND_0[15:0];
  _RAND_1 = {1{`RANDOM}};
  outputReg1 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  outputReg2 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module VGAController(
  input        clock,
  input        reset,
  input  [3:0] io_Rin,
  input  [3:0] io_Gin,
  input  [3:0] io_Bin,
  output       io_hSync,
  output       io_vSync,
  output [3:0] io_R,
  output [3:0] io_G,
  output [3:0] io_B
);
  wire  clkdiv_clock; // @[VGAController.scala 11:22]
  wire  clkdiv_reset; // @[VGAController.scala 11:22]
  wire  clkdiv_io_tick; // @[VGAController.scala 11:22]
  wire  horCntr_clock; // @[VGAController.scala 12:23]
  wire  horCntr_reset; // @[VGAController.scala 12:23]
  wire  horCntr_io_pxlCLK; // @[VGAController.scala 12:23]
  wire  horCntr_io_horSync; // @[VGAController.scala 12:23]
  wire  horCntr_io_dispTime; // @[VGAController.scala 12:23]
  wire  horCntr_io_enVCnt; // @[VGAController.scala 12:23]
  wire  verCntr_clock; // @[VGAController.scala 13:23]
  wire  verCntr_reset; // @[VGAController.scala 13:23]
  wire  verCntr_io_enVCnt; // @[VGAController.scala 13:23]
  wire  verCntr_io_verSync; // @[VGAController.scala 13:23]
  wire  verCntr_io_dispTime; // @[VGAController.scala 13:23]
  ClockDivider clkdiv ( // @[VGAController.scala 11:22]
    .clock(clkdiv_clock),
    .reset(clkdiv_reset),
    .io_tick(clkdiv_io_tick)
  );
  HorizontalCounter horCntr ( // @[VGAController.scala 12:23]
    .clock(horCntr_clock),
    .reset(horCntr_reset),
    .io_pxlCLK(horCntr_io_pxlCLK),
    .io_horSync(horCntr_io_horSync),
    .io_dispTime(horCntr_io_dispTime),
    .io_enVCnt(horCntr_io_enVCnt)
  );
  VerticalCounter verCntr ( // @[VGAController.scala 13:23]
    .clock(verCntr_clock),
    .reset(verCntr_reset),
    .io_enVCnt(verCntr_io_enVCnt),
    .io_verSync(verCntr_io_verSync),
    .io_dispTime(verCntr_io_dispTime)
  );
  assign io_hSync = horCntr_io_horSync; // @[VGAController.scala 31:12]
  assign io_vSync = verCntr_io_verSync; // @[VGAController.scala 32:12]
  assign io_R = horCntr_io_dispTime & verCntr_io_dispTime ? io_Rin : 4'h0; // @[VGAController.scala 20:51 VGAController.scala 21:10 VGAController.scala 25:10]
  assign io_G = horCntr_io_dispTime & verCntr_io_dispTime ? io_Gin : 4'h0; // @[VGAController.scala 20:51 VGAController.scala 22:10 VGAController.scala 26:10]
  assign io_B = horCntr_io_dispTime & verCntr_io_dispTime ? io_Bin : 4'h0; // @[VGAController.scala 20:51 VGAController.scala 23:10 VGAController.scala 27:10]
  assign clkdiv_clock = clock;
  assign clkdiv_reset = reset;
  assign horCntr_clock = clock;
  assign horCntr_reset = reset;
  assign horCntr_io_pxlCLK = clkdiv_io_tick; // @[VGAController.scala 16:21]
  assign verCntr_clock = clock;
  assign verCntr_reset = reset;
  assign verCntr_io_enVCnt = horCntr_io_enVCnt; // @[VGAController.scala 17:21]
endmodule
module Top(
  input        clock,
  input        reset,
  output       io_hSync,
  output       io_vSync,
  output [3:0] io_R,
  output [3:0] io_G,
  output [3:0] io_B,
  input  [3:0] io_Rin,
  input  [3:0] io_Gin,
  input  [3:0] io_Bin
);
  wire  vGACtrl_clock; // @[Top.scala 11:25]
  wire  vGACtrl_reset; // @[Top.scala 11:25]
  wire [3:0] vGACtrl_io_Rin; // @[Top.scala 11:25]
  wire [3:0] vGACtrl_io_Gin; // @[Top.scala 11:25]
  wire [3:0] vGACtrl_io_Bin; // @[Top.scala 11:25]
  wire  vGACtrl_io_hSync; // @[Top.scala 11:25]
  wire  vGACtrl_io_vSync; // @[Top.scala 11:25]
  wire [3:0] vGACtrl_io_R; // @[Top.scala 11:25]
  wire [3:0] vGACtrl_io_G; // @[Top.scala 11:25]
  wire [3:0] vGACtrl_io_B; // @[Top.scala 11:25]
  VGAController vGACtrl ( // @[Top.scala 11:25]
    .clock(vGACtrl_clock),
    .reset(vGACtrl_reset),
    .io_Rin(vGACtrl_io_Rin),
    .io_Gin(vGACtrl_io_Gin),
    .io_Bin(vGACtrl_io_Bin),
    .io_hSync(vGACtrl_io_hSync),
    .io_vSync(vGACtrl_io_vSync),
    .io_R(vGACtrl_io_R),
    .io_G(vGACtrl_io_G),
    .io_B(vGACtrl_io_B)
  );
  assign io_hSync = vGACtrl_io_hSync; // @[Top.scala 22:14]
  assign io_vSync = vGACtrl_io_vSync; // @[Top.scala 23:14]
  assign io_R = vGACtrl_io_R; // @[Top.scala 17:10]
  assign io_G = vGACtrl_io_G; // @[Top.scala 18:10]
  assign io_B = vGACtrl_io_B; // @[Top.scala 19:10]
  assign vGACtrl_clock = clock;
  assign vGACtrl_reset = reset;
  assign vGACtrl_io_Rin = io_Rin; // @[Top.scala 12:20]
  assign vGACtrl_io_Gin = io_Gin; // @[Top.scala 13:20]
  assign vGACtrl_io_Bin = io_Bin; // @[Top.scala 14:20]
endmodule
