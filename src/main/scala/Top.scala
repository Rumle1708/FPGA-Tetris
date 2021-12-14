import chisel3._
import chisel3.util.experimental.loadMemoryFromFileInline
import chisel3.experimental.{annotate, ChiselAnnotation}
import firrtl.annotations.MemorySynthInit

import java.io.{File, FileWriter}

class Top extends Module{
    val io = IO(new Bundle{
        val hSync, vSync = Output(Bool())
        val R, G, B = Output(UInt(4.W))
        // val Rin, Gin, Bin = Input(UInt(4.W))
    })

    annotate(new ChiselAnnotation {
        override def toFirrtl =
            MemorySynthInit
    })

    val mem = SyncReadMem(2048, UInt(12.W))
    /* For windows
    if ("C:/Users/Mads Rumle Nordstrom/Desktop/FPGA-Tetris/generated/MemoryData.txt".trim().nonEmpty) {
        loadMemoryFromFileInline(mem, "C:/Users/Mads Rumle Nordstrom/Desktop/FPGA-Tetris/generated/MemoryData.txt")
    }
     */
    if ("generated/MemoryData.txt".trim().nonEmpty) {
        loadMemoryFromFileInline(mem, "generated/MemoryData.txt")
    }

    // VGA controller and inputs
    val vGACtrl = Module(new VGAController)
    val memAdrs = vGACtrl.io.horCntr + vGACtrl.io.verCntr
    val memVal = mem(memAdrs)
    vGACtrl.io.Rin := memVal(3,0)
    vGACtrl.io.Gin := memVal(7,4)
    vGACtrl.io.Bin := memVal(11,8)

    // Color signals
    io.R := vGACtrl.io.R
    io.G := vGACtrl.io.G
    io.B := vGACtrl.io.B

    // Sync signals
    io.hSync := vGACtrl.io.hSync
    io.vSync := vGACtrl.io.vSync
}

object Top extends App {

    // Setup file writer
    def writeFile(fileName: String, content: String) {
        if(fileName != null && !fileName.isEmpty()) {
            var file = new File(fileName);
            var fileWriter = new FileWriter(file);
            fileWriter.write(content);
            fileWriter.close();
        }
    }

    // Write program to .txt file
    var s = ""
    for (i <- 0 until 2048) {
        if (i % 3 == 0){
            s += "f00" + "\n"
        } else if (i % 10 == 0){
            s += "00f" + "\n"
        } else {
            s += "0f0" + "\n"
        }
    }
    // writeFile("C:/Users/Mads Rumle Nordstrom/Desktop/FPGA-Tetris/generated/MemoryData.txt", s)
    writeFile("generated/MemoryData.txt", s)

    // Generate verilog
    println("Generating hardware")
    (new chisel3.stage.ChiselStage).emitVerilog(new Top(), Array("--target-dir", "generated"))
    println("Hardware successfully generated")
}