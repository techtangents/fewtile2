module Techtangents.Fewtile.LaidTile where

import Techtangents.Fewtile.Tile

data LaidTile = LaidTile { id : String
                         , text : String
                         , weight : Int
                         , color : Color
                         , pos : {x : Int, y : Int}
                         , size : {width: Int, height: Int}
                         }

ltFromTile tile pos size =
  LaidTile {id=tile.id, text=tile.text, weight=tile.weight, color=tile.color, pos = pos, size = size}