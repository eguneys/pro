file(a).
file(b).

rank(1).
rank(2).
rank(3).

up(1-2).
up(2-3).

pos(X-Y) :- file(X), rank(Y).
tree(O, B, Ls) :- Ls=[check(O-D, K), flee(K-Flee), check(D-Mate, Flee), mate(Mate)], run(B, Ls).


next(a-b).
next(a-d).
next(b-c).
next(b-e).

hello(B, Ls) :- Ls=[king(K), king2(K-C), c(C)], run(B, Ls).

run(_, []).
run(B, [king(K)|Rest]) :- next(B-K), run(K, Rest).
run(B, [king2(K-C)|Rest]) :- K=b,next(B-C), run(C, Rest).
run(B, [c(K)|Rest]) :- K=c, run(B, Rest).


