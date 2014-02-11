module Techtangents.Fewtile.Alien.MaybeExtras where

import Maybe (Maybe, maybe)

maybeOr : a -> Maybe a -> a
maybeOr other =
  maybe other id
