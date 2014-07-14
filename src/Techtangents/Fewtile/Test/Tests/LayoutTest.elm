module Techtangents.Fewtile.Test.Tests.LayoutTest where

import ElmTest.Test (..)
import ElmTest.Assertion (..)
import ElmTest.Runner.Element (..)

import Techtangents.Fewtile.Layout.Layout (..)

tests : Test
tests = 
  suite "Layout" 
  [ defaultTest (assertEqual 
                  [{start=0, size=1}] 
                  (allocate 1 [1])
                )
  , defaultTest (assertEqual 
                  [{start=0, size=2}] 
                  (allocate 2 [1])
                )
  , defaultTest (assertEqual 
                  [{start=0, size=10}, {start=10, size=20}]
                  (allocate 30 [1, 2])
                )
  , defaultTest (assertEqual 
                  [{start=0, size=100}, {start=100, size=200}, {start=300, size=200}] 
                  (allocate 500 [1, 2, 2]))
  ]