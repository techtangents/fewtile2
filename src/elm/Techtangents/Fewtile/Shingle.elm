module Techtangents.Fewtile.Shingle where

import Techtangents.Fewtile.Tile

-- TODO: Does a Shingle need the weight?

-- A Tile that has been laid out ready for display
data Shingle = Shingle { i: String -- id
                       , t: String -- text
                       , m: Int    -- mass
                       , c: Color  -- color
                       , x: Int    -- x position
                       , y: Int    -- y position
                       , w: Int    -- width
                       , h: Int    -- height
                       }

fromTile x y w h tile =
  Shingle {i=tile.i, t=tile.t, m=tile.m, c=tile.c, x=x, y=y, w=w, h=h}