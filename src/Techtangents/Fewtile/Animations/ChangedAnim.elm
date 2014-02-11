module Techtangents.Fewtile.Animations.ChangedAnim where

import open Techtangents.Fewtile.Shingle
import open Techtangents.Fewtile.Animations.Progress

changedAnim : Float -> Shingle -> Shingle -> Shingle
changedAnim =
  progress
