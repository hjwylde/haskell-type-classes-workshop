module Definition where

import Prelude hiding (Applicative, Eq, Functor, Show, fmap, pure, show, (*>), (/=), (<$), (<*>),
                (==))

class Show a where
    -- Minimum complete definition: show

    show :: a -> String

class Eq a where
    -- Minimum complete definition: (==) or (/=)

    (==) :: a -> a -> Bool
    lhs == rhs = not $ lhs /= rhs

    (/=) :: a -> a -> Bool
    lhs /= rhs = not $ lhs == rhs

-- N.B., often with type classes such as these they are defined with /laws/ that you are expected to
-- obey when writing instances. I have not listed these laws here, if oyu're interested you may look
-- up the documentation for them.

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
