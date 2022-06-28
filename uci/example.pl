:- set_prolog_flag(double_quotes, chars).

moves([Move]) --> "move ", alnums(Move).
moves(Moves) --> "moves ", moves_list(Moves).

moves_list([Move|Moves]) --> alnums(Move), " ", moves_list(Moves).
moves_list([Move]) --> alnums(Move).

alnums([C|Cs]) --> alnum(C), alnums(Cs).
alnums([C]) --> alnum(C).

alnum(C) --> [C].


state(S), [S] --> [S].
state(S0, S), [S] --> [S0].

stuff(A) --> state(s(A0), s(A)), {
    A is A0 + 1
  }.

hello(A, Ls, B) :- phrase(stuff(B), [s(A)], Ls).

initial_fen(fen).
next_fen(fen, fen2).

fen(Fen) --> state(s(Fen)), { initial_fen(Fen) }.
fen2(Fen) --> state(s(Fen0), s(Fen)), { next_fen(Fen0, Fen) }.

world :- 
read_line_to_string(user_input, Ll),
atom_string(Ls, Ll),
((Ls = hello, phrase(fen(Fen), Lq));
(Ls = world, phrase(fen2(Fen), Lq));
(Ls = go, format('~a', Fen))),
world.
