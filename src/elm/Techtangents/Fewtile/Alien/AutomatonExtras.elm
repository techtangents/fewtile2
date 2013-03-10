module Techtangents.Fewtile.Alien.AutomatonExtras where

-- An automaton that ignores the value of its input signal
-- anonaton :: s -> (s -> (o,s)) -> Automaton i o
anonaton i f = Automaton.init' i (\_ x -> f x)
