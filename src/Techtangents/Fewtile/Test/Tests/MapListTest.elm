module Techtangents.Fewtile.Test.Tests.MapListTest where

import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)

import Techtangents.Fewtile.Data.MapList as ML

tests : Test
tests = 
  suite "MapListTest" 
  [ test "Get on empty" 
      (assertEqual [] (ML.get 3 ML.empty))

  , test "removeByKeyValue" 
      (
        let expected = ML.empty |> ML.insert 3 "b" |> ML.insert 1 "c"
            actual   = expected |> ML.insert 3 "a" |> ML.removeByKeyValue 3 "a"
        in  assertEqual expected actual
      )
  ]