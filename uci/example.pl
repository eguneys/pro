:- set_prolog_flag(double_quotes, chars).
:- use_module(library(reif)).

:- dynamic(brek/1).

take_user :-
  assertz(brek(0)),
  retract(brek(_)),
  assertz(brek(0)),
  read_line_to_string(user_input, L),
  string_chars(L, Ls),
  (phrase(uci, Ls); phrase(no_match(_), Ls)),
  brek(B),
  format('|~a|', B),
  if_(dif(B, break), take_user, format('bye')).


uci --> quit; go; position.

quit --> "quit", {
  format('wtf'),
  retract(brek(_)),
  assertz(brek(break))
}.

position --> {
}.

go --> "go", {
  format('go fen ')
}.

no_match([]) --> [].
no_match([X|Xs]) --> [X], no_match(Xs).
