module Techtangents.Fewtile.Main where

import JavaScript

import Techtangents.Fewtile.Tile
import Techtangents.Fewtile.Alien.Cycler
import Techtangents.Fewtile.Alien.NonEmpty
import Techtangents.Fewtile.Sources.DummySource
import Techtangents.Fewtile.Sources.Source
import Techtangents.Fewtile.LaidTile

title = constant (JavaScript.fromString "Fewtile")
foreign export jsevent "elm_title"
  title : Signal JavaScript.JSString

