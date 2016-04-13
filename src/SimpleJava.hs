module SimpleJava where

data Program = Program [Statement]
    deriving Eq

instance Show Program where
    show (Program stmts) = unlines $ map show stmts

data Statement = PrintStatement Expression
    deriving Eq

instance Show Statement where
    show (PrintStatement expr) = "print " ++ show expr ++ ";"

data Expression = ValueExpression Int
    deriving Eq

instance Show Expression where
    show (ValueExpression i) = show i

sampleProgram1 :: Program
sampleProgram1 = Program
    [ PrintStatement $ ValueExpression 1
    ]

inputProgram1 :: String
inputProgram1 = "print 1;"

sampleProgram2 :: Program
sampleProgram2 = Program
    [ PrintStatement $ ValueExpression 1
    , PrintStatement $ ValueExpression 10
    , PrintStatement $ ValueExpression 2
    ]

inputProgram2 :: String
inputProgram2 = unlines
    [ "print 1;"
    , "print 10;"
    , "print 2;"
    ]

sampleProgram3 :: Program
sampleProgram3 = Program
    [ PrintStatement $ ValueExpression 1
    ]

inputProgram3 :: String
inputProgram3 = unlines
    [ "print 1"
    , ";"
    ]

sampleProgram4 :: Program
sampleProgram4 = Program
    [ PrintStatement $ ValueExpression 1
    , PrintStatement $ ValueExpression 2
    ]

inputProgram4 :: String
inputProgram4 = unlines
    [ "print 1;"
    , ";;"
    , "print 2;"
    ]

errorProgram1 :: String
errorProgram1 = "print 1"

errorProgram2 :: String
errorProgram2 = unlines
    [ "print 1;"
    , "rint 2;"
    ]

sampleStatement1 :: Statement
sampleStatement1 = PrintStatement $ ValueExpression 1

inputStatement1 :: String
inputStatement1 = "print 1;"

sampleStatement2 :: Statement
sampleStatement2 = PrintStatement $ ValueExpression 2

inputStatement2 :: String
inputStatement2 = "print 2\n;"

errorStatement1 :: String
errorStatement1 = "print 2"

errorStatement2 :: String
errorStatement2 = "rint 2;"

sampleExpression1 :: Expression
sampleExpression1 = ValueExpression 1

inputExpression1 :: String
inputExpression1 = "1"

sampleExpression2 :: Expression
sampleExpression2 = ValueExpression 2

inputExpression2 :: String
inputExpression2 = "2"

errorExpression1 :: String
errorExpression1 = ""

errorExpression2 :: String
errorExpression2 = "x"
