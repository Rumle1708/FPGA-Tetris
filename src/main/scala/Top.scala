import chisel3._

class Top extends Module{
    val io = IO(new Bundle{
        val HS = Output(Bool())
    })
    // Move constants later
    val FREQ = 100000000
    val WIDTH = 640
    val HEIGHT = 480
    val FPS = 60


    val clkdiv = Module(new ClockDivider(25000000, FREQ)) // 25MHz clock
    val horCounter = Module(new HorizontalCounter) // Horizontal
    val verCounter = Module(new VerticalCounter) // Vertical
    horCounter.io.pxlCLK := clkdiv.io.tick
    verCounter.io.enVCnt := horCounter.io.enVCnt

    val nice2 = verCounter.io.dispTime && verCounter.io.verSync && verCounter.io.verCnt(0)
    val nice = horCounter.io.horCnt
    io.HS := clkdiv.io.tick && horCounter.io.dispTime && horCounter.io.horSync && horCounter.io.enVCnt && nice(0) && nice2(0)
}

object Top extends App {
    // Generate verilog
    println("Generating hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Top(), Array("--target-dir", "generated"))
    println("Hardware successfully generated")
}