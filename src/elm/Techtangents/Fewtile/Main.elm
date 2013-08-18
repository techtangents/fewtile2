module Techtangents.Fewtile.Main where

import JavaScript
import Window
import Color

import Automaton (Automaton, run, hiddenState)

import Techtangents.Fewtile.Sources.DummySource (dummyShingleSource)
import open Techtangents.Fewtile.Shingle


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

--render :
--  Int
--  -> Int
--  -> [Form]
--render w h =
--  [ box w h <| Shingle { id: "hello"
--                       , text: "Box 1"
--                       , weight: 3
--                       , color: red
--                       , pos: {x: 20, y: 0},
--                       , size: {width: 300, height: 200}
--                       }
--  ]

