module Techtangents.Fewtile.Data.Op where

data Op k v = Added k v | Removed k v | Changed k v v
