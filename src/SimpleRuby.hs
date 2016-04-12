module SimpleRuby where

data Program = Program [Statement]
    deriving Eq

instance Show Program where
    show (Program stmts) = unlines $ map show stmts

data Statement = PrintStatement Expression
    deriving Eq

instance Show Statement where
    show (PrintStatement expr) = "print " ++ show expr ++ ";"

data Expression = ValueExpression Int
                | BinaryExpression BinaryOp Expression Expression
    deriving Eq

instance Show Expression where
    show (ValueExpression i)            = show i
    show (BinaryExpression op lhs rhs)  = unwords [show lhs, show op, show rhs]

data BinaryOp = Add | Sub
    deriving Eq

instance Show BinaryOp where
    show Add = "+"
    show Sub = "-"

sampleProgram :: Program
sampleProgram = Program
    [ PrintStatement $ ValueExpression 1
    , PrintStatement $ BinaryExpression Add (BinaryExpression Sub (ValueExpression 5) (ValueExpression 3)) (ValueExpression 1)
    , PrintStatement $ BinaryExpression Sub (ValueExpression 2) (ValueExpression 2)
    ]

program1 :: String
program1 = "print 1 - 2 + 3 + 4;"

program2 :: String
program2 = unlines
    [ "print 1 - 2 + 3 + 4;"
    , "print 10 - 2;"
    , "print (1 + 10) - 2;"
    ]

program3 :: String
program3 = unlines
    [ "print 1 - 2 + 3 + 4;"
    , "print 10 - 2"
    , ";"
    ]

program4 :: String
program4 = unlines
    [ "print 1 - 2 + 3 + 4;"
    , ";;"
    , "print 10 - 2;"
    ]

errorProgram1 :: String
errorProgram1 = "print 1 - 2 + 3 + 4"

errorProgram2 :: String
errorProgram2 = unlines
    [ "print 2;"
    , "rint 1;"
    ]
