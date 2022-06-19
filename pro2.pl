:- use_module(library(reif)).
:- table board/1.


file(a).
file(b).
file(c).
file(d).
file(e).
file(f).
file(g).
file(h).



rank(1).
rank(2).
rank(3).
rank(4).
rank(5).
rank(6).
rank(7).
rank(8).

pos(X-Y) :- file(X), rank(Y).

color(w).
color(b).

role(k).
role(q).
role(b).
role(n).
role(r).
role(p).

piece(Color-Role) :- color(Color), role(Role). 
piese(Piece-Pos) :- piece(Piece), pos(Pos).

board([]).
board([P]) :- piese(P).
board([P-Pos,P2-Pos2]) :- piece(P), piece(P2), pos(Pos), pos(Pos2), dif(Pos, Pos2).
board([X,Y|Rest]) :- board([X|Rest]), board([Y|Rest]), board([X,Y]).


drop(P, B, [P|B]) :- board([P|B]).
pickup(P, B, B2) :- drop(P, B2, B).

on(T, B, P) :- memberd_t(P, B, T).

on_color(B, Color, P, T) :- on(T, Color-_-P, B).
on_king(B, P, T) :- on(T, _-k-P, B).

mobile(P, P2, B, BOut) :- pickup(P, B, B2), drop(P2, B2, BOut).

opposite(w,b).
opposite(b,w).


mobile_situation(O-D, T-B, T2-B2) :-
 on_color(B, T, O),
 (
	 mobile_ray(O-D, B, B2)
 ),
 opposite(T, T2).


mobile_ray(O-D, B, B2) :-
 mobile(Color-Role-O, Color-Role-D, B, B2),
 ray_route(Role-O, D, Is),
 maplist(on(false, B), Is),
 member(Color-Role-O, B).

ray_route(b-P, P2, Is) :- bishop(P, P2, Is).
ray_route(q-P, P2, Is) :- queen(P, P2, Is).
ray_route(r-P, P2, Is) :- rook(P, P2, Is).
ray_route(n-P, P2, []) :- knight(P, P2).
ray_route(k-P, P2, []) :- king(P, P2).

pawn_push(w-P, P2, Is) :- white_push(P, P2, Is).
pawn_push(b-P, P2, Is) :- black_push(P, P2, Is).

pawn_capture(w-P, P2) :- white_capture(P, P2).
pawn_capture(b-P, P2) :- black_capture(P, P2).



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
    format('\n  abcdefgh\n').

print_row(Y, Pieces) :-
  format('\n~w ', [Y]),
  forall( member(X, [a,b,c,d,e,f,g,h]),
  (   member(X-Piece, Pieces)
  ->  uci(Piece)
  ;   format('.') ) ).


initial_fen("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1").

kiwipete("r3k2r/p1ppqpb1/bn2pnp1/3PN3/1p2P3/2N2Q1p/PPPBBPPP/R3K2R w KQkq - ").
pos3("8/2p5/3p4/KP5r/1R3p1k/8/4P1P1/8 w - - ").


fen_board(Fen, T-B) :- split_string(Fen, " ", "", [Pieses, Turn, _, _ |_]),
   uci_turn(Turn, T),
   split_string(Pieses, "/", "", RRanks),
   maplist(string_chars, RRanks, Ranks),
 foldl(rank_pieses, Ranks, [8,7,6,5,4,3,2,1], [], BB),
 foldl(append, BB, [], B).




rank_pieses(Chars, Rank, Rest, [Pieses|Rest]):- 
  fold_rank(Rank, Chars, [a,b,c,d,e,f,g,h], Pieses).

uci_turn("w", w).
uci_turn("b", b).

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


data_b_od(Data, B-T, ODs) :- data_fen(Data, Fen, Moves, _), fen_board(Fen, B-T), moves_od(Moves, ODs).

data_fen(Data, Fen, Moves, Id) :- split_string(Data, ",", "", [Id, Fen, Moves]).

moves_od(Moves, ODs) :- split_string(Moves, " ", "", Ls),
maplist(string_chars, Ls, Lss),
maplist(uci_od, Lss, ODs).

uci_od([OF,OR,DF,DR], OFF-ORR-(DFF-DRR)) :- uci_file(OF, OFF), uci_rank(OR, ORR), uci_file(DF, DFF), uci_rank(DR, DRR).

uci_file('a', a).
uci_file('b', b).
uci_file('c', c).
uci_file('d', d).
uci_file('e', e).
uci_file('f', f).
uci_file('g', g).
uci_file('h', h).

uci_rank('1', 1).
uci_rank('2', 2).
uci_rank('3', 3).
uci_rank('4', 4).
uci_rank('5', 5).
uci_rank('6', 6).
uci_rank('7', 7).
uci_rank('8', 8).




backranks(FMs) :- puzzles(backRankMate, FMs).
  
  
puzzles(X, FMs) :-  findall(TB-Ods, 
  (
    file_line("data/athousand_sorted.csv", Line), 
    csv_fen(Line, Fen, Moves, _, TagsS),
    tags_with(TagsS, X),
    fen_board(Fen, TB),
    moves_od(Moves, Ods)
  ), 
  FMs). 

csv_fen(Line, Fen, Moves, Id, Tags) :- split_string(Line, ",", "", [Id, Fen, Moves, _, _, _, _, Tags|_]).


tags_with(Tags, Tag) :- split_string(Tags, " ", "", Ls), maplist(atom_string, Atoms, Ls), member(Tag, Atoms).


% https://stackoverflow.com/a/69006410/3994249
file_line(File, Line) :-
  setup_call_cleanup(open(File, read, In),
  stream_line(In, Line),
  close(In)).

stream_line(In, Line) :-
  repeat,
  (read_line_to_string(In, Line0),
    Line0 \= end_of_file
  -> Line0 = Line
  ; !,
    fail
  ).