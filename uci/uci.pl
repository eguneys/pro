#!/usr/bin/env swipl

:- use_module(pro2).


:- initialization(main, main).

main() :-
  prompt(_, ''),
  initial_fen(Fen),
  uci_loop(go, Fen).

uci_loop(break, _).
uci_loop(go, Fen):-
  read_line_to_string(user_input, L),
  split_string(L, " ", "", Ls),
  (phrase(uci(Break, Fen), Ls);
    (phrase(no_match(Break, _), Ls))),
  uci_loop(Break, Fen).



go(Fen) --> ["go"], {
  fen_board(Fen, TB),
  print_tb(TB),
  format("\n")
}.

uci(Break, Fen) --> (quit, { Break=break });
(go(Fen);
  moves(Moves);
  position(Fen)), { Break=go }.

moves(Moves) --> ["moves"], Moves, { length(Moves, 2), format("moves ~w", Moves) }.

quit --> ["quit"].
position(Fen) --> ["position"], (fen(Fen); custom_fen(Fen)).

fen(Fen) --> ["startpos"], { initial_fen(Fen) }.
custom_fen(Fen) --> ["fen"], Fen, { length(Fen, 6), format("~a", Fen) }.

no_match(go, []) --> [].
no_match(go, [X|Xs]) --> [X], no_match(go, Xs).
