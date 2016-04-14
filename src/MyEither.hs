module MyEither where

import Control.Applicative

data MyEither l r = MyLeft l | MyRight r
    deriving (Eq, Show)

instance Functor (MyEither l) where
    fmap _ (MyLeft l)   = MyLeft l
    fmap f (MyRight r)  = MyRight $ f r

instance Applicative (MyEither l) where
    pure = MyRight

    (MyRight f) <*> fB  = fmap f fB
    (MyLeft l) <*> _    = MyLeft l

instance Monad (MyEither l) where
    (MyRight r) >>= f   = f r
    (MyLeft l) >>= _    = MyLeft l

instance Monoid l => Alternative (MyEither l) where
    empty = MyLeft mempty

    (MyLeft _) <|> rhs  = rhs
    lhs <|> _           = lhs
