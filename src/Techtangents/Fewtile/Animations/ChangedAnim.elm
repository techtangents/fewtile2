module Techtangents.Fewtile.Animations.ChangedAnim where

import Techtangents.Fewtile.Data.Shingle (..)
import Techtangents.Fewtile.Animations.Progress (..)

changedAnim : Float -> Shingle -> Shingle -> Shingle
changedAnim =
  progress
