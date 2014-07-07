module Techtangents.Fewtile.Mash.Index where

import Dict
import Dict(Dict)
import List
import Set
import Set(Set)
import Techtangents.Fewtile.Mash.Fn(..)

indexToMap : (x -> comparable) -> [x] -> Dict comparable x
indexToMap f =
  foldl (\x -> Dict.insert (f x) x) Dict.empty

indexToSet : (x -> comparable) -> [x] -> Set comparable
indexToSet = 
  Set.fromList ∘∘ List.map
