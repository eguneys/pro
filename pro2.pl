% Prolog
:- set_prolog_flag(double_quotes, chars).

file(a) --> [a].
file(b) --> [b].
file(c) --> [c].

rank(1) --> [1].
rank(2) --> [2].
rank(3) --> [3].


color(w) --> [w].
color(b) --> [b].

role(b) --> [b].
role(n) --> [n].
role(k) --> [k].
role(q) --> [q].

pos(X-Y) --> file(X), rank(Y).

piece(Color-Role-XY) --> color(Color), role(Role), "@", pos(XY).

board([]) --> [].
board([B|Rest]) --> piece(B), " ", board(Rest).




