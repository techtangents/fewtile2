module Techtangents.Fewtile.Layout.Layout where

import Dict (..)
import Maybe (..)
import List
import Techtangents.Fewtile.Data.Tile(..)
import Techtangents.Fewtile.Data.Shingle(..)
import Techtangents.Fewtile.Mash.Group(..)
import Techtangents.Fewtile.Data.ListX
import Debug(..)

aspectRatio : Float
aspectRatio = 
  7 / 3


{-|
  Allocate a length of space into slices, given the weights of the slices.

  Sizes are quantized to integers by rounding.
  In calculating each slice's size, its weight is taken as a percentage of the remaining weight to be allocated.
  This percentage of the remaining space is calculated then rounded.
  I suspect that the difference in slice size between the rounded versions and if you just allocated 
  to floats is less than 1 for each slice.

  The returned List of allocations is parallel to the input list.
-}
allocate : Int -> [Int] -> [{start:Int, size: Int}]
allocate totalSize weights = 
  let 
    totalWeight = List.sum weights
    initialState = { remWeight = totalWeight
                   , remSize   = totalSize
                   , acc       = []
                   }
    r = 
      List.foldr
        (\weight {remWeight, remSize, acc} -> 
          let
            size = if remWeight == 0 
                      then 0 
                      else round <| (toFloat weight) / (toFloat remWeight) * (toFloat remSize)
            newRemSize = remSize - size
          in
            { remWeight = remWeight - weight
            , remSize   = newRemSize
            , acc       = {start = newRemSize, size = size} :: acc
            }
        )
        initialState
        weights
  in r.acc
  