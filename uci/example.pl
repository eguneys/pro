moves([Move]) --> "move ", alnums(Move).
moves(Moves) --> "moves ", moves_list(Moves).

moves_list([Move|Moves]) --> alnums(Move), " ", moves_list(Moves).
moves_list([Move]) --> alnums(Move).

alnums([C|Cs]) --> alnum(C), alnums(Cs).
alnums([C]) --> alnum(C).

alnum(C) --> [C].
