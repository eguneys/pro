#!/usr/bin/env swipl

:- use_module(library(dcg/basics)).
:- use_module(library(reif)).
:- use_module(best).


:- initialization(main, main).

main :-
prompt(_, ''),
initial_fen(Fen),
repl(position(Fen)).


repl(Fen0) :-
  read_line_to_codes(user_input, Line),
  ( Line == end_of_file
    -> Input = `quit`
    ; Input = Line
  ),
  phrase(parse(Command), Input), !,
  eval(Command, Result, Fen0, Fen),
  format("~w~n", Result),
  ( Command = quit
    -> true
    ; repl(Fen)
  ).


parse(quit) --> "quit".
parse(go) --> "go".
parse(position(Fen)) --> "position ", (start_pos(Fen0); custom_fen(Fen0)), " moves ", moves(Moves), {
  apply_moves(Fen0, Moves, Fen)
}.
parse(position(Fen)) --> "position ", (start_pos(Fen); custom_fen(Fen)).
parse(unknown(U)) --> remainder(U).

custom_fen(Fen) --> "fen ", fen(Fen).
start_pos(Fen) --> "startpos", { initial_fen(Fen) }.

moves([Move|Rest]) --> string(MoveCodes), " ", moves(Rest), 
{ format(string(Move), "~s", [MoveCodes]) }.

moves([Move]) --> string(MoveCodes), eol, 
{ format(string(Move, "~s", [MoveCodes])) }.

fen(Fen) --> string(Pieses), " ", string(Turn), " ", string(Castles), " ", string(EnPassant), " ", string(A), " ", string(B), { format(string(Fen), "~s ~s ~s ~s ~s ~s", [Pieses, Turn, Castles, EnPassant, A, B]) }.


eval(quit, "bye", S, S).
eval(go, R, S, S) :-
  S = position(Fen),
  best_move(Fen, Move),
  Move=OF-OR-(DF-DR),
  format(string(R), "~w~w~w~w", [OF,OR,DF,DR]).

eval(position(Fen), "", _, position(Fen)).
eval(unknown(_), "", S, S).
