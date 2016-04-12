module MyMaybe where

data MyMaybe a = MyJust a | MyNothing
    deriving (Eq, Show)

--instance Functor _ where
--  fmap _ _ = _

--instance Applicative _ where
--  pure _ = _
--
--  _ <*> _ = _

--instance Monad _ where
--  _ >>= _ = _

instance Functor MyMaybe where
  fmap _ MyNothing = MyNothing
  fmap f (MyJust a) = MyJust $ f a
