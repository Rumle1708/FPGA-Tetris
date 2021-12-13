import chisel3._

class ClockDivider(n: Int, freq: Int) extends Module{
    val io = IO(new Bundle{
        val tick = Output(Bool())
    })
    val MAX = ((freq / n) - 2).S
    val cntReg = RegInit(MAX)
    io.tick := false.B

    cntReg := cntReg - 1.S
    when(cntReg(MAX.getWidth - 1)){
        cntReg := MAX
        io.tick := true.B
    }
}