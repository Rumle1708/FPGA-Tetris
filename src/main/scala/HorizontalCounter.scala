import chisel3._

// Horizontal timing
// Visible area:  640 pixels
// Front porch:   16 pixels
// Sync pulse:    96 pixels
// Back porch:    48 pixels
// Whole line:    800 pixels

class HorizontalCounter extends Module{
  val io = IO(new Bundle{
    val pxlCLK = Input(Bool())
    val horCnt = Output(UInt(10.W))
    val horSync, dispTime, enVCnt = Output(Bool())
  })

  // Constants
  def VISIBLE_AREA = 640
  def FRONT_PORCH = 16
  def SYNC_PULSE = 96
  def BACK_PORCH = 48


  val cntReg = RegInit(0.U(10.W))
  val outputReg1 = RegInit(1.U(1.W))
  val outputReg2 = RegInit(1.U(1.W))

  // Outputs
  io.horSync := outputReg1  // 1
  io.dispTime := outputReg2 // 1
  io.horCnt := cntReg
  io.enVCnt := false.B

  when (io.pxlCLK){
    cntReg := cntReg + 1.U
    when(cntReg === (VISIBLE_AREA - 1).U){ // 640 pixels display time
      outputReg2 := ~outputReg2
    }
    when(cntReg === (VISIBLE_AREA + FRONT_PORCH - 1).U){ // 656 pixels front porch
      outputReg1 := ~outputReg1
    }
    when(cntReg === (VISIBLE_AREA + FRONT_PORCH + SYNC_PULSE - 1).U){ // 752 pixels sync pulse
      outputReg1 := ~outputReg1
    }
    when(cntReg === (VISIBLE_AREA + FRONT_PORCH + SYNC_PULSE + BACK_PORCH - 1).U){ // 800 pixels
      cntReg := 0.U
      outputReg2 := ~outputReg2
      io.enVCnt := true.B
    }
  }
}
