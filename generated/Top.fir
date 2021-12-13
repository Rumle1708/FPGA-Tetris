;buildInfoPackage: chisel3, version: 3.4.1, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Top : 
  module ClockDivider : 
    input clock : Clock
    input reset : Reset
    output io : {tick : UInt<1>}
    
    reg cntReg : SInt, clock with : (reset => (reset, asSInt(UInt<3>("h02")))) @[ClockDivider.scala 8:25]
    io.tick <= UInt<1>("h00") @[ClockDivider.scala 9:13]
    node _T = sub(cntReg, asSInt(UInt<2>("h01"))) @[ClockDivider.scala 11:22]
    node _T_1 = tail(_T, 1) @[ClockDivider.scala 11:22]
    node _T_2 = asSInt(_T_1) @[ClockDivider.scala 11:22]
    cntReg <= _T_2 @[ClockDivider.scala 11:12]
    node _T_3 = bits(cntReg, 2, 2) @[ClockDivider.scala 12:16]
    when _T_3 : @[ClockDivider.scala 12:35]
      cntReg <= asSInt(UInt<3>("h02")) @[ClockDivider.scala 13:16]
      io.tick <= UInt<1>("h01") @[ClockDivider.scala 14:17]
      skip @[ClockDivider.scala 12:35]
    
  module HorizontalCounter : 
    input clock : Clock
    input reset : Reset
    output io : {flip pxlCLK : UInt<1>, horCnt : UInt<16>, horSync : UInt<1>, dispTime : UInt<1>, enVCnt : UInt<1>}
    
    reg cntReg : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[HorizontalCounter.scala 24:23]
    reg outputReg1 : UInt<1>, clock with : (reset => (reset, UInt<1>("h01"))) @[HorizontalCounter.scala 25:27]
    reg outputReg2 : UInt<1>, clock with : (reset => (reset, UInt<1>("h01"))) @[HorizontalCounter.scala 26:27]
    io.horSync <= outputReg1 @[HorizontalCounter.scala 29:14]
    io.dispTime <= outputReg2 @[HorizontalCounter.scala 30:15]
    io.horCnt <= cntReg @[HorizontalCounter.scala 31:13]
    io.enVCnt <= UInt<1>("h00") @[HorizontalCounter.scala 32:13]
    when io.pxlCLK : @[HorizontalCounter.scala 34:19]
      node _T = add(cntReg, UInt<1>("h01")) @[HorizontalCounter.scala 35:22]
      node _T_1 = tail(_T, 1) @[HorizontalCounter.scala 35:22]
      cntReg <= _T_1 @[HorizontalCounter.scala 35:12]
      node _T_2 = eq(cntReg, UInt<10>("h027f")) @[HorizontalCounter.scala 36:17]
      when _T_2 : @[HorizontalCounter.scala 36:42]
        node _T_3 = not(outputReg2) @[HorizontalCounter.scala 37:21]
        outputReg2 <= _T_3 @[HorizontalCounter.scala 37:18]
        skip @[HorizontalCounter.scala 36:42]
      node _T_4 = eq(cntReg, UInt<10>("h028f")) @[HorizontalCounter.scala 39:17]
      when _T_4 : @[HorizontalCounter.scala 39:56]
        node _T_5 = not(outputReg1) @[HorizontalCounter.scala 40:21]
        outputReg1 <= _T_5 @[HorizontalCounter.scala 40:18]
        skip @[HorizontalCounter.scala 39:56]
      node _T_6 = eq(cntReg, UInt<10>("h02ef")) @[HorizontalCounter.scala 42:17]
      when _T_6 : @[HorizontalCounter.scala 42:69]
        node _T_7 = not(outputReg1) @[HorizontalCounter.scala 43:21]
        outputReg1 <= _T_7 @[HorizontalCounter.scala 43:18]
        skip @[HorizontalCounter.scala 42:69]
      node _T_8 = eq(cntReg, UInt<10>("h031f")) @[HorizontalCounter.scala 45:17]
      when _T_8 : @[HorizontalCounter.scala 45:82]
        cntReg <= UInt<1>("h00") @[HorizontalCounter.scala 46:14]
        node _T_9 = not(outputReg2) @[HorizontalCounter.scala 47:21]
        outputReg2 <= _T_9 @[HorizontalCounter.scala 47:18]
        io.enVCnt <= UInt<1>("h01") @[HorizontalCounter.scala 48:17]
        skip @[HorizontalCounter.scala 45:82]
      skip @[HorizontalCounter.scala 34:19]
    
  module VerticalCounter : 
    input clock : Clock
    input reset : Reset
    output io : {flip enVCnt : UInt<1>, verCnt : UInt<16>, verSync : UInt<1>, dispTime : UInt<1>}
    
    reg cntReg : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[VerticalCounter.scala 22:23]
    reg outputReg1 : UInt<1>, clock with : (reset => (reset, UInt<1>("h01"))) @[VerticalCounter.scala 23:27]
    reg outputReg2 : UInt<1>, clock with : (reset => (reset, UInt<1>("h01"))) @[VerticalCounter.scala 24:27]
    io.verSync <= outputReg1 @[VerticalCounter.scala 27:14]
    io.dispTime <= outputReg2 @[VerticalCounter.scala 28:15]
    io.verCnt <= cntReg @[VerticalCounter.scala 29:13]
    when io.enVCnt : @[VerticalCounter.scala 31:19]
      node _T = add(cntReg, UInt<1>("h01")) @[VerticalCounter.scala 32:22]
      node _T_1 = tail(_T, 1) @[VerticalCounter.scala 32:22]
      cntReg <= _T_1 @[VerticalCounter.scala 32:12]
      node _T_2 = eq(cntReg, UInt<9>("h01df")) @[VerticalCounter.scala 33:17]
      when _T_2 : @[VerticalCounter.scala 33:42]
        node _T_3 = not(outputReg2) @[VerticalCounter.scala 34:21]
        outputReg2 <= _T_3 @[VerticalCounter.scala 34:18]
        skip @[VerticalCounter.scala 33:42]
      node _T_4 = eq(cntReg, UInt<9>("h01e9")) @[VerticalCounter.scala 36:17]
      when _T_4 : @[VerticalCounter.scala 36:56]
        node _T_5 = not(outputReg1) @[VerticalCounter.scala 37:21]
        outputReg1 <= _T_5 @[VerticalCounter.scala 37:18]
        skip @[VerticalCounter.scala 36:56]
      node _T_6 = eq(cntReg, UInt<9>("h01eb")) @[VerticalCounter.scala 39:17]
      when _T_6 : @[VerticalCounter.scala 39:69]
        node _T_7 = not(outputReg1) @[VerticalCounter.scala 40:21]
        outputReg1 <= _T_7 @[VerticalCounter.scala 40:18]
        skip @[VerticalCounter.scala 39:69]
      node _T_8 = eq(cntReg, UInt<10>("h020c")) @[VerticalCounter.scala 42:17]
      when _T_8 : @[VerticalCounter.scala 42:82]
        cntReg <= UInt<1>("h00") @[VerticalCounter.scala 43:14]
        node _T_9 = not(outputReg2) @[VerticalCounter.scala 44:21]
        outputReg2 <= _T_9 @[VerticalCounter.scala 44:18]
        skip @[VerticalCounter.scala 42:82]
      skip @[VerticalCounter.scala 31:19]
    
  module VGAController : 
    input clock : Clock
    input reset : Reset
    output io : {flip Rin : UInt<4>, flip Gin : UInt<4>, flip Bin : UInt<4>, hSync : UInt<1>, vSync : UInt<1>, R : UInt<4>, G : UInt<4>, B : UInt<4>}
    
    inst clkdiv of ClockDivider @[VGAController.scala 11:22]
    clkdiv.clock <= clock
    clkdiv.reset <= reset
    inst horCntr of HorizontalCounter @[VGAController.scala 12:23]
    horCntr.clock <= clock
    horCntr.reset <= reset
    inst verCntr of VerticalCounter @[VGAController.scala 13:23]
    verCntr.clock <= clock
    verCntr.reset <= reset
    horCntr.io.pxlCLK <= clkdiv.io.tick @[VGAController.scala 16:21]
    verCntr.io.enVCnt <= horCntr.io.enVCnt @[VGAController.scala 17:21]
    node _T = and(horCntr.io.dispTime, verCntr.io.dispTime) @[VGAController.scala 20:28]
    when _T : @[VGAController.scala 20:51]
      io.R <= io.Rin @[VGAController.scala 21:10]
      io.G <= io.Gin @[VGAController.scala 22:10]
      io.B <= io.Bin @[VGAController.scala 23:10]
      skip @[VGAController.scala 20:51]
    else : @[VGAController.scala 24:15]
      io.R <= UInt<1>("h00") @[VGAController.scala 25:10]
      io.G <= UInt<1>("h00") @[VGAController.scala 26:10]
      io.B <= UInt<1>("h00") @[VGAController.scala 27:10]
      skip @[VGAController.scala 24:15]
    io.hSync <= horCntr.io.horSync @[VGAController.scala 31:12]
    io.vSync <= verCntr.io.verSync @[VGAController.scala 32:12]
    
  module Top : 
    input clock : Clock
    input reset : UInt<1>
    output io : {hSync : UInt<1>, vSync : UInt<1>, R : UInt<4>, G : UInt<4>, B : UInt<4>, flip Rin : UInt<4>, flip Gin : UInt<4>, flip Bin : UInt<4>}
    
    inst vGACtrl of VGAController @[Top.scala 11:25]
    vGACtrl.clock <= clock
    vGACtrl.reset <= reset
    vGACtrl.io.Rin <= io.Rin @[Top.scala 12:20]
    vGACtrl.io.Gin <= io.Gin @[Top.scala 13:20]
    vGACtrl.io.Bin <= io.Bin @[Top.scala 14:20]
    io.R <= vGACtrl.io.R @[Top.scala 17:10]
    io.G <= vGACtrl.io.G @[Top.scala 18:10]
    io.B <= vGACtrl.io.B @[Top.scala 19:10]
    io.hSync <= vGACtrl.io.hSync @[Top.scala 22:14]
    io.vSync <= vGACtrl.io.vSync @[Top.scala 23:14]
    
