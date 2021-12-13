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
  input        clock,
  input        reset,
  input        io_pxlCLK,
  output [9:0] io_horCnt,
  output       io_horSync,
  output       io_dispTime,
  output       io_enVCnt
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] cntReg; // @[HorizontalCounter.scala 24:23]
  reg  outputReg1; // @[HorizontalCounter.scala 25:27]
  reg  outputReg2; // @[HorizontalCounter.scala 26:27]
  wire [9:0] _T_1 = cntReg + 10'h1; // @[HorizontalCounter.scala 35:22]
  wire [9:0] _T_3 = 10'h280 - 10'h1; // @[HorizontalCounter.scala 36:34]
  wire  _T_5 = ~outputReg2; // @[HorizontalCounter.scala 37:21]
  wire  _GEN_0 = cntReg == _T_3 ? ~outputReg2 : outputReg2; // @[HorizontalCounter.scala 36:40 HorizontalCounter.scala 37:18 HorizontalCounter.scala 26:27]
  wire [9:0] _T_9 = 10'h290 - 10'h1; // @[HorizontalCounter.scala 39:48]
  wire  _T_11 = ~outputReg1; // @[HorizontalCounter.scala 40:21]
  wire  _GEN_1 = cntReg == _T_9 ? ~outputReg1 : outputReg1; // @[HorizontalCounter.scala 39:54 HorizontalCounter.scala 40:18 HorizontalCounter.scala 25:27]
  wire [9:0] _T_17 = 10'h2f0 - 10'h1; // @[HorizontalCounter.scala 42:61]
  wire  _GEN_2 = cntReg == _T_17 ? _T_11 : _GEN_1; // @[HorizontalCounter.scala 42:67 HorizontalCounter.scala 43:18]
  wire [9:0] _T_27 = 10'h320 - 10'h1; // @[HorizontalCounter.scala 45:74]
  wire  _T_28 = cntReg == _T_27; // @[HorizontalCounter.scala 45:17]
  wire  _GEN_4 = cntReg == _T_27 ? _T_5 : _GEN_0; // @[HorizontalCounter.scala 45:80 HorizontalCounter.scala 47:18]
  wire  _GEN_7 = io_pxlCLK ? _GEN_4 : outputReg2; // @[HorizontalCounter.scala 34:19 HorizontalCounter.scala 26:27]
  wire  _GEN_8 = io_pxlCLK ? _GEN_2 : outputReg1; // @[HorizontalCounter.scala 34:19 HorizontalCounter.scala 25:27]
  assign io_horCnt = cntReg; // @[HorizontalCounter.scala 31:13]
  assign io_horSync = outputReg1; // @[HorizontalCounter.scala 29:14]
  assign io_dispTime = outputReg2; // @[HorizontalCounter.scala 30:15]
  assign io_enVCnt = io_pxlCLK & _T_28; // @[HorizontalCounter.scala 34:19 HorizontalCounter.scala 32:13]
  always @(posedge clock) begin
    if (reset) begin // @[HorizontalCounter.scala 24:23]
      cntReg <= 10'h0; // @[HorizontalCounter.scala 24:23]
    end else if (io_pxlCLK) begin // @[HorizontalCounter.scala 34:19]
      if (cntReg == _T_27) begin // @[HorizontalCounter.scala 45:80]
        cntReg <= 10'h0; // @[HorizontalCounter.scala 46:14]
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
  cntReg = _RAND_0[9:0];
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
  input        clock,
  input        reset,
  input        io_enVCnt,
  output [9:0] io_verCnt,
  output       io_verSync,
  output       io_dispTime
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [9:0] cntReg; // @[VerticalCounter.scala 22:23]
  reg  outputReg1; // @[VerticalCounter.scala 23:27]
  reg  outputReg2; // @[VerticalCounter.scala 24:27]
  wire [9:0] _T_1 = cntReg + 10'h1; // @[VerticalCounter.scala 32:22]
  wire [8:0] _T_3 = 9'h1e0 - 9'h1; // @[VerticalCounter.scala 33:34]
  wire [9:0] _GEN_8 = {{1'd0}, _T_3}; // @[VerticalCounter.scala 33:17]
  wire  _T_5 = ~outputReg2; // @[VerticalCounter.scala 34:21]
  wire  _GEN_0 = cntReg == _GEN_8 ? ~outputReg2 : outputReg2; // @[VerticalCounter.scala 33:40 VerticalCounter.scala 34:18 VerticalCounter.scala 24:27]
  wire [8:0] _T_9 = 9'h1ea - 9'h1; // @[VerticalCounter.scala 36:48]
  wire [9:0] _GEN_9 = {{1'd0}, _T_9}; // @[VerticalCounter.scala 36:17]
  wire  _T_11 = ~outputReg1; // @[VerticalCounter.scala 37:21]
  wire  _GEN_1 = cntReg == _GEN_9 ? ~outputReg1 : outputReg1; // @[VerticalCounter.scala 36:54 VerticalCounter.scala 37:18 VerticalCounter.scala 23:27]
  wire [8:0] _T_17 = 9'h1ec - 9'h1; // @[VerticalCounter.scala 39:61]
  wire [9:0] _GEN_10 = {{1'd0}, _T_17}; // @[VerticalCounter.scala 39:17]
  wire  _GEN_2 = cntReg == _GEN_10 ? _T_11 : _GEN_1; // @[VerticalCounter.scala 39:67 VerticalCounter.scala 40:18]
  wire [8:0] _T_27 = 9'hd - 9'h1; // @[VerticalCounter.scala 42:74]
  wire [9:0] _GEN_11 = {{1'd0}, _T_27}; // @[VerticalCounter.scala 42:17]
  wire  _GEN_4 = cntReg == _GEN_11 ? _T_5 : _GEN_0; // @[VerticalCounter.scala 42:80 VerticalCounter.scala 44:18]
  wire  _GEN_6 = io_enVCnt ? _GEN_4 : outputReg2; // @[VerticalCounter.scala 31:19 VerticalCounter.scala 24:27]
  wire  _GEN_7 = io_enVCnt ? _GEN_2 : outputReg1; // @[VerticalCounter.scala 31:19 VerticalCounter.scala 23:27]
  assign io_verCnt = cntReg; // @[VerticalCounter.scala 29:13]
  assign io_verSync = outputReg1; // @[VerticalCounter.scala 27:14]
  assign io_dispTime = outputReg2; // @[VerticalCounter.scala 28:15]
  always @(posedge clock) begin
    if (reset) begin // @[VerticalCounter.scala 22:23]
      cntReg <= 10'h0; // @[VerticalCounter.scala 22:23]
    end else if (io_enVCnt) begin // @[VerticalCounter.scala 31:19]
      if (cntReg == _GEN_11) begin // @[VerticalCounter.scala 42:80]
        cntReg <= 10'h0; // @[VerticalCounter.scala 43:14]
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
  cntReg = _RAND_0[9:0];
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
module Top(
  input   clock,
  input   reset,
  output  io_HS
);
  wire  clkdiv_clock; // @[Top.scala 14:24]
  wire  clkdiv_reset; // @[Top.scala 14:24]
  wire  clkdiv_io_tick; // @[Top.scala 14:24]
  wire  horCounter_clock; // @[Top.scala 15:28]
  wire  horCounter_reset; // @[Top.scala 15:28]
  wire  horCounter_io_pxlCLK; // @[Top.scala 15:28]
  wire [9:0] horCounter_io_horCnt; // @[Top.scala 15:28]
  wire  horCounter_io_horSync; // @[Top.scala 15:28]
  wire  horCounter_io_dispTime; // @[Top.scala 15:28]
  wire  horCounter_io_enVCnt; // @[Top.scala 15:28]
  wire  verCounter_clock; // @[Top.scala 16:28]
  wire  verCounter_reset; // @[Top.scala 16:28]
  wire  verCounter_io_enVCnt; // @[Top.scala 16:28]
  wire [9:0] verCounter_io_verCnt; // @[Top.scala 16:28]
  wire  verCounter_io_verSync; // @[Top.scala 16:28]
  wire  verCounter_io_dispTime; // @[Top.scala 16:28]
  wire  nice2 = verCounter_io_dispTime & verCounter_io_verSync & verCounter_io_verCnt[0]; // @[Top.scala 20:65]
  ClockDivider clkdiv ( // @[Top.scala 14:24]
    .clock(clkdiv_clock),
    .reset(clkdiv_reset),
    .io_tick(clkdiv_io_tick)
  );
  HorizontalCounter horCounter ( // @[Top.scala 15:28]
    .clock(horCounter_clock),
    .reset(horCounter_reset),
    .io_pxlCLK(horCounter_io_pxlCLK),
    .io_horCnt(horCounter_io_horCnt),
    .io_horSync(horCounter_io_horSync),
    .io_dispTime(horCounter_io_dispTime),
    .io_enVCnt(horCounter_io_enVCnt)
  );
  VerticalCounter verCounter ( // @[Top.scala 16:28]
    .clock(verCounter_clock),
    .reset(verCounter_reset),
    .io_enVCnt(verCounter_io_enVCnt),
    .io_verCnt(verCounter_io_verCnt),
    .io_verSync(verCounter_io_verSync),
    .io_dispTime(verCounter_io_dispTime)
  );
  assign io_HS = clkdiv_io_tick & horCounter_io_dispTime & horCounter_io_horSync & horCounter_io_enVCnt &
    horCounter_io_horCnt[0] & nice2; // @[Top.scala 22:115]
  assign clkdiv_clock = clock;
  assign clkdiv_reset = reset;
  assign horCounter_clock = clock;
  assign horCounter_reset = reset;
  assign horCounter_io_pxlCLK = clkdiv_io_tick; // @[Top.scala 17:26]
  assign verCounter_clock = clock;
  assign verCounter_reset = reset;
  assign verCounter_io_enVCnt = horCounter_io_enVCnt; // @[Top.scala 18:26]
endmodule
