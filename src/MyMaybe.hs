module MyMaybe where

data MyMaybe a = MyJust a | MyNothing
    deriving Eq
