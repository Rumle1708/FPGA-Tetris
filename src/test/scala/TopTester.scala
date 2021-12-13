
import chisel3._
import chisel3.iotesters.Driver
import chisel3.iotesters.PeekPokeTester
import org.scalatest._
import Top._

class TopTester(dut: Top) extends PeekPokeTester(dut){
  //val timeInMilliSecs = 16.0
  //print((100000000.0 * (timeInMilliSecs/1000.0)).toInt)
  step(800*32)
}

class ProcessorSpec extends FlatSpec with Matchers{
  "Processor" should "pass" in{
    Driver.execute(Array[String]("--generate-vcd-output", "on"), () => new Top()) {
      c => new TopTester(c)
    }should be (true)
  }
}