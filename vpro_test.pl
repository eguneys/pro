:- dynamic(white/1).
:- dynamic(orange/1).
:- dynamic(black/1).

:- dynamic(red/1).
:- dynamic(green/1).
:- dynamic(blue/1).
:- dynamic(yellow/1).

list([]).

color(white, Pos) :- white(Pos).
color(orange, Pos) :- orange(Pos).
color(black, Pos) :- black(Pos).

color(red, Pos) :- red(Pos).
color(green, Pos) :- green(Pos).
color(blue, Pos) :- blue(Pos).
color(yellow, Pos) :- yellow(Pos).

board0([b-k-(h-8),b-p-(a-7),b-b-(b-7),b-p-(g-7),b-p-(h-7),b-p-(c-6),b-p-(f-5),w-p-(d-4),w-p-(a-2),w-p-(b-2),w-p-(c-2),w-p-(f-2),w-p-(g-2),w-p-(h-2),w-r-(e-1),w-k-(g-1),b-r-(f-7)]).
board1([w-r-(e-8),w-k-(g-8),w-p-(a-7),w-p-(f-7),w-p-(g-7),w-p-(h-7),b-p-(a-2),b-p-(b-2),b-p-(f-2),b-p-(g-2),b-p-(h-2),b-k-(a-1),b-r-(d-2)]).
board2([b-k-(b-8),b-p-(a-7),b-p-(b-7),b-p-(c-7),b-r-(g-7),w-p-(a-5),b-b-(c-5),w-r-(e-4),w-p-(h-3),w-p-(b-2),w-p-(c-2),w-r-(a-1),w-k-(h-1),b-r-(d-2)]).
board3([b-r-(b-8),b-b-(c-8),b-p-(a-7),b-p-(g-7),b-p-(h-7),b-p-(b-6),w-r-(d-5),w-b-(c-4),b-p-(e-4),w-p-(a-2),w-p-(b-2),b-r-(f-2),w-p-(g-2),w-p-(h-2),w-k-(b-1),w-r-(h-1),b-k-(h-8)]).
board4([w-r-(f-8),w-k-(g-8),w-p-(a-7),w-p-(b-7),w-p-(h-7),w-p-(c-6),b-p-(e-6),w-p-(g-6),w-p-(d-5),b-n-(e-5),w-r-(f-4),b-p-(c-3),b-q-(h-3),b-p-(a-2),b-p-(b-2),b-p-(g-2),b-p-(h-2),b-k-(h-1),b-r-(f-1)]).
board5([w-r-(d-8),w-p-(a-7),w-k-(c-7),w-q-(g-7),w-p-(b-6),w-p-(e-6),w-p-(h-6),w-p-(c-5),w-n-(e-5),w-p-(g-5),b-p-(c-4),b-n-(e-4),b-p-(a-3),b-q-(g-3),b-p-(b-2),b-p-(f-2),b-p-(g-2),b-p-(h-2),b-k-(g-1),b-r-(e-3)]).
board6([b-r-(d-8),b-k-(g-8),b-n-(e-7),b-p-(f-7),b-p-(g-7),b-p-(h-7),b-p-(a-6),b-q-(b-6),b-b-(f-6),b-p-(b-5),b-r-(c-4),w-p-(f-4),w-p-(c-3),w-n-(e-3),w-r-(f-3),w-p-(a-2),w-p-(b-2),w-q-(d-2),w-b-(g-2),w-p-(h-2),w-r-(d-1),w-k-(g-1),b-p-(e-5)]).
board7([b-k-(g-8),b-p-(f-7),b-p-(g-7),b-p-(h-7),b-r-(e-5),w-p-(f-5),w-p-(g-4),w-r-(c-3),w-k-(d-3),w-p-(h-3),w-b-(h-1),b-r-(b-5)]).
board8([b-r-(c-8),b-k-(g-8),b-p-(a-7),b-p-(f-7),b-p-(g-7),b-p-(h-7),b-p-(b-6),b-p-(e-6),b-q-(f-6),w-p-(b-5),w-q-(c-4),w-p-(e-4),w-p-(f-4),w-p-(g-3),w-p-(a-2),w-b-(g-2),w-p-(h-2),w-r-(c-1),w-k-(g-1),b-b-(b-7)]).
board9([b-k-(b-8),b-p-(a-7),b-p-(b-7),b-p-(c-7),b-p-(g-7),w-p-(b-5),b-p-(h-5),w-p-(a-3),b-n-(e-3),w-p-(h-3),w-p-(c-2),b-r-(e-2),w-p-(g-2),w-b-(a-1),w-n-(e-1),w-r-(f-1),w-k-(g-1),b-r-(d-1)]).



mateIn20([b-k-(h-8),b-p-(a-7),b-b-(b-7),b-p-(g-7),b-p-(h-7),b-p-(c-6),b-p-(f-5),w-p-(d-4),w-p-(a-2),w-p-(b-2),w-p-(c-2),w-p-(f-2),w-p-(g-2),w-p-(h-2),w-r-(e-1),w-k-(g-1),b-r-(f-7)]).
mateIn21([w-r-(e-8),w-k-(g-8),w-p-(a-7),w-p-(f-7),w-p-(g-7),w-p-(h-7),b-p-(a-2),b-p-(b-2),b-p-(f-2),b-p-(g-2),b-p-(h-2),b-k-(a-1),b-r-(d-2)]).
mateIn22([b-k-(b-8),b-p-(a-7),b-p-(b-7),b-p-(c-7),b-r-(g-7),w-p-(a-5),b-b-(c-5),w-r-(e-4),w-p-(h-3),w-p-(b-2),w-p-(c-2),w-r-(a-1),w-k-(h-1),b-r-(d-2)]).
mateIn23([b-r-(b-8),b-b-(c-8),b-p-(a-7),b-p-(g-7),b-p-(h-7),b-p-(b-6),w-r-(d-5),w-b-(c-4),b-p-(e-4),w-p-(a-2),w-p-(b-2),b-r-(f-2),w-p-(g-2),w-p-(h-2),w-k-(b-1),w-r-(h-1),b-k-(h-8)]).
mateIn24([w-r-(c-8),w-p-(b-7),w-k-(e-7),w-p-(g-7),w-p-(h-7),w-p-(e-6),b-n-(b-5),w-p-(f-5),b-p-(f-4),b-p-(a-3),w-n-(d-3),b-p-(e-3),b-p-(g-2),b-p-(h-2),b-k-(g-1),b-r-(d-2)]).
mateIn25([w-r-(d-8),w-p-(a-7),w-k-(c-7),w-q-(g-7),w-p-(b-6),w-p-(e-6),w-p-(h-6),w-p-(c-5),w-n-(e-5),w-p-(g-5),b-p-(c-4),b-n-(e-4),b-p-(a-3),b-q-(g-3),b-p-(b-2),b-p-(f-2),b-p-(g-2),b-p-(h-2),b-k-(g-1),b-r-(e-3)]).
mateIn26([b-r-(d-8),b-k-(g-8),b-n-(e-7),b-p-(f-7),b-p-(g-7),b-p-(h-7),b-p-(a-6),b-q-(b-6),b-b-(f-6),b-p-(b-5),b-r-(c-4),w-p-(f-4),w-p-(c-3),w-n-(e-3),w-r-(f-3),w-p-(a-2),w-p-(b-2),w-q-(d-2),w-b-(g-2),w-p-(h-2),w-r-(d-1),w-k-(g-1),b-p-(e-5)]).
mateIn27([b-k-(h-8),b-p-(a-7),b-q-(c-7),b-p-(g-7),b-p-(h-7),b-p-(c-6),w-q-(e-6),b-p-(g-6),w-n-(g-3),w-p-(a-2),w-p-(c-2),w-p-(g-2),w-k-(g-1),b-r-(f-3)]).
mateIn28([b-k-(g-8),b-p-(f-7),b-p-(g-7),b-p-(h-7),b-r-(e-5),w-p-(f-5),w-p-(g-4),w-r-(c-3),w-k-(d-3),w-p-(h-3),w-b-(h-1),b-r-(b-5)]).
mateIn29([w-p-(f-7),w-r-(c-6),w-k-(d-6),w-b-(d-5),b-p-(h-4),b-p-(g-3),b-p-(f-2),b-k-(g-1),b-q-(h-7)]).


piece(X) :- boardX(B), member(X, B).

/*
(c-6)-(c-1) Rc1
(g-1)-(h-2) Kh2
(c-1)-(h-1) Rh1#
*/

boardI(B) :- mateIn25(B).


lsX([
  ok(b-k-KP),
  check_ray(O-D, KP),
  flee(b-k-KP, b-k-Flee),
  check_ray(D-M, Flee),
  mate(b-k-KP)
]).

ls(Ls) :- boardI(B), lsX(Ls), foldl(run, Ls, B, BL).


/*

yellow(X) :-
  boardX(B),
  O=w-R-PO,
  D=w-R-PD,
  ray_member(O, B),
  ray_route(R-PO, PD, _),
  mobile(O, D, B, B2),
  ray_member(w-R-PD, B2),
  ray_route(R-PD, C, _),
  capture(w-R-PD, b-k-C, B2, _),
  X=PD.
*/


run(check_ray(O-D, C), B, B2) :-
  ray_member(O, B),
  O=w-R-PO,
  D=w-R-PD,
  ray_route(R-PO, PD, _),
  mobile(O, D, B, B2),
  ray_member(w-R-PD, B2),
  ray_route(R-PD, C, _),
  capture(w-R-PD, b-k-C, B2, _).

run(ok(X), B, B) :- member(X, B).
run(check(O-D, C), B, B2) :- 
member(O, B),
D=w-r-PD,
O=w-r-PO,
rook_route(PO, PD, _),
mobile(O, D, B, B2),
rook_route(PD, C, _).

run(flee(K, Flee), B, B2):-
member(b-k-KP, B),
K=b-k-PK,
Flee=b-k-FK,
king_route(PK, FK),
mobile(K, Flee, B, B2),
\+ (member(w-b-BP, B2),
  bishop_route(BP, FK, _),
  capture(w-b-BP, b-k-FK, B2, _)),
\+ (member(w-r-RP, B2),
  rook_route(RP, FK, _),
  capture(w-r-RP, b-k-FK, B2, _)).



run(mate(K), B, B) :-
  member(b-k-KP, B),

  capture(w-R-MP, b-k-KP, B, _),
  ray_route(R-MP, KP, _),
\+ (
  king_route(KP, Flee),
  mobile(b-k-KP, b-k-Flee, B, BFlee),
\+ (ray_route(R2-FC, Flee, _),
  capture(w-R2-FC, b-k-Flee, BFlee, _)
)
)
.


yellow(X) :- 
  boardX(B),
  member(b-k-KP, B),
  capture(w-R-MP, b-k-KP, B, _),
  ray_route(R-MP, KP, _),
  king_route(KP, Flee),
  X=Flee,
  mobile(b-k-KP, b-k-Flee, B, B2),
\+ (
  ray_route(R2-FC, Flee, _),
  capture(w-R2-FC, b-k-Flee, B2, _)
)
.



board_2(BOut) :- boardI(B), 
pickup(b-k-(g-1), B, B2),
pickup(w-r-(c-6), B2, B3),
drop(b-k-(h-2), B3, B4),
drop(w-r-(h-1), B4, BOut).

boardX(X) :- boardI(X).



/*
orange(X) :- boardX(B),
member(b-k-KP, B),
king_route(KP, Flee),
mobile(b-k-KP, b-k-Flee, B, BFLee),
X=Flee. 
*/

/*
piece(X) :- boardX(B),
ray_member(b-k-KP, B),
king_route(KP, Flee),
mobile(b-k-KP, b-k-Flee, B, BFlee),
\+ (
ray_member(w-R-RP, BFlee),
ray_route(R-RP, Flee, _)
),
member(X, BFlee).
*/


king_at(X, B) :- boardX(B), member(b-k-X, B).
king_flee(K, Flee, B) :- king_at(K, B), king_route(K, Flee).
pawn_at(P, B) :- boardX(B), member(b-p-P, B).

rook_At(X, B) :- boardX(B), member(w-r-X, B).

rook_Check(R, B, CAt, C) :- 
rook_At(R, B), 
rook_route(R, CAt, _),
rook_route(CAt, C, _).

white(Flee) :- king_flee(K, Flee, B), \+ pawn_at(Flee, B).
%green(Flee) :- king_flee(K, Flee, B), pawn_at(Flee, B).

red(CAt) :- king_at(K, B), findall(Flee, white(Flee), Flees), rook_Check(R, B, CAt, K), maplist(rook_Check(R, B, CAt), Flees).



ray_route(b-P, P2, Is) :- bishop(P, P2, Is).
ray_route(q-P, P2, Is) :- queen(P, P2, Is).
ray_route(r-P, P2, Is) :- rook(P, P2, Is).

bishop_route(B, B2, Is) :- bishop(B, B2, Is).
rook_route(R, R2, Is) :- rook(R, R2, Is).
king_route(K, K2) :- king(K, K2).


ray_role(b).
ray_role(n).
ray_role(k).
ray_role(q).
ray_role(r).

ray_member(Color-Role-Pos, B) :- ray_role(Role), member(Color-Role-Pos, B).







checks(Q, QC, B, B2) :- queen_route(Q, QC, _), mobile(Q, QC, B, B2), queen_route(QC, K, _), capture(QC, K, B2, _).






mobile(P, P2, B, BOut) :- \+ same_pos(P, P2), pickup(P, B, B2), drop(P2, B2, BOut).


capture(P, C, B, BOut) :- \+ same_color(P, C), pickup(C, B, B2), pickup(P, B2, B3), take_pos(P, C, P2), drop(P2, B3, BOut).



pickup(P, [P|B2], B2).
pickup(P, [X|Rest], [X|Rest2]) :- pickup(P, Rest, Rest2).

drop(P, [], [P]).
drop(P, [X|Rest], [X|Ls]) :- \+ same_pos(P, X), drop(P, Rest, Ls).

same_pos(_-_-Pos, _-_-Pos).
same_color(X-_-_, X-_-_).
take_pos(C-R-_, _-_-Pos, C-R-Pos).




on(Is, _-_-X) :- member(X, Is).
route_pass(Is, B2, M) :- include(on(Is), B2, M).


queen_route(_-_-Q, _-_-Q2, Is) :- queen(Q, Q2, Is).







right(a-b).
right(b-c).
right(c-d).
right(d-e).
right(e-f).
right(f-g).
right(g-h).

left(X-Y) :- right(Y-X).
leftright(X-Y) :- left(X-Y); right(X-Y).


right2(X-Y) :- right(X-Z), right(Z-Y).
left2(X-Y) :- right2(Y-X).

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

up2(X-Y) :- up(X-Z), up(Z-Y).
down2(X-Y) :- up2(Y-X).

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

white_base(_-1).
black_base(_-8).
white_home(_-2).
white_home1(_-3).
white_home2(_-4).
black_home(_-7).
black_home1(_-6).
black_home2(_-5).


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

white_push(X, Y, N) :- \+ white_base(X), (white_home(X), fwd2(X, Y, N); forward(X, Y, [])).
white_capture(X, Y) :- \+ white_base(X), (fwd_kng(X, Y, []); fwd_que(X, Y, [])).
white_en_passant(X, Y, C) :- black_home2(X), white_capture(X, Y), backward(Y, C, []).
white_promote(X) :- black_home(X).

black_push(X, Y, N) :- \+ black_base(X), (black_home(X), bck2(X, Y, N); backward(X, Y, [])).
black_capture(X, Y) :- \+ black_base(X), (bck_kng(X, Y, []); bck_que(X, Y, [])).
black_en_passant(X, Y, C) :- white_home2(X), black_capture(X, Y), forward(Y, C, []).
black_promote(X) :- white_home(X).

