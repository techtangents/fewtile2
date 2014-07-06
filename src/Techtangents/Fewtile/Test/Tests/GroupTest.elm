module Techtangents.Fewtile.Test.Tests.GroupTest where

import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)

import Techtangents.Fewtile.Mash.Group as G
import Techtangents.Fewtile.Data.MapList as ML

tests : Test
tests = 
  suite "Group" 
  [ test "blah" 
      (assertEqual 
        (G.groupByDict .w [{w=2, id=3}, {w=2, id=4}]) 
        (ML.empty |> ML.insert 2 {w=2, id=3} |> ML.insert 2 {w=2, id=4})
      )
  ]