module Techtangents.Fewtile.Main where

import JavaScript
import Window
import Color

import Automaton (Automaton, run, hiddenState)

import open Techtangents.Fewtile.Sources.DummySource
import open Techtangents.Fewtile.Shingle
import open Techtangents.Fewtile.Op
import open Techtangents.Fewtile.Animations.AddedAnim
import open Techtangents.Fewtile.Animations.ChangedAnim
import open Techtangents.Fewtile.Animations.RemovedAnim


import List (concatMap, map)

--title = constant (JavaScript.fromString "Fewtile")
--foreign export jsevent "title"
--  title : Signal JavaScript.JSString

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

main : Element
main =
  collage 600 600 [
    filled red (rect 100 100)
  ]

