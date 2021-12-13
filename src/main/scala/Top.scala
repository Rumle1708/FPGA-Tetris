import chisel3._

class Top extends Module{
    val io = IO(new Bundle{
        val HS, VS, = Output(Bool())
        val R, G, B = Output(UInt(4.W))
        val Rin, Gin, Bin = Input(UInt(4.W))
    })
    // Move constants later
    val FREQ = 100000000

    val clkdiv = Module(new ClockDivider(25000000, FREQ)) // 25MHz clock
    val horCntr = Module(new HorizontalCounter) // Horizontal
    val verCntr = Module(new VerticalCounter) // Vertical
    horCntr.io.pxlCLK := clkdiv.io.tick
    verCntr.io.enVCnt := horCntr.io.enVCnt


    // Display only in display time
    when(horCntr.io.dispTime && verCntr.io.dispTime){
        io.R := io.Rin
        io.G := io.Gin
        io.B := io.Bin
    }. otherwise{
        io.R := 0.U
        io.G := 0.U
        io.B := 0.U
    }

    io.HS := horCntr.io.horSync
    io.VS := verCntr.io.verSync
}

object Top extends App {
    // Generate verilog
    println("Generating hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Top(), Array("--target-dir", "generated"))
    println("Hardware successfully generated")
}