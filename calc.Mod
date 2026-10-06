MODULE calc;  (** the calculator of Calc for the console of polpo *)

(* calc.Dec expr     the value in decimal          calc.Hex expr    in hexadecimal
   calc.Real expr    as a real                     calc.Char expr   as a character
   calc.Set name := expr ... ~   variables         calc.List, calc.Reset
   Operators + - * / % < > ^ (modulo, shifts, power), the functions arccos, arcsin, arctan,
   cos, entier, exp, ln, short, sign, sin, sqrt, tan; numbers 12, 0CH (hexadecimal), "c".
   The variables live as long as the shell. See Calc.Tool for the grammar. *)

IMPORT Texts := Texts0, Oberon := Oberon0, Calc0, out;

VAR log: Texts.Text;

(* the console has no log: Calc0 writes into a text of its own, shown after the command *)
PROCEDURE Begin(VAR saved: Texts.Text);
BEGIN saved := Oberon.Log; NEW(log); Texts.Open(log, ""); Oberon.SetLog(log)
END Begin;

PROCEDURE End(saved: Texts.Text);
VAR R: Texts.Reader; ch: CHAR;
BEGIN
  Oberon.SetLog(saved);
  Texts.OpenReader(R, log, 0); Texts.Read(R, ch);
  WHILE ~R.eot DO IF ch = 0DX THEN out.Ln ELSE out.Char(ch) END; Texts.Read(R, ch) END
END End;

PROCEDURE Hex*;
VAR saved: Texts.Text;
BEGIN Begin(saved); Calc0.Hex(Oberon.Par.text, Oberon.Par.pos); End(saved)
END Hex;

PROCEDURE Dec*;
VAR saved: Texts.Text;
BEGIN Begin(saved); Calc0.Dec(Oberon.Par.text, Oberon.Par.pos); End(saved)
END Dec;

PROCEDURE Real*;
VAR saved: Texts.Text;
BEGIN Begin(saved); Calc0.Real(Oberon.Par.text, Oberon.Par.pos); End(saved)
END Real;

PROCEDURE Char*;
VAR saved: Texts.Text;
BEGIN Begin(saved); Calc0.Char(Oberon.Par.text, Oberon.Par.pos); End(saved)
END Char;

PROCEDURE Set*;
VAR saved: Texts.Text;
BEGIN Begin(saved); Calc0.Set(Oberon.Par.text, Oberon.Par.pos); End(saved)
END Set;

PROCEDURE List*;
VAR saved: Texts.Text;
BEGIN Begin(saved); Calc0.List; End(saved)
END List;

PROCEDURE Reset*;
VAR saved: Texts.Text;
BEGIN Begin(saved); Calc0.Reset; End(saved)
END Reset;

END calc.
