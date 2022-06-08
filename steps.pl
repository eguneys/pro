% Prolog 


% Section 1
file(a).
file(b).
file(c).
file(d).
file(e).
file(f).
file(g).
file(h).


% Section 2

right(a-b).
right(b-c).
right(c-d).
right(d-e).
right(e-f).
right(f-g).
right(g-h).


left(X-Y) :- right(Y-X).


% Section 3

right2(X-Y) :- right(X-Z), right(Z-Y).

righter(X-Y, []) :- right(X-Y).
righter(X-Y, [Z|Rest]) :- right(X-Z), righter(Z-Y, Rest).
