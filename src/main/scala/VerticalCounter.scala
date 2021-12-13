import chisel3._

// Horizontal timing
// Visible area:  640 pixels
// Front porch:   16 pixels
// Sync pulse:    96 pixels
// Back porch:    48 pixels
// Whole line:    800 pixels

class VerticalCounter extends Module{
  val io = IO(new Bundle{
    val enVCnt = Input(Bool())
    val verCnt = Output(UInt(10.W))
    val verSync, dispTime = Output(Bool())
  })
  // Constants
  val VISIBLE_AREA = 480.U
  val FRONT_PORCH = 10.U
  val SYNC_PULSE = 2.U
  val BACK_PORCH = 33.U

  val cntReg = RegInit(0.U(10.W))
  val outputReg1 = RegInit(1.U(1.W)) // bit0 = horSync bit 1 = enVCnt bit2 = dispTime
  val outputReg2 = RegInit(1.U(1.W)) // bit0 = horSync bit 1 = enVCnt bit2 = dispTime

  // Outputs
  io.verSync := outputReg1  // 1
  io.dispTime := outputReg2 // 0
  io.verCnt := cntReg

  when (io.enVCnt){
    cntReg := cntReg + 1.U
    when(cntReg === VISIBLE_AREA - 1.U){ // 640 pixels display time
      outputReg2 := ~outputReg2
    }
    when(cntReg === VISIBLE_AREA + FRONT_PORCH - 1.U){ // 656 pixels front porch
      outputReg1 := ~outputReg1
    }
    when(cntReg === VISIBLE_AREA + FRONT_PORCH + SYNC_PULSE - 1.U){ // 752 pixels sync pulse
      outputReg1 := ~outputReg1
    }
    when(cntReg === VISIBLE_AREA + FRONT_PORCH + SYNC_PULSE + BACK_PORCH - 1.U){ // 800 pixels
      cntReg := 0.U
      outputReg2 := ~outputReg2
    }
  }
}
