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
    output io : {flip enVCnt : UInt<1>, verCnt : UInt<16>, verSync : UInt<1>, dispTime : UInt<1>, fuck : UInt<1>}
    
    reg cntReg : UInt<16>, clock with : (reset => (reset, UInt<16>("h00"))) @[VerticalCounter.scala 22:23]
    reg outputReg1 : UInt<1>, clock with : (reset => (reset, UInt<1>("h01"))) @[VerticalCounter.scala 23:27]
    reg outputReg2 : UInt<1>, clock with : (reset => (reset, UInt<1>("h01"))) @[VerticalCounter.scala 24:27]
    io.verSync <= outputReg1 @[VerticalCounter.scala 27:14]
    io.dispTime <= outputReg2 @[VerticalCounter.scala 28:15]
    io.verCnt <= cntReg @[VerticalCounter.scala 29:13]
    io.fuck <= UInt<1>("h00") @[VerticalCounter.scala 30:11]
    when io.enVCnt : @[VerticalCounter.scala 32:19]
      node _T = add(cntReg, UInt<1>("h01")) @[VerticalCounter.scala 33:22]
      node _T_1 = tail(_T, 1) @[VerticalCounter.scala 33:22]
      cntReg <= _T_1 @[VerticalCounter.scala 33:12]
      node _T_2 = eq(cntReg, UInt<9>("h01df")) @[VerticalCounter.scala 34:17]
      when _T_2 : @[VerticalCounter.scala 34:42]
        node _T_3 = not(outputReg2) @[VerticalCounter.scala 35:21]
        outputReg2 <= _T_3 @[VerticalCounter.scala 35:18]
        skip @[VerticalCounter.scala 34:42]
      node _T_4 = eq(cntReg, UInt<9>("h01e9")) @[VerticalCounter.scala 37:17]
      when _T_4 : @[VerticalCounter.scala 37:56]
        node _T_5 = not(outputReg1) @[VerticalCounter.scala 38:21]
        outputReg1 <= _T_5 @[VerticalCounter.scala 38:18]
        skip @[VerticalCounter.scala 37:56]
      node _T_6 = eq(cntReg, UInt<9>("h01eb")) @[VerticalCounter.scala 40:17]
      when _T_6 : @[VerticalCounter.scala 40:69]
        node _T_7 = not(outputReg1) @[VerticalCounter.scala 41:21]
        outputReg1 <= _T_7 @[VerticalCounter.scala 41:18]
        skip @[VerticalCounter.scala 40:69]
      node _T_8 = eq(cntReg, UInt<10>("h020c")) @[VerticalCounter.scala 43:17]
      when _T_8 : @[VerticalCounter.scala 43:82]
        cntReg <= UInt<1>("h00") @[VerticalCounter.scala 44:14]
        node _T_9 = not(outputReg2) @[VerticalCounter.scala 45:21]
        outputReg2 <= _T_9 @[VerticalCounter.scala 45:18]
        io.fuck <= UInt<1>("h01") @[VerticalCounter.scala 46:15]
        skip @[VerticalCounter.scala 43:82]
      skip @[VerticalCounter.scala 32:19]
    
  module Top : 
    input clock : Clock
    input reset : UInt<1>
    output io : {HS : UInt<1>, VS : UInt<1>, fuck : UInt<1>, R : UInt<4>, G : UInt<4>, B : UInt<4>, flip Rin : UInt<4>, flip Gin : UInt<4>, flip Bin : UInt<4>}
    
    inst clkdiv of ClockDivider @[Top.scala 12:24]
    clkdiv.clock <= clock
    clkdiv.reset <= reset
    inst horCntr of HorizontalCounter @[Top.scala 13:25]
    horCntr.clock <= clock
    horCntr.reset <= reset
    inst verCntr of VerticalCounter @[Top.scala 14:25]
    verCntr.clock <= clock
    verCntr.reset <= reset
    horCntr.io.pxlCLK <= clkdiv.io.tick @[Top.scala 15:23]
    verCntr.io.enVCnt <= horCntr.io.enVCnt @[Top.scala 16:23]
    node _T = and(horCntr.io.dispTime, verCntr.io.dispTime) @[Top.scala 20:30]
    when _T : @[Top.scala 20:53]
      io.R <= io.Rin @[Top.scala 21:14]
      io.G <= io.Gin @[Top.scala 22:14]
      io.B <= io.Bin @[Top.scala 23:14]
      skip @[Top.scala 20:53]
    else : @[Top.scala 24:17]
      io.R <= UInt<1>("h00") @[Top.scala 25:14]
      io.G <= UInt<1>("h00") @[Top.scala 26:14]
      io.B <= UInt<1>("h00") @[Top.scala 27:14]
      skip @[Top.scala 24:17]
    io.HS <= horCntr.io.horSync @[Top.scala 30:11]
    io.VS <= verCntr.io.verSync @[Top.scala 31:11]
    io.fuck <= horCntr.io.enVCnt @[Top.scala 32:13]
    
