module Main where

import qualified Toc1

import Test.HUnit

main :: IO ()
main = runTestTT Toc1.tests >> return ()
