module Techtangents.Fewtile.Main where

import Techtangents.Fewtile.Tile
import Techtangents.Fewtile.Alien.Cycler
import Techtangents.Fewtile.Alien.NonEmpty

title = constant (JavaScript.castStringToJSString "Fewtile")
foreign export jsevent "elm_title"
  title : Signal JSString

{-
main =
  collage 300 300
    [filled red (rect 100 100 (120, 120))]
-}

list = NonEmpty 1 [4, 9, 12]

main = asText <~ (Automaton.run (cycler list) (every second))
