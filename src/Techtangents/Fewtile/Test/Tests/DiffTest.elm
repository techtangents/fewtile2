module Techtangents.Fewtile.Test.Tests.DiffTest where

import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)

import Techtangents.Fewtile.Mash.Diff

tests : Test
tests = 
  suite "Diff" 
  [ test "blah" 
      (assertEqual "a" "a"
      )
  ]