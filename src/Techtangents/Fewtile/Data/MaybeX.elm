module Techtangents.Fewtile.Data.MaybeX where

import Maybe (..)

getOrElse : a -> Maybe a -> a
getOrElse = flip maybe id