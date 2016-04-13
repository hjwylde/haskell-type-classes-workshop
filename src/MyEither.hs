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

instance Applicative (MyEither l) where
    pure = MyRight

    (MyRight f) <*> fB  = fmap f fB
    (MyLeft l) <*> _    = MyLeft l

instance Monad (MyEither l) where
    (MyRight r) >>= f   = f r
    (MyLeft l) >>= _    = MyLeft l
