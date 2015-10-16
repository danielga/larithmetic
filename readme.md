# larithmetic

A Lua library that parses and creates ASTs for arithmetic expressions.

## Info

To create an AST from an arithmetic expression, just create a new parser with the 'arithmetic.parser' function and call its 'parse' metamethod and. This AST has methods for calculating the result of the expression. You can also print the AST (reconstructs the expression).
