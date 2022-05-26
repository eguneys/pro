
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

board_4_setup :- clear_board, a_drop(b-r-(e-3)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)),a_drop(w-p-(d-2)),a_drop(w-p-(h-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-q-(d-1)),a_drop(w-k-(e-1)),a_drop(w-r-(h-1)).

test(escape_danger, [
  setup(board_4_setup),
  cleanup(clear_board),
   set(Y == [f-1, f-2]) 
]) :-  king_move_safe(e-1, Y).

board_5_setup :- clear_board, a_drop(b-r-(e-4)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)),a_drop(w-p-(d-2)),a_drop(w-p-(h-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-q-(d-1)),a_drop(w-k-(e-1)),a_drop(w-r-(h-1)).

test(move_to_defend, [
  setup(board_5_setup),
  cleanup(clear_board),
   set(Y == [e-2]) 
]) :-  turn_ray_move_safe(d-1, Y).

board_6_setup :- clear_board, a_drop(b-r-(e-4)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)),a_drop(w-p-(d-2)),a_drop(w-p-(h-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-q-(d-1)),a_drop(w-k-(e-1)),a_drop(w-n-(g-1)),a_drop(w-r-(h-1)).

test(knight_block, [
  setup(board_6_setup),
  cleanup(clear_board),
   set(Y == [e-2]) 
]) :-  turn_ray_move_safe(g-1, Y).

board_7_setup :- clear_board, a_drop(w-k-(c-3)),a_drop(b-r-(h-3)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)),a_drop(w-p-(d-2)),a_drop(w-p-(h-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-q-(d-1)),a_drop(w-n-(g-1)),a_drop(w-r-(h-1)).

test(pawn_block, [
  setup(board_7_setup),
  cleanup(clear_board),
   set(Y = [d-3]) 
]) :-  turn_pawn_move_safe(d-2, Y).

board_8_setup :- clear_board, a_drop(w-k-(c-4)),a_drop(b-r-(h-4)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)),a_drop(w-p-(d-2)),a_drop(w-p-(h-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-q-(d-1)),a_drop(w-n-(g-1)),a_drop(w-r-(h-1)).

test(pawn_double_sq, [
  setup(board_8_setup),
  cleanup(clear_board),
   set(Y = [d-4]) 
]) :-  turn_pawn_move_safe(d-2, Y).

board_9_setup :- clear_board, a_drop(b-r-(e-4)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)),a_drop(w-p-(d-2)),a_drop(w-k-(e-2)),a_drop(w-q-(g-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-r-(h-1)).

test(queen_capture_defend, [
  setup(board_9_setup),
  cleanup(clear_board),
   set(Y = [e-4]) 
]) :-  turn_ray_move_safe(g-2, Y).

board_10_setup :- clear_board, a_drop(b-r-(e-4)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)),a_drop(w-p-(d-2)),a_drop(w-q-(e-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-k-(e-1)),a_drop(w-r-(h-1)).

test(queen_defender, [
  setup(board_10_setup),
  cleanup(clear_board),
   set(Y = [e-3, e-4]) 
]) :-  turn_ray_move_safe(e-2, Y).

board_11_setup :- clear_board, a_drop(b-r-(e-4)), a_drop(w-p-(f-3)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)),a_drop(w-p-(d-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-k-(e-1)),a_drop(w-r-(h-1)).

test(pawn_defend, [
  setup(board_11_setup),
  cleanup(clear_board),
   set(Y = [e-4]) 
]) :-  turn_pawn_move_safe(f-3, Y).

board_12_setup :- clear_board, a_drop(b-r-(e-4)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)),a_drop(w-p-(d-2)),a_drop(w-b-(e-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-k-(e-1)),a_drop(w-r-(h-1)).

test(stay_to_defend, [
  setup(board_12_setup),
  cleanup(clear_board),
   set(Y = []) 
]) :-  turn_ray_move_safe(e-2, Y).

board_13_setup :- clear_board, a_drop(w-k-(b-3)),a_drop(w-p-(d-3)),a_drop(b-r-(g-3)), a_drop(w-p-(a-2)),a_drop(w-p-(b-2)),a_drop(w-p-(c-2)), a_drop(w-r-(a-1)),a_drop(w-n-(b-1)),a_drop(w-b-(c-1)),a_drop(w-r-(h-1)).

test(stay_pawn, [
  setup(board_13_setup),
  cleanup(clear_board),
   set(Y = []) 
]) :-  turn_pawn_move_safe(d-3, Y).



  :- end_tests(chess).
  