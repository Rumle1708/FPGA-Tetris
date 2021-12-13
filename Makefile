SBT = sbt

# Generate Verilog code
doit:
	$(SBT) "runMain Top"

# Run the test
test:
	$(SBT) "test:runMain TopTester"

clean:
	git clean -fd