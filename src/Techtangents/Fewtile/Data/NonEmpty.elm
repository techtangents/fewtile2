module Techtangents.Fewtile.Data.NonEmpty where

import Maybe (Maybe, Nothing, Just)

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

neFromList' : [a] -> Maybe [a]
neFromList' list = 
  case list of [] -> Nothing
               xs  -> Just xs
