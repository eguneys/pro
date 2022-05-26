
:- begin_tests(chess).

:- include(chess).

clear_board :- a_clear; a_turn(w).

board_1_setup :- clear_board, a_drop(b-r-(a-8)), a_drop(b-n-(b-8)), a_drop(b-b-(c-8)), a_drop(b-q-(d-8)), a_drop(b-k-(e-8)), a_drop(b-b-(f-8)), a_drop(b-n-(g-8)), a_drop(b-r-(h-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-p-(c-7)), a_drop(b-p-(d-7)), a_drop(b-p-(e-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-p-(d-2)), a_drop(w-p-(e-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-n-(b-1)), a_drop(w-b-(c-1)), a_drop(w-q-(d-1)), a_drop(w-k-(e-1)), a_drop(w-b-(f-1)), a_drop(w-n-(g-1)), a_drop(w-r-(h-1)).

test(standard, [
  setup(board_1_setup),
  cleanup(clear_board),
   set(Uci = ["Na3"]) 
]) :-  legals(X, Y, C, P), to_uci(X, Y, C, P, Uci).



  :- end_tests(chess).
  