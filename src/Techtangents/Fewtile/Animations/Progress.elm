module Techtangents.Fewtile.Animations.Progress where

import Techtangents.Fewtile.Data.Shingle (..)

-- FIX: there's an 'easing' library in the elm libraries

progressColor : Float -> Color -> Color -> Color
progressColor percent start end =
  -- TODO: linear progression through a colour space
  if | percent < 50 -> start
     | otherwise    -> end

progressInt : Float -> Int -> Int -> Int
progressInt percent start end =
  start + round ((toFloat (end - start)) / percent)

progress : Float -> Shingle -> Shingle -> Shingle
progress percent old nu =
  let p = progressInt percent
      c = progressColor percent
  in  { old |
           color <- (c old.color nu.color),
        x     <- (p old.x nu.x),
        y     <- (p old.y nu.y),
        w     <- (p old.w nu.w),
        h     <- (p old.h nu.h)
      }

progressAll : Float -> [(Shingle, Shingle)] -> [Shingle]
progressAll percent shingles =
  map (\(start, end) -> progress percent start end) shingles
