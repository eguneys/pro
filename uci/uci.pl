#!/usr/bin/env swipl

:- set_prolog_flag(double_quotes, chars).

:- use_module(library(reif)).
:- use_module(pro2).


:- initialization(main, main).

main() :-
  prompt(_, ''),
  format("Pro Aid Chess v0.5\n"),
  initial_fen(Fen),
  uci_loop(Fen).

uci_loop():-
  read_line_to_string(user_input, L),
  string_chars(L, Ls),
  (phrase(uci(s(Break, Fen)), Ls);
    (phrase(no_match(s(Break, _)), Ls))),
  if_(dif(Break, break), uci_loop(), format('bye')).


go(Fen) --> "go", {
  fen_board(Fen, TB),
  print_tb(TB),
  format("\n")
}.

uci(Break, Fen) --> (quit, { Break=break });
(go(Fen);
  position(Fen)), { Break=go }.

quit --> "quit".
position(Fen) --> "position ", (start_pos(Fen); custom_fen(Fen)).

custom_fen(Fen) --> "fen ", fen(Fen), { format('here') }.
start_pos(Fen) --> "startpos ", [Fe], { format('hello~a', Fe), initial_fen(Fen) }.


fen([Pieses, Turn, Castles, EnPassant, A, B]) --> [Pieses, Turn, Castles, EnPassant, A, B].

no_match(go, []) --> [].
no_match(go, [X|Xs]) --> [X], no_match(go, Xs).

state(S), [S] --> [S].
state(S0, S), [S] --> [S0].
