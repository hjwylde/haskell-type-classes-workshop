module MyIdentity where

data MyIdentity a = MyIdentity a
    deriving (Eq, Show)

instance Functor MyIdentity where
  fmap f (MyIdentity a) = MyIdentity $ f a

instance Applicative MyIdentity where
    pure = MyIdentity

    (MyIdentity f) <*> fB = fmap f fB

instance Monad MyIdentity where
    (MyIdentity a) >>= f = f a
