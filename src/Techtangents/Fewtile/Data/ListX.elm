module Techtangents.Fewtile.Data.ListX where

import List
import Maybe
import Maybe(Maybe)
import Techtangents.Fewtile.Mash.Fn(..)

-- FIX: lots of testing!

mapMaybe : (a -> Maybe b) -> [a] -> [b]
mapMaybe = 
  Maybe.justs ∘∘ List.map

revSortBy : (a -> comparable) -> [a] -> [a]
revSortBy = 
  List.reverse ∘∘ List.sortBy
