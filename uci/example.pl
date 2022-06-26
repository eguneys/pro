move(Move) --> ["move", Move], { format("__ ~w", Move) }.
moves(Moves) --> ["moves"], Moves, { length(Moves, 2), format("__ ~w", Moves) }.


% this works as expected.
hello :- split_string("move ten", " ", "", Ls), phrase(move(_), Ls).

% this throws arguments error, I want to capture the list [one, two, three].
hello2 :- split_string("moves one two three", " ", "", Ls), phrase(moves(_), Ls).


% finally I want this to work without split_string debacle.
hello3 :- phrase(move(_), "move ten").


% note that it also has to work from strings read from stdin.

hello4 :- 
read_line_to_string(user_input, L), 
phrase(move(_), L).
