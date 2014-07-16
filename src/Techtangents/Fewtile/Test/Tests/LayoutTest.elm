module Techtangents.Fewtile.Test.Tests.LayoutTest where

import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)

import Techtangents.Fewtile.Layout.Layout (..)


tests : Test
tests = 
  suite "Layout" 
  [ defaultTest (assertEqual [1] (linearAllocate 1 [1]))
  , defaultTest (assertEqual [2] (linearAllocate 2 [1]))
  , defaultTest (assertEqual [10, 20] (linearAllocate 30 [1, 2]))
  , defaultTest (assertEqual [100, 200, 200] (linearAllocate 500 [1, 2, 2]))
  ]