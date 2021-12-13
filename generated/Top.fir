circuit Top :
  module ClockDivider :
    input clock : Clock
    input reset : Reset
    output io : { tick : UInt<1>}

    reg cntReg : SInt, clock with :
      reset => (reset, asSInt(UInt<3>("h2"))) @[ClockDivider.scala 8:25]
    io.tick <= UInt<1>("h0") @[ClockDivider.scala 9:13]
    node _cntReg_T = sub(cntReg, asSInt(UInt<2>("h1"))) @[ClockDivider.scala 11:22]
    node _cntReg_T_1 = tail(_cntReg_T, 1) @[ClockDivider.scala 11:22]
    node _cntReg_T_2 = asSInt(_cntReg_T_1) @[ClockDivider.scala 11:22]
    cntReg <= _cntReg_T_2 @[ClockDivider.scala 11:12]
    node _T = bits(cntReg, 2, 2) @[ClockDivider.scala 12:16]
    when _T : @[ClockDivider.scala 12:35]
      cntReg <= asSInt(UInt<3>("h2")) @[ClockDivider.scala 13:16]
      io.tick <= UInt<1>("h1") @[ClockDivider.scala 14:17]

  module HorizontalCounter :
    input clock : Clock
    input reset : Reset
    output io : { flip pxlCLK : UInt<1>, horCnt : UInt<10>, horSync : UInt<1>, dispTime : UInt<1>, enVCnt : UInt<1>}

    reg cntReg : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[HorizontalCounter.scala 24:23]
    reg outputReg1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[HorizontalCounter.scala 25:27]
    reg outputReg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[HorizontalCounter.scala 26:27]
    io.horSync <= outputReg1 @[HorizontalCounter.scala 29:14]
    io.dispTime <= outputReg2 @[HorizontalCounter.scala 30:15]
    io.horCnt <= cntReg @[HorizontalCounter.scala 31:13]
    io.enVCnt <= UInt<1>("h0") @[HorizontalCounter.scala 32:13]
    when io.pxlCLK : @[HorizontalCounter.scala 34:19]
      node _cntReg_T = add(cntReg, UInt<1>("h1")) @[HorizontalCounter.scala 35:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[HorizontalCounter.scala 35:22]
      cntReg <= _cntReg_T_1 @[HorizontalCounter.scala 35:12]
      node _T = eq(cntReg, UInt<10>("h27f")) @[HorizontalCounter.scala 36:17]
      when _T : @[HorizontalCounter.scala 36:42]
        node _outputReg2_T = not(outputReg2) @[HorizontalCounter.scala 37:21]
        outputReg2 <= _outputReg2_T @[HorizontalCounter.scala 37:18]
      node _T_1 = eq(cntReg, UInt<10>("h28f")) @[HorizontalCounter.scala 39:17]
      when _T_1 : @[HorizontalCounter.scala 39:56]
        node _outputReg1_T = not(outputReg1) @[HorizontalCounter.scala 40:21]
        outputReg1 <= _outputReg1_T @[HorizontalCounter.scala 40:18]
      node _T_2 = eq(cntReg, UInt<10>("h2ef")) @[HorizontalCounter.scala 42:17]
      when _T_2 : @[HorizontalCounter.scala 42:69]
        node _outputReg1_T_1 = not(outputReg1) @[HorizontalCounter.scala 43:21]
        outputReg1 <= _outputReg1_T_1 @[HorizontalCounter.scala 43:18]
      node _T_3 = eq(cntReg, UInt<10>("h31f")) @[HorizontalCounter.scala 45:17]
      when _T_3 : @[HorizontalCounter.scala 45:82]
        cntReg <= UInt<1>("h0") @[HorizontalCounter.scala 46:14]
        node _outputReg2_T_1 = not(outputReg2) @[HorizontalCounter.scala 47:21]
        outputReg2 <= _outputReg2_T_1 @[HorizontalCounter.scala 47:18]
        io.enVCnt <= UInt<1>("h1") @[HorizontalCounter.scala 48:17]

  module VerticalCounter :
    input clock : Clock
    input reset : Reset
    output io : { flip enVCnt : UInt<1>, verCnt : UInt<10>, verSync : UInt<1>, dispTime : UInt<1>}

    reg cntReg : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[VerticalCounter.scala 22:23]
    reg outputReg1 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[VerticalCounter.scala 23:27]
    reg outputReg2 : UInt<1>, clock with :
      reset => (reset, UInt<1>("h1")) @[VerticalCounter.scala 24:27]
    io.verSync <= outputReg1 @[VerticalCounter.scala 27:14]
    io.dispTime <= outputReg2 @[VerticalCounter.scala 28:15]
    io.verCnt <= cntReg @[VerticalCounter.scala 29:13]
    when io.enVCnt : @[VerticalCounter.scala 31:19]
      node _cntReg_T = add(cntReg, UInt<1>("h1")) @[VerticalCounter.scala 32:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[VerticalCounter.scala 32:22]
      cntReg <= _cntReg_T_1 @[VerticalCounter.scala 32:12]
      node _T = eq(cntReg, UInt<9>("h1df")) @[VerticalCounter.scala 33:17]
      when _T : @[VerticalCounter.scala 33:42]
        node _outputReg2_T = not(outputReg2) @[VerticalCounter.scala 34:21]
        outputReg2 <= _outputReg2_T @[VerticalCounter.scala 34:18]
      node _T_1 = eq(cntReg, UInt<9>("h1e9")) @[VerticalCounter.scala 36:17]
      when _T_1 : @[VerticalCounter.scala 36:56]
        node _outputReg1_T = not(outputReg1) @[VerticalCounter.scala 37:21]
        outputReg1 <= _outputReg1_T @[VerticalCounter.scala 37:18]
      node _T_2 = eq(cntReg, UInt<9>("h1eb")) @[VerticalCounter.scala 39:17]
      when _T_2 : @[VerticalCounter.scala 39:69]
        node _outputReg1_T_1 = not(outputReg1) @[VerticalCounter.scala 40:21]
        outputReg1 <= _outputReg1_T_1 @[VerticalCounter.scala 40:18]
      node _T_3 = eq(cntReg, UInt<10>("h20c")) @[VerticalCounter.scala 42:17]
      when _T_3 : @[VerticalCounter.scala 42:82]
        cntReg <= UInt<1>("h0") @[VerticalCounter.scala 43:14]
        node _outputReg2_T_1 = not(outputReg2) @[VerticalCounter.scala 44:21]
        outputReg2 <= _outputReg2_T_1 @[VerticalCounter.scala 44:18]

  module VGAController :
    input clock : Clock
    input reset : Reset
    output io : { flip Rin : UInt<4>, flip Gin : UInt<4>, flip Bin : UInt<4>, hSync : UInt<1>, vSync : UInt<1>, R : UInt<4>, G : UInt<4>, B : UInt<4>, horCntr : UInt<10>, verCntr : UInt<10>}

    inst clkDiv of ClockDivider @[VGAController.scala 12:22]
    clkDiv.clock <= clock
    clkDiv.reset <= reset
    inst horCntr of HorizontalCounter @[VGAController.scala 13:23]
    horCntr.clock <= clock
    horCntr.reset <= reset
    inst verCntr of VerticalCounter @[VGAController.scala 14:23]
    verCntr.clock <= clock
    verCntr.reset <= reset
    horCntr.io.pxlCLK <= clkDiv.io.tick @[VGAController.scala 17:21]
    verCntr.io.enVCnt <= horCntr.io.enVCnt @[VGAController.scala 18:21]
    node _T = and(horCntr.io.dispTime, verCntr.io.dispTime) @[VGAController.scala 21:28]
    when _T : @[VGAController.scala 21:51]
      io.R <= io.Rin @[VGAController.scala 22:10]
      io.G <= io.Gin @[VGAController.scala 23:10]
      io.B <= io.Bin @[VGAController.scala 24:10]
    else :
      io.R <= UInt<1>("h0") @[VGAController.scala 26:10]
      io.G <= UInt<1>("h0") @[VGAController.scala 27:10]
      io.B <= UInt<1>("h0") @[VGAController.scala 28:10]
    io.hSync <= horCntr.io.horSync @[VGAController.scala 32:12]
    io.vSync <= verCntr.io.verSync @[VGAController.scala 33:12]
    io.horCntr <= horCntr.io.horCnt @[VGAController.scala 36:14]
    io.verCntr <= verCntr.io.verCnt @[VGAController.scala 37:14]

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io : { hSync : UInt<1>, vSync : UInt<1>, R : UInt<4>, G : UInt<4>, B : UInt<4>}

    smem mem : UInt<12> [2048] @[Top.scala 29:26]
    inst vGACtrl of VGAController @[Top.scala 35:25]
    vGACtrl.clock <= clock
    vGACtrl.reset <= reset
    node _memAdrs_T = add(vGACtrl.io.horCntr, vGACtrl.io.verCntr) @[Top.scala 36:38]
    node memAdrs = tail(_memAdrs_T, 1) @[Top.scala 36:38]
    infer mport memVal = mem[memAdrs], clock @[Top.scala 37:21]
    node _vGACtrl_io_Rin_T = bits(memVal, 3, 0) @[Top.scala 38:29]
    vGACtrl.io.Rin <= _vGACtrl_io_Rin_T @[Top.scala 38:20]
    node _vGACtrl_io_Gin_T = bits(memVal, 7, 4) @[Top.scala 39:29]
    vGACtrl.io.Gin <= _vGACtrl_io_Gin_T @[Top.scala 39:20]
    node _vGACtrl_io_Bin_T = bits(memVal, 11, 8) @[Top.scala 40:29]
    vGACtrl.io.Bin <= _vGACtrl_io_Bin_T @[Top.scala 40:20]
    io.R <= vGACtrl.io.R @[Top.scala 43:10]
    io.G <= vGACtrl.io.G @[Top.scala 44:10]
    io.B <= vGACtrl.io.B @[Top.scala 45:10]
    io.hSync <= vGACtrl.io.hSync @[Top.scala 48:14]
    io.vSync <= vGACtrl.io.vSync @[Top.scala 49:14]

