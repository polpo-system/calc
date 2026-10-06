MODULE CalcTest;  (** CalcTest.Log: the lines of the log (where Calc writes) on the standard output *)
IMPORT Texts, Oberon, out;

PROCEDURE Log*;
VAR R: Texts.Reader; ch: CHAR;
BEGIN
  Texts.OpenReader(R, Oberon.Log, 0); Texts.Read(R, ch);
  WHILE ~R.eot DO IF ch = 0DX THEN out.Ln ELSE out.Char(ch) END; Texts.Read(R, ch) END;
  out.Ln
END Log;

END CalcTest.
