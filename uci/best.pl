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


best_move(TB, Move) :- phrase(safe_combs(_, TB, _), [Move]).

safe_combs(C, TB, TB2) --> not_combination(C, TB, TB2), !, { fail }.
safe_combs(C, TB, TB2) --> combination(C, TB, TB2).

not_combination(ignored([O-D]), T-B, T2-B2) --> [O-D],  {
  mobile_situation(O-D, T-B, T2-B2),
  mobile_capture(_, T-q, T2-B2, _)
}.

combination(prepare([P-DP], O-D), T-B, T2-B2) --> [P-DP], {
  mobile_situation(P-DP, T-B, T2-B2),
  mobile_situation(_, T2-B2, T3-B3),
  mobile_situation(O-D, T3-B3, T4-B4),
  mobile_situation(_-D, T4-B4, T5-B5),
  mobile_situation(DP-D, T5-B5, _)
}.

combination(capture([O-D]), T-B, T2-B2) --> [O-D], {
  mobile_capture(O-D, _, T-B, T2-B2),
  findall(D2, mobile_situation(_-D2, T2-B2, _), D2s),
  maplist(dif(D), D2s)
}.

combination(on_pressure([O-D]), T-B, T2-B2) --> [O-D], {
  mobile_situation(O-D, T-B, T2-B2),
  mobile_capture(D-C, _-C, T-B2, _)
}.

combination(no_pressure([O-D]), T-B, T2-B2) --> combination(any([O-D]), T-B, T2-B2), {
  findall(D2, mobile_situation(_-D2, T2-B2, _), D2s),
  maplist(dif(D), D2s)
}.

combination(any([O-D]), T-B, T2-B2) --> [O-D], {
  mobile_situation(O-D, T-B, T2-B2) 
}.





