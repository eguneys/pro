% Prolog
:- use_module(library(reif)).


file(a).
file(b).


rank(1).
rank(2).



pos(X-Y) :- file(X), rank(Y).


color(w).

role(k).
role(q).



piece(Color-Role) :- color(Color), role(Role). 
piese(Piece-Pos) :- piece(Piece), pos(Pos).

board([]).
board([P]).
board([P-Pos,P2-Pos2]) :- dif(Pos, Pos2).
board([X,Y,C|Rest]) :- board([X|Rest]), board([Y|Rest]), board([C|Rest]), board([X,Y]),
board([X,C]), board([Y,C]).

