module Main where

import Control.Monad

import qualified Toc1

import Test.HUnit

main :: IO ()
main = void $ runTestTT Toc1.tests
