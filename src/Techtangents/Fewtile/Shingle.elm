module Techtangents.Fewtile.Shingle where

import Techtangents.Fewtile.Tile

-- A Tile that has been laid out ready for display
type Shingle = { id     : String
               , text   : String
               , weight : Int
               , color  : Color
               , x      : Int
               , y      : Int
               , w      : Int
               , h      : Int
               }
