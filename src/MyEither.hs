module MyEither where

data MyEither l r = MyLeft l | MyRight r
    deriving (Eq, Show)

--instance Functor _ where
--  fmap _ _ = _
