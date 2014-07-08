module Techtangents.Fewtile.Mash.OuterJoin where

import List
import Dict
import Dict(Dict)
import Maybe(..)
import Set

import Techtangents.Fewtile.Data.MaybeX as MaybeX
import Techtangents.Fewtile.Mash.Fn(..)
import Techtangents.Fewtile.Data.DictX as DictX

outerJoin : (a -> comparable) -> [a] -> [a] -> Dict comparable (Maybe a, Maybe a)
outerJoin f olds news = 
  let q = List.foldl
            (\o -> Dict.insert (f o) (Just o, Nothing))
            Dict.empty
            olds
  
  in  List.foldl 
            (\n -> DictX.update' (f n) (\mo -> (maybe Nothing fst mo, Just n)))
            q
            news
