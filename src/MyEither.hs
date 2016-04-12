module MyEither where

data MyEither a b = MyLeft a | MyRight b
    deriving Eq
