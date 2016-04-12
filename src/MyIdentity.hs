module MyIdentity where

data MyIdentity a = MyIdentity a
    deriving (Eq, Show)

--instance Functor _ where
--  fmap _ _ = _

--instance Applicative _ where
--  pure _ = _
--
--  _ <*> _ = _

--instance Monad _ where
--  _ >>= _ = _

instance Functor MyIdentity where
  fmap f (MyIdentity a) = MyIdentity $ f a

instance Applicative MyIdentity where
    pure a = MyIdentity a

    (MyIdentity f) <*> fB = fmap f fB

instance Monad MyIdentity where
    (MyIdentity a) >>= f = f a
