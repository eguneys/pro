% Prolog

print_tb(T-B) :- print_board(B), format("~a to play", T).

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


