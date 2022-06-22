:- use_module(library(http/http_unix_daemon)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).

:- use_module(pro2).

:- http_handler(/, home, []).
:- http_handler('/hello', hello, [method(post)]).

hello_json(Id-Rest, Res) :-
  term_string(Rest, R),
  Res=res{id: Id, rest: R}.

home(_Request) :-
  findall(Id-Res, hello(Id, Res), Ls),
  maplist(hello_json, Ls, Js),
  Dict=hello{js: Js},
  reply_json_dict(Dict).


hello(Request) :-
  http_parameters(Request,
  [ id(Id, [string, optional(true)]) ]),
  findall(Id-Res, hello(Id, Res), Ls),
  maplist(hello_json, Ls, Js),
  Dict=hello{js: Js},
  reply_json_dict(Dict).
