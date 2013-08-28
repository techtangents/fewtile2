module Techtangents.Fewtile.Main where

import JavaScript
import Window
import Color

import Automaton (Automaton, run, hiddenState)

import Techtangents.Fewtile.Sources.DummySource (dummyShingleSource)
import Techtangents.Fewtile.Shingle (Shingle)


title = constant (JavaScript.fromString "Fewtile")
foreign export jsevent "title"
  title : Signal JavaScript.JSString

wenda : (Int, Int) -> [Shingle] -> Element
wenda (ww, wh) shingles = collage ww wh <| map (box ww wh) shingles

main : Signal Element
main = wenda <~ Window.dimensions ~ dummyShingleSource

box : Int -> Int -> Shingle -> Form
box pw ph lt =
  let (Shingle {i, t, m, c, x, y, w, h}) = lt
  in plainText t
     |> container w h middle
     |> color c
     |> container pw ph (topLeftAt (absolute x) (absolute y))
     |> toForm

progressColor : Float -> Color -> Color -> Color
progressColor percent start end =
  -- TODO: linear progression through a colour space
  if | percent < 50 -> start
     | otherwise    -> end

progressInt : Float -> Int -> Int -> Int
progressInt percent start end = start + round ((toFloat (end - start)) / percent)

progressAll : Float -> [(Shingle, Shingle)] -> [Shingle]
progressAll percent shingles = map (\(start, end) -> progress percent start end) shingles

progress : Float -> Shingle -> Shingle -> Shingle
progress percent (Shingle start) (Shingle end) =
  Shingle { i=start.i
          , t=start.t
          , m=start.m
          , c=(progressColor percent start.c end.c)
          , x=(progressInt   percent start.x end.x)
          , y=(progressInt   percent start.y end.y)
          , w=(progressInt   percent start.w end.w)
          , h=(progressInt   percent start.h end.h)
          }

