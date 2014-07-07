module Techtangents.Fewtile.Data.MaybeX where

import Maybe (..)

getOrElse : a -> Maybe a -> a
getOrElse = 
  flip maybe id

map : (a -> b) -> Maybe a -> Maybe b
map f = 
  maybe Nothing (Just . f)

justIf : Bool -> a -> Maybe a
justIf b a =
  if b then Nothing else Just a
