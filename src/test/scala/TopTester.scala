
import chisel3._
import chisel3.iotesters.Driver
import chisel3.iotesters.PeekPokeTester
import org.scalatest._

class TopTester(dut: Top) extends PeekPokeTester(dut){
  step(820 * 4)
}

class ProcessorSpec extends FlatSpec with Matchers{
  "Processor" should "pass" in{
    Driver.execute(Array[String]("--generate-vcd-output", "on"), () => new Top()) {
      c => new TopTester(c)
    }should be (true)
  }
}