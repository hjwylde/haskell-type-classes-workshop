module MyIdentity where

data MyIdentity a = MyIdentity a
    deriving (Eq, Show)

--instance Functor _ where
--  fmap _ _ = _
