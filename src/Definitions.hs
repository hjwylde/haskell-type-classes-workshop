module Definitions where

import Prelude hiding (Applicative, Functor, fmap, pure, (*>), (<$), (<*>))

-- N.B., there are a number of /laws/ that type class instances should often follow. I have not
-- listed these here, if you're interested look up the documentation.

class Functor f where
    -- Minimum complete definition: fmap

    -- 'fmap' takes a function and a functor, and applies the function to the element inside the
    -- functor
    fmap :: (a -> b) -> f a -> f b

    -- Infix binary operator - equivalent to 'fmap'
    -- I often call it "dollar wings"
    (<$>) :: (a -> b) -> f a -> f b
    (<$>) = fmap

    -- Similar to dollar wings, but rather than taking a function it just throws away the value
    -- inside the functor and sets it to 'a'
    (<$) :: a -> f b -> f a
    (<$) = fmap . const

class Functor f => Applicative f where
    -- Minimum complete definition: pure & <*>

    -- Lifts a value into the applicative (container)
    pure :: a -> f a

    -- Apply the function inside the first applicative to the value inside the second
    (<*>) :: f (a -> b) -> f a -> f b

    -- Sequences two applicatives, i.e., perform the action of the first, then the second and return
    -- the result from the second
    (*>) :: f a -> f b -> f b
    fA *> fB = (id <$ fA) <*> fB

    -- Sequences two applicatives, but return the result from the first
    (<*) :: f a -> f b -> f a
    fA <* fB = fmap const fA <*> fB

class Applicative m => Monad m where
    -- Minimum complete definition: >>=

    return :: a -> m a
    return = pure

    -- Called "bind"
    (>>=) :: m a -> (a -> m b) -> m b

    -- Called "sequence"
    (>>) :: m a -> m b -> m b
    (>>) = (*>)
