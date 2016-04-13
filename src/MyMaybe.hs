module MyMaybe where

data MyMaybe a = MyJust a | MyNothing
    deriving (Eq, Show)

instance Functor MyMaybe where
  fmap _ MyNothing = MyNothing
  fmap f (MyJust a) = MyJust $ f a

instance Applicative MyMaybe where
    pure = MyJust

    (MyJust f) <*> fB   = fmap f fB
    _ <*> _             = MyNothing

instance Monad MyMaybe where
    (MyJust a) >>= f    = f a
    _ >>= _             = MyNothing
