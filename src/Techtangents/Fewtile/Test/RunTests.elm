module Techtangents.Fewtile.Test.RunTests where

import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)

import Techtangents.Fewtile.Test.Tests.MapListTest as MapListTest

main : Element
main = runDisplay tests

tests : Test
tests = 
  suite "Tests" [
    MapListTest.tests
  ]
