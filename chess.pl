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

righter(X-Y, []) :- right(X-Y).
righter(X-Y, [Z|Rest]) :- right(X-Z), righter(Z-Y, Rest).

lefter(X-Y, []) :- left(X-Y).
lefter(X-Y, [Z|Rest]) :- left(X-Z), lefter(Z-Y, Rest).


righter(X-Y) :- righter(X-Y, []).
lefter(X-Y) :- lefter(Y-X, []).


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


upper(X-Y, []) :- up(X-Y).
upper(X-Y, [Z|Rest]) :- up(X-Z), upper(Z-Y, Rest).

downer(X-Y, []) :- down(X-Y).
downer(X-Y, [Z|Rest]) :- down(X-Z), downer(Z-Y, Rest).

upper(X-Y) :- upper(X-Y, []).
downer(X-Y) :- upper(Y-X, []).

rank(1).
rank(2).
rank(3).
rank(4).
rank(5).
rank(6).
rank(7).
rank(8).

pos(F-R) :- file(F), rank(R).

bigger(X-Y,X_-Y_) :- upper(Y-Y_); Y=Y_, righter(X-X_).

queen_edge(a-_).
king_edge(h-_).
bck_edge(_-1).
fwd_edge(_-8).

corner(a-1).
corner(a-8).
corner(h-1).
corner(h-8).

back_rank(_-1).
promote_rank(_-8).
pawn_rank(_-2).

zip_pos([], [], []).
zip_pos([X|Xs], [Y|Ys], [X-Y|Rest]) :- zip_pos(Xs, Ys, Rest).

% https://stackoverflow.com/questions/67946585/using-maplist-with-a-lambda-that-does-not-have-a-body
forward(X-Y,X-Y_, N) :- upper(Y-Y_, M), findall(X-Y__, member(Y__, M), N).
backward(X-Y,X-Y_, N) :- downer(Y-Y_, M), findall(X-Y__, member(Y__, M), N).
queen_side(X-Y,X_-Y, N) :- lefter(X-X_, M), findall(X__-Y, member(X__, M), N).
king_side(X-Y,X_-Y, N) :- righter(X-X_, M), findall(X__-Y, member(X__, M), N).

fwd_que(X-Y, X_-Y_, N) :- upper(Y-Y_, MY), lefter(X-X_, MX), zip_pos(MX, MY, N).
fwd_kng(X-Y, X_-Y_, N) :- upper(Y-Y_, MY), righter(X-X_, MX), zip_pos(MX, MY, N).
bck_que(X-Y, X_-Y_, N) :- downer(Y-Y_, MY), lefter(X-X_, MX), zip_pos(MX, MY, N).
bck_kng(X-Y, X_-Y_, N) :- downer(Y-Y_, MY), righter(X-X_, MX), zip_pos(MX, MY, N).

fwd_que2bck_kng(X,Y, N) :- fwd_que(X, Y, N); bck_kng(X, Y, N).
fwd_kng2bck_que(X,Y, N) :- fwd_kng(X, Y, N); bck_que(X, Y, N).

fwd2bck(X,Y, N) :- forward(X, Y, N); backward(X, Y, N).
que2kng(X,Y, N) :- queen_side(X, Y, N); king_side(X, Y, N).

king_fwd(X,Y) :- forward(X,Y, []); fwd_que(X,Y, []); fwd_kng(X,Y, []). 
king_bck(X,Y) :- backward(X,Y, []); bck_que(X,Y, []); bck_kng(X,Y, []).
king_lat(X,Y) :- queen_side(X,Y, []); king_side(X,Y,[]).

bishop(X, Y, N) :- fwd_que(X, Y, N); fwd_kng(X, Y, N); bck_que(X, Y, N); bck_kng(X, Y, N).
rook(X, Y, N) :- forward(X, Y, N); backward(X, Y, N); queen_side(X, Y, N); king_side(X, Y, N).
king(X, Y) :- king_fwd(X, Y); king_bck(X, Y); king_lat(X, Y).
queen(X, Y, N) :- bishop(X, Y, N); rook(X, Y, N).


role(k).
role(r).
role(b).
role(q).

color(w).
color(b).

piece(X-Y) :- color(X), role(Y).

% piese(X-Y) :- piece(X), pos_(Y).
piese(X-Y) :- piece(X), pos(Y).

piese_pos(X, Y) :- X=_-_-Y.
piese_role(X, Y) :- X=_-Y-_.
piese_color(X, Y) :- X=Y-_-_.


move(b-r-X, Y, I):- rook(X, Y, I).
move(w-r-X, Y, I):- rook(X, Y, I).
move(b-k-X, Y, _):- king(X, Y).
move(b-b-X, Y, I):- bishop(X, Y, I).
move(w-q-X, Y, I):- queen(X, Y, I).


% check for the non-existence of non-existence  
% https://stackoverflow.com/a/50648745/3994250
hello(K, Q):- move(b-k-K, Q, []),
\+ (move(b-k-K, Flee, []), \+ Flee=Q, \+ move(w-q-Q, Flee, _)).


board(Ps) :-
  setof(P, pos_(P), S),
  set_subset(S, Ls),
  maplist(piese_pos, Ps, Ls),
  maplist(piese, Ps).

% https://stackoverflow.com/a/9007359/3994249 
is_set(Lst) :-
  setof(X, member(X, Lst), Set),
  length(Lst, N),
  length(Set, N).



% https://stackoverflow.com/a/6065515/3994249
count(P, Count) :- findall(1, P, L), length(L, Count).



% https://stackoverflow.com/a/72289416/3994249
set_subset([], []).
set_subset([X|Xs], S) :-set_subset(Xs, T), (S = T; S = [X|T]).


% https://stackoverflow.com/a/59266875/3994249
ap([], L, L).
ap([H|T], L, [H|Z]):- ap(T,L,Z).
