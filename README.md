This is a tutorial that tells the machine about legal chess rules, and in the end, machine can generate legal chess moves for any chess position. In Prolog, the language of logic and reasoning.

Before we start, install Prolog, create a prolog script file like `chess.pl`, run Prolog, and load the file on the repl:

`?- consult(chess).`

<sub> `?-` is the prompt written on the repl, It means input `consult(chess).` on the repl </sub>
<sub> You need to run `consult(chess).` after each change made to the file to reload the changes. </sub>

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

So   ,   is `logical and` we can use to chain facts, as we wish.


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

<sub> You can skip the exercises, all definitions covered in this article are in the file [steps.pl](steps.pl). Look them up, or just use `?- consult(steps).` to import them. </sub>

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

`?- forward(a-4, a-8, Ls).` , we get `Ls = [5, 6, 7]` . Of course `upper` just works on ranks, but we need to map this list into `Ls = [a-5, a-6, a-7]`. 

There is a terse technique for mapping lists in Prolog, explained in this SO question, [https://stackoverflow.com/questions/67946585/using-maplist-with-a-lambda-that-does-not-have-a-body](https://stackoverflow.com/questions/67946585/using-maplist-with-a-lambda-that-does-not-have-a-body).

```pl
forward(X-Y,X-Y_, N) :- upper(Y-Y_, M), findall(X-Y__, member(Y__, M), N).
```

Note how `file(X).`, returns all definitions of `X` a thru h, one by one with a semicolon, we can use `findall` to get them all at once in a list like this:

`?- findall(X, file(X), Ls).` gives `Ls = [a, b, c, d, e, f, g, h]`.

`member(X, Ls).` returns true if X is an element of Ls. Like we can split all elements of a list as separate answers if we ask `?- member(X, [1,2,3]).` returns `X = 1 ; X = 2 ; X = 3`.

The last part of the definition uses this technique, and maps `[5, 6, 7]`, into `[a-5, a-6, a-7]`.


Note that `?- forward(a-8, a-4, Ls)` is false. It doesn't cover ranks going down, because we only used `upper`.
Also note that `?- forward(a-4, b-8, Ls)` is false. Because we only covered coordinates with the same file. (The same X is used in both places).

Now ask `?- forward(a-4, X, _).`, see it enumerates coordinates forward of a-4, no matter what's in between, `X = a-5 ; X = a-6 ; X = a-7 ; X = a-8`.

We can go straight forward or backward, or laterally left and right with what we have learned. They are called `forward(X, Y, Ls)`, `backward(X, Y, Ls)`, `king_side(X, Y, Ls)`, and `queen_side(X, Y, Ls)` and they are left as an exercise.


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

`?- fwd_que(e-3, X, _).` see it returns `X = d-4 ; X = c-5 ; X = b-6 ; X = a-7`.

We can also limit to coordinates that has three coordinates in between, that means 3 distance away:

`?- fwd_que(e-3, X, [_, _, _])` see it returns `X = a-7`.

Or we can use the `length(Ls, Length).`, which tells the length of a list.

`?- fwd_que(e-3, X, Ls), length(Ls, 3).` see it returns `X = a-7 , Ls = [d-4, c-5, b-6]`.

Note that it only returns coordinates in the forward queen side direction. Other diagonal directions are left as an exercise.


### Exercises for Section 4

Define these facts:

```pl
/*
?- backward(a-4, X, Ls).
X = a-3,
Ls = [] ;
X = a-2,
Ls = [a-3] ;
X = a-1,
Ls = [a-3, a-2] ;
*/
backward(X-Y,X-Y_, N) :- % Similar to forward in backwards direction
queen_side(X-Y,X_-Y, N) :- % Similar to forward in horizontal queen side direction. (queen side is h to a)
king_side(X-Y,X_-Y, N) :- % Similar to queen_side in king side direction (king side is a to h).

fwd_kng(X-Y, X_-Y_, N) :- % Similar to fwd_que in diagonal forward king side direction.
bck_que(X-Y, X_-Y_, N) :- % Similar to fwd_que in diagonal backward queen side direction.
bck_kng(X-Y, X_-Y_, N) :- % Similar to fwd_que in diagonal backward king side direction.

king_fwd(X,Y) :- % A king's movement in forward direction. King can move one square to it's neighbors in every direction. This is just the forward directions. For example 

`?- king_fwd(e-4, Y)` gives `Y = e-5 ; Y = d-5 ; Y = f-5`.

king_bck(X,Y) :- % A king's movement in backward direction. `king_bck(e-4, Y).` is `Y = e-3 ; Y = d-3 ; Y = f-3`.
king_lat(X,Y) :- % A king's movement in lateral direction both left and right. `king_lat(e-4, Y) is `Y = d-4 ; Y = f-4 `.

Use the facts we defined earlier, forward, backward, king_side, queen_side etc. Limit the length of the list to 0, to get just the neighbors. Use  ,  as a logical and operator to chain facts left and right.

% More challenges

fwd2_que(X-Y, X_-Y_) :- % Two forwards one queen side, one way of how a knight moves.
fwd2_kng(X-Y, X_-Y_) :- % Two forwards one king side.

fwd_que2(X-Y, X_-Y_) :- % fwd_que2(c-3, a-4).
fwd_kng2(X-Y, X_-Y_) :- % fwd_kng2(e-4, g-5).


bck2_que(X-Y, X_-Y_) :- % bck2_que(e-4, d-2).
bck2_kng(X-Y, X_-Y_) :- % bck2_kng(e-4, f-2).

bck_que2(X-Y, X_-Y_) :- % bck_que2(e-4, c-3).
bck_kng2(X-Y, X_-Y_) :- % bck_kng2(e-4, g-3).

fwd2(X, Y, N) :- % Two forwards like how a pawn moves from it's home rank. `?- fwd2(e-4, e-6, [e-5]).`
bck2(X, Y, N) :- % bck2(e-4, e-2, [e-3]).


knight(X, Y) :- % How a knight moves, chain the facts we defined earlier to cover all knight moves. Note that there is no list in between the moves because knight isn't obstructed by any in between coordinates, it jumps.

bishop(X, Y, N) :- % How a bishop moves, Goes from X to Y with N is a list that are in between the coordinates X and Y.
rook(X, Y, N) :- % rook(a-4, d-4, [b-4, c-4]).
king(X, Y) :- % king(a-4, Y) , gives `Y = a-5 ; Y = b-5 ; Y = a-3 ; Y = b-3 ; Y = b-4 ;` Note that the order might differ because how you define this.
queen(X, Y, N) :- % queen(a-4, d-4, [b-4, c-4]), queen(a-4, b-3, []).

```


### Section 5 - Drop some chess pieces on a chess board

Now we have the coordinates and directions, putting pieces on the board is easy as we wish:

```pl
boardR([w-k-(e-4), b-r-(c-5), w-p-(a-2)]).
```

`?- boardR(Ls).` , see it returns the pieces in a list.

The elements in the list has a structure as `Color-Role-(File-Rank)`. Note that we have three pairings with a dash.
The structure can also be seen as `Color-Role-Pos`, where Pos is another structure like `File-Rank`.

Order doesn't matter, but let's just see the first piece we can get from this list:

`?- boardR([P|_]).` , see it returns `H = w-k-(e-4).`. You can further disect the piece to its Color, Role, or Position.

Experiment like `?- boardR([Color-Role-Pos|_]).`. 

The built-in `member/2` function has a structure `member(X, Ls)`. It returns all members of list Ls as X. For example:

Try, `?- member(X, [1,2,3]).`, see it returns `X = 1 ; X = 2; X = 3 ;`.

We can ask for white pieces with this function:

`?- boardR(Ls), member(w-Color-Pos, Ls)` , see it returns `Color = k , Pos = e-4 ; Color = p , Pos = a-2.` meaning, white king at e4, and white pawn on a2. 

Note that it returns false for `?- boardR(Ls), member(w-X, Ls)` . So it doesn't unify X with Color and Pos as a pair.

How do we move pieces around. Simply, how do we pickup a piece from, and drop a piece to this board.

We use the list accumulation with recursion technique:

Base case: 
```pl
pickup(P, [P|B2], B2).
```

Given a piece P, and a board that has P as the first piece, and rest of the pieces as B2, we give B2 as output. Note that the last argument B2 is the output, that returns the board with the piece removed. Second argument is the original board that has the piece to be removed.

Recursive case:
```pl
pickup(P, [X|Rest], [X|Rest2]) :- pickup(P, Rest, Rest2).
```

This says if there is a piece X, that is not a P (implicitly true, because base case covers if X is a P), try pickup from the rest of the list.

Note that, we don't cover the empty list, which would eventually happen if it cannot find the piece in the board, in that case it returns false, because there is no rule that says it shall be true. So it will return false if we pickup a piece that doesn't exist, which is ok.


Let's use it, `?- boardR(R), pickup(w-k-(e-4), R, R2).` , see `R2 = [b-r-(c-5), w-p-(a-2)]`, and we try to remove a piece that doesn't exist, `?- boardR(R), pickup(w-r-(e-4), R, R2).` , see it returns false.

Base case for dropping a piece on the board is simple:

```pl
drop(P, [], [P]).
```

Dropping a piece on an empty list is the list with just the piece as the single element.

Recursive case:
```pl
drop(P, [X|Rest], [X|Ls]) :- \+ same_pos(P, X), drop(P, Rest, Ls).
```

`\+` is the `logical not` which generally should be used with caution, but it's ok for our use case.

There is also definition as, `same_pos(_-_-Pos, _-_-Pos).`. This would return true if two pieces has the same position. For example `?- same_pos(w-r-(a-4), b-k-(a-4)).` would return true.

So we recursively check all elements of the list, checking if it has the same position with every element, and only when all return false, then we drop the piece as we reach the base case.

If you are confused by this recursive technique, just remember they all have the same principle.

Now for fun, there is some utility to pretty print these boards on the repl. They are defined in [steps_util.pl](steps_util.pl) and used like this:

`?- boardR(R), print_board(R).` , see the board printed with ascii characters.

<sub> The definitions are taken from this [SO question](https://stackoverflow.com/questions/72550199/how-to-sort-and-print-coordinates-of-a-chess-board-with-pieces-in-them), use `?- consult(steps_util).` to make them available in the repl. </sub>


Drop some pieces and print the resulting board:

`?- boardR(R), drop(w-n-(a-8), R, R2), print_board(R2).` , see the white knight on a8 on the resulting board.

Note that you can chain multiple drops (also pickups) manually like `drop(P, R, R2), drop(P2, R2, R3), %...` , or if you have a list of pieces to drop, you can use `foldl` over that list and give the initial board, and let the `foldl` chain the boards implicitly. Like this:

`?- boardR(B), foldl(drop, [b-p-(a-7), b-p-(b-7), b-p-(c-7)], B, BOut), print_board(BOut).` , see the black pawns on the seventh rank.

Just a demonstration of `foldl` which will be used in later sections.


Finally there are some utility methods to read boards from a FEN notation, for example this is also defined in [steps_util.pl](steps_util.pl).

```pl
initial_fen("rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1").
```

And you can print the starting position like this:

`?- initial_fen(F), fen_board(F, T-B), print_board(B).` , `fen_board(F, T-B)` is a definition where F is a Fen string, T is whose turn it is `w` or `b` , B is the board, which we can print and use.
Note that we seperated T-B as Turn and Board, there is a definition to print that as a pair like:
`?- initial_fen(F), fen_board(F, T-B), print_tb(T-B).`, it will tell you whose turn it is as well as print the board.

Or you can just give it any other fen by replacing the variables.

There is also some other fens defined like:

```pl
kiwipete("r3k2r/p1ppqpb1/bn2pnp1/3PN3/1p2P3/2N2Q1p/PPPBBPPP/R3K2R w KQkq - ").
pos3("8/2p5/3p4/KP5r/1R3p1k/8/4P1P1/8 w - - ").
```

Which are famous positions for perft tests.

### Section 6 - A Mouse Slip, A Better Approach

<sub> Previous Section (Section 5) became obsolete, but still contains useful information, so it's not removed. Though we will use different file for code [steps2.pl](steps2.pl), and move the previous information there, with a slight change. This chapter explains the reason behind the change, and how to move forward. </sub>

Let's recap, we had `file(X)` , `rank(Y).` structures, `pos(X).` coordinates, and some facts about how the pieces move. Let's define a few more facts, this is useful later for enumeration.

<sub> These new definitions are available in [steps2.pl](steps2.pl) </sub>

```pl
color(w).
color(b).

role(k).
role(q).
role(b).
role(n).
role(r).
role(p).
```

See `?- color(X).` enumerates  w  and  b , namely white and black. And `?- role(X).`  enumerates different pieces like king, queen, bishop, knight, rook and pawn.


A Piece is a color and a role.

```pl
piece(Color-Role) :- color(Color), role(Role). 
```

Similar to a position, except we pair color and a role. See we can enumerate all the pieces `?- piece(X).` , or `?- piece(w-X).` only white pieces.

If we pair a Piece with a Position, we call that a Piese (informally).

```pl
piese(Piece-Pos) :- piece(Piece), pos(Pos).
```

`?- piese(X).` see it enumerates all pieces in every square like `w-k-(a-1) , w-k-(a-2) , ` , etc. Or we can ask specifically for white pawns on second rank: `?- piese(w-p-(X-2)).` , it just enumerates all the files, not very useful; yet.

Now this isn't all different, we put pieses on a list and call that a board, like;

`this_board_is_mine([w-k-(a-4), b-r-(a-5)]).`

Or use the utilities defined in [steps_util.pl](steps_util.pl) to read a board from a fen,

`?- initial_fen(F), fen_board(F, T-B), print_board(B).`

<sub>Note that `fen_board` returns a `T-B` pair, B is the board we can print, T is a color `w or b` whose turn it is. There is `?- initial_fen(F), fen_board(F, TB), print_tb(TB).` which prints T-B pair directly. </sub>


Now take a quick look at this SO question [https://stackoverflow.com/questions/27358456/prolog-union-for-a-u-b-u-c/27358600#27358600](https://stackoverflow.com/questions/27358456/prolog-union-for-a-u-b-u-c/27358600#27358600), and especially the given answer, to get an idea of what we are doing.

<sub> I don't understand the whole gist of the question or the answer, but I have a rogue idea of it has something to do with words like, monotonic pure logical code, removing duplicate enumerations, etc. </sub>


`member(X, Ls).` used to give an element `X` of the list `Ls`. But it has some drawbacks, so we will use a different function to test if a piese is on the board.

```pl
on(B, P) :- memberd_t(P, B, true).
```

The SO question answers, how to derive this function, also there is a library for that, we will just use that library, its contents are [here (reif.pl)](https://www.swi-prolog.org/pack/file_details/reif/prolog/reif.pl?show=src). so add this at the top of the file:

```pl
:- use_module(library(reif)).
```

<sub> You also need to install this package on Prolog repl, to make it available. Try `?- pack_install(reif).` . That should install the package `reif`. </sub>


Observe how `memberd_t` behaves:

```repl
?- memberd_t(1, [1,2,3], true).
true.

?- memberd_t(1, [1,2,3], false).
false.

?- memberd_t(4, [1,2,3], false).
true.
```

Now we can ask if a piese is on the board:

```
?- initial_fen(F), fen_board(F, T-B), on(B, w-k-(e-1)).
```

Or list all the white pieses on the board:

```
?- initial_fen(F), fen_board(F, T-B), on(B, w-Role-Pos).
```

Before we move on, let's take a quick exercise, and talk about coordinates. We want to order coordinates from a-1 to h-8, from left to right, and down to up. See if you can come up with this definition below:

```pl
bigger(X-Y, X_-Y_) :- upper(Y-Y_, _); Y=Y_, righter(X-X_, _).
```

It tells, in order for a coordinate to be bigger than the other, it's rank needs to be upper, or if their rank is equal, it's file needs to be righter. Pretty logical. Let's expand this definition to pieses too:

```pl
bigger_piese(_-_-P, _-_-P2) :- bigger(P, P2).
```

Let's do some test: 
```
?- bigger_piese(w-k-(a-3), b-r-(h-8)).
true .

?- bigger_piese(w-k-(a-3), b-r-(a-1)).
false.

```

<sub> The word position, although refers to the arrangement of pieces on a chess board, we use it as a simple coordinate like a-4 is a position. </sub>

We can easily test if a position is occupied on the board with this:

```pl
on_pos(true, B, Pos) :- on(B, _-_-Pos).
```

To test this `?- on_pos(true, B, a-4)`. 

Testing if a position is not occupied takes a bit more work, that has something to do with this SO question [https://stackoverflow.com/questions/53531536/insert-into-open-ended-list-without-binding-its-tail-variable](https://stackoverflow.com/questions/53531536/insert-into-open-ended-list-without-binding-its-tail-variable).:

```pl
on_pos(false, B, Pos) :- in(w-r-Pos, B, _).
```

A quick detour, `in(Piece, Board, Board2).` , drops a `Piece` to the `Board`, and returns `Board2` . It is adapted from the SO question, and put in [steps2.pl](steps2.pl). You can test it on an empty board like:

```
?- in(b-r-(h-8), [], B2), in(w-k-(a-4), B2, B3), in(b-r-(c-3), B3, B4).
B2 = [b-r-(h-8)],
B3 = [w-k-(a-4), b-r-(h-8)],
B4 = [b-r-(c-3), w-k-(a-4), b-r-(h-8)] ;
```

Note that it inserts the pieces in order according to `bigger_piese(X, Y).` we defined earlier, it fails if it cannot insert a piece at a position, because the position is occupied.

And back to `on_pos(false, B, Pos).` we try to insert a white rook at Pos, and if we can, then that means Pos is empty.

Let's enumerate all the empty positions on the initial starting position:

`?- initial_fen(F), fen_board(F, T-B), on_pos(false, B, X).`, Note the `X = _-3 ; X = _-4 ; X = _-5 ; X = _-6 . ` results, `_` meaning all files on ranks 3, 4, 5, and 6.


Finally, let's tell how to remove a piese from a board:

```

```


`?- initial_fen(F), fen_board(F, T-B), out(w-r-(a-1), B, B2), print_board(B2).`, see the white rook on a-1 is removed. Note that we need to tell the piece on a position or a `piese` to remove from the board.

Or remove all the white pieces from the board:
`?- initial_fen(F), fen_board(F, T-B), out(w-_-_, B, B2), print_board(B2).`, see it doesn't remove all of them at once, but one by one on each iteration. You can think about how to remove them at once for fun.


### Exercises for Section 6


