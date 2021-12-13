import chisel3._

class Top extends Module{
    val io = IO(new Bundle{
        val hSync, vSync = Output(Bool())
        val R, G, B = Output(UInt(4.W))
        val Rin, Gin, Bin = Input(UInt(4.W))
    })

    // VGA controller and inputs
    val vGACtrl = Module(new VGAController)
    vGACtrl.io.Rin := io.Rin
    vGACtrl.io.Gin := io.Gin
    vGACtrl.io.Bin := io.Bin

    // Color signals
    io.R := vGACtrl.io.R
    io.G := vGACtrl.io.G
    io.B := vGACtrl.io.B

    // Sync signals
    io.hSync := vGACtrl.io.hSync
    io.vSync := vGACtrl.io.vSync
}

object Top extends App {
    // Generate verilog
    println("Generating hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Top(), Array("--target-dir", "generated"))
    println("Hardware successfully generated")
}