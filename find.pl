% Prolog

board([w-q-(g-5), w-r-(g-1), b-k-(h-7)]).


queen_checks(Q, C, Board) :- mobile(w-q-Q, Board, QMobile), mobile(w-q-C, QMobile, QQMobile), mated(QQMobile, b-k-_).




mobile(w-q-Q, B1, B3) :- pickup(w-q-Q, B1, B2), queen_route(Q, Q2, Is), route_pass(Is, B2, []), drop(w-q-Q2, B2, B3).


pickup(P, B1, B2) :- select(P, B1, B2).


on(Is, _-_-X) :- member(X, Is).
route_pass(Is, B2, M) :- include(on(Is), B2, M).
