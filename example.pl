% Prolog

pretty_row(Ls) :- maplist(format, Ls).

uci(w-k, 'K').
uci(b-q, 'q').

ls([w-k, b-q]).

ucis([], []).
ucis([P|Rest], [Z|ZRest]) :- uci(P, Z), ucis(Rest, ZRest).


