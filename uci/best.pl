% Prolog
:- module(best, [
    best_move/2,
    initial_fen/1,
    fen_board/2,
    apply_moves/3,
    print_tb/1
]).


:- use_module(pro2).


apply_moves(TB, [], TB).
apply_moves(TB0, [Move|Rest], TB2) :- 
  apply_move(TB0, Move, TB1), apply_moves(TB1, Rest, TB2).

apply_move(TB, Move, TB2) :- 
  string_chars(Move, MoveChars),
  uci_od(MoveChars, OD),
  mobile_situation(OD, TB, TB2).


a_move(O-D, T-B, T2-B2) --> [O-D], {
  mobile_situation(O-D, T-B, T2-B2)
}.


/*
best_move(TB, Move) :- phrase(safe_combs(_, TB, _), [Move]).

safe_combs(C, TB, TB2) --> not_combination(C, TB, TB2), !, { fail }.
safe_combs(C, TB, TB2) --> combination(C, TB, TB2).

not_combination(ignored([O-D]), T-B, T2-B2) --> [O-D],  {
  mobile_situation(O-D, T-B, T2-B2),
  mobile_capture(_, T-q, T2-B2, _)
}.



combination(any([O-D]), T-B, T2-B2) --> [O-D], {
  mobile_situation(O-D, T-B, T2-B2) 
}.




*/
