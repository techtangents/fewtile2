module Techtangents.Fewtile.Alien.Cycler where

import Automaton (Automaton, state, pure)

import Techtangents.Fewtile.Alien.Fn (const)
import Techtangents.Fewtile.Alien.MaybeExtras (maybeOr)
import Techtangents.Fewtile.Alien.NonEmpty (NonEmpty, neFromList)


cycle : NonEmpty a -> NonEmpty a
cycle (NonEmpty h t) =
  case t of []        -> NonEmpty h t
            (x :: xs) -> NonEmpty x (xs ++ [h])

cycler : NonEmpty a -> Automaton z (NonEmpty a)
cycler list =
  state
    list
    (\a b -> cycle b)
