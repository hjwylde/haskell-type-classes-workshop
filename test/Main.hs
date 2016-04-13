module Main where

import Control.Monad

import qualified Toc1
import qualified Toc2

import Test.HUnit

main :: IO ()
main = void $ runTestTT tests
    where
        tests = TestList
            [ Toc1.tests
            , Toc2.tests
            ]
