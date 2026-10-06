# Calc of ETH Oberon, for polpo

The Oberon desktop calculator: expressions as command parameters, results in the log.

    Calc.Dec alpha^2 * 3      in decimal
    Calc.Hex alpha + beta     in hexadecimal
    Calc.Real cos pi          as a real
    Calc.Char "j" + 7         as a character
    Calc.Set alpha := 33H beta := 1000H ~      variables
    Calc.List, Calc.Reset

Operators `+ - * / % < > ^` (modulo, shifts, power), the functions arccos, arcsin, arctan,
cos, entier, exp, ln, short, sign, sin, sqrt, tan; numbers in decimal, hexadecimal (`33H`)
and characters. `Calc.Tool` has the examples and the grammar.

From Native Oberon 2.3.6, unchanged. It needs MathL (the package math). `test/CalcTest.Mod`
shows the log on the standard output for the test of the package (needs the desktop).

Install with portia: `portia.Install calc`. The license is the one of ETH Oberon: `LICENSE`.
