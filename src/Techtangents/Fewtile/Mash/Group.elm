module Techtangents.Fewtile.Mash.Group where

import Dict (..)
import List (..)
import Techtangents.Fewtile.Data.MapList as ML
import Techtangents.Fewtile.Data.MapList (MapList)


groupByDict : (x -> comparable) -> [x] -> MapList comparable x
groupByDict f xs = 
  foldl (\x -> ML.insert (f x) x) 
    ML.empty 
    xs
