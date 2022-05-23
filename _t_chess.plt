:- begin_tests(chess).

:- include(chess).


clear_board :- a_clear.

on_setup :- a_drop(w-k-(a-5)).

test(on, [
  setup(on_setup),
  cleanup(clear_board)
]) :- on(a-4).


off_setup :- a_drop(w-k-(a-4)).

test(off, [
  setup(off_setup),
  cleanup(clear_board)
]) :- on(a-4), \+ on(a-5).
