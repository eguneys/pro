This is a tutorial that tells the machine about legal chess rules, and in the end, machine can generate legal chess moves for any chess position. In Prolog, the language of logic and reasoning.

Before we start, install Prolog, create a prolog script file like `chess.pl`, run Prolog, and load the file on the repl:

`?- consult(chess).`

<sub> `?-` is the prompt written on the repl, It means input `consult(chess).` on the repl </sub>

### Section 1 - Tell the chess files a thru h

Let's start by enumerating files.

```pl
% Prolog a comment line start with % sign
file(a).
file(b).
file(c).
% ...
```

`file(a).` has a structure. If you write this into the script file and save. You can ask in the repl about this structure.


`?- file(a).`, see it returns `true.`.

See the output `false.` for `?- file(bananas).`.

Moreover you can enumerate the `file(X).` structure, like X is unknown (because it's capitalized).

`?- file(X).`, see it tells you `X = a`.

When there are multiple definitions of the same structure, you can enumerate them.

Define all chess files, a, b, c, d, e, f, g, and h, with the `file(X).` structure as shown in the beginning.

Ask for `?- file(X).`, see it tells you `X = a`, press  ;  (logical or), to see the next answer, press until all files are listed and prompt is restored. While enumerating, press  Enter  to break and skip the rest of the answers and restore the prompt.



### Section 2 - Give a sense of direction to files


Let's order these files next to each other, for example:

```pl
right(a-b).
right(b-c).
right(c-d).
% ...
```

We can pair words like `a-b`, and give it a structure like `right(a-b).`. We can ask questions like this:

`?- right(X).`, see it returns pairs similar to chess files.

`?- right(X-b).`, see it returns `X = a`. So pairs can be asked separately or as a single unit like above.

`?- right(c-RightOfC).`, the variable name is not important except it shall be capitalized.

`?- right(X-Y).`, it enumerates all pairs split up to X and Y variables.


Think about `left(b-a).` which is similar to `right(a-b).` except  a  and  b  are swapped.

```pl
left(X-Y) :- right(Y-X).
```

Instead of writing `left(c-b). left(d-c). %...`, let's say, if there is a `left(X-Y).`, it is true that there is a `right(Y-X).`. Seems logical, which is all we are doing.


If you only care about one side of the pair, you can ask like `?- left(X-_)` , _  is an unknown but it's value is omitted, not written as output.



### Section 3 - Go from a to h by passing b, c, d, e, f, and g


We know all files, we know files a thru g has a right, point out that h doesn't have a right and a doesn't have a left. Just ask:

`?- right(h-X).` and `?- left(a-X).`



