module Techtangents.Fewtile.Data.Cycler where

import Automaton (Automaton, state, pure, hiddenState)

import Techtangents.Fewtile.Data.NonEmpty (NonEmpty, neFromList, neHead)

-- Cycles a NonEmpty List - the first element becomes the last
cycle : NonEmpty a -> NonEmpty a
cycle (NonEmpty h t) =
  case t of []        -> NonEmpty h t
            (x :: xs) -> NonEmpty x (xs ++ [h])

-- An Automaton that ignores the value of its input signal and produces a cycle of values from the input list.
cycler : NonEmpty a -> Automaton z a
cycler list =
  hiddenState list (\_ cur -> let next = cycle cur in (next, neHead next))
