module Definition where

import Prelude hiding (Eq, Show, show, (/=), (==))

class Show a where
    -- Minimum complete definition: show

    show :: a -> String

class Eq a where
    -- Minimum complete definition: (==) or (/=)

    (==) :: a -> a -> Bool
    lhs == rhs = not $ lhs /= rhs

    (/=) :: a -> a -> Bool
    lhs /= rhs = not $ lhs == rhs
