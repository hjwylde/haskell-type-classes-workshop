module Toc2 where

import MyEither
import MyIdentity
import MyMaybe

import Test.HUnit

tests :: Test
tests = TestList
    [ myIdentityTests
    , myMaybeTests
    , myEitherTests
    ]



myIdentityTests :: Test
myIdentityTests = TestList
    -- Functor tests
    [ TestCase $ show (fmap (+ 1) (MyIdentity 1)) @?= "MyIdentity 2"

    -- Applicative tests
    , TestCase $ show (pure (+ 1) <*> MyIdentity 1) @?= "MyIdentity 2"

    -- Monad tests
    , TestCase $ show (return 1 :: MyIdentity Int) @?= "MyIdentity 1"
    , TestCase $ show (MyIdentity 1 >>= \i -> MyIdentity $ i + 1) @?= "MyIdentity 2"
    ]

myMaybeTests :: Test
myMaybeTests = TestList
    -- Functor tests
    [ TestCase $ show (fmap (+ 1) MyNothing) @?= "MyNothing"
    , TestCase $ show (fmap (+ 1) (MyJust 1)) @?= "MyJust 2"

    -- Applicative tests
    , TestCase $ show (pure (+ 1) <*> MyNothing) @?= "MyNothing"
    , TestCase $ show (MyNothing <*> MyJust 1 :: MyMaybe Int) @?= "MyNothing"
    , TestCase $ show (pure (+ 1) <*> MyJust 1) @?= "MyJust 2"

    -- Monad tests
    , TestCase $ show (return 1 :: MyMaybe Int) @?= "MyJust 1"
    , TestCase $ show (MyJust 1 >>= const MyNothing :: MyMaybe Int) @?= "MyNothing"
    , TestCase $ show (MyNothing >>= const (MyJust 1)) @?= "MyNothing"
    , TestCase $ show (MyJust 1 >>= \i -> MyJust $ i + 1) @?= "MyJust 2"
    ]

myEitherTests :: Test
myEitherTests = TestList
    -- Functor tests
    [ TestCase $ show (fmap (+ 1) (MyLeft 1)) @?= "MyLeft 1"
    , TestCase $ show (fmap (+ 1) (MyRight 1 :: MyEither Int Int)) @?= "MyRight 2"

    -- Applicative tests
    , TestCase $ show (pure (+ 1) <*> MyLeft 1) @?= "MyLeft 1"
    , TestCase $ show (MyLeft 1 <*> MyLeft 2 :: MyEither Int Int) @?= "MyLeft 1"
    , TestCase $ show (pure (+ 1) <*> (MyRight 1 :: MyEither Int Int)) @?= "MyRight 2"

    -- Monad tests
    , TestCase $ show (return 1 :: MyEither Int Int) @?= "MyRight 1"
    , TestCase $ show (MyRight 1 >>= \i -> (MyLeft $ i + 1) :: MyEither Int Int) @?= "MyLeft 2"
    , TestCase $ show (MyLeft 1 >>= const (MyRight 2)) @?= "MyLeft 1"
    , TestCase $ show (MyRight 1 >>= \i -> MyRight $ i + 1 :: MyEither Int Int) @?= "MyRight 2"
    ]
