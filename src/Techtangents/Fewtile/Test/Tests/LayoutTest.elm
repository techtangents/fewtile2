module Techtangents.Fewtile.Test.Tests.LayoutTest where

import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)

import Techtangents.Fewtile.Layout.Layout (..)

-- FIX: actually write tests :)

tests : Test
tests = 
  suite "Layout" 
  [ defaultTest (assertEqual [1] (allocate 1 [1]))
  , defaultTest (assertEqual [2] (allocate 2 [1]))
  , defaultTest (assertEqual [10, 20] (allocate 30 [1, 2]))
  , defaultTest (assertEqual [100, 200, 200] (allocate 500 [1, 2, 2]))
  ]