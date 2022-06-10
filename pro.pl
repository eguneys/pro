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

piece(X) :- boardX(B), member(X, B).


boardI(B) :- boardR(B).

boardX(X) :- boardI(X).

boardR([w-r-(d-5), b-b-(f-5), b-k-(b-2)]).



mobile_situation(O-D, T-B, T2-B2) :-
  on_color(B, T, O),
  (
    mobile_ray(O-D, B, B2) ; 
    mobile_pawn(O-D, B, B2) ;
    capture_ray(O-D, B, B2) ;
    capture_pawn(O-D, B, B2)
  ),
  opposite(T,T2).


run(B, OD, Ls) :- foldl(mobile_situation, OD, w-B, Ls).


run_to_depth(F, D, C) :- length(OD, D), fen_board(F, B), findall(Ls, run(B, OD, Ls), Lss), length(Lss, C).



mobile_ray(O-D, B, B2) :- 
member(Color-Role-O, B),
ray_route(Role-O, D, Is), 
maplist(off(B), Is),
mobile(Color-Role-O, Color-Role-D, B, B2).

mobile_pawn(O-D, B, B2) :-
  member(Color-p-O, B),
  pawn_push(Color-O, D, Is),
  maplist(off(B), Is),
  mobile(Color-p-O, Color-p-D, B, B2).

capture_ray(O-D, B, B2) :-
  member(Color-Role-O, B),
  ray_route(Role-O, D, Is), 
  maplist(off(B), Is),
  opposite(Color, Op),
  capture(Color-Role-O, Op-_-D, B, B2).


capture_pawn(O-D, B, B2) :-
  member(Color-p-O, B),
  pawn_capture(Color-O, D),
  opposite(Color, Op),
  capture(Color-p-O, Op-_-D, B, B2).



off(B, X) :- \+ on(B, X).


ray_route(b-P, P2, Is) :- bishop(P, P2, Is).
ray_route(q-P, P2, Is) :- queen(P, P2, Is).
ray_route(r-P, P2, Is) :- rook(P, P2, Is).
ray_route(n-P, P2, []) :- knight(P, P2).
ray_route(k-P, P2, []) :- king(P, P2).

pawn_push(w-P, P2, Is) :- white_push(P, P2, Is).
pawn_push(b-P, P2, Is) :- black_push(P, P2, Is).

pawn_capture(w-P, P2) :- white_capture(P, P2).
pawn_capture(b-P, P2) :- black_capture(P, P2).

opposite(w,b).
opposite(b,w).

on(B, P) :- member(_-_-P, B).
on_color(B, Color, P) :- member(Color-_-P, B).

mobile(P, P2, B, BOut) :- \+ same_pos(P, P2), pickup(P, B, B2), drop(P2, B2, BOut).


capture(P, C, B, BOut) :- \+ same_color(P, C), pickup(C, B, B2), pickup(P, B2, B3), take_pos(P, C, P2), drop(P2, B3, BOut).



pickup(P, [P|B2], B2).
pickup(P, [X|Rest], [X|Rest2]) :- pickup(P, Rest, Rest2).

drop(P, [], [P]).
drop(P, [X|Rest], [X|Ls]) :- \+ same_pos(P, X), drop(P, Rest, Ls).

same_pos(_-_-Pos, _-_-Pos).
same_color(X-_-_, X-_-_).
take_pos(C-R-_, _-_-Pos, C-R-Pos).




route_pass(Is, B2, M) :- include(on(Is), B2, M).


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





print_boardM(B, P) :- 
  findall(D, mobile_ray(P, D, B, _), Bs), 
  findall(a-x-X, member(X, Bs), Bss), 
  foldl(drop, Bss, B, Res), 
  print_board(Res).

print_boardPM(B, P) :-
  findall(D, mobile_pawn(P, D, B, _), Bs), 
  findall(a-x-X, member(X, Bs), Bss), 
  foldl(drop, Bss, B, Res), 
  print_board(Res).



uci(a-X) :- format('~a', X).
uci(w-r) :- format('R').
uci(w-q) :- format('Q').
uci(w-k) :- format('K').
uci(w-n) :- format('N').
uci(w-b) :- format('B').
uci(w-p) :- format('P').
uci(b-Role) :- format('~a', Role).


% https://stackoverflow.com/questions/72550199/how-to-sort-and-print-coordinates-of-a-chess-board-with-pieces-in-them/72553353?noredirect=1#comment128164848_72553353
print_board(Board) :-
  forall( member(Y, [8,7,6,5,4,3,2,1]),
  ( findall(X-Piece, member(Piece-(X-Y), Board), Pieces),
    print_row(Y, Pieces) ) ),
    format('\n  abcdefgh\n\n').

print_row(Y, Pieces) :-
  format('\n~w ', [Y]),
  forall( member(X, [a,b,c,d,e,f,g,h]),
  (   member(X-Piece, Pieces)
  ->  uci(Piece)
  ;   format('.') ) ).


initial_fen("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1").

kiwipete("r3k2r/p1ppqpb1/bn2pnp1/3PN3/1p2P3/2N2Q1p/PPPBBPPP/R3K2R w KQkq - ").
pos3("8/2p5/3p4/KP5r/1R3p1k/8/4P1P1/8 w - - ").


fen_board(Fen, B) :- split_string(Fen, " ", "", [Pieses, _, _, _ |_]),
   split_string(Pieses, "/", "", RRanks),
   maplist(string_chars, RRanks, Ranks),
 foldl(rank_pieses, Ranks, [8,7,6,5,4,3,2,1], [], BB),
 foldl(append, BB, [], B).




rank_pieses(Chars, Rank, Rest, [Pieses|Rest]):- 
  fold_rank(Rank, Chars, [a,b,c,d,e,f,g,h], Pieses).


n('1', 1).
n('2', 2).
n('3', 3).
n('4', 4).
n('5', 5).
n('6', 6).
n('7', 7).
n('8', 8).

char_role('k', k).
char_role('b', b).
char_role('n', n).
char_role('q', q).
char_role('r', r).
char_role('p', p).
char_role('K', k).
char_role('B', b).
char_role('N', n).
char_role('Q', q).
char_role('R', r).
char_role('P', p).


char_color('k', b).
char_color('b', b).
char_color('n', b).
char_color('q', b).
char_color('r', b).
char_color('p', b).
char_color('K', w).
char_color('B', w).
char_color('N', w).
char_color('Q', w).
char_color('R', w).
char_color('P', w).



fold_rank(_, [], [], []).
% https://stackoverflow.com/questions/46676080/prolog-how-to-remove-n-number-of-members-from-a-list
fold_rank(Rank, [Char|Rest], Files, SS) :- 
  (n(Char, RRank)
  -> (
    length(RemoveFiles, RRank),
    append(RemoveFiles, FFiles, Files),
    fold_rank(Rank, Rest, FFiles, SS)
  ) ; (
  Files = [File|FRest],
  char_role(Char, Role),
  char_color(Char, Color),
  SS=[Color-Role-(File-Rank)|SSRest],
  fold_rank(Rank, Rest, FRest, SSRest)
)).
