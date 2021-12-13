circuit Top :
  module ClockDivider :
    input clock : Clock
    input reset : UInt<1>
    output io_tick : UInt<1>

    reg cntReg : SInt<3>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[ClockDivider.scala 8:25]
    node _T = sub(cntReg, asSInt(UInt<2>("h1"))) @[ClockDivider.scala 11:22]
    node _T_1 = tail(_T, 1) @[ClockDivider.scala 11:22]
    node _T_2 = asSInt(_T_1) @[ClockDivider.scala 11:22]
    node _T_3 = bits(cntReg, 2, 2) @[ClockDivider.scala 12:16]
    node _GEN_0 = mux(_T_3, asSInt(UInt<3>("h2")), _T_2) @[ClockDivider.scala 12:35 ClockDivider.scala 13:16 ClockDivider.scala 11:12]
    node _GEN_1 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[ClockDivider.scala 12:35 ClockDivider.scala 14:17 ClockDivider.scala 9:13]
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
    node _T = add(cntReg, UInt<1>("h1")) @[HorizontalCounter.scala 35:22]
    node _T_1 = tail(_T, 1) @[HorizontalCounter.scala 35:22]
    node _T_2 = sub(UInt<6>("h20"), UInt<1>("h1")) @[HorizontalCounter.scala 36:34]
    node _T_3 = tail(_T_2, 1) @[HorizontalCounter.scala 36:34]
    node _T_4 = eq(cntReg, _T_3) @[HorizontalCounter.scala 36:17]
    node _T_5 = not(outputReg2) @[HorizontalCounter.scala 37:21]
    node _GEN_0 = mux(_T_4, _T_5, outputReg2) @[HorizontalCounter.scala 36:40 HorizontalCounter.scala 37:18 HorizontalCounter.scala 26:27]
    node _T_6 = add(UInt<6>("h20"), UInt<5>("h10")) @[HorizontalCounter.scala 39:34]
    node _T_7 = tail(_T_6, 1) @[HorizontalCounter.scala 39:34]
    node _T_8 = sub(_T_7, UInt<1>("h1")) @[HorizontalCounter.scala 39:48]
    node _T_9 = tail(_T_8, 1) @[HorizontalCounter.scala 39:48]
    node _T_10 = eq(cntReg, _T_9) @[HorizontalCounter.scala 39:17]
    node _T_11 = not(outputReg1) @[HorizontalCounter.scala 40:21]
    node _GEN_1 = mux(_T_10, _T_11, outputReg1) @[HorizontalCounter.scala 39:54 HorizontalCounter.scala 40:18 HorizontalCounter.scala 25:27]
    node _T_12 = add(UInt<6>("h20"), UInt<5>("h10")) @[HorizontalCounter.scala 42:34]
    node _T_13 = tail(_T_12, 1) @[HorizontalCounter.scala 42:34]
    node _T_14 = add(_T_13, UInt<7>("h60")) @[HorizontalCounter.scala 42:48]
    node _T_15 = tail(_T_14, 1) @[HorizontalCounter.scala 42:48]
    node _T_16 = sub(_T_15, UInt<1>("h1")) @[HorizontalCounter.scala 42:61]
    node _T_17 = tail(_T_16, 1) @[HorizontalCounter.scala 42:61]
    node _T_18 = eq(cntReg, _T_17) @[HorizontalCounter.scala 42:17]
    node _T_19 = not(outputReg1) @[HorizontalCounter.scala 43:21]
    node _GEN_2 = mux(_T_18, _T_19, _GEN_1) @[HorizontalCounter.scala 42:67 HorizontalCounter.scala 43:18]
    node _T_20 = add(UInt<6>("h20"), UInt<5>("h10")) @[HorizontalCounter.scala 45:34]
    node _T_21 = tail(_T_20, 1) @[HorizontalCounter.scala 45:34]
    node _T_22 = add(_T_21, UInt<7>("h60")) @[HorizontalCounter.scala 45:48]
    node _T_23 = tail(_T_22, 1) @[HorizontalCounter.scala 45:48]
    node _T_24 = add(_T_23, UInt<6>("h30")) @[HorizontalCounter.scala 45:61]
    node _T_25 = tail(_T_24, 1) @[HorizontalCounter.scala 45:61]
    node _T_26 = sub(_T_25, UInt<1>("h1")) @[HorizontalCounter.scala 45:74]
    node _T_27 = tail(_T_26, 1) @[HorizontalCounter.scala 45:74]
    node _T_28 = eq(cntReg, _T_27) @[HorizontalCounter.scala 45:17]
    node _T_29 = not(outputReg2) @[HorizontalCounter.scala 47:21]
    node _GEN_3 = mux(_T_28, UInt<1>("h0"), _T_1) @[HorizontalCounter.scala 45:80 HorizontalCounter.scala 46:14 HorizontalCounter.scala 35:12]
    node _GEN_4 = mux(_T_28, _T_29, _GEN_0) @[HorizontalCounter.scala 45:80 HorizontalCounter.scala 47:18]
    node _GEN_5 = mux(_T_28, UInt<1>("h1"), UInt<1>("h0")) @[HorizontalCounter.scala 45:80 HorizontalCounter.scala 48:17 HorizontalCounter.scala 32:13]
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
    node _T = add(cntReg, UInt<1>("h1")) @[VerticalCounter.scala 32:22]
    node _T_1 = tail(_T, 1) @[VerticalCounter.scala 32:22]
    node _T_2 = sub(UInt<6>("h20"), UInt<1>("h1")) @[VerticalCounter.scala 33:34]
    node _T_3 = tail(_T_2, 1) @[VerticalCounter.scala 33:34]
    node _T_4 = eq(cntReg, _T_3) @[VerticalCounter.scala 33:17]
    node _T_5 = not(outputReg2) @[VerticalCounter.scala 34:21]
    node _GEN_0 = mux(_T_4, _T_5, outputReg2) @[VerticalCounter.scala 33:40 VerticalCounter.scala 34:18 VerticalCounter.scala 24:27]
    node _T_6 = add(UInt<6>("h20"), UInt<4>("ha")) @[VerticalCounter.scala 36:34]
    node _T_7 = tail(_T_6, 1) @[VerticalCounter.scala 36:34]
    node _T_8 = sub(_T_7, UInt<1>("h1")) @[VerticalCounter.scala 36:48]
    node _T_9 = tail(_T_8, 1) @[VerticalCounter.scala 36:48]
    node _T_10 = eq(cntReg, _T_9) @[VerticalCounter.scala 36:17]
    node _T_11 = not(outputReg1) @[VerticalCounter.scala 37:21]
    node _GEN_1 = mux(_T_10, _T_11, outputReg1) @[VerticalCounter.scala 36:54 VerticalCounter.scala 37:18 VerticalCounter.scala 23:27]
    node _T_12 = add(UInt<6>("h20"), UInt<4>("ha")) @[VerticalCounter.scala 39:34]
    node _T_13 = tail(_T_12, 1) @[VerticalCounter.scala 39:34]
    node _T_14 = add(_T_13, UInt<2>("h2")) @[VerticalCounter.scala 39:48]
    node _T_15 = tail(_T_14, 1) @[VerticalCounter.scala 39:48]
    node _T_16 = sub(_T_15, UInt<1>("h1")) @[VerticalCounter.scala 39:61]
    node _T_17 = tail(_T_16, 1) @[VerticalCounter.scala 39:61]
    node _T_18 = eq(cntReg, _T_17) @[VerticalCounter.scala 39:17]
    node _T_19 = not(outputReg1) @[VerticalCounter.scala 40:21]
    node _GEN_2 = mux(_T_18, _T_19, _GEN_1) @[VerticalCounter.scala 39:67 VerticalCounter.scala 40:18]
    node _T_20 = add(UInt<6>("h20"), UInt<4>("ha")) @[VerticalCounter.scala 42:34]
    node _T_21 = tail(_T_20, 1) @[VerticalCounter.scala 42:34]
    node _T_22 = add(_T_21, UInt<2>("h2")) @[VerticalCounter.scala 42:48]
    node _T_23 = tail(_T_22, 1) @[VerticalCounter.scala 42:48]
    node _T_24 = add(_T_23, UInt<6>("h21")) @[VerticalCounter.scala 42:61]
    node _T_25 = tail(_T_24, 1) @[VerticalCounter.scala 42:61]
    node _T_26 = sub(_T_25, UInt<1>("h1")) @[VerticalCounter.scala 42:74]
    node _T_27 = tail(_T_26, 1) @[VerticalCounter.scala 42:74]
    node _T_28 = eq(cntReg, _T_27) @[VerticalCounter.scala 42:17]
    node _T_29 = not(outputReg2) @[VerticalCounter.scala 44:21]
    node _GEN_3 = mux(_T_28, UInt<1>("h0"), _T_1) @[VerticalCounter.scala 42:80 VerticalCounter.scala 43:14 VerticalCounter.scala 32:12]
    node _GEN_4 = mux(_T_28, _T_29, _GEN_0) @[VerticalCounter.scala 42:80 VerticalCounter.scala 44:18]
    node _GEN_5 = mux(io_enVCnt, _GEN_3, cntReg) @[VerticalCounter.scala 31:19 VerticalCounter.scala 22:23]
    node _GEN_6 = mux(io_enVCnt, _GEN_4, outputReg2) @[VerticalCounter.scala 31:19 VerticalCounter.scala 24:27]
    node _GEN_7 = mux(io_enVCnt, _GEN_2, outputReg1) @[VerticalCounter.scala 31:19 VerticalCounter.scala 23:27]
    io_verCnt <= cntReg @[VerticalCounter.scala 29:13]
    io_verSync <= outputReg1 @[VerticalCounter.scala 27:14]
    io_dispTime <= outputReg2 @[VerticalCounter.scala 28:15]
    cntReg <= mux(reset, UInt<10>("h0"), _GEN_5) @[VerticalCounter.scala 22:23 VerticalCounter.scala 22:23]
    outputReg1 <= mux(reset, UInt<1>("h1"), _GEN_7) @[VerticalCounter.scala 23:27 VerticalCounter.scala 23:27]
    outputReg2 <= mux(reset, UInt<1>("h1"), _GEN_6) @[VerticalCounter.scala 24:27 VerticalCounter.scala 24:27]

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io_HS : UInt<1>

    inst clkdiv of ClockDivider @[Top.scala 14:24]
    inst horCounter of HorizontalCounter @[Top.scala 15:28]
    inst verCounter of VerticalCounter @[Top.scala 16:28]
    node _T = and(verCounter.io_dispTime, verCounter.io_verSync) @[Top.scala 20:40]
    node _T_1 = bits(verCounter.io_verCnt, 0, 0) @[Top.scala 20:88]
    node nice2 = and(_T, _T_1) @[Top.scala 20:65]
    node _T_2 = and(clkdiv.io_tick, horCounter.io_dispTime) @[Top.scala 22:29]
    node _T_3 = and(_T_2, horCounter.io_horSync) @[Top.scala 22:55]
    node _T_4 = and(_T_3, horCounter.io_enVCnt) @[Top.scala 22:80]
    node _T_5 = bits(horCounter.io_horCnt, 0, 0) @[Top.scala 22:111]
    node _T_6 = and(_T_4, _T_5) @[Top.scala 22:104]
    node _T_7 = bits(nice2, 0, 0) @[Top.scala 22:123]
    node _T_8 = and(_T_6, _T_7) @[Top.scala 22:115]
    io_HS <= _T_8 @[Top.scala 22:11]
    clkdiv.clock <= clock
    clkdiv.reset <= reset
    horCounter.clock <= clock
    horCounter.reset <= reset
    horCounter.io_pxlCLK <= clkdiv.io_tick @[Top.scala 17:26]
    verCounter.clock <= clock
    verCounter.reset <= reset
    verCounter.io_enVCnt <= horCounter.io_enVCnt @[Top.scala 18:26]