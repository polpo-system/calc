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

## The modules

    Calc0.Mod   the calculator: the commands take the text and position of their parameters
                and write to Oberon0.Log; works in the console and the desktop
    calc.Mod    the console commands calc.Dec, calc.Hex, calc.Real, calc.Char, calc.Set,
                calc.List, calc.Reset: the results on the standard output
    Calc.Mod    the desktop commands Calc.Dec ... (^ for the selected expression), results in
                the log

Calc0 is Calc of Native Oberon 2.3.6 with the parameters given to its commands (instead of
Oberon.Par and the selection) and the version line left to Calc. It needs MathL (the package
math). `test/CalcTest.Mod` shows the log of the desktop on the standard output, for the test
of the desktop package.

Install with portia: `portia.Install calc` (the console commands), `portia.Install
calc-desktop` (the desktop commands and Calc.Tool). The license is GPL-3 (`LICENSE`); the code comes from ETH Oberon, whose license (`LICENSE.ETH`)
asks to keep its copyright notice and conditions, which `LICENSE.ETH` does.
