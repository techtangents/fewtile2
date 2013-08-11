module Techtangents.Fewtile.Sources.DummySource where

import Automaton (Automaton, run)

import Techtangents.Fewtile.Sources.Source
import Techtangents.Fewtile.Alien.Cycler (cycler')
import Techtangents.Fewtile.Tile (Tile)
import Techtangents.Fewtile.Alien.NonEmpty (NonEmpty)

s1t1 = Tile { id = "1", text = "hello", weight = 3, color = red }
s1t2 = Tile { id = "2", text = "chook", weight = 3, color = green }

s2t1 = Tile { id = "1", text = "hello2", weight = 3, color = cyan }
s2t2 = Tile { id = "2", text = "chook2", weight = 3, color = magenta }

state1 = [s1t1, s1t2]
state2 = [s2t1, s2t2]

dummyTiles : NonEmpty [Tile]
dummyTiles =
  NonEmpty state1 [state2]

ticker : Signal Time
ticker = every <| second * 2

cc : Automaton Time (NonEmpty [Tile])
cc = cycler dummyTiles

dummySource : Signal [Tile]
dummySource =
  run (cycler' dummyTiles) [] ticker

-- run : Automaton a b -> b -> Signal a -> Signal b
-- dummyTiles : NonEmpty [Tile]

-- cycler : NonEmpty a -> Automaton z (NonEmpty a)
-- cycler dummyTiles : Automaton z (NonEmpty [Tile])

-- cycler' : NonEmpty a -> Automaton z a
-- cycler' dummyTiles : Automaton z [Tile]


-- run (cycler' dummyTiles) : [Tile] -> Signal a -> Signal [Tile]