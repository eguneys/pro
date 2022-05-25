
:- begin_tests(chess).

:- include(chess).

clear_board :- a_clear; a_turn(w).

board_1_setup :- clear_board, a_drop(b-r-(b-6)), a_drop(w-k-(e-5)), a_drop(w-b-(d-4)), a_drop(b-b-(c-3)).

test(hello, [
  setup(board_1_setup),
  cleanup(clear_board),
   Ys = [d-6,
 e-6,
 f-6,
 d-5,
 f-5,
 e-4,
 f-4] 
]) :-  pos(Y), setof(Y, any_turn_king_move(e-5, Y), Ys).

