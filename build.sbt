import Dependencies._

lazy val root = (project in file(".")).
  settings(
    inThisBuild(List(
      organization := "com.example",
      scalaVersion := "2.12.4",
      version      := "0.1.0-SNAPSHOT"
    )),
    name := "openlab.ubilab.io",
    libraryDependencies += scalaTest % Test
  ).
  settings(
    scalaxbDispatchVersion in (Compile, scalaxb) := "1.5.2",
    scalaxbPackageName in (Compile, scalaxb)     := "generated"
    // scalaxbPackageNames in (Compile, scalaxb)    := Map(uri("http://schemas.microsoft.com/2003/10/Serialization/") -> "microsoft.serialization"),
    // logLevel in (Compile, scalaxb) := Level.Debug
  )


