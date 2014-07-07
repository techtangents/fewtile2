module Techtangents.Fewtile.Data.DictX where

import Dict(..)

update' : comparable -> (Maybe v -> v) -> Dict comparable v -> Dict comparable v
update' k f = 
  update k (Just . f)
