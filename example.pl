file(a).
file(b).

rank(1).
rank(2).
rank(3).

up(1-2).
up(2-3).

pos(X-Y) :- file(X), rank(Y).


any_ray_move(X-Y, X-Y_) :- up(Y-Y_).
any_ray_move(X-Y, X-Y_) :- up(Y-Z), up(Z-Y_).
