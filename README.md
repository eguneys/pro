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


We know all `file`s, we know files `a thru g` has a `right`, note that `h` doesn't have a `right` and `a` doesn't have a `left`. Just ask:

`?- right(h-X).` and `?- left(a-X).`, see both returns false.


Think about `right2(a-c).`, c is 2 right to a, as if there is a B where `right(a-B)` and `right(B-c)`, which is true for `B = b`.

```pl
right2(X-Y) :- right(X-Z), right(Z-Y).
```

So  ,  is `logical and` we can use to chain facts, as we wish.


`?- right2(X-Y)`, see similar answers to `right` except for 2 to the right.


Let's ask what are the files between `a` and `h`.

We know, there are no files, between files that has an immediate right. For example `a` and `b`.

```
righter(X-Y, []) :- right(X-Y).
```

Ask for `?- righter(a-b, X).`, see it returns `X = []`. files between a and b is an empty list `[]`. 

Ask for `?- righter(X-Y, []).`, meaning files that has no other files between them, see it returns results like `X = a, Y = b`, and other pairs that has a `right(X-Y).` structure.


Now there is a recursive technique to accumulate elements to a list like this:

```
righter(X-Y, [Z|Rest]) :- right(X-Z), righter(Z-Y, Rest).
```

There is a file `Z`, and `other files` called `Rest` between files `X` and `Y`, when,
there is a `right(X-Z)`, and a `righter(Z-Y, Rest)`.

In other words `Z` and `Rest` are the files between `X` and `Y`, when `Z` is right to `X`, and `Rest` is files between `Z` and `Y`. Some terse explained logic, it works though.

<sub> [Z|Rest] is a list destructured into a head and a tail </sub>


Let's ask something easy:

`?- righter(X-Y, [b]).` , see a-c is the pair that has only b in between.
`?- righter(X-Y, [b,c]).` , see a-d is the pair that has b, and c in between.


`?- righter(X-Y, [_, _, _, _, _]).`, see a-g and b-h are the pairs that has five files between them.

Something regular:

`?- righter(a-h, Ls).`, see b, c, d, e, f, g are the files between a and h.

### Exercises for Section 1-3


Define these facts:

```pl

left2(X-Y) :- % c's 2 left is a, for all files that has 2 left. For example `left2(c-a).` is true.
lefter(X-Y, Ls) :- % righter we defined above returns files between from right to left. For example `righter(c-a, Ls).` is false. This will tell files from left to right, so `lefter(h-a, [g, f, e, d, c, b]).` is true.
rank(1). % Tell ranks 1 thru 8
up(1-2). % Similar to right or left but for ranks
down(X-Y) :- % Define in terms of up

up2(X-Y) :- % Similar to right2 for ranks
down2(X-Y) :- % Similar to left2 for ranks

upper(X-Y, Ls) :- % Similar to righter for ranks, note that you need the recursive techniqe for accumulating a list, that is a base case and a recursive definition.

downer(X-Y, Ls) :- % Similar to lefter for ranks.

```

That's quite a lot to cover, but that's most of what prolog is all about.

### Section 4 - A file and a rank is a chess coordinate

Let's express a chess coordinate like `a-4`, `b-5`, `h-8`. It has the `pos(X-Y).` structure where X is a file and Y is a rank. 

```pl
pos(F-R) :- file(F), rank(R).
```

`?- pos(X).` see it enumerates all the coordinates.

Let's enumerate coordinates on the a file only.

`?- pos(X), X=a-_.` see it enumerates only `a-1` thru `a-8`. 


Now let's tell from a coordinate `a-4` to `a-8`, there are coordinates `a-5` `a-6` `a-7`.

Think about how we use it:

`?- forward(a-4, a-8, [a-5, a-6, a-7]).`, we want this to be true.

Our first attempt is easy:

```pl
forward(X-Y,X-Y_, N) :- upper(Y-Y_, N).
```

The structure looks like, file stays the same, thus same variable X is used, but the rank changes, that has the ranks in between 4 and 8. As we have a structure to check for that `upper`.

If we ask for our query

`?- forward(a-4, a-8, Ls).` , we get `Ls = [5, 6, 7]` . Of course upper just works on ranks, but we need to map this list into `Ls = [a-5, a-6, a-7]`. 

There is a terse technique for mapping lists in Prolog, explained in this SO question, [https://stackoverflow.com/questions/67946585/using-maplist-with-a-lambda-that-does-not-have-a-body](https://stackoverflow.com/questions/67946585/using-maplist-with-a-lambda-that-does-not-have-a-body).

```pl
forward(X-Y,X-Y_, N) :- upper(Y-Y_, M), findall(X-Y__, member(Y__, M), N).
```

The last part of the definition uses this technique, and maps `[5, 6, 7]`, into `[a-5, a-6, a-7]`.


Note that `?- forward(a-8, a-4, Ls)` is false. It doesn't cover ranks going down, because we only used `upper`.
Also note that `?- forward(a-4, b-8, Ls)` is false. Because we only covered coordinates with the same file. (The same X is used in both places).

Now ask `?- forward(a-4, X, _).`, see it enumerates coordinates forward of a-4, no matter what's in between, `X = a-5 ; X = a-6 ; X = a-7 ; X = a-8`.

We can go straight forward or backward, or laterally left and right with what we have learned. They are called `forward(X, Y, Ls)`, `backward(X, Y, Ls)`, `king_side(X, Y, Ls)`, and `queen_side(X, Y, Ls)` and left as an exercise.


Let's think how we can find coordinates in diagonal direction. For example: 

`fwd_que(e-4, d-5, []).` or `fwd_que(e-4, a-8, [d-5, c-6, b-7]).`. Note that this direction is forward and queen side only. Doesn't cover other diagonal directions.

What is the pattern for this structure, both file and rank changes but the change occurs in same amount of steps. Like `e` goes `d, c, b`, while `4` goes `5, 6, 7`. That is `queen_side` for the file and `forward` for the rank.

Let's see the intermediate step of how that looks:

```pl
fwd_que_intermediate(X-Y, X_-Y_, MY, MX) :- upper(Y-Y_, MY), lefter(X-X_, MX).
```

`?- fwd_que_intermediate(e-4, a-8, MX, MY).`, see it gives two lists `MX = [5, 6, 7]`, and `MY = [d, c, b]` . 

Before we had a single list we could map, this time we want to zip two lists, that is pair the elements that are at the same index.

Use the recursive technique to accumulate lists to achieve this.

Here are the base case and recursive definition.

```pl
zip_pos([], [], []).
zip_pos([X|Xs], [Y|Ys], [X-Y|Rest]) :- zip_pos(Xs, Ys, Rest).
```

Try this out with different lists:

`?- zip_pos([a, b, c], [1, 2, 3], Ls).` see `Ls = [a-1, b-2, c-3].`

Note that lists with different length returns false.

Now we can zip the two lists and return as result, note how the naming of variables have changed.

```pl
fwd_que(X-Y, X_-Y_, N) :- upper(Y-Y_, MY), lefter(X-X_, MX), zip_pos(MX, MY, N).
```

Let's ask for diagonal directions for a coordinate:

`fwd_que(e-3, X, _).` see it returns `X = d-4 ; X = c-5 ; X = b-6 ; X = a-7`.

Note that it only returns coordinates in the forward queen side direction. Other diagonal directions are left as an exercise.



