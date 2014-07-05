module Techtangents.Fewtile.Main where

import Window (..)

import Automaton (Automaton, run, hiddenState)
import Color (..)
import List (..)

import Techtangents.Fewtile.Sources.DummySource (..)
import Techtangents.Fewtile.Data.Shingle (..)
import Techtangents.Fewtile.Data.Tile (..)
import Techtangents.Fewtile.Layout.Layout (..)
import Techtangents.Fewtile.Data.Op (..)
import Techtangents.Fewtile.Animations.AddedAnim (..)
import Techtangents.Fewtile.Animations.ChangedAnim (..)
import Techtangents.Fewtile.Animations.RemovedAnim (..)


import List (concatMap, map)

data State k = Stable [Shingle] | Animating [Op k Shingle]

--ease : State k -> Float -> [Shingle]
--ease s pc =
--  case s of Stable    shins -> shins
--            Animating ops   -> (easeOp pc) `concatMap` ops


--easeOp : Float -> Op k Shingle -> [Shingle]
--easeOp pc op =
--  case op of (Added _ s)      -> addedAnim pc s
--             (Removed _ s)    -> removedAnim pc s
--             (Changed _ s s') -> changedAnim pc s s'


--type Q = {t: Time, w: Int, h: Int, s: [Shingle]}

-- collage : Int -> Int -> [Form] -> Element

undefined = undefined


dummyStaticSource : Signal [Shingle]
dummyStaticSource =
  constant [
    {id="1", text="tile 1", color=green, x=0, y=0, w=100, h=150},
    {id="2", text="tile 2", color=lightBlue, x=150, y=0, w=200, h=150},
    {id="3", text="tile 3", color=lightOrange, x=150, y=200, w=100, h=150}
  ]

intRect : Int -> Int -> Shape
intRect w h =
  rect (toFloat w) (toFloat h)


tileState : Signal [Tile]
tileState = undefined

shingleState : Signal [Shingle]
shingleState = dummyShingleSource

drawTile : Shingle -> Element
drawTile {text,color,x,y,w,h} =
  container (x + w) (y + h) (topLeftAt (absolute x) (absolute y)) (
    collage w h [
      filled color (intRect w h),
      outlined (solid black) (intRect w h),
      toForm (container w h middle (centered (Text.color black (toText text))))
    ]
  )



render : [Shingle] -> Element
render ss =
  if isEmpty ss
    then plainText "no tiles"
    else layers <| map drawTile ss

main : Signal Element
main =
  lift render shingleState


