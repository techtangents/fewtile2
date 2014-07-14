module Techtangents.Fewtile.Mash.Fn where

(∘) : (g -> h) -> (f -> g) -> f -> h
(∘) = (.)

(∘∘) : (h -> i) -> (f -> g -> h) -> f -> g -> i
(∘∘) hi fgh = \f g -> hi (fgh f g)
infixr 9 ∘∘

(∘∘∘) : (i -> j) -> (f -> g -> h -> i) -> f -> g -> h -> j
(∘∘∘) ij fghi = \f g h -> ij (fghi f g h)
infixr 9 ∘∘∘
