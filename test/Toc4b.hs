module Toc4b where

import MyEither

import Parser

import SimpleJava

import Test.HUnit

tests :: Test
tests = TestList
    [ statementParserTests
    , expressionParserTests
    ]

statementParserTests :: Test
statementParserTests = TestList
    [ TestCase $ parse statement inputStatement1 @?= MyRight sampleStatement1
    , TestCase $ parse statement inputStatement2 @?= MyRight sampleStatement2
    , TestCase $ parse statement errorStatement1 @?= MyLeft "unexpected end of input"
    , TestCase $ parse statement errorStatement2 @?= MyLeft "expecting keyword print, but found rint"
    ]

expressionParserTests :: Test
expressionParserTests = TestList
    [ TestCase $ parse expression inputExpression1 @?= MyRight sampleExpression1
    , TestCase $ parse expression inputExpression2 @?= MyRight sampleExpression2
    , TestCase $ parse expression errorExpression1 @?= MyLeft "unexpected end of input"
    , TestCase $ parse expression errorExpression2 @?= MyLeft "expecting a digit, but found x"
    ]
