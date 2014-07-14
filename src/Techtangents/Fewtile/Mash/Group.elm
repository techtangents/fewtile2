module Techtangents.Fewtile.Mash.Group where

import Dict (..)
import List (..)
import Techtangents.Fewtile.Data.MapList as MapList
import Techtangents.Fewtile.Data.MapList (MapList)

groupByDict : (x -> comparable) -> [x] -> MapList comparable x
groupByDict f xs = 
  foldl (\x -> MapList.insert (f x) x) 
    MapList.empty 
    xs

groupBy : (x -> comparable) -> [x] -> [(comparable,[x])]
groupBy f xs = 
  groupByDict f xs |> MapList.toList

  