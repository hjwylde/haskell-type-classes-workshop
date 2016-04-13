module Toc4c where

import MyEither

import Parser

import SimpleJava

import Test.HUnit

tests :: Test
tests = programParserTests

programParserTests :: Test
programParserTests = TestList
    [ TestCase $ parse program inputProgram1 @?= MyRight sampleProgram1
    , TestCase $ parse program inputProgram2 @?= MyRight sampleProgram2
    , TestCase $ parse program inputProgram3 @?= MyRight sampleProgram3
    , TestCase $ parse program inputProgram4 @?= MyRight sampleProgram4
    , TestCase $ parse program errorProgram1 @?= MyLeft ""
    , TestCase $ parse program errorProgram2 @?= MyLeft ""
    ]
