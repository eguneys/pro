:- module(best, [
    best_move/2,
    initial_fen/1,
    apply_moves/3
]).


:- use_module(pro2).


apply_moves(Fen, [], Fen).
apply_moves(Fen0, [Move|Rest], Fen) :- 
  apply_move(Fen0, Move, FenI), apply_moves(FenI, Rest, Fen).

apply_move(Fen0, Move, Fen0) :- 
  format("~w", Move).


best_move(Fen, Move) :- fen_board(Fen, TB), phrase(combination(_, TB, _), [Move]).


combination(open_pawn([O-D]), T-B, T2-B2) --> [O-D], {
  opposite(T, T2),
  findall(P, (
      on_color(T, B, P),
      on_role(p, B, P)), Ps),
  maplist(turn_home(T), Ps),
  O=e-2,
  D=e-4,
  mobile_situation(O-D, T-B, T2-B2) 
}.
