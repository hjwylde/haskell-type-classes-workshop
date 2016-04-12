module MyMaybe where

data MyMaybe a = MyJust a | MyNothing
    deriving (Eq, Show)

--instance Functor _ where
--  fmap _ _ = _
