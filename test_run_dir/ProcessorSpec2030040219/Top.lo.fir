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
    output io_horCnt : UInt<16>
    output io_horSync : UInt<1>
    output io_dispTime : UInt<1>
    output io_enVCnt : UInt<1>

    reg cntReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[HorizontalCounter.scala 24:23]
    reg outputReg1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outputReg1) @[HorizontalCounter.scala 25:27]
    reg outputReg2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outputReg2) @[HorizontalCounter.scala 26:27]
    node _T = add(cntReg, UInt<1>("h1")) @[HorizontalCounter.scala 35:22]
    node _T_1 = tail(_T, 1) @[HorizontalCounter.scala 35:22]
    node _T_2 = sub(UInt<10>("h280"), UInt<1>("h1")) @[HorizontalCounter.scala 36:34]
    node _T_3 = tail(_T_2, 1) @[HorizontalCounter.scala 36:34]
    node _T_4 = eq(cntReg, _T_3) @[HorizontalCounter.scala 36:17]
    node _T_5 = not(outputReg2) @[HorizontalCounter.scala 37:21]
    node _GEN_0 = mux(_T_4, _T_5, outputReg2) @[HorizontalCounter.scala 36:40 HorizontalCounter.scala 37:18 HorizontalCounter.scala 26:27]
    node _T_6 = add(UInt<10>("h280"), UInt<5>("h10")) @[HorizontalCounter.scala 39:34]
    node _T_7 = tail(_T_6, 1) @[HorizontalCounter.scala 39:34]
    node _T_8 = sub(_T_7, UInt<1>("h1")) @[HorizontalCounter.scala 39:48]
    node _T_9 = tail(_T_8, 1) @[HorizontalCounter.scala 39:48]
    node _T_10 = eq(cntReg, _T_9) @[HorizontalCounter.scala 39:17]
    node _T_11 = not(outputReg1) @[HorizontalCounter.scala 40:21]
    node _GEN_1 = mux(_T_10, _T_11, outputReg1) @[HorizontalCounter.scala 39:54 HorizontalCounter.scala 40:18 HorizontalCounter.scala 25:27]
    node _T_12 = add(UInt<10>("h280"), UInt<5>("h10")) @[HorizontalCounter.scala 42:34]
    node _T_13 = tail(_T_12, 1) @[HorizontalCounter.scala 42:34]
    node _T_14 = add(_T_13, UInt<7>("h60")) @[HorizontalCounter.scala 42:48]
    node _T_15 = tail(_T_14, 1) @[HorizontalCounter.scala 42:48]
    node _T_16 = sub(_T_15, UInt<1>("h1")) @[HorizontalCounter.scala 42:61]
    node _T_17 = tail(_T_16, 1) @[HorizontalCounter.scala 42:61]
    node _T_18 = eq(cntReg, _T_17) @[HorizontalCounter.scala 42:17]
    node _T_19 = not(outputReg1) @[HorizontalCounter.scala 43:21]
    node _GEN_2 = mux(_T_18, _T_19, _GEN_1) @[HorizontalCounter.scala 42:67 HorizontalCounter.scala 43:18]
    node _T_20 = add(UInt<10>("h280"), UInt<5>("h10")) @[HorizontalCounter.scala 45:34]
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
    cntReg <= mux(reset, UInt<16>("h0"), _GEN_6) @[HorizontalCounter.scala 24:23 HorizontalCounter.scala 24:23]
    outputReg1 <= mux(reset, UInt<1>("h1"), _GEN_8) @[HorizontalCounter.scala 25:27 HorizontalCounter.scala 25:27]
    outputReg2 <= mux(reset, UInt<1>("h1"), _GEN_7) @[HorizontalCounter.scala 26:27 HorizontalCounter.scala 26:27]

  module VerticalCounter :
    input clock : Clock
    input reset : UInt<1>
    input io_enVCnt : UInt<1>
    output io_verCnt : UInt<16>
    output io_verSync : UInt<1>
    output io_dispTime : UInt<1>
    output io_fuck : UInt<1>

    reg cntReg : UInt<16>, clock with :
      reset => (UInt<1>("h0"), cntReg) @[VerticalCounter.scala 22:23]
    reg outputReg1 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outputReg1) @[VerticalCounter.scala 23:27]
    reg outputReg2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), outputReg2) @[VerticalCounter.scala 24:27]
    node _T = add(cntReg, UInt<1>("h1")) @[VerticalCounter.scala 33:22]
    node _T_1 = tail(_T, 1) @[VerticalCounter.scala 33:22]
    node _T_2 = sub(UInt<9>("h1e0"), UInt<1>("h1")) @[VerticalCounter.scala 34:34]
    node _T_3 = tail(_T_2, 1) @[VerticalCounter.scala 34:34]
    node _T_4 = eq(cntReg, _T_3) @[VerticalCounter.scala 34:17]
    node _T_5 = not(outputReg2) @[VerticalCounter.scala 35:21]
    node _GEN_0 = mux(_T_4, _T_5, outputReg2) @[VerticalCounter.scala 34:40 VerticalCounter.scala 35:18 VerticalCounter.scala 24:27]
    node _T_6 = add(UInt<9>("h1e0"), UInt<4>("ha")) @[VerticalCounter.scala 37:34]
    node _T_7 = tail(_T_6, 1) @[VerticalCounter.scala 37:34]
    node _T_8 = sub(_T_7, UInt<1>("h1")) @[VerticalCounter.scala 37:48]
    node _T_9 = tail(_T_8, 1) @[VerticalCounter.scala 37:48]
    node _T_10 = eq(cntReg, _T_9) @[VerticalCounter.scala 37:17]
    node _T_11 = not(outputReg1) @[VerticalCounter.scala 38:21]
    node _GEN_1 = mux(_T_10, _T_11, outputReg1) @[VerticalCounter.scala 37:54 VerticalCounter.scala 38:18 VerticalCounter.scala 23:27]
    node _T_12 = add(UInt<9>("h1e0"), UInt<4>("ha")) @[VerticalCounter.scala 40:34]
    node _T_13 = tail(_T_12, 1) @[VerticalCounter.scala 40:34]
    node _T_14 = add(_T_13, UInt<2>("h2")) @[VerticalCounter.scala 40:48]
    node _T_15 = tail(_T_14, 1) @[VerticalCounter.scala 40:48]
    node _T_16 = sub(_T_15, UInt<1>("h1")) @[VerticalCounter.scala 40:61]
    node _T_17 = tail(_T_16, 1) @[VerticalCounter.scala 40:61]
    node _T_18 = eq(cntReg, _T_17) @[VerticalCounter.scala 40:17]
    node _T_19 = not(outputReg1) @[VerticalCounter.scala 41:21]
    node _GEN_2 = mux(_T_18, _T_19, _GEN_1) @[VerticalCounter.scala 40:67 VerticalCounter.scala 41:18]
    node _T_20 = add(UInt<9>("h1e0"), UInt<4>("ha")) @[VerticalCounter.scala 43:34]
    node _T_21 = tail(_T_20, 1) @[VerticalCounter.scala 43:34]
    node _T_22 = add(_T_21, UInt<2>("h2")) @[VerticalCounter.scala 43:48]
    node _T_23 = tail(_T_22, 1) @[VerticalCounter.scala 43:48]
    node _T_24 = add(_T_23, UInt<6>("h21")) @[VerticalCounter.scala 43:61]
    node _T_25 = tail(_T_24, 1) @[VerticalCounter.scala 43:61]
    node _T_26 = sub(_T_25, UInt<1>("h1")) @[VerticalCounter.scala 43:74]
    node _T_27 = tail(_T_26, 1) @[VerticalCounter.scala 43:74]
    node _T_28 = eq(cntReg, _T_27) @[VerticalCounter.scala 43:17]
    node _T_29 = not(outputReg2) @[VerticalCounter.scala 45:21]
    node _GEN_3 = mux(_T_28, UInt<1>("h0"), _T_1) @[VerticalCounter.scala 43:80 VerticalCounter.scala 44:14 VerticalCounter.scala 33:12]
    node _GEN_4 = mux(_T_28, _T_29, _GEN_0) @[VerticalCounter.scala 43:80 VerticalCounter.scala 45:18]
    node _GEN_5 = mux(_T_28, UInt<1>("h1"), UInt<1>("h0")) @[VerticalCounter.scala 43:80 VerticalCounter.scala 46:15 VerticalCounter.scala 30:11]
    node _GEN_6 = mux(io_enVCnt, _GEN_3, cntReg) @[VerticalCounter.scala 32:19 VerticalCounter.scala 22:23]
    node _GEN_7 = mux(io_enVCnt, _GEN_4, outputReg2) @[VerticalCounter.scala 32:19 VerticalCounter.scala 24:27]
    node _GEN_8 = mux(io_enVCnt, _GEN_2, outputReg1) @[VerticalCounter.scala 32:19 VerticalCounter.scala 23:27]
    node _GEN_9 = mux(io_enVCnt, _GEN_5, UInt<1>("h0")) @[VerticalCounter.scala 32:19 VerticalCounter.scala 30:11]
    io_verCnt <= cntReg @[VerticalCounter.scala 29:13]
    io_verSync <= outputReg1 @[VerticalCounter.scala 27:14]
    io_dispTime <= outputReg2 @[VerticalCounter.scala 28:15]
    io_fuck <= _GEN_9
    cntReg <= mux(reset, UInt<16>("h0"), _GEN_6) @[VerticalCounter.scala 22:23 VerticalCounter.scala 22:23]
    outputReg1 <= mux(reset, UInt<1>("h1"), _GEN_8) @[VerticalCounter.scala 23:27 VerticalCounter.scala 23:27]
    outputReg2 <= mux(reset, UInt<1>("h1"), _GEN_7) @[VerticalCounter.scala 24:27 VerticalCounter.scala 24:27]

  module Top :
    input clock : Clock
    input reset : UInt<1>
    output io_HS : UInt<1>
    output io_VS : UInt<1>
    output io_fuck : UInt<1>
    output io_R : UInt<4>
    output io_G : UInt<4>
    output io_B : UInt<4>
    input io_Rin : UInt<4>
    input io_Gin : UInt<4>
    input io_Bin : UInt<4>

    inst clkdiv of ClockDivider @[Top.scala 12:24]
    inst horCntr of HorizontalCounter @[Top.scala 13:25]
    inst verCntr of VerticalCounter @[Top.scala 14:25]
    node _T = and(horCntr.io_dispTime, verCntr.io_dispTime) @[Top.scala 20:30]
    node _GEN_0 = mux(_T, io_Rin, UInt<1>("h0")) @[Top.scala 20:53 Top.scala 21:14 Top.scala 25:14]
    node _GEN_1 = mux(_T, io_Gin, UInt<1>("h0")) @[Top.scala 20:53 Top.scala 22:14 Top.scala 26:14]
    node _GEN_2 = mux(_T, io_Bin, UInt<1>("h0")) @[Top.scala 20:53 Top.scala 23:14 Top.scala 27:14]
    io_HS <= horCntr.io_horSync @[Top.scala 30:11]
    io_VS <= verCntr.io_verSync @[Top.scala 31:11]
    io_fuck <= verCntr.io_fuck @[Top.scala 32:13]
    io_R <= _GEN_0
    io_G <= _GEN_1
    io_B <= _GEN_2
    clkdiv.clock <= clock
    clkdiv.reset <= reset
    horCntr.clock <= clock
    horCntr.reset <= reset
    horCntr.io_pxlCLK <= clkdiv.io_tick @[Top.scala 15:23]
    verCntr.clock <= clock
    verCntr.reset <= reset
    verCntr.io_enVCnt <= horCntr.io_enVCnt @[Top.scala 16:23]