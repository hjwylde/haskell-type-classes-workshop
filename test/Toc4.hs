module Toc4 where

import Control.Applicative

import MyEither
import MyIdentity
import MyMaybe

import Parser

import Test.HUnit

tests :: Test
tests = TestList
    [ helperFunctionTests
    , parserFunctorTests
    , parserApplicativeTests
    ]

helperFunctionTests :: Test
helperFunctionTests = TestList
    [ TestCase $ parse identifier "foo" @?= MyRight "foo"
    , TestCase $ parse identifier "1" @?= MyLeft "expecting an identifier, but found 1"
    , TestCase $ parse (keyword "print") "print" @?= MyRight ()
    , TestCase $ parse (keyword "print") "if" @?= MyLeft "expecting keyword print, but found if"
    , TestCase $ parse (symbol '$') "$" @?= MyRight ()
    , TestCase $ parse (symbol '$') "@" @?= MyLeft "expecting symbol $, but found @"
    , TestCase $ parse int "1" @?= MyRight 1
    , TestCase $ parse int "x" @?= MyLeft "expecting a digit, but found x"
    ]

parserFunctorTests :: Test
parserFunctorTests = TestList
    [ TestCase $ parse (fmap (+ 1) int) "1" @?= MyRight 2
    , TestCase $ parse (fmap (+ 1) int) "x" @?= MyLeft "expecting a digit, but found x"
    ]

parserApplicativeTests :: Test
parserApplicativeTests = TestList
    [ TestCase $ parse (pure 1) "" @?= MyRight 1
    , TestCase $ parse (pure 1) "x" @?= MyLeft "unexpected leftovers x"
    , TestCase $ parse (liftA2 (+) (int <* whiteSpace) int) "1 2" @?= MyRight 3
    ]
