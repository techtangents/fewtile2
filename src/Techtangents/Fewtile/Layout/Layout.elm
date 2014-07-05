module Techtangents.Fewtile.Layout.Layout where

import Techtangents.Fewtile.Data.Tile (..)
import Techtangents.Fewtile.Data.Shingle (..)
import Dict (..)
import Maybe (..)

layout : (Int, Int) -> [Tile] -> [Shingle]
layout (w, h) tiles =
  --let groupMap = groupBy .weight tiles
  --    total = totalWeight tiles
  []


--totalWeight : [Tile] -> Int
--totalWeight tiles = sum <| (map .weight tiles)


--  foldr : (a -> b -> b) -> b -> [a] -> b

type Group = {weight: Int, totalWeight: Int, tiles: [Tile]}

type AllocGroup = {weight: Int, totalWeight: Int, tiles: [Tile], percent: Float}

groupBy : (x -> i) -> [x] -> [(i, [x])]
groupBy f xs =
  []


orElse : a -> Maybe a -> a
orElse a = maybe a id


--  update : i -> (Maybe [x] -> Maybe [x]) -> Dict i [x] -> Dict i [x]

addToMapList : comparable -> x -> Dict comparable [x] -> Dict comparable [x]
addToMapList i x =
  update i (\mx -> Just (x :: (orElse [] mx)))

data Hole = Hole

--  foldl : (a -> b -> b) -> b -> [a] -> b
--- a == x
--- b == Dict comparable [x]
groupByDict : (x -> comparable) -> [x] -> Dict comparable [x]
groupByDict f xs =
  --foldl (\z m -> addToMapList Hole z m) empty xs
  groupByDict f xs

-- addToMapList (f z) z m