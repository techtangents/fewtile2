module Techtangents.Fewtile.Alien.NonEmpty where

import Maybe (Maybe, Nothing, Just)
import Techtangents.Fewtile.Alien.MaybeExtras (maybeOr)

-- Non-Empty list
data NonEmpty x = NonEmpty x [x]

neHead : NonEmpty a -> a
neHead (NonEmpty x _) = x

neTail : NonEmpty a -> [a]
neTail (NonEmpty _ xs) = xs

neToList : NonEmpty a -> [a]
neToList (NonEmpty x xs) = x :: xs

neFromList : [a] -> Maybe (NonEmpty a)
neFromList list =
  case list of []        -> Nothing
               (x :: xs) -> Just (NonEmpty x xs)

