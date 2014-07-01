module Techtangents.Fewtile.Data.MapList where

import Dict
import Dict (Dict)
import Maybe
import Techtangents.Fewtile.Data.MaybeX as MX

data MapList comparable a = 
  MapList (Dict comparable [a])

empty : MapList comparable a
empty = 
  MapList (Dict.empty)

insert : comparable -> v -> MapList comparable v -> MapList comparable v
insert i x (MapList m) = 
  MapList <| Dict.update i (\mx -> Just (x :: (MX.getOrElse [] mx))) m

get : comparable -> MapList comparable v -> [v]
get c (MapList m) = 
  Dict.getOrElse [] c m
