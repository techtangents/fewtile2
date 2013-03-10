module Techtangents.Fewtile.Alien.Cycler where

import Techtangents.Fewtile.Alien.AutomatonExtras
import Techtangents.Fewtile.Alien.MaybeExtras
import Techtangents.Fewtile.Alien.NonEmpty

-- cycler :: NonEmpty a -> Automaton z a
cycler list = anonaton list (nonEmpty (\x xs -> (x, maybeOr list (neFromList xs))))
