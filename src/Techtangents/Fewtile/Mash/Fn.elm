module Techtangents.Fewtile.Mash.Fn where

(∘) : (g -> h) -> (f -> g) -> f -> h
(∘) = (.)

(∘∘) : (h -> i) -> (f -> g -> h) -> f -> g -> i
(∘∘) hi fgh = ((∘) hi) ∘ fgh
infixr 9 ∘∘

