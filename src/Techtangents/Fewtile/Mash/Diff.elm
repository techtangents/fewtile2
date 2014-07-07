module Techtangents.Fewtile.Mash.Diff where

import List
import Dict
import Dict(Dict)
import Maybe(..)
import Set
import Set(Set)

import Techtangents.Fewtile.Data.Op(..)
import Techtangents.Fewtile.Data.MaybeX as MaybeX
import Techtangents.Fewtile.Mash.Fn(..)
import Techtangents.Fewtile.Mash.Index(..)
import Techtangents.Fewtile.Data.DictX as DictX
import Techtangents.Fewtile.Data.ListX as ListX


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

diff : (a -> comparable) -> [a] -> [a] -> [Op comparable a]
diff f olds news =
  let oj = outerJoin f olds news
      loj = Dict.toList oj
  in  ListX.mapMaybe 
        (\(k, x) -> case x of 
                      (Nothing, Nothing) -> Nothing
                      (Nothing, Just n)  -> Just <| Added k n
                      (Just o,  Nothing) -> Just <| Removed k o
                      (Just o, Just n)   -> MaybeX.justIf (o /= n) (Changed k o n)
        ) 
        loj
