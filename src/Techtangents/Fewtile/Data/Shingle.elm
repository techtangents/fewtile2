module Techtangents.Fewtile.Data.Shingle where

import Techtangents.Fewtile.Data.Tile

-- A Tile that has been laid out ready for display
type Shingle = { id     : String
               , text   : String
               , color  : Color
               , x      : Int
               , y      : Int
               , w      : Int
               , h      : Int
               }
