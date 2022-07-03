list([]) --> [].
list([L|Ls]) --> [L], list(Ls).


state(S), [state(S)] --> [state(S)].
state(S, S2), [state(S2)] --> [state(S)], { S2 = S + 1 }.

keep_state(S, I), [state(S)] --> [state(S)], [I].
end_state(S) --> [state(S)], [].

count_dcg(S, S) -->
  end_state(S).

/*
count_dcg(S, S2) -->
  state(S, S1),
  keep_state(S1, _),
  count_dcg(S1, S2).
*/


count_dcg(S, S1) -->
  keep_state(S, C1),
  lookahead(C1),
  count_dcg(S, S1).

count_dcg(S, S2) -->
  state(S, S1),
  keep_state(S1, C1),
  lookahead(C2),
  {
    dif(C1, C2)
  },
  count_dcg(S1, S2).


count_dcg(S, S1) -->
  state(S, S1),
  keep_state(S1, _C),
  list(R),
  { R = [state(_)]}.

lookahead(C), [S, C] --> [S, C].


count(L, S) :-
  phrase(count_dcg(0, S), [state(0)|L]).
