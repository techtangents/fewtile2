module Techtangents.Fewtile.Test.Tests.MapListTest where

import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)

import Techtangents.Fewtile.Data.MapList as ML

tests : Test
tests = 
  suite "MapListTest" 
  [ test "Get on empty" (assertEqual [] (ML.get 3 ML.empty))
  ]