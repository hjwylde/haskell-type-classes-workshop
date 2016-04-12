module Main where

import qualified Toc1
import qualified Toc2

import Test.HUnit

main :: IO ()
main = runTestTT tests >> return ()
    where
        tests = TestList
            [ Toc1.tests
            , Toc2.tests
            ]
