circuit Top :
  module ClockDivider :
    input clock : Clock
    input reset : UInt<1>
    output io_tick : UInt<1>

    reg cntReg : SInt<3>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[ClockDivider.scala 8:25]
    node _cntReg_T = sub(cntReg, asSInt(UInt<2>("h1"))) @[ClockDivider.scala 11:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[ClockDivider.scala 11:22]
    node _cntReg_T_2 = asSInt(_cntReg_T_1) @[ClockDivider.scala 11:22]
    node _T = bits(cntReg, 2, 2) @[ClockDivider.scala 12:16]
    node _GEN_0 = mux(_T, asSInt(UInt<3>("h2")), _cntReg_T_2) @[ClockDivider.scala 12:35 ClockDivider.scala 13:16 ClockDivider.scala 11:12]
    node _GEN_1 = mux(_T, UInt<1>("h1"), UInt<1>("h0")) @[ClockDivider.scala 12:35 ClockDivider.scala 14:17 ClockDivider.scala 9:13]
    io_tick <= _GEN_1
    cntReg <= mux(reset, asSInt(UInt<3>("h2")), _GEN_0) @[ClockDivider.scala 8:25 ClockDivider.scala 8:25]

  module HorizontalCounter :
    input clock : Clock
    input reset : UInt<1>
    input io_pxlCLK : UInt<1>
    output io_horCnt : UInt<10>
    output io_horSync : UInt<1>
    output io_dispTime : UInt<1>
    output io_enVCnt : UInt<1>

    reg cntReg : UInt<10>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[HorizontalCounter.scala 24:23]
    reg outputReg1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outputReg1) @[HorizontalCounter.scala 25:27]
    reg outputReg2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outputReg2) @[HorizontalCounter.scala 26:27]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[HorizontalCounter.scala 35:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[HorizontalCounter.scala 35:22]
    node _T = eq(cntReg, UInt<10>("h27f")) @[HorizontalCounter.scala 36:17]
    node _outputReg2_T = not(outputReg2) @[HorizontalCounter.scala 37:21]
    node _GEN_0 = mux(_T, _outputReg2_T, outputReg2) @[HorizontalCounter.scala 36:42 HorizontalCounter.scala 37:18 HorizontalCounter.scala 26:27]
    node _T_1 = eq(cntReg, UInt<10>("h28f")) @[HorizontalCounter.scala 39:17]
    node _outputReg1_T = not(outputReg1) @[HorizontalCounter.scala 40:21]
    node _GEN_1 = mux(_T_1, _outputReg1_T, outputReg1) @[HorizontalCounter.scala 39:56 HorizontalCounter.scala 40:18 HorizontalCounter.scala 25:27]
    node _T_2 = eq(cntReg, UInt<10>("h2ef")) @[HorizontalCounter.scala 42:17]
    node _outputReg1_T_1 = not(outputReg1) @[HorizontalCounter.scala 43:21]
    node _GEN_2 = mux(_T_2, _outputReg1_T_1, _GEN_1) @[HorizontalCounter.scala 42:69 HorizontalCounter.scala 43:18]
    node _T_3 = eq(cntReg, UInt<10>("h31f")) @[HorizontalCounter.scala 45:17]
    node _outputReg2_T_1 = not(outputReg2) @[HorizontalCounter.scala 47:21]
    node _GEN_3 = mux(_T_3, UInt<1>("h0"), _cntReg_T_1) @[HorizontalCounter.scala 45:82 HorizontalCounter.scala 46:14 HorizontalCounter.scala 35:12]
    node _GEN_4 = mux(_T_3, _outputReg2_T_1, _GEN_0) @[HorizontalCounter.scala 45:82 HorizontalCounter.scala 47:18]
    node _GEN_5 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[HorizontalCounter.scala 45:82 HorizontalCounter.scala 48:17 HorizontalCounter.scala 32:13]
    node _GEN_6 = mux(io_pxlCLK, _GEN_3, cntReg) @[HorizontalCounter.scala 34:19 HorizontalCounter.scala 24:23]
    node _GEN_7 = mux(io_pxlCLK, _GEN_4, outputReg2) @[HorizontalCounter.scala 34:19 HorizontalCounter.scala 26:27]
    node _GEN_8 = mux(io_pxlCLK, _GEN_2, outputReg1) @[HorizontalCounter.scala 34:19 HorizontalCounter.scala 25:27]
    node _GEN_9 = mux(io_pxlCLK, _GEN_5, UInt<1>("h0")) @[HorizontalCounter.scala 34:19 HorizontalCounter.scala 32:13]
    io_horCnt <= cntReg @[HorizontalCounter.scala 31:13]
    io_horSync <= outputReg1 @[HorizontalCounter.scala 29:14]
    io_dispTime <= outputReg2 @[HorizontalCounter.scala 30:15]
    io_enVCnt <= _GEN_9
    cntReg <= mux(reset, UInt<10>("h0"), _GEN_6) @[HorizontalCounter.scala 24:23 HorizontalCounter.scala 24:23]
    outputReg1 <= mux(reset, UInt<1>("h1"), _GEN_8) @[HorizontalCounter.scala 25:27 HorizontalCounter.scala 25:27]
    outputReg2 <= mux(reset, UInt<1>("h1"), _GEN_7) @[HorizontalCounter.scala 26:27 HorizontalCounter.scala 26:27]

  module VerticalCounter :
    input clock : Clock
    input reset : UInt<1>
    input io_enVCnt : UInt<1>
    output io_verCnt : UInt<10>
    output io_verSync : UInt<1>
    output io_dispTime : UInt<1>

    reg cntReg : UInt<10>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[VerticalCounter.scala 22:23]
    reg outputReg1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outputReg1) @[VerticalCounter.scala 23:27]
    reg outputReg2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outputReg2) @[VerticalCounter.scala 24:27]
    node _cntReg_T = add(cntReg, UInt<1>("h1")) @[VerticalCounter.scala 32:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[VerticalCounter.scala 32:22]
    node _T = eq(cntReg, UInt<9>("h1df")) @[VerticalCounter.scala 33:17]
    node _outputReg2_T = not(outputReg2) @[VerticalCounter.scala 34:21]
    node _GEN_0 = mux(_T, _outputReg2_T, outputReg2) @[VerticalCounter.scala 33:42 VerticalCounter.scala 34:18 VerticalCounter.scala 24:27]
    node _T_1 = eq(cntReg, UInt<9>("h1e9")) @[VerticalCounter.scala 36:17]
    node _outputReg1_T = not(outputReg1) @[VerticalCounter.scala 37:21]
    node _GEN_1 = mux(_T_1, _outputReg1_T, outputReg1) @[VerticalCounter.scala 36:56 VerticalCounter.scala 37:18 VerticalCounter.scala 23:27]
    node _T_2 = eq(cntReg, UInt<9>("h1eb")) @[VerticalCounter.scala 39:17]
    node _outputReg1_T_1 = not(outputReg1) @[VerticalCounter.scala 40:21]
    node _GEN_2 = mux(_T_2, _outputReg1_T_1, _GEN_1) @[VerticalCounter.scala 39:69 VerticalCounter.scala 40:18]
    node _T_3 = eq(cntReg, UInt<10>("h20c")) @[VerticalCounter.scala 42:17]
    node _outputReg2_T_1 = not(outputReg2) @[VerticalCounter.scala 44:21]
    node _GEN_3 = mux(_T_3, UInt<1>("h0"), _cntReg_T_1) @[VerticalCounter.scala 42:82 VerticalCounter.scala 43:14 VerticalCounter.scala 32:12]
    node _GEN_4 = mux(_T_3, _outputReg2_T_1, _GEN_0) @[VerticalCounter.scala 42:82 VerticalCounter.scala 44:18]
    node _GEN_5 = mux(io_enVCnt, _GEN_3, cntReg) @[VerticalCounter.scala 31:19 VerticalCounter.scala 22:23]
    node _GEN_6 = mux(io_enVCnt, _GEN_4, outputReg2) @[VerticalCounter.scala 31:19 VerticalCounter.scala 24:27]
    node _GEN_7 = mux(io_enVCnt, _GEN_2, outputReg1) @[VerticalCounter.scala 31:19 VerticalCounter.scala 23:27]
    io_verCnt <= cntReg @[VerticalCounter.scala 29:13]
    io_verSync <= outputReg1 @[VerticalCounter.scala 27:14]
    io_dispTime <= outputReg2 @[VerticalCounter.scala 28:15]
    cntReg <= mux(reset, UInt<10>("h0"), _GEN_5) @[VerticalCounter.scala 22:23 VerticalCounter.scala 22:23]
    outputReg1 <= mux(reset, UInt<1>("h1"), _GEN_7) @[VerticalCounter.scala 23:27 VerticalCounter.scala 23:27]
    outputReg2 <= mux(reset, UInt<1>("h1"), _GEN_6) @[VerticalCounter.scala 24:27 VerticalCounter.scala 24:27]

  module VGAController :
    input clock : Clock
    input reset : UInt<1>
    input io_Rin : UInt<4>
    input io_Gin : UInt<4>
    input io_Bin : UInt<4>
    output io_hSync : UInt<1>
    output io_vSync : UInt<1>
    output io_R : UInt<4>
    output io_G : UInt<4>
    output io_B : UInt<4>
    output io_horCntr : UInt<10>
    output io_verCntr : UInt<10>

    inst clkDiv of ClockDivider @[VGAController.scala 12:22]
    inst horCntr of HorizontalCounter @[VGAController.scala 13:23]
    inst verCntr of VerticalCounter @[VGAController.scala 14:23]
    node _T = and(horCntr.io_dispTime, verCntr.io_dispTime) @[VGAController.scala 21:28]
    node _GEN_0 = mux(_T, io_Rin, UInt<1>("h0")) @[VGAController.scala 21:51 VGAController.scala 22:10 VGAController.scala 26:10]
    node _GEN_1 = mux(_T, io_Gin, UInt<1>("h0")) @[VGAController.scala 21:51 VGAController.scala 23:10 VGAController.scala 27:10]
    node _GEN_2 = mux(_T, io_Bin, UInt<1>("h0")) @[VGAController.scala 21:51 VGAController.scala 24:10 VGAController.scala 28:10]
    io_hSync <= horCntr.io_horSync @[VGAController.scala 32:12]
    io_vSync <= verCntr.io_verSync @[VGAController.scala 33:12]
    io_R <= _GEN_0
    io_G <= _GEN_1
    io_B <= _GEN_2
    io_horCntr <= horCntr.io_horCnt @[VGAController.scala 36:14]
    io_verCntr <= verCntr.io_verCnt @[VGAController.scala 37:14]
    clkDiv.clock <= clock
    clkDiv.reset <= reset
    horCntr.clock <= clock
    horCntr.reset <= reset
    horCntr.io_pxlCLK <= clkDiv.io_tick @[VGAController.scala 17:21]
    verCntr.clock <= clock
    verCntr.reset <= reset
    verCntr.io_enVCnt <= horCntr.io_enVCnt @[VGAController.scala 18:21]

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io_hSync : UInt<1>
    output io_vSync : UInt<1>
    output io_R : UInt<4>
    output io_G : UInt<4>
    output io_B : UInt<4>

    mem mem : @[Top.scala 29:26]
      data-type => UInt<12>
      depth => 1024
      read-latency => 1
      write-latency => 1
      reader => vGACtrl_io_Rin_MPORT
      reader => vGACtrl_io_Gin_MPORT
      reader => vGACtrl_io_Bin_MPORT
      read-under-write => undefined
    inst vGACtrl of VGAController @[Top.scala 35:25]
    node _memAdrs_T = add(vGACtrl.io_horCntr, vGACtrl.io_verCntr) @[Top.scala 36:38]
    node memAdrs = tail(_memAdrs_T, 1) @[Top.scala 36:38]
    node _GEN_0 = validif(UInt<1>("h1"), memAdrs) @[Top.scala 37:31 Top.scala 37:31]
    node _vGACtrl_io_Rin_WIRE = _GEN_0 @[Top.scala 37:31]
    node _vGACtrl_io_Rin_T = or(_vGACtrl_io_Rin_WIRE, UInt<10>("h0")) @[Top.scala 37:31]
    node _vGACtrl_io_Rin_T_1 = bits(_vGACtrl_io_Rin_T, 9, 0) @[Top.scala 37:31]
    node _GEN_1 = mux(UInt<1>("h1"), UInt<1>("h1"), UInt<1>("h0")) @[Top.scala 37:31 Top.scala 37:31 Top.scala 29:26]
    node _GEN_2 = validif(UInt<1>("h1"), _vGACtrl_io_Rin_T_1) @[Top.scala 37:31 Top.scala 37:31]
    node _GEN_3 = validif(UInt<1>("h1"), clock) @[Top.scala 37:31 Top.scala 37:31]
    node _vGACtrl_io_Rin_T_2 = bits(mem.vGACtrl_io_Rin_MPORT.data, 3, 0) @[Top.scala 37:40]
    node _vGACtrl_io_Gin_WIRE = _GEN_0 @[Top.scala 38:31]
    node _vGACtrl_io_Gin_T = or(_vGACtrl_io_Gin_WIRE, UInt<10>("h0")) @[Top.scala 38:31]
    node _vGACtrl_io_Gin_T_1 = bits(_vGACtrl_io_Gin_T, 9, 0) @[Top.scala 38:31]
    node _GEN_4 = validif(UInt<1>("h1"), _vGACtrl_io_Gin_T_1) @[Top.scala 38:31 Top.scala 38:31]
    node _vGACtrl_io_Gin_T_2 = bits(mem.vGACtrl_io_Gin_MPORT.data, 7, 4) @[Top.scala 38:40]
    node _vGACtrl_io_Bin_WIRE = _GEN_0 @[Top.scala 39:31]
    node _vGACtrl_io_Bin_T = or(_vGACtrl_io_Bin_WIRE, UInt<10>("h0")) @[Top.scala 39:31]
    node _vGACtrl_io_Bin_T_1 = bits(_vGACtrl_io_Bin_T, 9, 0) @[Top.scala 39:31]
    node _GEN_5 = validif(UInt<1>("h1"), _vGACtrl_io_Bin_T_1) @[Top.scala 39:31 Top.scala 39:31]
    node _vGACtrl_io_Bin_T_2 = bits(mem.vGACtrl_io_Bin_MPORT.data, 11, 8) @[Top.scala 39:40]
    io_hSync <= vGACtrl.io_hSync @[Top.scala 47:14]
    io_vSync <= vGACtrl.io_vSync @[Top.scala 48:14]
    io_R <= vGACtrl.io_R @[Top.scala 42:10]
    io_G <= vGACtrl.io_G @[Top.scala 43:10]
    io_B <= vGACtrl.io_B @[Top.scala 44:10]
    mem.vGACtrl_io_Rin_MPORT.addr <= _GEN_2
    mem.vGACtrl_io_Rin_MPORT.en <= _GEN_1
    mem.vGACtrl_io_Rin_MPORT.clk <= _GEN_3
    mem.vGACtrl_io_Gin_MPORT.addr <= _GEN_4
    mem.vGACtrl_io_Gin_MPORT.en <= _GEN_1
    mem.vGACtrl_io_Gin_MPORT.clk <= _GEN_3
    mem.vGACtrl_io_Bin_MPORT.addr <= _GEN_5
    mem.vGACtrl_io_Bin_MPORT.en <= _GEN_1
    mem.vGACtrl_io_Bin_MPORT.clk <= _GEN_3
    vGACtrl.clock <= clock
    vGACtrl.reset <= reset
    vGACtrl.io_Rin <= _vGACtrl_io_Rin_T_2 @[Top.scala 37:20]
    vGACtrl.io_Gin <= _vGACtrl_io_Gin_T_2 @[Top.scala 38:20]
    vGACtrl.io_Bin <= _vGACtrl_io_Bin_T_2 @[Top.scala 39:20]
