% Prolog 


% Section 1
file(a).
file(b).
file(c).
file(d).
file(e).
file(f).
file(g).
file(h).


% Section 2

right(a-b).
right(b-c).
right(c-d).
right(d-e).
right(e-f).
right(f-g).
right(g-h).


left(X-Y) :- right(Y-X).


% Section 3

right2(X-Y) :- right(X-Z), right(Z-Y).

righter(X-Y, []) :- right(X-Y).
righter(X-Y, [Z|Rest]) :- right(X-Z), righter(Z-Y, Rest).


% Exercises Section 1-3


left2(X-Y) :- right2(Y-X).

lefter(X-Y, []) :- left(X-Y).
lefter(X-Y, [Z|Rest]) :- left(X-Z), lefter(Z-Y, Rest).

rank(1).
rank(2).
rank(3).
rank(4).
rank(5).
rank(6).
rank(7).
rank(8).

up(1-2).
up(2-3).
up(3-4).
up(4-5).
up(5-6).
up(6-7).
up(7-8).

down(X-Y) :- up(Y-X).
updown(X-Y) :- up(X-Y);down(X-Y).

up2(X-Y) :- up(X-Z), up(Z-Y).
down2(X-Y) :- up2(Y-X).

upper(X-Y, []) :- up(X-Y).
upper(X-Y, [Z|Rest]) :- up(X-Z), upper(Z-Y, Rest).

downer(X-Y, []) :- down(X-Y).
downer(X-Y, [Z|Rest]) :- down(X-Z), downer(Z-Y, Rest).


% Section 4 

pos(F-R) :- file(F), rank(R).


% https://stackoverflow.com/questions/67946585/using-maplist-with-a-lambda-that-does-not-have-a-body
forward(X-Y,X-Y_, N) :- upper(Y-Y_, M), findall(X-Y__, member(Y__, M), N).


fwd_que_intermediate(X-Y, X_-Y_, MY, MX) :- upper(Y-Y_, MY), lefter(X-X_, MX).

fwd_que(X-Y, X_-Y_, N) :- upper(Y-Y_, MY), lefter(X-X_, MX), zip_pos(MX, MY, N).


zip_pos([], [], []).
zip_pos([X|Xs], [Y|Ys], [X-Y|Rest]) :- zip_pos(Xs, Ys, Rest).


% Exercises for Section 4

backward(X-Y,X-Y_, N) :- downer(Y-Y_, M), findall(X-Y__, member(Y__, M), N).
queen_side(X-Y,X_-Y, N) :- lefter(X-X_, M), findall(X__-Y, member(X__, M), N).
king_side(X-Y,X_-Y, N) :- righter(X-X_, M), findall(X__-Y, member(X__, M), N).

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

fwd2_que(X-Y, X_-Y_) :- up2(Y-Y_), left(X-X_).
fwd2_kng(X-Y, X_-Y_) :- up2(Y-Y_), right(X-X_).

fwd_que2(X-Y, X_-Y_) :- up(Y-Y_), left2(X-X_).
fwd_kng2(X-Y, X_-Y_) :- up(Y-Y_), right2(X-X_).


bck2_que(X-Y, X_-Y_) :- down2(Y-Y_), left(X-X_).
bck2_kng(X-Y, X_-Y_) :- down2(Y-Y_), right(X-X_).

bck_que2(X-Y, X_-Y_) :- down(Y-Y_), left2(X-X_).
bck_kng2(X-Y, X_-Y_) :- down(Y-Y_), right2(X-X_).

fwd2(X, Y, N) :- forward(X, Y, N), length(N, 1).
bck2(X, Y, N) :- backward(X, Y, N), length(N, 1).


knight(X, Y) :- fwd2_que(X, Y); fwd2_kng(X, Y); fwd_que2(X, Y); fwd_kng2(X, Y); 
                bck2_que(X, Y); bck2_kng(X, Y); bck_que2(X, Y); bck_kng2(X, Y).

bishop(X, Y, N) :- fwd_que(X, Y, N); fwd_kng(X, Y, N); bck_que(X, Y, N); bck_kng(X, Y, N).
rook(X, Y, N) :- forward(X, Y, N); backward(X, Y, N); queen_side(X, Y, N); king_side(X, Y, N).
king(X, Y) :- king_fwd(X, Y); king_bck(X, Y); king_lat(X, Y).
queen(X, Y, N) :- bishop(X, Y, N); rook(X, Y, N).



% Section 5


boardR([w-k-(e-4), b-r-(c-5), w-p-(a-2)]).


pickup(P, [P|B2], B2).
pickup(P, [X|Rest], [X|Rest2]) :- pickup(P, Rest, Rest2).


drop(P, [], [P]).
drop(P, [X|Rest], [X|Ls]) :- \+ same_pos(P, X), drop(P, Rest, Ls).

same_pos(_-_-Pos, _-_-Pos).

