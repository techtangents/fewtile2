module Techtangents.Fewtile.Sources.DummySource where

import Automaton (Automaton, run)
import open Color

import Techtangents.Fewtile.Sources.Source
import Techtangents.Fewtile.Alien.Cycler (cycler)
import Techtangents.Fewtile.Tile (Tile)
import Techtangents.Fewtile.Shingle (Shingle)
import Techtangents.Fewtile.Alien.NonEmpty (NonEmpty)

state1 = [ Tile { i="1", t="hello", m=3, c=red }
         , Tile { i="2", t="chook", m=3, c=green }
         ]

state2 = [ Tile { i="1", t="hello2", m=3, c=red }
         , Tile { i="2", t="chook2", m=3, c=green }
         ]

dummyTileSource : Signal [Tile]
dummyTileSource =
  run (cycler (NonEmpty state1 [state2])) [] ticker


sstate1 = [ Shingle { i="1", t="hello", m=3, c=red,   x=30,  y=30,  w=300, h=100}
          , Shingle { i="2", t="chook", m=3, c=green, x=100, y=300, w=200, h=80}
          ]

sstate2 = [ Shingle { i="1", t="hello", m=3, c=red,   x=300, y=30,  w=300, h=100}
          , Shingle { i="2", t="chook", m=3, c=green, x=10,  y=300, w=200, h=80}
          ]


dummyShingleSource : Signal [Shingle]
dummyShingleSource =
  run (cycler (NonEmpty sstate1 [sstate2])) [] ticker


ticker : Signal Time
ticker = every <| second * 2

