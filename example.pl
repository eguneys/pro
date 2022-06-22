% Prolog
:- use_module(library(reif)).


file(a).
file(b).


rank(1).
rank(2).



pos(X-Y) :- file(X), rank(Y).


solve(Cs, TB, TB2) --> seq_any(Cs, TB, TB2).

seq_any([C|Cs], TB, TB3) --> combination(C, TB, TB2), seq_any(Cs, TB2, TB3).
seq_any([], TB, TB) --> [].

combination(one_any([A]), D, D) --> [A], {
  dif(D, x)
}.

combination(defense([A]), D, D2) --> [A], {
  D=x,
  A=d,
  D2=stop
}.

combination(precount([A]), D, D2) --> [A], {
 D = x,
 A = b,
 D2= go 
}.

combination(countdown([A, B, C]), D, D) --> [A, B, C], {
  D = go,
  A = 3,
  B = 2,
  C = 1
}.


/*

?- length(Ls, 4), phrase(solve(Cs, x, Tb2), Ls).
Ls = [d, _A, _B, _C],
Cs = [defense([d]), one_any([_A]), one_any([_B]), one_any([_C])],
Tb2 = stop ;
Ls = [b, _A, _B, _C],
Cs = [precount([b]), one_any([_A]), one_any([_B]), one_any([_C])],
Tb2 = go ;
Ls = [b, 3, 2, 1],
Cs = [precount([b]), countdown([3, 2, 1])],
Tb2 = go ;
false.

 */
