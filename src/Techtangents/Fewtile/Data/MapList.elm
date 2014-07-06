module Techtangents.Fewtile.Data.MapList 
  ( empty
  , insert
  , get
  , removeByKey
  , removeByKeyValue
  , sortValuesWith
  ) where

import Dict
import Dict (Dict)
import List
import Maybe
import Techtangents.Fewtile.Data.MaybeX as MX
import Techtangents.Fewtile.Data.NonEmpty as NE

-- FIX: Probably use a NonEmpty list instead of []

data MapList comparable a = 
  MapList (Dict comparable [a])

empty : MapList comparable a
empty = 
  MapList (Dict.empty)

insert : comparable -> v -> MapList comparable v -> MapList comparable v
insert i x = 
  under 
    <| Dict.update i 
    <| \mx -> Just <| x :: (MX.getOrElse [] mx)

get : comparable -> MapList comparable v -> [v]
get c (MapList m) = 
  Dict.getOrElse [] c m

removeByKey : comparable -> MapList comparable v -> MapList comparable v
removeByKey i =
  under
    <| Dict.remove i

-- FIX: requires an Eq constraint on v, but this is inexpressible in Elm
removeByKeyValue : comparable -> v -> MapList comparable v -> MapList comparable v
removeByKeyValue i x =
  under
    <| Dict.update i
    <| \mx -> (MX.getOrElse [] mx) |> filter ((/=) x) |> NE.neFromList'

sortValuesWith : (a -> a -> Order) -> MapList comparable a -> MapList comparable a
sortValuesWith f = 
  under
    <| Dict.map (List.sortWith f)

under : (Dict comparable [a] -> Dict comparable [a]) -> MapList comparable a -> MapList comparable a
under f (MapList m) = 
  MapList <| f m

