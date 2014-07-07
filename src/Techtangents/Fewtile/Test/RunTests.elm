module Techtangents.Fewtile.Test.RunTests where

import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)

import Techtangents.Fewtile.Test.Tests.MapListTest as MapListTest
import Techtangents.Fewtile.Test.Tests.GroupTest as GroupTest
import Techtangents.Fewtile.Test.Tests.DiffTest as DiffTest

main : Element
main = runDisplay tests

tests : Test
tests = 
  suite "Tests" 
    [ MapListTest.tests
    , GroupTest.tests
    , DiffTest.tests
    ]
