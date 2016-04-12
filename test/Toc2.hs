module Toc2 where

import MyEither
import MyIdentity
import MyMaybe

import Test.HUnit

tests :: Test
tests = TestList
    [ TestCase $ show (fmap (+ 1) (MyIdentity 1)) @?= "MyIdentity 2"
    , TestCase $ show (fmap (+ 1) MyNothing) @?= "MyNothing"
    , TestCase $ show (fmap (+ 1) (MyJust 1)) @?= "MyJust 2"
    , TestCase $ show (fmap (+ 1) (MyLeft 1)) @?= "MyLeft 1"
    , TestCase $ show (fmap (+ 1) (MyRight 1 :: MyEither Int Int)) @?= "MyRight 2"
    ]
