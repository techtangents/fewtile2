module Techtangents.Fewtile.Layout.Layout where

import open Techtangents.Fewtile.Tile
import open Techtangents.Fewtile.Shingle
import Dict

layout : (Int, Int) -> [Tile] -> [Shingle]
layout (w, h) tiles =
  let groupMap = groupBy .weight tiles
      total = totalWeight tiles
  in []


totalWeight : [Tile] -> Int
totalWeight tiles = sum <| (map .weight tiles)


--  foldr : (a -> b -> b) -> b -> [a] -> b

type Group = {weight: Int, totalWeight: Int, tiles: [Tile]}

type AllocGroup = {weight: Int, totalWeight: Int, tiles: [Tile], percent: Float}

groupBy : (x -> i) -> [x] -> [(i, [x])]
groupBy f xs =
  []