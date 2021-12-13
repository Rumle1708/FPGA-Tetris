// build.sbt
scalaVersion := "2.12.13"
addCompilerPlugin("edu.berkeley.cs" % "chisel3-plugin" % "3.4.4" cross CrossVersion.full)
libraryDependencies += "edu.berkeley.cs" %% "chisel3" % "3.4.4"
scalacOptions += "-Xsource:2.11"
// We also recommend using chiseltest for writing unit tests
libraryDependencies += "edu.berkeley.cs" %% "chisel-iotesters" % "1.5.1"
libraryDependencies += "edu.berkeley.cs" %% "chiseltest" % "0.3.4" % "test"
