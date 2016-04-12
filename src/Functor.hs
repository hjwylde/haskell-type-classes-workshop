module Functor where

--class Functor f where
    -- Minimum complete definition
    -- 'fmap' takes a function and a functor, and applies the function to the element inside the
    -- functor
--  fmap :: (a -> b) -> f a -> f b

    -- Infix binary operator - equivalent to 'fmap'
    -- I often call it "dollar wings"
--  (<$>) :: (a -> b) -> f a -> f b
--  (<$>) = fmap

    -- Similar to dollar wings, but rather than taking a function it just throws away the value
    -- inside the functor and sets it to 'a'
--  (<$) :: a -> f b -> f a
--  (<$) = fmap . const
