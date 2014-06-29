module Techtangents.Fewtile.Sources.DummySource where

import Automaton (Automaton, run)
import Color (..)

import Techtangents.Fewtile.Sources.Source
import Techtangents.Fewtile.Alien.Cycler (cycler)
import Techtangents.Fewtile.Tile (Tile)
import Techtangents.Fewtile.Shingle (Shingle)
import Techtangents.Fewtile.Alien.NonEmpty (NonEmpty)

state1 : [Tile]
state1 = [ { id="1", text="hello", weight=3, color=red }
         , { id="2", text="chook", weight=3, color=green }
         ]

state2 : [Tile]
state2 = [ { id="1", text="hello2", weight=3, color=red }
         , { id="2", text="chook2", weight=3, color=green }
         ]

dummyTileSource : Signal [Tile]
dummyTileSource =
  run (cycler (NonEmpty state1 [state2])) [] ticker


sstate1 : [Shingle]
sstate1 = [ { id="1", text="hello", color=red,   x=30,  y=30,  w=300, h=100}
          , { id="2", text="chook", color=green, x=100, y=300, w=200, h=80}
          ]

sstate2 : [Shingle]
sstate2 = [ { id="1", text="hello", color=red,   x=300, y=30,  w=300, h=100}
          , { id="2", text="chook", color=green, x=10,  y=300, w=200, h=80}
          ]


dummyShingleSource : Signal [Shingle]
dummyShingleSource =
  run (cycler (NonEmpty sstate1 [sstate2])) [] ticker


ticker : Signal Time
ticker = every <| second * 2

