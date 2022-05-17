% Prolog %

right(a-b).
right(b-c).
right(c-d).
right(d-e).
right(e-f).
right(f-g).
right(g-h).

left(X-Y) :- right(Y-X).
leftright(X-Y) :- left(X-Y); right(X-Y).

file(a).
file(b).
file(c).
file(d).
file(e).
file(f).
file(g).
file(h).

up(1-2).
up(2-3).
up(3-4).
up(4-5).
up(5-6).
up(6-7).
up(7-8).

down(X-Y) :- up(Y-X).

updown(X-Y) :- up(X-Y);down(X-Y).

rank(1).
rank(2).
rank(3).
rank(4).
rank(5).
rank(6).
rank(7).
rank(8).

pos(F-R) :- file(F), rank(R).

edge(a-_).
edge(h-_).
edge(_-1).
edge(_-8).

corner(a-1).
corner(a-8).
corner(h-1).
corner(h-8).

backrank(_-1).
promoterank(_-8).
pawnrank(_-2).


forward(X-Y,X-Y_) :- up(Y-Y_).
backward(X-Y,X-Y_) :- down(Y-Y_).
queen_side(X-Y,X_-Y) :- left(X-X_).
king_side(X-Y,X_-Y) :- right(X-X_).

fwd_que(X-Y, X_-Y_) :- up(Y-Y_), left(X-X_).
fwd_kng(X-Y, X_-Y_) :- up(Y-Y_), right(X-X_).
bck_que(X-Y, X_-Y_) :- down(Y-Y_), left(X-X_).
bck_kng(X-Y, X_-Y_) :- down(Y-Y_), right(X-X_).

fwd_que2bck_kng(X,Y) :- fwd_que(X-Y); bck_kng(X-Y).
fwd_kng2bck_que(X,Y) :- fwd_kng(X-Y); bck_que(X-Y).

fwd2bck(X,Y) :- forward(X-Y); backward(X-Y).
que2kng(X,Y) :- queen_side(X-Y); king_side(X-Y).

king_fwd(X,Y) :- forward(X,Y); fwd_que(X,Y); fwd_kng(X,Y). 
king_bck(X,Y) :- backward(X,Y); bck_que(X,Y); bck_kng(X,Y).
king_lat(X,Y) :- queen_side(X,Y); king_side(X,Y).

make_long(F, X, Y, []) :- call(F, X, Y).
make_long(F, X, Y, [Z|Blocks]) :- call(F, X, Z), make_long(F, Z, Y, Blocks).

make_short(F, X, Y, []) :- call(F, X, Y).


forward_long(X, Y, Interpose) :- make_long(forward, X, Y, Interpose).
backward_long(X, Y, Interpose) :- make_long(backward, X, Y, Interpose).
queen_side_long(X, Y, Interpose) :- make_long(queen_side, X, Y, Interpose).
king_side_long(X, Y, Interpose) :- make_long(king_side, X, Y, Interpose).

fwd_que_long(X, Y, Interpose) :- make_long(fwd_que, X, Y, Interpose).


forward_short(X, Y, Interpose) :- make_short(forward, X, Y, Interpose).
backward_short(X, Y, Interpose) :- make_short(backward, X, Y, Interpose).
queen_side_short(X, Y, Interpose) :- make_short(queen_side, X, Y, Interpose).
king_side_short(X, Y, Interpose) :- make_short(king_side, X, Y, Interpose).

fwd_que_short(X, Y, Interpose) :- make_short(fwd_que, X, Y, Interpose).


rook_long(X, Y, Interpose) :- forward_long(X, Y, Interpose); backward_long(X, Y, Interpose); queen_side_long(X, Y, Interpose); king_side_long(X, Y, Interpose).

rook_short(X, Y, Interpose) :- forward_short(X, Y, Interpose); backward_short(X, Y, Interpose); queen_side_short(X, Y, Interpose); king_side_short(X, Y, Interpose).

king_short(X, Y, Interpose) :- rook_short(X, Y, Interpose).

interpose_route(R1, R2, X, Y, IFrom, IAt) :- call(R1, X, Y, Interpose), member(IAt, Interpose), call(R2, IFrom, IAt, _).

flee_safe(K) :- king_short(K, Y, _), \+ rook_long(_, Y, _).


:- dynamic(k/1).
:- dynamic(p/1).
:- dynamic(r/1).
:- dynamic(b/1).
:- dynamic(kW/1).
:- dynamic(pW/1).
:- dynamic(rW/1).
:- dynamic(bW/1).

black(X) :- k(X);p(X);r(X);b(X).
white(X) :- kW(X);pW(X);rW(X);bW(X).

piece(X) :- black(X);white(X).


