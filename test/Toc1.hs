module Toc1 where

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
myIdentityTests = TestCase $ show (MyIdentity "foo") @?= "MyIdentity: \"foo\""

myMaybeTests :: Test
myMaybeTests = TestList
    [ TestCase $ show (MyNothing :: MyMaybe String) @?= "MyNothing"
    , TestCase $ show (MyJust "foo") @?= "MyJust: \"foo\""
    ]

myEitherTests :: Test
myEitherTests = TestList
    [ TestCase $ show (MyLeft "foo" :: MyEither String String) @?= "MyLeft: \"foo\""
    , TestCase $ show (MyRight "foo" :: MyEither String String) @?= "MyRight: \"foo\""
    ]
