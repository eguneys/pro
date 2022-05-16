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

king(X, Y) :- king_fwd(X, Y); king_bck(X, Y); king_lat(X, Y).

