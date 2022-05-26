
:- begin_tests(chess).

:- include(chess).

clear_board :- a_clear.

  board_1_setup :- clear_board; a_turn(b), a_drop(b-b-(d-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-k-(e-7)), a_drop(b-p-(f-7)), a_drop(b-r-(g-7)), a_drop(b-p-(h-7)), a_drop(w-b-(b-5)), a_drop(b-p-(c-5)), a_drop(w-r-(e-4)), a_drop(w-p-(b-3)), a_drop(w-p-(a-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-k-(b-1)).

play_move_test_01GC2 :- drop(C-R-(e-7)),
    a_pickup(e-7),
    a_drop(C-R-(f-8)).

test(test_01GC2, [
  setup(board_1_setup),
  cleanup(clear_board),
  setup(play_move_test_01GC2), set(Uci = ['e4e8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_2_setup :- clear_board; a_turn(w), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(w-q-(f-7)), a_drop(b-p-(h-7)), a_drop(b-n-(b-6)), a_drop(w-b-(e-6)), a_drop(b-p-(g-6)), a_drop(b-k-(h-6)), a_drop(w-p-(g-4)), a_drop(b-q-(h-4)), a_drop(w-p-(h-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-p-(f-2)), a_drop(w-k-(c-1)).

play_move_test_00Xiu :- drop(C-R-(f-2)),
    a_pickup(f-2),
    a_drop(C-R-(f-4)).

test(test_00Xiu, [
  setup(board_2_setup),
  cleanup(clear_board),
  setup(play_move_test_00Xiu), set(Uci = ['h4e1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_3_setup :- clear_board; a_turn(w), a_drop(b-r-(g-8)), a_drop(b-k-(h-8)), a_drop(w-r-(d-7)), a_drop(b-p-(h-7)), a_drop(w-p-(e-6)), a_drop(b-r-(h-6)), a_drop(b-p-(b-5)), a_drop(b-p-(f-5)), a_drop(b-p-(a-4)), a_drop(w-p-(a-3)), a_drop(w-p-(c-3)), a_drop(w-p-(b-2)), a_drop(w-r-(f-2)), a_drop(b-p-(g-2)), a_drop(w-k-(h-2)), a_drop(w-q-(e-1)).

play_move_test_00ohT :- drop(C-R-(h-2)),
    a_pickup(h-2),
    a_drop(C-R-(g-1)).

test(test_00ohT, [
  setup(board_3_setup),
  cleanup(clear_board),
  setup(play_move_test_00ohT), set(Uci = ['h6h1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_4_setup :- clear_board; a_turn(w), a_drop(b-r-(f-8)), a_drop(b-k-(g-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-p-(h-7)), a_drop(b-p-(c-6)), a_drop(w-p-(e-6)), a_drop(b-p-(g-6)), a_drop(b-p-(d-5)), a_drop(w-n-(e-5)), a_drop(b-r-(f-4)), a_drop(w-p-(c-3)), a_drop(w-q-(h-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(b-q-(f-1)), a_drop(w-k-(h-1)).

play_move_test_00ns1 :- drop(C-R-(a-1)),
    a_pickup(a-1),
    a_drop(C-R-(f-1)).

test(test_00ns1, [
  setup(board_4_setup),
  cleanup(clear_board),
  setup(play_move_test_00ns1), set(Uci = ['f4f1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_5_setup :- clear_board; a_turn(b), a_drop(b-k-(c-8)), a_drop(b-r-(a-7)), a_drop(b-p-(g-7)), a_drop(w-k-(c-6)), a_drop(b-p-(f-6)), a_drop(b-p-(h-6)), a_drop(w-p-(h-4)), a_drop(b-p-(a-3)), a_drop(w-r-(e-1)).

play_move_test_01Egl :- drop(C-R-(a-3)),
    a_pickup(a-3),
    a_drop(C-R-(a-2)).

test(test_01Egl, [
  setup(board_5_setup),
  cleanup(clear_board),
  setup(play_move_test_01Egl), set(Uci = ['e1e8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_6_setup :- clear_board; a_turn(b), a_drop(b-r-(a-8)), a_drop(b-r-(f-8)), a_drop(b-k-(h-8)), a_drop(b-p-(b-7)), a_drop(b-p-(c-7)), a_drop(w-n-(e-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(w-r-(h-7)), a_drop(b-p-(d-6)), a_drop(b-p-(a-5)), a_drop(b-n-(e-5)), a_drop(w-p-(e-4)), a_drop(w-p-(b-3)), a_drop(w-p-(c-3)), a_drop(w-p-(d-3)), a_drop(w-p-(g-3)), a_drop(w-p-(b-2)), a_drop(w-k-(d-2)), a_drop(w-p-(g-2)), a_drop(w-r-(d-1)).

play_move_test_01J5O :- drop(C-R-(h-8)),
    a_pickup(h-8),
    a_drop(C-R-(h-7)).

test(test_01J5O, [
  setup(board_6_setup),
  cleanup(clear_board),
  setup(play_move_test_01J5O), set(Uci = ['d1h1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_7_setup :- clear_board; a_turn(w), a_drop(b-k-(c-8)), a_drop(b-r-(h-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(e-6)), a_drop(b-n-(f-6)), a_drop(b-n-(c-5)), a_drop(b-p-(d-5)), a_drop(b-p-(g-5)), a_drop(w-b-(b-3)), a_drop(w-p-(d-3)), a_drop(w-p-(f-3)), a_drop(b-q-(g-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-n-(d-2)), a_drop(w-r-(f-2)), a_drop(w-r-(a-1)), a_drop(w-q-(d-1)), a_drop(w-k-(h-1)).

play_move_test_00DPQ :- drop(C-R-(f-2)),
    a_pickup(f-2),
    a_drop(C-R-(h-2)).

test(test_00DPQ, [
  setup(board_7_setup),
  cleanup(clear_board),
  setup(play_move_test_00DPQ), set(Uci = ['g3h2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_8_setup :- clear_board; a_turn(b), a_drop(b-r-(g-8)), a_drop(b-k-(h-8)), a_drop(b-p-(h-7)), a_drop(w-r-(a-6)), a_drop(w-n-(d-6)), a_drop(w-p-(h-6)), a_drop(b-r-(b-5)), a_drop(w-p-(b-4)), a_drop(w-k-(h-4)), a_drop(w-p-(a-3)).

play_move_test_00OPk :- drop(C-R-(b-5)),
    a_pickup(b-5),
    a_drop(C-R-(d-5)).

test(test_00OPk, [
  setup(board_8_setup),
  cleanup(clear_board),
  setup(play_move_test_00OPk), set(Uci = ['d6f7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_9_setup :- clear_board; a_turn(w), a_drop(b-r-(a-8)), a_drop(b-n-(b-8)), a_drop(b-b-(c-8)), a_drop(b-k-(e-8)), a_drop(b-r-(h-8)), a_drop(b-b-(a-7)), a_drop(b-p-(b-7)), a_drop(b-q-(c-7)), a_drop(b-p-(d-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(a-6)), a_drop(b-p-(e-6)), a_drop(b-p-(h-5)), a_drop(w-p-(e-4)), a_drop(b-n-(g-4)), a_drop(w-n-(b-3)), a_drop(w-n-(c-3)), a_drop(w-b-(d-3)), a_drop(w-p-(h-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-r-(a-1)), a_drop(w-b-(c-1)), a_drop(w-q-(d-1)), a_drop(w-r-(f-1)), a_drop(w-k-(h-1)).

play_move_test_010Jc :- drop(C-R-(d-1)),
    a_pickup(d-1),
    a_drop(C-R-(e-2)).

test(test_010Jc, [
  setup(board_9_setup),
  cleanup(clear_board),
  setup(play_move_test_010Jc), set(Uci = ['c7h2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_10_setup :- clear_board; a_turn(b), a_drop(w-r-(e-8)), a_drop(b-k-(b-7)), a_drop(w-r-(e-7)), a_drop(w-k-(d-6)), a_drop(b-p-(g-6)), a_drop(w-p-(b-5)), a_drop(w-p-(b-4)), a_drop(b-r-(c-3)), a_drop(b-p-(d-3)), a_drop(b-r-(h-3)).

play_move_test_00IaZ :- drop(C-R-(b-7)),
    a_pickup(b-7),
    a_drop(C-R-(b-6)).

test(test_00IaZ, [
  setup(board_10_setup),
  cleanup(clear_board),
  setup(play_move_test_00IaZ), set(Uci = ['e8b8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_11_setup :- clear_board; a_turn(w), a_drop(w-p-(a-7)), a_drop(b-p-(h-7)), a_drop(b-p-(g-6)), a_drop(b-k-(b-5)), a_drop(b-p-(d-4)), a_drop(b-q-(e-4)), a_drop(w-p-(b-3)), a_drop(w-p-(c-3)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-q-(d-1)), a_drop(w-k-(g-1)).

play_move_test_00pmn :- drop(C-R-(d-1)),
    a_pickup(d-1),
    a_drop(C-R-(d-4)).

test(test_00pmn, [
  setup(board_11_setup),
  cleanup(clear_board),
  setup(play_move_test_00pmn), set(Uci = ['e4e1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_12_setup :- clear_board; a_turn(b), a_drop(b-r-(f-8)), a_drop(b-k-(g-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-q-(c-7)), a_drop(b-p-(g-7)), a_drop(w-r-(h-7)), a_drop(b-p-(e-6)), a_drop(b-r-(g-6)), a_drop(b-p-(d-5)), a_drop(w-p-(c-3)), a_drop(w-q-(h-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-r-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-k-(g-1)).

play_move_test_00JO7 :- drop(C-R-(c-7)),
    a_pickup(c-7),
    a_drop(C-R-(c-5)).

test(test_00JO7, [
  setup(board_12_setup),
  cleanup(clear_board),
  setup(play_move_test_00JO7), set(Uci = ['h7h8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_13_setup :- clear_board; a_turn(b), a_drop(w-q-(b-8)), a_drop(w-p-(c-7)), a_drop(b-k-(d-7)), a_drop(b-p-(a-6)), a_drop(b-p-(e-6)), a_drop(b-p-(f-6)), a_drop(b-p-(h-6)), a_drop(b-q-(d-5)), a_drop(b-p-(g-5)), a_drop(b-p-(b-4)), a_drop(w-p-(b-3)), a_drop(w-p-(e-3)), a_drop(w-p-(g-3)), a_drop(w-p-(f-2)), a_drop(w-p-(h-2)), a_drop(w-k-(g-1)).

play_move_test_01RPQ :- drop(C-R-(d-5)),
    a_pickup(d-5),
    a_drop(C-R-(c-6)).

test(test_01RPQ, [
  setup(board_13_setup),
  cleanup(clear_board),
  setup(play_move_test_01RPQ), set(Uci = ['b8d8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_14_setup :- clear_board; a_turn(w), a_drop(b-r-(d-8)), a_drop(b-r-(f-8)), a_drop(b-k-(g-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-b-(g-7)), a_drop(b-p-(c-6)), a_drop(b-p-(f-6)), a_drop(w-p-(f-5)), a_drop(b-p-(h-5)), a_drop(b-n-(g-4)), a_drop(w-n-(c-3)), a_drop(w-b-(f-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-q-(e-2)), a_drop(w-p-(g-2)), a_drop(b-q-(h-2)), a_drop(w-r-(d-1)), a_drop(w-r-(e-1)), a_drop(w-k-(g-1)).

play_move_test_01Lyl :- drop(C-R-(g-1)),
    a_pickup(g-1),
    a_drop(C-R-(f-1)).

test(test_01Lyl, [
  setup(board_14_setup),
  cleanup(clear_board),
  setup(play_move_test_01Lyl), set(Uci = ['h2h1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_15_setup :- clear_board; a_turn(b), a_drop(b-r-(a-8)), a_drop(b-r-(d-8)), a_drop(b-k-(g-8)), a_drop(b-q-(c-7)), a_drop(b-b-(e-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(d-6)), a_drop(b-n-(f-6)), a_drop(b-p-(h-6)), a_drop(b-p-(b-5)), a_drop(b-p-(c-5)), a_drop(w-n-(d-5)), a_drop(w-p-(b-4)), a_drop(w-b-(d-4)), a_drop(w-p-(e-4)), a_drop(w-p-(a-3)), a_drop(w-q-(g-3)), a_drop(w-r-(e-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-k-(g-1)).

play_move_test_004iZ :- drop(C-R-(f-6)),
    a_pickup(f-6),
    a_drop(C-R-(d-5)).

test(test_004iZ, [
  setup(board_15_setup),
  cleanup(clear_board),
  setup(play_move_test_004iZ), set(Uci = ['g3g7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_16_setup :- clear_board; a_turn(w), a_drop(b-r-(b-8)), a_drop(b-r-(e-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-p-(f-7)), a_drop(b-k-(g-7)), a_drop(b-p-(c-6)), a_drop(b-p-(d-6)), a_drop(b-p-(g-6)), a_drop(w-p-(b-5)), a_drop(b-p-(e-5)), a_drop(b-p-(h-5)), a_drop(w-p-(c-4)), a_drop(w-n-(e-4)), a_drop(b-n-(g-4)), a_drop(b-q-(h-4)), a_drop(w-p-(d-3)), a_drop(w-p-(e-3)), a_drop(w-p-(a-2)), a_drop(w-q-(d-2)), a_drop(w-p-(f-2)), a_drop(w-b-(g-2)), a_drop(w-r-(b-1)), a_drop(w-r-(f-1)), a_drop(w-k-(g-1)).

play_move_test_00nlD :- drop(C-R-(e-4)),
    a_pickup(e-4),
    a_drop(C-R-(g-3)).

test(test_00nlD, [
  setup(board_16_setup),
  cleanup(clear_board),
  setup(play_move_test_00nlD), set(Uci = ['h4h2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_17_setup :- clear_board; a_turn(b), a_drop(b-r-(f-8)), a_drop(b-k-(g-8)), a_drop(b-q-(b-7)), a_drop(b-r-(f-7)), a_drop(b-p-(h-7)), a_drop(b-p-(d-6)), a_drop(w-r-(g-6)), a_drop(w-q-(h-6)), a_drop(b-p-(d-5)), a_drop(w-b-(d-4)), a_drop(w-p-(c-3)), a_drop(w-p-(f-3)), a_drop(w-p-(a-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-k-(g-1)).

play_move_test_00fZM :- drop(C-R-(h-7)),
    a_pickup(h-7),
    a_drop(C-R-(g-6)).

test(test_00fZM, [
  setup(board_17_setup),
  cleanup(clear_board),
  setup(play_move_test_00fZM), set(Uci = ['h6h8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_18_setup :- clear_board; a_turn(w), a_drop(b-k-(c-8)), a_drop(b-r-(g-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-p-(h-7)), a_drop(b-p-(e-6)), a_drop(b-p-(c-5)), a_drop(b-p-(f-5)), a_drop(w-p-(c-4)), a_drop(w-p-(a-3)), a_drop(w-p-(f-3)), a_drop(b-q-(h-3)), a_drop(w-p-(b-2)), a_drop(w-q-(c-2)), a_drop(w-r-(e-2)), a_drop(w-r-(f-2)), a_drop(b-b-(h-2)), a_drop(w-k-(h-1)).

play_move_test_00QY3 :- drop(C-R-(f-2)),
    a_pickup(f-2),
    a_drop(C-R-(h-2)).

test(test_00QY3, [
  setup(board_18_setup),
  cleanup(clear_board),
  setup(play_move_test_00QY3), set(Uci = ['h3f1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_19_setup :- clear_board; a_turn(b), a_drop(b-k-(d-7)), a_drop(b-r-(f-7)), a_drop(b-p-(a-6)), a_drop(b-p-(b-5)), a_drop(b-p-(f-5)), a_drop(w-p-(h-5)), a_drop(w-q-(d-4)), a_drop(w-p-(f-4)), a_drop(w-p-(g-4)), a_drop(w-b-(h-4)), a_drop(w-p-(a-3)), a_drop(b-n-(c-3)), a_drop(w-k-(h-3)), a_drop(b-b-(b-2)), a_drop(b-p-(d-2)), a_drop(b-q-(d-1)).

play_move_test_018Bi :- drop(C-R-(d-7)),
    a_pickup(d-7),
    a_drop(C-R-(e-8)).

test(test_018Bi, [
  setup(board_19_setup),
  cleanup(clear_board),
  setup(play_move_test_018Bi), set(Uci = ['d4d8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_20_setup :- clear_board; a_turn(w), a_drop(b-r-(f-8)), a_drop(b-k-(g-8)), a_drop(b-p-(a-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(b-q-(h-6)), a_drop(b-p-(e-5)), a_drop(w-p-(b-4)), a_drop(w-p-(c-4)), a_drop(b-b-(f-4)), a_drop(w-p-(a-3)), a_drop(w-q-(f-3)), a_drop(b-r-(d-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-b-(c-1)), a_drop(w-r-(e-1)), a_drop(w-r-(f-1)), a_drop(w-k-(h-1)).

play_move_test_01QLj :- drop(C-R-(c-1)),
    a_pickup(c-1),
    a_drop(C-R-(d-2)).

test(test_01QLj, [
  setup(board_20_setup),
  cleanup(clear_board),
  setup(play_move_test_01QLj), set(Uci = ['h6h2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_21_setup :- clear_board; a_turn(b), a_drop(b-r-(d-8)), a_drop(b-r-(g-8)), a_drop(b-k-(h-8)), a_drop(b-b-(b-7)), a_drop(b-p-(f-7)), a_drop(w-q-(h-7)), a_drop(b-p-(a-6)), a_drop(b-q-(c-6)), a_drop(w-p-(f-6)), a_drop(b-p-(g-6)), a_drop(b-p-(b-5)), a_drop(w-p-(g-4)), a_drop(w-p-(a-3)), a_drop(w-b-(d-3)), a_drop(w-r-(e-3)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-r-(f-2)), a_drop(w-p-(h-2)), a_drop(w-k-(g-1)).

play_move_test_00yxD :- drop(C-R-(h-8)),
    a_pickup(h-8),
    a_drop(C-R-(h-7)).

test(test_00yxD, [
  setup(board_21_setup),
  cleanup(clear_board),
  setup(play_move_test_00yxD), set(Uci = ['e3h3'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_22_setup :- clear_board; a_turn(w), a_drop(b-r-(a-8)), a_drop(b-b-(c-8)), a_drop(b-k-(e-8)), a_drop(b-r-(h-8)), a_drop(b-p-(b-7)), a_drop(b-p-(f-7)), a_drop(b-p-(a-6)), a_drop(b-p-(c-6)), a_drop(b-q-(d-6)), a_drop(b-p-(e-6)), a_drop(b-b-(c-5)), a_drop(w-p-(f-5)), a_drop(b-p-(g-5)), a_drop(b-p-(h-5)), a_drop(w-p-(e-4)), a_drop(b-n-(g-4)), a_drop(w-n-(c-3)), a_drop(w-b-(d-3)), a_drop(w-p-(h-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-p-(g-2)), a_drop(w-r-(a-1)), a_drop(w-q-(d-1)), a_drop(w-b-(e-1)), a_drop(w-r-(f-1)), a_drop(w-k-(h-1)).

play_move_test_00d8a :- drop(C-R-(d-1)),
    a_pickup(d-1),
    a_drop(C-R-(f-3)).

test(test_00d8a, [
  setup(board_22_setup),
  cleanup(clear_board),
  setup(play_move_test_00d8a), set(Uci = ['d6h2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_23_setup :- clear_board; a_turn(b), a_drop(b-r-(b-8)), a_drop(b-b-(c-8)), a_drop(b-r-(d-8)), a_drop(b-k-(f-8)), a_drop(b-p-(a-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(w-b-(c-6)), a_drop(b-p-(c-5)), a_drop(w-r-(d-5)), a_drop(w-n-(f-5)), a_drop(w-p-(g-5)), a_drop(w-p-(c-4)), a_drop(w-p-(a-3)), a_drop(w-p-(h-2)), a_drop(w-r-(e-1)), a_drop(w-k-(g-1)).

play_move_test_00Hxb :- drop(C-R-(d-8)),
    a_pickup(d-8),
    a_drop(C-R-(d-5)).

test(test_00Hxb, [
  setup(board_23_setup),
  cleanup(clear_board),
  setup(play_move_test_00Hxb), set(Uci = ['e1e8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_24_setup :- clear_board; a_turn(w), a_drop(b-k-(g-7)), a_drop(b-p-(h-7)), a_drop(b-b-(e-6)), a_drop(b-q-(g-6)), a_drop(b-p-(b-5)), a_drop(w-p-(b-4)), a_drop(b-p-(c-4)), a_drop(w-p-(d-4)), a_drop(b-p-(e-4)), a_drop(w-q-(h-4)), a_drop(w-p-(c-3)), a_drop(w-p-(e-3)), a_drop(b-r-(a-2)), a_drop(w-n-(d-2)), a_drop(w-p-(g-2)), a_drop(w-r-(f-1)), a_drop(w-k-(g-1)).

play_move_test_00Bm8 :- drop(C-R-(d-2)),
    a_pickup(d-2),
    a_drop(C-R-(e-4)).

test(test_00Bm8, [
  setup(board_24_setup),
  cleanup(clear_board),
  setup(play_move_test_00Bm8), set(Uci = ['g6g2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_25_setup :- clear_board; a_turn(w), a_drop(b-k-(e-8)), a_drop(b-n-(g-8)), a_drop(b-r-(h-8)), a_drop(b-r-(a-7)), a_drop(b-p-(c-7)), a_drop(b-p-(d-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-q-(h-7)), a_drop(b-p-(b-6)), a_drop(b-p-(e-6)), a_drop(b-b-(c-5)), a_drop(w-p-(c-4)), a_drop(w-p-(e-4)), a_drop(w-p-(f-4)), a_drop(b-p-(a-3)), a_drop(w-p-(b-3)), a_drop(w-n-(c-3)), a_drop(w-p-(d-3)), a_drop(b-n-(f-3)), a_drop(w-p-(g-3)), a_drop(w-p-(a-2)), a_drop(w-b-(d-2)), a_drop(w-n-(f-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-q-(d-1)), a_drop(w-r-(f-1)), a_drop(w-k-(g-1)), a_drop(w-b-(h-1)).

play_move_test_01InH :- drop(C-R-(d-1)),
    a_pickup(d-1),
    a_drop(C-R-(f-3)).

test(test_01InH, [
  setup(board_25_setup),
  cleanup(clear_board),
  setup(play_move_test_01InH), set(Uci = ['h7h2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_26_setup :- clear_board; a_turn(b), a_drop(b-r-(e-8)), a_drop(b-k-(g-8)), a_drop(w-r-(b-7)), a_drop(w-r-(g-7)), a_drop(b-p-(c-6)), a_drop(b-p-(a-5)), a_drop(w-k-(h-5)), a_drop(w-p-(a-4)), a_drop(w-p-(c-4)), a_drop(b-r-(e-4)), a_drop(b-p-(f-3)).

play_move_test_01M6C :- drop(C-R-(g-8)),
    a_pickup(g-8),
    a_drop(C-R-(f-8)).

test(test_01M6C, [
  setup(board_26_setup),
  cleanup(clear_board),
  setup(play_move_test_01M6C), set(Uci = ['b7f7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_27_setup :- clear_board; a_turn(b), a_drop(w-k-(e-3)), a_drop(b-k-(b-2)), a_drop(w-q-(f-2)), a_drop(b-q-(b-1)).

play_move_test_00T85 :- drop(C-R-(b-2)),
    a_pickup(b-2),
    a_drop(C-R-(c-1)).

test(test_00T85, [
  setup(board_27_setup),
  cleanup(clear_board),
  setup(play_move_test_00T85), set(Uci = ['f2d2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_28_setup :- clear_board; a_turn(b), a_drop(b-r-(a-8)), a_drop(b-b-(c-8)), a_drop(b-k-(e-8)), a_drop(b-n-(g-8)), a_drop(b-r-(h-8)), a_drop(b-p-(d-7)), a_drop(b-p-(f-7)), a_drop(w-q-(g-7)), a_drop(b-p-(h-7)), a_drop(b-p-(a-6)), a_drop(b-p-(b-6)), a_drop(b-p-(e-6)), a_drop(w-b-(h-6)), a_drop(b-b-(c-5)), a_drop(w-p-(e-4)), a_drop(w-n-(c-3)), a_drop(w-b-(d-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(b-q-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-k-(d-1)), a_drop(w-r-(h-1)).

play_move_test_00rzr :- drop(C-R-(c-5)),
    a_pickup(c-5),
    a_drop(C-R-(d-4)).

test(test_00rzr, [
  setup(board_28_setup),
  cleanup(clear_board),
  setup(play_move_test_00rzr), set(Uci = ['g7f8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_29_setup :- clear_board; a_turn(w), a_drop(b-k-(c-8)), a_drop(b-r-(d-8)), a_drop(b-n-(g-8)), a_drop(b-r-(h-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-n-(e-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(b-p-(c-6)), a_drop(b-p-(d-6)), a_drop(b-b-(c-5)), a_drop(w-p-(f-5)), a_drop(w-p-(g-5)), a_drop(w-n-(e-4)), a_drop(w-p-(f-4)), a_drop(b-q-(g-4)), a_drop(w-b-(d-3)), a_drop(w-r-(f-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-q-(d-1)), a_drop(w-b-(e-1)), a_drop(w-k-(h-1)).

play_move_test_00RoG :- drop(C-R-(h-2)),
    a_pickup(h-2),
    a_drop(C-R-(h-3)).

test(test_00RoG, [
  setup(board_29_setup),
  cleanup(clear_board),
  setup(play_move_test_00RoG), set(Uci = ['g4g1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_30_setup :- clear_board; a_turn(w), a_drop(b-r-(a-8)), a_drop(w-r-(d-8)), a_drop(b-r-(e-8)), a_drop(b-k-(f-8)), a_drop(b-q-(h-8)), a_drop(b-p-(a-7)), a_drop(w-n-(e-7)), a_drop(b-p-(f-7)), a_drop(b-p-(b-6)), a_drop(b-p-(c-6)), a_drop(w-p-(a-4)), a_drop(w-q-(c-4)), a_drop(w-p-(e-4)), a_drop(b-p-(g-4)), a_drop(w-p-(h-4)), a_drop(w-p-(c-3)), a_drop(w-p-(f-3)), a_drop(w-p-(b-2)), a_drop(b-b-(f-2)), a_drop(w-p-(g-2)), a_drop(w-r-(d-1)), a_drop(w-k-(h-1)).

play_move_test_00n6z :- drop(C-R-(d-8)),
    a_pickup(d-8),
    a_drop(C-R-(a-8)).

test(test_00n6z, [
  setup(board_30_setup),
  cleanup(clear_board),
  setup(play_move_test_00n6z), set(Uci = ['h8h4'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_31_setup :- clear_board; a_turn(b), a_drop(b-r-(a-8)), a_drop(b-b-(c-8)), a_drop(b-q-(d-8)), a_drop(b-r-(g-8)), a_drop(b-p-(b-7)), a_drop(b-p-(a-6)), a_drop(b-p-(e-6)), a_drop(b-b-(f-6)), a_drop(b-p-(c-5)), a_drop(w-n-(e-5)), a_drop(w-p-(d-4)), a_drop(w-q-(e-4)), a_drop(w-p-(h-4)), a_drop(w-p-(c-3)), a_drop(w-b-(d-3)), a_drop(b-k-(e-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(g-2)), a_drop(w-r-(f-1)), a_drop(w-k-(g-1)).

play_move_test_013ze :- drop(C-R-(e-3)),
    a_pickup(e-3),
    a_drop(C-R-(d-2)).

test(test_013ze, [
  setup(board_31_setup),
  cleanup(clear_board),
  setup(play_move_test_013ze), set(Uci = ['e5c4'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_32_setup :- clear_board; a_turn(b), a_drop(w-r-(d-8)), a_drop(b-p-(c-7)), a_drop(b-k-(e-7)), a_drop(b-p-(e-6)), a_drop(b-p-(g-6)), a_drop(b-p-(b-5)), a_drop(w-p-(e-5)), a_drop(b-p-(h-5)), a_drop(w-p-(b-4)), a_drop(b-r-(e-2)), a_drop(b-r-(f-2)), a_drop(w-r-(d-1)), a_drop(w-k-(g-1)).

play_move_test_01BI2 :- drop(C-R-(e-7)),
    a_pickup(e-7),
    a_drop(C-R-(f-7)).

test(test_01BI2, [
  setup(board_32_setup),
  cleanup(clear_board),
  setup(play_move_test_01BI2), set(Uci = ['d1d7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_33_setup :- clear_board; a_turn(w), a_drop(w-b-(a-8)), a_drop(w-q-(d-8)), a_drop(b-n-(e-8)), a_drop(b-k-(f-8)), a_drop(b-r-(h-8)), a_drop(b-p-(a-7)), a_drop(b-p-(c-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-q-(g-6)), a_drop(b-b-(c-5)), a_drop(w-b-(f-4)), a_drop(w-p-(c-3)), a_drop(w-n-(f-3)), a_drop(b-p-(g-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(e-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-r-(f-1)), a_drop(w-k-(h-1)).

play_move_test_01Xg6 :- drop(C-R-(b-2)),
    a_pickup(b-2),
    a_drop(C-R-(b-4)).

test(test_01Xg6, [
  setup(board_33_setup),
  cleanup(clear_board),
  setup(play_move_test_01Xg6), set(Uci = ['g3g2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_34_setup :- clear_board; a_turn(b), a_drop(w-r-(b-8)), a_drop(b-k-(d-7)), a_drop(w-q-(f-7)), a_drop(b-p-(a-6)), a_drop(b-b-(d-6)), a_drop(b-p-(f-6)), a_drop(b-r-(c-5)), a_drop(b-p-(e-5)), a_drop(b-n-(d-4)), a_drop(w-p-(a-3)), a_drop(w-p-(h-3)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(b-q-(e-1)), a_drop(w-b-(f-1)), a_drop(w-k-(g-1)).

play_move_test_00MYL :- drop(C-R-(d-7)),
    a_pickup(d-7),
    a_drop(C-R-(c-6)).

test(test_00MYL, [
  setup(board_34_setup),
  cleanup(clear_board),
  setup(play_move_test_00MYL), set(Uci = ['f7b7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_35_setup :- clear_board; a_turn(b), a_drop(b-r-(c-8)), a_drop(b-p-(a-7)), a_drop(b-b-(d-7)), a_drop(b-k-(e-7)), a_drop(w-q-(g-7)), a_drop(b-p-(b-6)), a_drop(b-p-(e-6)), a_drop(b-n-(d-5)), a_drop(w-n-(e-5)), a_drop(w-p-(d-4)), a_drop(w-p-(a-2)), a_drop(b-q-(b-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(e-1)), a_drop(w-k-(g-1)).

play_move_test_01Esj :- drop(C-R-(e-7)),
    a_pickup(e-7),
    a_drop(C-R-(d-6)).

test(test_01Esj, [
  setup(board_35_setup),
  cleanup(clear_board),
  setup(play_move_test_01Esj), set(Uci = ['g7d7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_36_setup :- clear_board; a_turn(b), a_drop(b-r-(b-8)), a_drop(b-r-(d-8)), a_drop(b-k-(h-8)), a_drop(b-p-(a-7)), a_drop(b-q-(d-7)), a_drop(w-r-(e-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(b-b-(a-6)), a_drop(b-p-(c-6)), a_drop(b-p-(c-5)), a_drop(w-q-(g-5)), a_drop(w-p-(c-3)), a_drop(w-p-(d-3)), a_drop(w-r-(e-3)), a_drop(w-p-(h-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-k-(g-1)).

play_move_test_00zDW :- drop(C-R-(d-7)),
    a_pickup(d-7),
    a_drop(C-R-(d-5)).

test(test_00zDW, [
  setup(board_36_setup),
  cleanup(clear_board),
  setup(play_move_test_00zDW), set(Uci = ['g5g7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_37_setup :- clear_board; a_turn(b), a_drop(b-q-(c-8)), a_drop(b-k-(g-8)), a_drop(b-b-(e-7)), a_drop(b-r-(f-7)), a_drop(b-p-(h-7)), a_drop(w-r-(g-6)), a_drop(w-q-(h-6)), a_drop(b-p-(b-5)), a_drop(b-n-(d-5)), a_drop(b-p-(g-5)), a_drop(w-p-(h-4)), a_drop(w-p-(b-3)), a_drop(w-p-(g-3)), a_drop(w-b-(b-2)), a_drop(w-p-(e-2)), a_drop(w-p-(f-2)), a_drop(w-k-(g-1)).

play_move_test_004zI :- drop(C-R-(h-7)),
    a_pickup(h-7),
    a_drop(C-R-(g-6)).

test(test_004zI, [
  setup(board_37_setup),
  cleanup(clear_board),
  setup(play_move_test_004zI), set(Uci = ['h6h8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_38_setup :- clear_board; a_turn(b), a_drop(b-r-(a-8)), a_drop(b-r-(e-8)), a_drop(b-k-(b-7)), a_drop(b-p-(c-7)), a_drop(w-r-(d-7)), a_drop(b-n-(e-7)), a_drop(b-q-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(b-p-(a-6)), a_drop(b-p-(f-6)), a_drop(w-q-(a-5)), a_drop(b-p-(b-5)), a_drop(w-p-(e-5)), a_drop(w-p-(h-5)), a_drop(w-n-(b-4)), a_drop(w-p-(e-3)), a_drop(b-b-(f-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-p-(g-2)), a_drop(w-k-(c-1)), a_drop(w-r-(f-1)).

play_move_test_00H1C :- drop(C-R-(e-7)),
    a_pickup(e-7),
    a_drop(C-R-(c-6)).

test(test_00H1C, [
  setup(board_38_setup),
  cleanup(clear_board),
  setup(play_move_test_00H1C), set(Uci = ['a5c7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_39_setup :- clear_board; a_turn(b), a_drop(b-r-(a-8)), a_drop(b-b-(c-8)), a_drop(b-k-(g-8)), a_drop(b-p-(b-7)), a_drop(b-q-(c-7)), a_drop(b-b-(g-7)), a_drop(b-p-(a-6)), a_drop(w-n-(d-6)), a_drop(w-q-(g-6)), a_drop(w-p-(c-5)), a_drop(w-b-(d-5)), a_drop(w-p-(b-4)), a_drop(b-p-(d-4)), a_drop(w-p-(d-3)), a_drop(b-p-(e-3)), a_drop(w-p-(a-2)), a_drop(b-r-(f-2)), a_drop(b-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-k-(g-1)), a_drop(w-r-(h-1)).

play_move_test_01Ptp :- drop(C-R-(g-8)),
    a_pickup(g-8),
    a_drop(C-R-(f-8)).

test(test_01Ptp, [
  setup(board_39_setup),
  cleanup(clear_board),
  setup(play_move_test_01Ptp), set(Uci = ['g6e8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_40_setup :- clear_board; a_turn(b), a_drop(b-r-(a-8)), a_drop(b-q-(d-8)), a_drop(b-k-(e-8)), a_drop(b-b-(f-8)), a_drop(b-n-(g-8)), a_drop(b-r-(h-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-p-(h-7)), a_drop(w-n-(e-5)), a_drop(b-b-(f-5)), a_drop(b-p-(d-4)), a_drop(w-q-(b-3)), a_drop(w-n-(c-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(e-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-k-(e-1)), a_drop(w-b-(f-1)), a_drop(w-r-(h-1)).

play_move_test_00Or5 :- drop(C-R-(d-4)),
    a_pickup(d-4),
    a_drop(C-R-(c-3)).

test(test_00Or5, [
  setup(board_40_setup),
  cleanup(clear_board),
  setup(play_move_test_00Or5), set(Uci = ['b3f7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_41_setup :- clear_board; a_turn(b), a_drop(b-r-(a-8)), a_drop(b-n-(b-8)), a_drop(b-k-(g-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-q-(d-7)), a_drop(b-r-(f-7)), a_drop(b-p-(c-6)), a_drop(b-p-(d-6)), a_drop(w-b-(g-6)), a_drop(w-p-(d-5)), a_drop(w-p-(c-4)), a_drop(w-b-(d-4)), a_drop(b-b-(g-4)), a_drop(w-p-(a-2)), a_drop(w-k-(d-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-r-(h-1)).

play_move_test_00Xfn :- drop(C-R-(c-6)),
    a_pickup(c-6),
    a_drop(C-R-(d-5)).

test(test_00Xfn, [
  setup(board_41_setup),
  cleanup(clear_board),
  setup(play_move_test_00Xfn), set(Uci = ['h1h8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_42_setup :- clear_board; a_turn(w), a_drop(w-q-(e-8)), a_drop(b-p-(g-7)), a_drop(b-k-(h-7)), a_drop(b-p-(a-6)), a_drop(b-p-(e-6)), a_drop(b-p-(h-6)), a_drop(b-p-(f-5)), a_drop(b-p-(b-4)), a_drop(w-p-(d-4)), a_drop(w-p-(g-4)), a_drop(b-q-(e-3)), a_drop(w-p-(h-3)), a_drop(w-b-(c-2)), a_drop(b-n-(e-2)), a_drop(w-b-(h-2)), a_drop(w-k-(h-1)).

play_move_test_00IPp :- drop(C-R-(g-4)),
    a_pickup(g-4),
    a_drop(C-R-(f-5)).

test(test_00IPp, [
  setup(board_42_setup),
  cleanup(clear_board),
  setup(play_move_test_00IPp), set(Uci = ['e3f3'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_43_setup :- clear_board; a_turn(w), a_drop(w-p-(a-5)), a_drop(b-p-(h-5)), a_drop(w-r-(c-3)), a_drop(b-n-(d-3)), a_drop(b-k-(e-3)), a_drop(w-n-(f-3)), a_drop(b-r-(a-2)), a_drop(w-k-(d-1)).

play_move_test_00VIe :- drop(C-R-(f-3)),
    a_pickup(f-3),
    a_drop(C-R-(e-1)).

test(test_00VIe, [
  setup(board_43_setup),
  cleanup(clear_board),
  setup(play_move_test_00VIe), set(Uci = ['a2d2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_44_setup :- clear_board; a_turn(w), a_drop(b-p-(d-7)), a_drop(b-k-(e-7)), a_drop(w-r-(a-6)), a_drop(w-r-(b-5)), a_drop(w-p-(e-5)), a_drop(b-p-(f-5)), a_drop(b-p-(h-5)), a_drop(w-p-(c-4)), a_drop(w-p-(d-4)), a_drop(b-n-(e-4)), a_drop(w-k-(f-4)), a_drop(b-r-(g-4)).

play_move_test_003IX :- drop(C-R-(f-4)),
    a_pickup(f-4),
    a_drop(C-R-(f-5)).

test(test_003IX, [
  setup(board_44_setup),
  cleanup(clear_board),
  setup(play_move_test_003IX), set(Uci = ['e4g3'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_45_setup :- clear_board; a_turn(w), a_drop(b-k-(g-8)), a_drop(b-p-(a-7)), a_drop(b-p-(c-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(b-6)), a_drop(b-b-(d-6)), a_drop(b-p-(h-6)), a_drop(w-p-(d-5)), a_drop(b-q-(e-5)), a_drop(w-p-(c-4)), a_drop(w-q-(f-3)), a_drop(w-p-(h-3)), a_drop(w-p-(a-2)), a_drop(w-r-(c-2)), a_drop(w-p-(g-2)), a_drop(w-k-(h-1)).

play_move_test_01WRz :- drop(C-R-(c-2)),
    a_pickup(c-2),
    a_drop(C-R-(f-2)).

test(test_01WRz, [
  setup(board_45_setup),
  cleanup(clear_board),
  setup(play_move_test_01WRz), set(Uci = ['e5h2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_46_setup :- clear_board; a_turn(b), a_drop(b-r-(b-8)), a_drop(b-k-(e-8)), a_drop(b-n-(g-8)), a_drop(b-r-(h-8)), a_drop(b-b-(d-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(w-q-(d-6)), a_drop(b-p-(e-6)), a_drop(w-b-(a-3)), a_drop(w-p-(e-3)), a_drop(w-p-(g-3)), a_drop(w-p-(f-2)), a_drop(w-p-(h-2)), a_drop(b-q-(b-1)), a_drop(w-r-(f-1)), a_drop(w-k-(g-1)).

play_move_test_01Vky :- drop(C-R-(b-1)),
    a_pickup(b-1),
    a_drop(C-R-(b-6)).

test(test_01Vky, [
  setup(board_46_setup),
  cleanup(clear_board),
  setup(play_move_test_01Vky), set(Uci = ['d6f8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_47_setup :- clear_board; a_turn(b), a_drop(b-k-(g-8)), a_drop(b-p-(c-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(b-p-(a-6)), a_drop(b-n-(b-6)), a_drop(b-p-(c-6)), a_drop(w-b-(a-5)), a_drop(w-p-(c-4)), a_drop(w-p-(g-4)), a_drop(w-p-(h-4)), a_drop(w-p-(b-3)), a_drop(b-b-(d-3)), a_drop(w-p-(e-3)), a_drop(w-p-(f-3)), a_drop(w-r-(g-3)), a_drop(b-r-(a-2)), a_drop(b-r-(h-2)), a_drop(w-r-(d-1)), a_drop(w-k-(g-1)).

play_move_test_008Nz :- drop(C-R-(d-3)),
    a_pickup(d-3),
    a_drop(C-R-(e-2)).

test(test_008Nz, [
  setup(board_47_setup),
  cleanup(clear_board),
  setup(play_move_test_008Nz), set(Uci = ['d1d8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_48_setup :- clear_board; a_turn(w), a_drop(b-k-(f-8)), a_drop(w-r-(a-7)), a_drop(b-p-(f-7)), a_drop(w-p-(a-6)), a_drop(b-p-(h-6)), a_drop(b-p-(f-5)), a_drop(w-n-(h-5)), a_drop(b-r-(a-4)), a_drop(b-p-(e-4)), a_drop(b-p-(c-3)), a_drop(w-p-(c-2)), a_drop(w-r-(e-2)), a_drop(w-p-(g-2)), a_drop(w-k-(c-1)).

play_move_test_00wVj :- drop(C-R-(h-5)),
    a_pickup(h-5),
    a_drop(C-R-(g-3)).

test(test_00wVj, [
  setup(board_48_setup),
  cleanup(clear_board),
  setup(play_move_test_00wVj), set(Uci = ['a4a1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_49_setup :- clear_board; a_turn(b), a_drop(b-r-(b-8)), a_drop(b-r-(f-8)), a_drop(b-k-(g-8)), a_drop(b-p-(c-7)), a_drop(w-n-(e-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-b-(h-7)), a_drop(b-p-(a-6)), a_drop(b-n-(d-6)), a_drop(b-q-(e-6)), a_drop(b-p-(b-5)), a_drop(b-p-(e-5)), a_drop(w-p-(g-5)), a_drop(b-p-(h-5)), a_drop(w-q-(e-4)), a_drop(b-n-(f-4)), a_drop(w-p-(h-4)), a_drop(w-p-(c-3)), a_drop(w-n-(e-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-b-(c-2)), a_drop(w-p-(f-2)), a_drop(w-k-(h-2)), a_drop(w-r-(d-1)), a_drop(w-r-(g-1)).

play_move_test_00GRa :- drop(C-R-(e-6)),
    a_pickup(e-6),
    a_drop(C-R-(e-7)).

test(test_00GRa, [
  setup(board_49_setup),
  cleanup(clear_board),
  setup(play_move_test_00GRa), set(Uci = ['e4h7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_50_setup :- clear_board; a_turn(w), a_drop(b-k-(g-8)), a_drop(b-p-(a-7)), a_drop(b-b-(b-7)), a_drop(b-r-(e-7)), a_drop(b-p-(g-7)), a_drop(w-n-(h-7)), a_drop(b-n-(b-6)), a_drop(w-b-(g-6)), a_drop(b-p-(h-6)), a_drop(b-p-(d-5)), a_drop(w-p-(b-4)), a_drop(b-p-(e-4)), a_drop(w-r-(f-4)), a_drop(w-p-(a-3)), a_drop(w-r-(d-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(b-r-(c-1)), a_drop(w-k-(g-1)).

play_move_test_009L0 :- drop(C-R-(d-2)),
    a_pickup(d-2),
    a_drop(C-R-(d-1)).

test(test_009L0, [
  setup(board_50_setup),
  cleanup(clear_board),
  setup(play_move_test_009L0), set(Uci = ['c1d1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_51_setup :- clear_board; a_turn(b), a_drop(b-r-(c-8)), a_drop(b-k-(g-8)), a_drop(b-p-(f-7)), a_drop(b-p-(h-7)), a_drop(b-p-(e-6)), a_drop(w-p-(f-6)), a_drop(b-p-(d-5)), a_drop(w-p-(h-5)), a_drop(w-p-(f-3)), a_drop(b-p-(a-2)), a_drop(b-b-(c-2)), a_drop(w-p-(g-2)), a_drop(w-r-(c-1)), a_drop(w-k-(g-1)).

play_move_test_00FHX :- drop(C-R-(c-2)),
    a_pickup(c-2),
    a_drop(C-R-(b-1)).

test(test_00FHX, [
  setup(board_51_setup),
  cleanup(clear_board),
  setup(play_move_test_00FHX), set(Uci = ['c1c8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_52_setup :- clear_board; a_turn(w), a_drop(b-r-(b-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-6)), a_drop(b-k-(f-6)), a_drop(w-k-(h-6)), a_drop(w-p-(a-5)), a_drop(b-p-(d-5)), a_drop(b-p-(g-5)), a_drop(w-r-(h-5)), a_drop(b-p-(c-4)), a_drop(w-p-(c-3)), a_drop(w-p-(g-3)), a_drop(w-p-(c-2)), a_drop(w-p-(g-2)), a_drop(w-r-(b-1)).

play_move_test_00rIF :- drop(C-R-(h-5)),
    a_pickup(h-5),
    a_drop(C-R-(g-5)).

test(test_00rIF, [
  setup(board_52_setup),
  cleanup(clear_board),
  setup(play_move_test_00rIF), set(Uci = ['b8h8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_53_setup :- clear_board; a_turn(b), a_drop(b-k-(d-8)), a_drop(w-r-(e-8)), a_drop(b-r-(f-8)), a_drop(b-n-(d-7)), a_drop(w-b-(f-7)), a_drop(b-p-(h-7)), a_drop(b-p-(c-6)), a_drop(w-p-(d-6)), a_drop(b-p-(a-5)), a_drop(b-n-(c-5)), a_drop(w-p-(a-4)), a_drop(b-p-(b-4)), a_drop(b-p-(c-4)), a_drop(w-p-(b-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(e-1)), a_drop(w-k-(g-1)).

play_move_test_00Ozz :- drop(C-R-(f-8)),
    a_pickup(f-8),
    a_drop(C-R-(e-8)).

test(test_00Ozz, [
  setup(board_53_setup),
  cleanup(clear_board),
  setup(play_move_test_00Ozz), set(Uci = ['e1e8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_54_setup :- clear_board; a_turn(b), a_drop(b-r-(f-8)), a_drop(b-k-(h-8)), a_drop(w-q-(a-7)), a_drop(b-p-(h-7)), a_drop(b-p-(b-6)), a_drop(b-b-(c-6)), a_drop(b-p-(g-6)), a_drop(b-q-(e-5)), a_drop(b-p-(e-4)), a_drop(w-b-(b-3)), a_drop(w-p-(c-3)), a_drop(b-p-(f-3)), a_drop(w-p-(h-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(g-2)), a_drop(w-r-(f-1)), a_drop(w-k-(g-1)).

play_move_test_00X1l :- drop(C-R-(f-3)),
    a_pickup(f-3),
    a_drop(C-R-(g-2)).

test(test_00X1l, [
  setup(board_54_setup),
  cleanup(clear_board),
  setup(play_move_test_00X1l), set(Uci = ['f1f8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_55_setup :- clear_board; a_turn(b), a_drop(b-r-(d-8)), a_drop(b-k-(e-8)), a_drop(b-r-(h-8)), a_drop(b-p-(a-7)), a_drop(b-n-(e-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(b-p-(b-6)), a_drop(b-p-(c-6)), a_drop(b-q-(a-5)), a_drop(w-b-(b-4)), a_drop(w-q-(e-4)), a_drop(w-r-(f-4)), a_drop(w-p-(g-4)), a_drop(w-p-(e-3)), a_drop(w-p-(h-3)), a_drop(w-p-(a-2)), a_drop(w-k-(e-1)), a_drop(w-r-(f-1)).

play_move_test_01HV2 :- drop(C-R-(a-5)),
    a_pickup(a-5),
    a_drop(C-R-(d-5)).

test(test_01HV2, [
  setup(board_55_setup),
  cleanup(clear_board),
  setup(play_move_test_01HV2), set(Uci = ['e4e7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_56_setup :- clear_board; a_turn(w), a_drop(b-r-(a-8)), a_drop(b-b-(c-8)), a_drop(b-k-(f-8)), a_drop(b-r-(h-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-p-(g-7)), a_drop(b-p-(c-6)), a_drop(b-q-(d-6)), a_drop(b-p-(g-6)), a_drop(b-p-(d-5)), a_drop(b-p-(d-4)), a_drop(w-n-(b-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-q-(d-1)), a_drop(w-r-(f-1)), a_drop(w-k-(g-1)).

play_move_test_00KYE :- drop(C-R-(d-1)),
    a_pickup(d-1),
    a_drop(C-R-(d-4)).

test(test_00KYE, [
  setup(board_56_setup),
  cleanup(clear_board),
  setup(play_move_test_00KYE), set(Uci = ['d6h2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_57_setup :- clear_board; a_turn(w), a_drop(b-r-(a-8)), a_drop(b-b-(d-8)), a_drop(b-r-(g-8)), a_drop(b-p-(a-7)), a_drop(w-p-(d-7)), a_drop(b-p-(f-7)), a_drop(b-p-(b-6)), a_drop(w-n-(c-6)), a_drop(w-q-(d-6)), a_drop(b-p-(f-6)), a_drop(b-k-(h-6)), a_drop(b-q-(g-5)), a_drop(b-p-(h-5)), a_drop(w-r-(f-4)), a_drop(w-p-(a-3)), a_drop(w-b-(d-3)), a_drop(w-p-(h-3)), a_drop(w-p-(b-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-k-(g-1)).

play_move_test_00k4u :- drop(C-R-(c-6)),
    a_pickup(c-6),
    a_drop(C-R-(d-8)).

test(test_00k4u, [
  setup(board_57_setup),
  cleanup(clear_board),
  setup(play_move_test_00k4u), set(Uci = ['g5g2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_58_setup :- clear_board; a_turn(w), a_drop(b-k-(g-8)), a_drop(b-p-(f-7)), a_drop(b-p-(b-6)), a_drop(b-p-(e-6)), a_drop(b-n-(f-6)), a_drop(b-p-(d-5)), a_drop(w-n-(e-5)), a_drop(w-p-(b-4)), a_drop(w-p-(d-4)), a_drop(w-p-(f-4)), a_drop(b-p-(g-4)), a_drop(w-p-(a-3)), a_drop(b-r-(e-3)), a_drop(w-p-(g-3)), a_drop(b-p-(h-3)), a_drop(b-q-(c-2)), a_drop(w-r-(e-2)), a_drop(w-p-(f-2)), a_drop(w-p-(h-2)), a_drop(w-k-(g-1)).

play_move_test_01DM2 :- drop(C-R-(e-2)),
    a_pickup(e-2),
    a_drop(C-R-(c-2)).

test(test_01DM2, [
  setup(board_58_setup),
  cleanup(clear_board),
  setup(play_move_test_01DM2), set(Uci = ['e3e1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_59_setup :- clear_board; a_turn(w), a_drop(b-k-(c-8)), a_drop(b-r-(d-8)), a_drop(b-p-(b-7)), a_drop(b-p-(f-7)), a_drop(w-p-(b-6)), a_drop(w-q-(a-5)), a_drop(b-p-(c-5)), a_drop(b-p-(d-5)), a_drop(w-p-(e-5)), a_drop(w-n-(d-4)), a_drop(b-n-(e-4)), a_drop(w-p-(f-4)), a_drop(b-q-(g-4)), a_drop(b-p-(h-4)), a_drop(w-p-(a-2)), a_drop(w-k-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(c-1)), a_drop(w-r-(e-1)).

play_move_test_00eC6 :- drop(C-R-(g-2)),
    a_pickup(g-2),
    a_drop(C-R-(h-1)).

test(test_00eC6, [
  setup(board_59_setup),
  cleanup(clear_board),
  setup(play_move_test_00eC6), set(Uci = ['e4f2'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_60_setup :- clear_board; a_turn(b), a_drop(b-k-(b-8)), a_drop(w-r-(e-8)), a_drop(b-r-(f-8)), a_drop(b-p-(a-7)), a_drop(b-p-(c-7)), a_drop(b-p-(d-7)), a_drop(b-p-(b-6)), a_drop(b-b-(d-6)), a_drop(w-q-(d-5)), a_drop(b-p-(f-5)), a_drop(w-p-(g-5)), a_drop(b-q-(a-4)), a_drop(w-p-(b-4)), a_drop(w-p-(f-4)), a_drop(w-p-(c-3)), a_drop(w-p-(h-3)), a_drop(w-k-(g-2)), a_drop(w-r-(e-1)).

play_move_test_00slf :- drop(C-R-(f-8)),
    a_pickup(f-8),
    a_drop(C-R-(e-8)).

test(test_00slf, [
  setup(board_60_setup),
  cleanup(clear_board),
  setup(play_move_test_00slf), set(Uci = ['e1e8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_61_setup :- clear_board; a_turn(b), a_drop(b-r-(d-8)), a_drop(b-k-(g-8)), a_drop(b-p-(a-7)), a_drop(w-q-(b-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(w-r-(e-6)), a_drop(b-n-(g-6)), a_drop(b-q-(c-5)), a_drop(w-p-(c-4)), a_drop(w-b-(c-3)), a_drop(w-p-(g-3)), a_drop(w-p-(a-2)), a_drop(w-p-(f-2)), a_drop(w-b-(g-2)), a_drop(w-p-(h-2)), a_drop(w-k-(g-1)).

play_move_test_00J7i :- drop(C-R-(f-7)),
    a_pickup(f-7),
    a_drop(C-R-(e-6)).

test(test_00J7i, [
  setup(board_61_setup),
  cleanup(clear_board),
  setup(play_move_test_00J7i), set(Uci = ['b7g7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_62_setup :- clear_board; a_turn(b), a_drop(w-q-(e-8)), a_drop(b-b-(f-8)), a_drop(b-r-(h-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(w-r-(e-7)), a_drop(b-k-(g-7)), a_drop(b-p-(c-6)), a_drop(b-q-(d-6)), a_drop(b-p-(f-6)), a_drop(b-p-(d-4)), a_drop(w-b-(b-3)), a_drop(w-p-(c-3)), a_drop(w-p-(h-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-b-(d-2)), a_drop(w-p-(g-2)), a_drop(w-k-(g-1)).

play_move_test_019tx :- drop(C-R-(f-8)),
    a_pickup(f-8),
    a_drop(C-R-(e-7)).

test(test_019tx, [
  setup(board_62_setup),
  cleanup(clear_board),
  setup(play_move_test_019tx), set(Uci = ['e8f7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_63_setup :- clear_board; a_turn(w), a_drop(b-r-(a-8)), a_drop(b-r-(h-8)), a_drop(b-p-(b-7)), a_drop(w-n-(c-7)), a_drop(b-k-(d-7)), a_drop(b-p-(f-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(b-n-(c-6)), a_drop(b-p-(d-6)), a_drop(b-b-(a-5)), a_drop(b-p-(e-5)), a_drop(w-p-(e-4)), a_drop(b-b-(g-4)), a_drop(w-n-(a-3)), a_drop(w-q-(c-3)), a_drop(w-p-(a-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-k-(e-1)), a_drop(w-b-(f-1)), a_drop(w-r-(h-1)).

play_move_test_001gi :- drop(C-R-(c-7)),
    a_pickup(c-7),
    a_drop(C-R-(a-8)).

test(test_001gi, [
  setup(board_63_setup),
  cleanup(clear_board),
  setup(play_move_test_001gi), set(Uci = ['a5c3'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_64_setup :- clear_board; a_turn(w), a_drop(b-r-(a-8)), a_drop(b-n-(b-8)), a_drop(b-b-(c-8)), a_drop(b-k-(e-8)), a_drop(b-n-(g-8)), a_drop(w-b-(h-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-p-(c-7)), a_drop(b-p-(f-7)), a_drop(b-p-(h-7)), a_drop(b-q-(h-4)), a_drop(w-p-(b-3)), a_drop(b-p-(f-3)), a_drop(b-b-(g-3)), a_drop(w-p-(a-2)), a_drop(w-p-(c-2)), a_drop(w-p-(d-2)), a_drop(w-p-(e-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-n-(b-1)), a_drop(w-q-(d-1)), a_drop(w-k-(e-1)), a_drop(w-b-(f-1)), a_drop(w-r-(h-1)).

play_move_test_019DY :- drop(C-R-(h-2)),
    a_pickup(h-2),
    a_drop(C-R-(g-3)).

test(test_019DY, [
  setup(board_64_setup),
  cleanup(clear_board),
  setup(play_move_test_019DY), set(Uci = ['h4g3'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_65_setup :- clear_board; a_turn(b), a_drop(b-k-(c-8)), a_drop(b-r-(d-8)), a_drop(b-p-(b-7)), a_drop(b-p-(g-7)), a_drop(b-p-(h-7)), a_drop(b-p-(a-6)), a_drop(b-p-(c-6)), a_drop(b-b-(e-6)), a_drop(w-q-(a-5)), a_drop(w-b-(e-5)), a_drop(b-q-(f-5)), a_drop(w-p-(e-3)), a_drop(w-b-(f-3)), a_drop(w-p-(b-2)), a_drop(w-p-(c-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-k-(b-1)).

play_move_test_00X2S :- drop(C-R-(g-7)),
    a_pickup(g-7),
    a_drop(C-R-(g-5)).

test(test_00X2S, [
  setup(board_65_setup),
  cleanup(clear_board),
  setup(play_move_test_00X2S), set(Uci = ['a5c7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_66_setup :- clear_board; a_turn(b), a_drop(b-r-(a-8)), a_drop(b-q-(d-8)), a_drop(b-r-(f-8)), a_drop(b-k-(g-8)), a_drop(b-p-(a-7)), a_drop(b-p-(b-7)), a_drop(b-b-(e-7)), a_drop(b-p-(f-7)), a_drop(b-b-(h-7)), a_drop(b-p-(c-6)), a_drop(b-p-(e-6)), a_drop(w-q-(h-6)), a_drop(b-n-(d-5)), a_drop(w-p-(e-5)), a_drop(w-n-(h-5)), a_drop(w-b-(c-4)), a_drop(w-p-(c-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-r-(e-1)), a_drop(w-k-(g-1)).

play_move_test_00sco :- drop(C-R-(e-7)),
    a_pickup(e-7),
    a_drop(C-R-(g-5)).

test(test_00sco, [
  setup(board_66_setup),
  cleanup(clear_board),
  setup(play_move_test_00sco), set(Uci = ['h6g7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_67_setup :- clear_board; a_turn(b), a_drop(b-r-(d-8)), a_drop(b-r-(e-8)), a_drop(b-b-(f-8)), a_drop(b-k-(g-8)), a_drop(b-p-(c-7)), a_drop(w-r-(g-7)), a_drop(b-p-(b-6)), a_drop(b-q-(e-6)), a_drop(w-q-(h-6)), a_drop(b-p-(d-5)), a_drop(w-p-(b-4)), a_drop(w-b-(c-3)), a_drop(w-p-(h-3)), a_drop(w-p-(g-2)), a_drop(w-r-(d-1)), a_drop(w-k-(g-1)).

play_move_test_00fDM :- drop(C-R-(f-8)),
    a_pickup(f-8),
    a_drop(C-R-(g-7)).

test(test_00fDM, [
  setup(board_67_setup),
  cleanup(clear_board),
  setup(play_move_test_00fDM), set(Uci = ['h6g7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_68_setup :- clear_board; a_turn(b), a_drop(w-k-(f-7)), a_drop(b-p-(h-7)), a_drop(b-p-(b-6)), a_drop(b-p-(g-6)), a_drop(b-k-(h-6)), a_drop(b-b-(d-4)), a_drop(b-r-(e-4)), a_drop(b-p-(f-4)), a_drop(w-r-(f-3)).

play_move_test_00OXc :- drop(C-R-(g-6)),
    a_pickup(g-6),
    a_drop(C-R-(g-5)).

test(test_00OXc, [
  setup(board_68_setup),
  cleanup(clear_board),
  setup(play_move_test_00OXc), set(Uci = ['f3h3'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_69_setup :- clear_board; a_turn(w), a_drop(b-r-(f-8)), a_drop(b-k-(g-8)), a_drop(b-p-(a-7)), a_drop(b-p-(c-7)), a_drop(b-p-(g-7)), a_drop(b-b-(a-6)), a_drop(b-p-(b-6)), a_drop(b-p-(e-6)), a_drop(b-p-(h-6)), a_drop(b-p-(f-5)), a_drop(b-q-(c-4)), a_drop(w-p-(d-4)), a_drop(w-b-(e-4)), a_drop(w-p-(c-3)), a_drop(w-q-(c-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-p-(h-2)), a_drop(w-r-(a-1)), a_drop(w-r-(f-1)), a_drop(w-k-(g-1)).

play_move_test_00g5t :- drop(C-R-(a-1)),
    a_pickup(a-1),
    a_drop(C-R-(a-4)).

test(test_00g5t, [
  setup(board_69_setup),
  cleanup(clear_board),
  setup(play_move_test_00g5t), set(Uci = ['c4f1'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_70_setup :- clear_board; a_turn(b), a_drop(b-r-(f-8)), a_drop(b-k-(h-8)), a_drop(b-r-(f-7)), a_drop(b-b-(c-6)), a_drop(w-r-(f-6)), a_drop(w-q-(g-6)), a_drop(b-p-(h-6)), a_drop(b-p-(b-5)), a_drop(b-p-(d-5)), a_drop(b-p-(g-5)), a_drop(b-q-(b-4)), a_drop(w-p-(g-4)), a_drop(w-b-(b-1)), a_drop(w-r-(f-1)), a_drop(w-k-(h-1)).

play_move_test_00HoG :- drop(C-R-(f-7)),
    a_pickup(f-7),
    a_drop(C-R-(f-6)).

test(test_00HoG, [
  setup(board_70_setup),
  cleanup(clear_board),
  setup(play_move_test_00HoG), set(Uci = ['g6h7'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_71_setup :- clear_board; a_turn(w), a_drop(b-k-(f-7)), a_drop(w-p-(b-6)), a_drop(w-r-(g-6)), a_drop(w-p-(g-5)), a_drop(w-k-(h-5)), a_drop(b-r-(b-4)).

play_move_test_00C7m :- drop(C-R-(h-5)),
    a_pickup(h-5),
    a_drop(C-R-(h-6)).

test(test_00C7m, [
  setup(board_71_setup),
  cleanup(clear_board),
  setup(play_move_test_00C7m), set(Uci = ['b4h4'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_72_setup :- clear_board; a_turn(b), a_drop(w-q-(a-7)), a_drop(b-b-(g-7)), a_drop(b-p-(a-6)), a_drop(b-k-(d-6)), a_drop(b-p-(e-6)), a_drop(b-p-(b-5)), a_drop(b-q-(e-5)), a_drop(b-p-(f-5)), a_drop(w-n-(g-5)), a_drop(w-p-(b-4)), a_drop(w-p-(a-3)), a_drop(b-n-(e-2)), a_drop(w-p-(f-2)), a_drop(w-p-(g-2)), a_drop(w-k-(f-1)).

play_move_test_00fXd :- drop(C-R-(d-6)),
    a_pickup(d-6),
    a_drop(C-R-(d-5)).

test(test_00fXd, [
  setup(board_72_setup),
  cleanup(clear_board),
  setup(play_move_test_00fXd), set(Uci = ['a7c5'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_73_setup :- clear_board; a_turn(b), a_drop(w-q-(a-8)), a_drop(b-k-(h-8)), a_drop(b-p-(h-7)), a_drop(b-p-(g-6)), a_drop(b-b-(d-4)), a_drop(b-q-(e-3)), a_drop(w-p-(a-2)), a_drop(w-p-(b-2)), a_drop(w-b-(h-2)), a_drop(b-r-(c-1)), a_drop(w-r-(f-1)), a_drop(w-k-(h-1)).

play_move_test_01MCO :- drop(C-R-(h-8)),
    a_pickup(h-8),
    a_drop(C-R-(g-7)).

test(test_01MCO, [
  setup(board_73_setup),
  cleanup(clear_board),
  setup(play_move_test_01MCO), set(Uci = ['a8f8'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


board_74_setup :- clear_board; a_turn(w), a_drop(b-r-(a-8)), a_drop(b-r-(g-8)), a_drop(b-k-(h-8)), a_drop(b-p-(b-7)), a_drop(b-p-(f-7)), a_drop(b-p-(h-7)), a_drop(b-b-(b-6)), a_drop(b-p-(d-6)), a_drop(b-p-(f-6)), a_drop(b-p-(a-5)), a_drop(w-p-(b-5)), a_drop(w-p-(d-5)), a_drop(b-q-(h-5)), a_drop(w-p-(a-4)), a_drop(w-p-(c-4)), a_drop(w-p-(e-4)), a_drop(b-n-(f-4)), a_drop(w-b-(d-3)), a_drop(w-n-(f-3)), a_drop(w-k-(g-3)), a_drop(w-p-(f-2)), a_drop(w-r-(a-1)), a_drop(w-q-(d-1)), a_drop(w-r-(h-1)).

play_move_test_01HoZ :- drop(C-R-(g-3)),
    a_pickup(g-3),
    a_drop(C-R-(f-4)).

test(test_01HoZ, [
  setup(board_74_setup),
  cleanup(clear_board),
  setup(play_move_test_01HoZ), set(Uci = ['h5g4'])
]) :- mate_in_1(X, Y), move_uci(X, Y, Uci).


  :- end_tests(chess).
    