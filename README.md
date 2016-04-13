# haskell-type-classes-workshop

A Haskell workshop on type classes for Powershop.

While I'm introducing everything:

```bash
brew install haskell-stack
git clone https://github.com/hjwylde/haskell-type-classes-workshop
cd haskell-type-classes-workshop
stack setup && stack build && stack exec haskell-workshop
```

### Table of Contents

1. Type classes
2. Functors, applicatives and monads
3. Simple Java
4. Parsing
5. State monad
6. Writer monad
7. Where to next?

### 1. Type classes

```bash
git checkout toc/1
```

* What are they?
* `Show` definition

Using `MyIdentity`, `MyMaybe` and `MyEither`:

* Deriving the `Show` type class
* Writing `Show` type class instances *exercise*

**Tip:**
Have a separate terminal open running `stack build --test --file-watch` for live updates on how
you're going.

### 2. Functors, applicatives and monads

```bash
git checkout toc/2
```

* What are they and how do they relate to each other? (https://chris-martin.github.io/haskell-aligned/)
* `Functor`, `Applicative` and `Monad` definitions
* Do notation

Using `MyIdentity`, `MyMaybe` and `MyEither`:

* Kinds
* Writing `Functor`, `Applicative` and `Monad` instances *exercise*

### 3. Simple Java

```bash
git checkout toc/3
```

* Programs, statements and expressions

Using `Program`, `Statement` and `Expression`:

* Writing `Show` type class instances

### 4. Parsing

```bash
git checkout toc/4a
```

* A brief explanation of lexing, abstract syntax trees and parsing
* The `Parser` data type

Using `Parser`:

* Writing `Functor`, `Applicative` and `Monad` instances *exercise*
* Utility functions to work with `Parser`

```bash
git checkout toc/4b
```

* Writing a `Program`, `Statement` and `Expression` parser *exercise*
* `Alternative` definition and type class instance for `Parser`
* Extending Simple Java with assignments and a post-increment function

### 5. State monad

```bash
git checkout toc/5
```

* `State` concept

Using `State`:

* Writing the `State` definition and type classes *exercise*
* Writing a `run` function for Simple Java *exercise*

### 6. Writer monad

```bash
git checkout toc/6
```

* `Writer` concept

Using `Writer`:

* Writing the `Writer` definition and type classes *exercise*
* Updating the `run` function to use the `Writer` monad

### 7. Where to next?

* Reader monad
* Monad transformers (ReaderT, WriterT, StateT)
