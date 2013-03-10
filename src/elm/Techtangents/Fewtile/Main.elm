module Techtangents.Fewtile.Main where

import Techtangents.Fewtile.Tile
import Techtangents.Fewtile.Alien.Cycler
import Techtangents.Fewtile.Alien.NonEmpty
import Techtangents.Fewtile.Sources.DummySource

title = constant (JavaScript.castStringToJSString "Fewtile")
foreign export jsevent "elm_title"
  title : Signal JSString

{-
main =
  collage 300 300
    [filled red (rect 100 100 (120, 120))]
-}

source = dummySource

list = NonEmpty 1 [4, 9, 12]

--main = asText <~ (Automaton.run (cycler list) (every second))

tileSummary tiles =
  concat (List.intersperse "," (map (\(Tile t) -> t.text) tiles))

main = asText <~ (tileSummary <~ source)