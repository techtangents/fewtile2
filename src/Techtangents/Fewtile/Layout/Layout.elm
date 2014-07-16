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

type Alloc = {start: Int, size: Int}

{-| Yeah, I'm getting weird type errors with 'max' -}
natto : Int -> Int
natto x = if x >= 0 then x else 0

{-|
  Allocate a length of space into slices, given the weights of the slices.

  Sizes are quantized to integers by rounding.
  In calculating each slice's size, its weight is taken as a percentage of the remaining 
  weight to be allocated.
  This percentage of the remaining space is calculated then rounded.
  I suspect that the difference in slice size between the rounded versions and if you just allocated 
  to floats is less than 1 for each slice.

  The returned List of allocations is parallel to the input list.
-}
linearAllocate : Int -> [Int] -> [Int]
linearAllocate totalSize weights = 
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
            s = if (remWeight == 0)
                   then 0 
                   else round <| (toFloat weight) / (toFloat remWeight) * (toFloat remSize)
            newRemSize = natto (remSize - s)
          in
            { remWeight = remWeight - weight
            , remSize   = newRemSize
            , acc       = s :: acc
            }
        )
        initialState
        weights
  in r.acc
  

linearPosition : Int -> [Int] -> [Alloc]
linearPosition padding als = 
  let l = List.foldl 
            (\size (acc, newStart) -> 
              ({start=newStart,size=size} :: acc, newStart+size+padding)
            ) 
            ([], padding)
            als
  in  reverse (fst l)

linearLayout : Int -> Int -> [Int] -> [Alloc]
linearLayout padding totalSize weights =
  let len = List.length weights
      nonBorderSpace = (2 + len) * padding
  in  if (nonBorderSpace <= 2 * len) 
        then []
        else linearPosition padding (linearAllocate nonBorderSpace weights)

