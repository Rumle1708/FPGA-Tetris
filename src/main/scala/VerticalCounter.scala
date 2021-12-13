import chisel3._

// Horizontal timing
// Visible area:  480 pixels
// Front porch:   10 pixels
// Sync pulse:    2 pixels
// Back porch:    33 pixels
// Whole line:    525 pixels

class VerticalCounter extends Module{
  val io = IO(new Bundle{
    val enVCnt = Input(Bool())
    val verCnt = Output(UInt(10.W))
    val verSync, dispTime = Output(Bool())
  })
  // Constants
  def VISIBLE_AREA = 480
  def FRONT_PORCH = 10
  def SYNC_PULSE = 2
  def BACK_PORCH = 33

  val cntReg = RegInit(0.U(10.W))
  val outputReg1 = RegInit(1.U(1.W))
  val outputReg2 = RegInit(1.U(1.W))

  // Outputs
  io.verSync := outputReg1  // 1
  io.dispTime := outputReg2 // 1
  io.verCnt := cntReg

  when (io.enVCnt){
    cntReg := cntReg + 1.U
    when(cntReg === (VISIBLE_AREA - 1).U){ // 480 pixels display time
      outputReg2 := ~outputReg2
    }
    when(cntReg === (VISIBLE_AREA + FRONT_PORCH - 1).U){ // 490 pixels front porch
      outputReg1 := ~outputReg1
    }
    when(cntReg === (VISIBLE_AREA + FRONT_PORCH + SYNC_PULSE - 1).U){ // 492 pixels sync pulse
      outputReg1 := ~outputReg1
    }
    when(cntReg === (VISIBLE_AREA + FRONT_PORCH + SYNC_PULSE + BACK_PORCH - 1).U){ // 525 pixels
      cntReg := 0.U
      outputReg2 := ~outputReg2
    }
  }
}
