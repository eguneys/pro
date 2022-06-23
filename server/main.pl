:- use_module(library(http/http_unix_daemon)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_cors)).

:- use_module(pro2).

:- set_setting(http:cors, [*]).

:- http_handler(/, home, []).
:- http_handler('/hello', hello, [method(post)]).

hello_json(Id-TB-Rest, Res) :-
  term_string(TB, TbR),
  term_string(Rest, R),
  Res=res{id: Id, rest: R, tb: TbR}.

home(_Request) :-
  findall(Id-Res, hello(Id, Res), Ls),
  maplist(hello_json, Ls, Js),
  Dict=hello{js: Js},
  reply_json_dict(Dict).


hello(Request) :-
  cors_enable,
  http_parameters(Request,
  [ id(Id, [string, optional(true)]) ]),
  findall(Id-TB-Res, hello_tb(Id, TB, Res), Ls),
  maplist(hello_json, Ls, Js),
  Dict=hello{js: Js},
  reply_json_dict(Dict).
