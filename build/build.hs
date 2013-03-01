module Main where

import System.Environment

main :: 
  IO ()
main = 
  getArgs >>= 
  (\x -> case x of [] -> usage
                   [root] -> go root 
  )
   
usage ::
  IO ()
usage = 
  do
    putStrLn "Uage: runhaskell build.hs ProjectRootFolder"

go ::
  String
  -> IO ()  
go root =
  putStrLn root
