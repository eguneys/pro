backrank_check_interpose(TB, TB2) -->
  [O-D], {
    opposite(TB, TB2)
  }.
















split(Ls, N, A, B) :- append(A, B, Ls), length(A, N).

consume([], []).
consume(ODs, Lss):-
  findall(ODs2-ODsRest, (split(ODs, N, ODs2, ODsRest), \+ N = 0), ODss),
  maplist(consume_one, ODss, Lss),
  length(Lss, C),
  \+ C = 0.


consume_one(ODs2-ODsRest, [Lss|LsRest]) :-
  consumes(Ls),
  findall([X, ODs2], (member(F, Ls), call(F, X, ODs2)), Lss),
  maplist(consume_ds(ODsRest), Lss, LssOd),
  maplist(consume, LssOd, LsRest).


consume_ds(ODsRest, _, ODsRest).

consumes([one, two]).

one(1, [a]).
two(2, [b]).

