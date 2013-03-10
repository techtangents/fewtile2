module Techtangents.Fewtile.Alien.MaybeExtras where

-- maybeOr : a -> Maybe a -> a
maybeOr other =
  Maybe.maybe other id
