
:- begin_tests(chess).

:- include(chess).

clear_board :- a_clear.

  board_1_setup :- a_drop(b-k-(a-5)).

test(hello , [
  setup(board_1_setup),
  cleanup(clear_board)
]) :-  on(a-5).


test(hello2 , [
  setup(board_1_setup),
  cleanup(clear_board)
]) :-  on(a-5).

board_2_setup :- a_drop(b-q-(a-8)), a_drop(w-p-(e-1)).

test(off , [
  setup(board_2_setup),
  cleanup(clear_board)
]) :-  on(a-8).

