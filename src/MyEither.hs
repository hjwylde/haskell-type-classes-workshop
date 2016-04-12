module MyEither where

data MyEither l r = MyLeft l | MyRight r
    deriving (Eq, Show)

--instance Functor _ where
--  fmap _ _ = _

--instance Applicative _ where
--  pure _ = _
--
--  _ <*> _ = _

--instance Monad _ where
--  _ >>= _ = _

instance Functor (MyEither l) where
    fmap _ (MyLeft l)   = MyLeft l
    fmap f (MyRight r)  = MyRight $ f r
