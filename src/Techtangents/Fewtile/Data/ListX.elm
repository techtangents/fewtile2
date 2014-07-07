module Techtangents.Fewtile.Data.ListX where

import List(map)
import Maybe(Maybe, justs)
import Techtangents.Fewtile.Mash.Fn(..)

mapMaybe : (a -> Maybe b) -> [a] -> [b]
mapMaybe = 
  justs ∘∘ map
