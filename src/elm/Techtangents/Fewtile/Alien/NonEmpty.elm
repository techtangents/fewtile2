module Techtangents.Fewtile.Alien.NonEmpty where

import Techtangents.Fewtile.Alien.MaybeExtras

-- Non-Empty list
data NonEmpty x = NonEmpty x [x]

-- (x -> [x] -> z) -> NonEmpty x -> z
nonEmpty f (NonEmpty x xs) = f x xs

-- NonEmpty x -> [x]
neToList = nonEmpty (::)

-- neFromList : [x] -> NonEmpty xs
neFromList list =
  case list of []      -> Maybe.Nothing
               (x::xs) -> Maybe.Just (NonEmpty x xs)

-- neFromListOr : NonEmpty x -> [x] -> NonEmpty x
neFromListOr other qs =
  maybeOr other (neFromList xs)
