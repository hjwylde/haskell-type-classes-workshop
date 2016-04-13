module Parser where

import Data.Char
import Data.List

import MyEither

import SimpleJava

-- A parser takes some input and returns either an error (MyLeft), or the result with any leftovers
-- from parsing (MyRight).
newtype Parser a = Parser { runParser :: String -> MyEither String (a, String) }

-- Applies a function to the first element in a tuple.
first :: (a -> c) -> (a, b) -> (c, b)
first f (a, b) = (f a, b)

instance Functor Parser where
    fmap f parser = Parser $ \input -> first f <$> runParser parser input

instance Applicative Parser where
    pure a = Parser $ \input -> return (a, input)

    fA <*> fB = Parser $ \input -> do
        (f, leftovers) <- runParser fA input

        runParser (f <$> fB) leftovers

-- Runs the given parser and expects it to consume the input fully.
parse :: Parser a -> String -> MyEither String a
parse parser input = do
    (result, leftovers) <- runParser parser input

    if null leftovers
        then return result
        else MyLeft $ "unexpected leftovers " ++ leftovers

-- Utility for building up a parser.
-- This will ensure that the input is non-empty and will split out the head and tail from the input
-- before passing it to the given parsing function.
parser :: ((Char, String) -> MyEither String (a, String)) -> Parser a
parser f = Parser $ \input -> case uncons input of
    Nothing             -> MyLeft "unexpected end of input"
    Just (head, tail)   -> f (head, tail)

whiteSpace :: Parser ()
whiteSpace = Parser $ \input -> return $ first (const ()) (span isSpace input)

-- Parses an identifier.
-- An identifier starts with an alpha character and is followed by 0 or more alpha numeric
-- characters.
identifier :: Parser String
identifier = parser $ \(head, tail) -> if isAlpha head
    then return $ first (head:) (span isAlphaNum tail)
    else MyLeft $ "expecting an identifier, but found " ++ [head]

-- Parses the given keyword.
keyword :: String -> Parser ()
keyword keyword = Parser $ \input -> do
    (identifier', leftovers) <- runParser identifier input

    if identifier' == keyword
        then return ((), leftovers)
        else MyLeft $ "expecting keyword " ++ keyword ++ ", but found " ++ identifier'

-- Parses the given symbol.
symbol :: Char -> Parser ()
symbol c = parser $ \(head, tail) -> if head == c
    then return ((), tail)
    else MyLeft $ "expecting symbol " ++ [c] ++ ", but found " ++ [head]

-- Parses an integer.
-- An integer is 1 or more digits.
int :: Parser Int
int = parser $ \(head, tail) -> if isDigit head
    then return $ first (read . (head:)) (span isDigit tail)
    else MyLeft $ "expecting a digit, but found " ++ [head]

-- Parses a program
program :: Parser Program
program = undefined

-- Parses a statement
statement :: Parser Statement
statement = undefined

-- Parses an expression
expression :: Parser Expression
expression = undefined
