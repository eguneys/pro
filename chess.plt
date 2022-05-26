
:- begin_tests(chess).

:- include(chess).

clear_board :- a_clear; a_turn(w).

board_1_setup :- clear_board, a_drop(b-r-(b-6)), a_drop(w-k-(e-5)), a_drop(w-b-(d-4)), a_drop(b-b-(c-3)).

test(king_move_safe, [
  setup(board_1_setup),
  cleanup(clear_board),
   set(Y = [d-5, e-4, f-4, f-5]) 
]) :-  king_move_safe(e-5, Y).

board_2_setup :- clear_board, a_drop(w-p-(e-3)),a_drop(b-n-(g-3)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)),a_drop(w-p-(d-2)),a_drop(w-p-(h-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-q-(d-1)),a_drop(w-k-(e-1)),a_drop(w-r-(h-1)).

test(notsuicide, [
  setup(board_2_setup),
  cleanup(clear_board),
   set(Y = [f-2]) 
]) :-  king_move_safe(e-1, Y).

board_3_setup :- clear_board, a_drop(b-b-(e-3)),a_drop(b-n-(g-3)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)),a_drop(w-p-(d-2)),a_drop(w-p-(h-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-q-(d-1)),a_drop(w-k-(e-1)),a_drop(w-r-(h-1)).

test(immobilized, [
  setup(board_3_setup),
  cleanup(clear_board),
   set(Y == []) 
]) :-  king_move_safe(e-1, Y).



  :- end_tests(chess).
  