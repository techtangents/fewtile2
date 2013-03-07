module Techtangents.Fewtile.Main where

import Techtangents.Fewtile.Tile

title = constant (JavaScript.castStringToJSString "Fewtile")
foreign export jsevent "elm_title"
  title :: Signal JSString

main =
  collage 300 300
    [filled red (rect 100 100 (120, 120))]