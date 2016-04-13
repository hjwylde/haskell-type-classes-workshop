module Main where

import Control.Monad

import qualified Toc1
import qualified Toc2
import qualified Toc4a
import qualified Toc4b
import qualified Toc4c

import Test.HUnit

main :: IO ()
main = void $ runTestTT tests
    where
        tests = TestList
            [ Toc1.tests
            , Toc2.tests
            , Toc4a.tests
            , Toc4b.tests
            , Toc4c.tests
            ]
