
:- begin_tests(chess).

:- include(chess).

clear_board :- a_clear; a_turn(w).

board_1_setup :- clear_board, a_drop(b-r-(b-6)), a_drop(w-k-(e-5)), a_drop(w-b-(d-4)), a_drop(b-b-(c-3)).

test(king_move_safe, [
  setup(board_1_setup),
  cleanup(clear_board),
   Ys = [d-5, e-4, f-4, f-5] 
]) :-  setof(Y, king_move_safe(e-5, Y), Ys).

