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

sampleProgram :: Program
sampleProgram = Program
    [ PrintStatement $ ValueExpression 1
    , PrintStatement $ ValueExpression 2
    , PrintStatement $ ValueExpression 10
    ]

program1 :: String
program1 = "print 1;"

program2 :: String
program2 = unlines
    [ "print 1;"
    , "print 10;"
    , "print 2;"
    ]

program3 :: String
program3 = unlines
    [ "print 1"
    , ";"
    ]

program4 :: String
program4 = unlines
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
