foo(special(S)) :- foo_special(S).

foo_special(a).


drop(w-k-(a-4)).
drop(b-b-(b-4)).


on(X) :- drop(_-_-X).

on(X) :- once(drop(_-_-X)).



