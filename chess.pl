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

role(k).
role(r).
role(b).
role(q).
role(p).
role(n).

color(w).
color(b).

piece(X-Y) :- color(X), role(Y).

piese(X-Y) :- piece(X), pos(Y).

piese_pos(X, Y) :- X=_-_-Y.
piese_role(X, Y) :- X=_-Y-_.
piese_color(X, Y) :- X=Y-_-_.

:- dynamic drop/1.
:- dynamic start/1.

a_turn(X) :- assertz(start(X)).
a_drop(X) :- piese(X), piese_pos(X, Y), \+ on(Y), assertz(drop(X)).
a_pickup(X) :- retract(drop(_-_-X)).
a_clear:- forall(drop(X), retract(drop(X))), retract(start(X)).

print_drops:- forall(drop(X), write(X)).


on(X) :- drop(_-_-X).
off(X) :- \+ drop(_-_-X).

turn(X) :- start(X).
cntr(w) :- turn(b).
cntr(b) :- turn(w).

enemy(X, Y) :- drop(w-_-X), drop(b-_-Y).
enemy(X, Y) :- drop(b-_-X), drop(w-_-Y).

on_turn(X) :- drop(C-_-X), turn(C).

on_pawn(X) :- drop(_-p-X).

turn_king(X) :- drop(C-k-X), turn(C).
cntr_king(X) :- drop(C-k-X), cntr(C).


rays(X, Y, []) :- drop(_-k-X), king(X, Y).
rays(X, Y, []) :- drop(_-n-X), knight(X, Y).
rays(X, Y, Is) :- drop(_-b-X), bishop(X, Y, Is).
rays(X, Y, Is) :- drop(_-r-X), rook(X, Y, Is).
rays(X, Y, Is) :- drop(_-q-X), queen(X, Y, Is).

interpose_rays(X, Y, I) :- rays(X, Y, Is), member(I, Is).

blocked_rays(X, Y, Bs) :- rays(X, Y, Is), include(on, Is, Bs).


free_move(X, Y) :- on(X), off(Y).
capture_move(X, Y) :- on(X), on(Y), enemy(X, Y).
capture_move_pawn(X, Y) :- on(X), on(Y), enemy(X, Y), on_pawn(X).


free_ray_move(X, Y) :- blocked_rays(X, Y, []), free_move(X, Y).
capture_ray_move(X, Y) :- blocked_rays(X, Y, []), capture_move(X, Y).

any_ray_move(X, Y) :- free_ray_move(X, Y); capture_ray_move(X, Y).


pushes(X, Y, Is) :- drop(w-p-X), white_push(X, Y, Is).
pushes(X, Y, Is) :- drop(b-p-X), black_push(X, Y, Is).
pawn_captures(X, Y) :- drop(w-p-X), white_capture(X, Y).
pawn_captures(X, Y) :- drop(b-p-X), black_capture(X, Y).
pawn_en_passant(X, Y, C) :- drop(w-p-X), white_en_passant(X, Y, C).
pawn_en_passant(X, Y, C) :- drop(b-p-X), black_en_passant(X, Y, C).
pawn_promote(X) :- drop(w-p-X), white_promote(X).
pawn_promote(X) :- drop(b-p-X), black_promote(X).

blocked_pushes(X, Y, Bs) :- pushes(X, Y, Is), include(on, Is, Bs).

free_push_move(X, Y) :- blocked_pushes(X, Y, []), free_move(X, Y).
capture_pawn_move(X, Y) :- pawn_captures(X, Y), capture_move(X, Y).
enpassant_pawn_move(X, Y, C) :- pawn_en_passant(X, Y, C), free_move(X, Y), capture_move(X, C).
promote_move(X, Y) :- pawn_promote(X), (free_push_move(X, Y); capture_pawn_move(X, Y)).

any_pawn_move(X, Y, C) :- free_push_move(X, Y); capture_pawn_move(X, Y); enpassant_pawn_move(X, Y, C); promote_move(X, Y).



any_turn_move(X, Y, C) :- (any_ray_move(X, Y); any_pawn_move(X, Y, C)), on_turn(X).
any_turn_king_move(X, Y) :- turn_king(X), any_ray_move(X, Y).

king_move_safe(K, F) :- any_ray_move(K, F), \+ ((blocked_rays(X, F, []); blocked_rays(X, F, [K])), enemy(K, X)).

cntr_king_captures(X) :- turn_king(K), (capture_ray_move(X, K); capture_pawn_move(X, K)).

block_ray_at(X, Y, T) :- rays(X, Y, Is), member(T, Is).

block_ray_move(X, Y, F, T) :- block_ray_at(X, Y, T), any_ray_move(F, T).
block_pawn_move(X, Y, F, T) :- block_ray_at(X, Y, T), any_pawn_move(F, T, _).

any_block_move(X, Y, F, T) :- block_ray_move(X, Y, F, T); block_pawn_move(X, Y, F, T).

counter_block_or_capture(X, Y, F, T) :- any_block_move(X, Y, F, T); X=T, (capture_ray_move(F, T); capture_pawn_move(F, T)).


cntr_checks(Ls) :- findall(X, cntr_king_captures(X), Ls).

turn_on_no_checks:- cntr_checks([]).
turn_on_one_check(X) :- cntr_checks([X]).
turn_on_double_check(X, Y) :- cntr_checks([X, Y]).
turn_on_more_checks :- \+ turn_on_no_checks, \+ turn_on_one_check(_), \+ turn_on_double_check(_, _).

pinned_ray_move(A, K, P) :- interpose_rays(A, K, P).

turn_ray_safe_move(X, Y) :- turn_on_double_check(_, _), king_move_safe(X, Y).
turn_ray_safe_move(X, Y) :- turn_king(K), turn_on_one_check(C), king_move_safe(X, Y).
turn_ray_safe_move(X, Y) :- turn_king(K), turn_on_one_check(C), counter_block_or_capture(C, K, X, Y).
turn_ray_safe_move(X, Y) :- turn_king(K), turn_on_no_checks, any_ray_move(X, Y), 
\+ (capture_move(A, K), (pinned_ray_move(A, K, X), \+ pinned_ray_move(A, K, Y)), (Y=A, capture_move(X, Y))).


turn_pawn_safe_move(X, Y, C) :- turn_king(K), turn_on_no_checks, any_pawn_move(X, Y, C).



legals(X, Y, C) :- on_turn(X), (turn_ray_safe_move(X, Y); turn_pawn_safe_move(X, Y, C)).



role_to_uci(k, "K").
role_to_uci(n, "N").
role_to_uci(b, "B").
role_to_uci(r, "R").
role_to_uci(q, "Q").

file_to_uci(a, "a").
file_to_uci(b, "b").
file_to_uci(c, "c").
file_to_uci(d, "d").
file_to_uci(e, "e").
file_to_uci(f, "f").
file_to_uci(g, "g").
file_to_uci(h, "h").

rank_to_uci(1, "1").
rank_to_uci(2, "2").
rank_to_uci(3, "3").
rank_to_uci(4, "4").
rank_to_uci(5, "5").
rank_to_uci(6, "6").
rank_to_uci(7, "7").
rank_to_uci(8, "8").

pos_to_uci(X-Y, Uci):- file_to_uci(X, XUci), rank_to_uci(Y, YUci), atom_concat(XUci, YUci, Uci).

to_uci(X, Y, C, P, Uci) :- drop(_-R-X), role_to_uci(R, RUci), pos_to_uci(Y, PUci), atom_concat(RUci, PUci, Uci).
to_uci(X, Y, C, P, Uci) :- drop(_-p-X), pos_to_uci(Y, PUci), atom_concat('', PUci, Uci).



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
