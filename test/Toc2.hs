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

    , TestCase $ show (pure (+ 1) <*> (MyIdentity 1)) @?= "MyIdentity 2"
    , TestCase $ show (pure (+ 1) <*> MyNothing) @?= "MyNothing"
    , TestCase $ show (MyNothing <*> (MyJust 1) :: MyMaybe Int) @?= "MyNothing"
    , TestCase $ show (pure (+ 1) <*> (MyJust 1)) @?= "MyJust 2"
    , TestCase $ show (pure (+ 1) <*> (MyLeft 1)) @?= "MyLeft 1"
    , TestCase $ show ((MyLeft 1) <*> (MyLeft 2) :: MyEither Int Int) @?= "MyLeft 1"
    , TestCase $ show (pure (+ 1) <*> (MyRight 1 :: MyEither Int Int)) @?= "MyRight 2"

    , TestCase $ show (return 1 >>= \i -> (MyIdentity $ i + 1)) @?= "MyIdentity 2"
    , TestCase $ show (return 1 >>= const MyNothing :: MyMaybe Int) @?= "MyNothing"
    , TestCase $ show (MyNothing >>= const (MyJust 1)) @?= "MyNothing"
    , TestCase $ show (return 1 >>= \i -> (MyJust $ i + 1)) @?= "MyJust 2"
    , TestCase $ show (return 1 >>= \i -> (MyLeft $ i + 1) :: MyEither Int Int) @?= "MyLeft 2"
    , TestCase $ show ((MyLeft 1) >>= const (MyRight 2)) @?= "MyLeft 1"
    , TestCase $ show (return 1 >>= \i -> (MyRight $ i + 1 :: MyEither Int Int)) @?= "MyRight 2"
    ]
