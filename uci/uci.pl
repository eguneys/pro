#!/usr/bin/env swipl

:- use_module(library(dcg/basics)).
:- use_module(library(reif)).
:- use_module(best).


:- initialization(main, main).

main :-
prompt(_, ''),
format("V Aid Prolog UCI v0.8\n"),
initial_fen(Fen),
fen_board(Fen, TB),
repl(position(TB)).


repl(TB0) :-
  read_line_to_codes(user_input, Line),
  ( Line == end_of_file
    -> Input = `quit`
    ; Input = Line
  ),
  phrase(parse(Command), Input), !,
  eval(Command, Result, TB0, TB),
  format("~w~n", Result),
  ( Command = quit
    -> true
    ; repl(TB)
  ).


parse(quit) --> "quit".
parse(print) --> "print".
parse(go) --> "go".
parse(position(TB)) --> "position ", (start_pos(TB0); custom_fen(TB0)), " moves " , moves(Moves), {
  apply_moves(TB0, Moves, TB)
}.

parse(position(TB)) --> "position ", (start_pos(TB); custom_fen(TB)).
parse(unknown(U)) --> remainder(U).

custom_fen(TB) --> "fen ", fen(Fen), fen_board(Fen, TB).
start_pos(TB) --> "startpos", { initial_fen(Fen), fen_board(Fen, TB) }.

moves([Move|Rest]) --> string(MoveCodes), " ", moves(Rest), 
{ format(string(Move), "~s", [MoveCodes]) }.

moves([Move]) --> string(MoveCodes), eol, 
{ format(string(Move), "~s", [MoveCodes]) }.

fen(Fen) --> string(Pieses), " ", string(Turn), " ", string(Castles), " ", string(EnPassant), " ", string(A), " ", string(B), { format(string(Fen), "~s ~s ~s ~s ~s ~s", [Pieses, Turn, Castles, EnPassant, A, B]) }.


eval(quit, "bye", S, S).
eval(go, R, S, S) :-
  S = position(TB),
  best_move(TB, Move),
  Move=OF-OR-(DF-DR),
  format(string(R), "~w~w~w~w", [OF,OR,DF,DR]).

eval(print, "", S, S) :-
 S = position(TB),
 print_tb(TB).

eval(position(TB), "", _, position(TB)).
eval(unknown(_), "", S, S).
