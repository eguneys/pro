
:- begin_tests(chess).

:- include(chess).

clear_board :- a_clear.

  board_1_setup :- clear_board, a_turn(b), a_drop(b-b-(d-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-k-(e-7)), a_drop(b-p-(f-7)), a_drop(b-r-(g-7)), a_drop(b-p-(h-7)), a_drop(w-b-(b-5)), a_drop(b-p-(c-5)), a_drop(w-r-(e-4)), a_drop(w-p-(b-3)), a_drop(w-p-(a-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-k-(b-1)).

play_move_test_01GC2 :- drop(C-R-(e-7)),
    a_pickup(e-7),
    a_drop(C-R-(f-8)),  
    
    turn(X),
    cntr(Y),
    retract(start(X)),
    a_turn(Y).


    board_and_play_board_1 :- board_1_setup, play_move_test_01GC2.
    

test(test_01GC2, [
  setup(board_and_play_board_1),
  cleanup(clear_board),
  set(Uci = ['e4e8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_2_setup :- clear_board, a_turn(w), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(w-q-(f-7)), a_drop(b-p-(h-7)), a_drop(b-n-(b-6)), a_drop(w-b-(e-6)), a_drop(b-p-(g-6)), a_drop(b-k-(h-6)), a_drop(w-p-(g-4)), a_drop(b-q-(h-4)), a_drop(w-p-(h-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-p-(f-2)), a_drop(w-k-(c-1)).

play_move_test_00Xiu :- drop(C-R-(f-2)),
    a_pickup(f-2),
    a_drop(C-R-(f-4)),  
    
    turn(X),
    cntr(Y),
    retract(start(X)),
    a_turn(Y).


    board_and_play_board_2 :- board_2_setup, play_move_test_00Xiu.
    

test(test_00Xiu, [
  setup(board_and_play_board_2),
  cleanup(clear_board),
  set(Uci = ['h4e1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


  :- end_tests(chess).
    