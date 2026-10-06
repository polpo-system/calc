(* OBERON System 3, Release 2.3.

Copyright 1999 ETH Zrich Institute for Computer Systems, 
ETH Center, CH-8092 Zrich. e-mail: oberon@inf.ethz.ch.

This module may be used under the conditions of the general Oberon 
System 3 license contract. The full text can be downloaded from

	"ftp://ftp.inf.ethz.ch/pub/software/Oberon/System3/license.txt;A"

Under the license terms stated it is in particular (a) prohibited to modify
the interface of this module in any way that disagrees with the style
or content of the system and (b) requested to provide all conversions
of the source code to another platform with the name OBERON. *)

MODULE Calc;	(** portable *)	(* CAS 28.9.93 / tk adapted for System 3 1.6.95*)
(* polpo: the desktop commands of the calculator Calc0: the expression after the command, or
   the selected one after ^; the results go to the log. calc has the same for the console. *)
	IMPORT
		Texts, Oberon, Calc0;

	VAR
		lastTime: LONGINT;
		W: Texts.Writer;

	(* the text and position of the parameters: after the command, or the selection for ^ *)
	PROCEDURE Par (VAR T: Texts.Text; VAR pos: LONGINT);
		VAR S: Texts.Scanner; text: Texts.Text; beg, end, time: LONGINT;
	BEGIN T := Oberon.Par.text; pos := Oberon.Par.pos;
		Texts.OpenScanner(S, T, pos); Texts.Scan(S);
		IF (S.class = Texts.Char) & (S.c = "^") & (S.line = 0) THEN
			Oberon.GetSelection(text, beg, end, time);
			IF time >= lastTime THEN lastTime := time; T := text; pos := beg END
		END
	END Par;

	PROCEDURE Hex*;	(** expr **)
		VAR T: Texts.Text; pos: LONGINT;
	BEGIN Par(T, pos); Calc0.Hex(T, pos)
	END Hex;

	PROCEDURE Dec*;	(** expr **)
		VAR T: Texts.Text; pos: LONGINT;
	BEGIN Par(T, pos); Calc0.Dec(T, pos)
	END Dec;

	PROCEDURE Real*;	(** expr **)
		VAR T: Texts.Text; pos: LONGINT;
	BEGIN Par(T, pos); Calc0.Real(T, pos)
	END Real;

	PROCEDURE Char*;	(** expr **)
		VAR T: Texts.Text; pos: LONGINT;
	BEGIN Par(T, pos); Calc0.Char(T, pos)
	END Char;

	PROCEDURE Set*;	(** {name ":=" expr} "~" **)
		VAR T: Texts.Text; pos: LONGINT;
	BEGIN Par(T, pos); Calc0.Set(T, pos)
	END Set;

	PROCEDURE List*;
	BEGIN Calc0.List
	END List;

	PROCEDURE Reset*;
	BEGIN Calc0.Reset
	END Reset;

BEGIN Texts.OpenWriter(W); Texts.WriteString(W, Calc0.Version); Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf);
	lastTime := 0
END Calc.
