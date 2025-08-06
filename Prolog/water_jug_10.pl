% File: water_jug.pl
% Capacities of the jugs
capacity(a, 4).  % Jug A holds 4 gallons
capacity(b, 3).  % Jug B holds 3 gallons

% Valid moves (state transitions)
% Fill Jug A
move(state(A, B), state(NewA, B), fill_a) :- 
    capacity(a, MaxA), A < MaxA, NewA = MaxA.

% Fill Jug B
move(state(A, B), state(A, NewB), fill_b) :- 
    capacity(b, MaxB), B < MaxB, NewB = MaxB.

% Empty Jug A
move(state(A, B), state(0, B), empty_a) :- 
    A > 0.

% Empty Jug B
move(state(A, B), state(A, 0), empty_b) :- 
    B > 0.

% Pour from Jug A to Jug B
move(state(A, B), state(NewA, NewB), pour_a_to_b) :- 
    capacity(b, MaxB), B < MaxB, A > 0,
    SpaceB is MaxB - B,  % Space available in B
    Pour is min(A, SpaceB),  % Amount to pour
    NewA is A - Pour,
    NewB is B + Pour.

% Pour from Jug B to Jug A
move(state(A, B), state(NewA, NewB), pour_b_to_a) :- 
    capacity(a, MaxA), A < MaxA, B > 0,
    SpaceA is MaxA - A,  % Space available in A
    Pour is min(B, SpaceA),  % Amount to pour
    NewA is A + Pour,
    NewB is B - Pour.

% Path to goal state using depth-first search
% Base case: Current state is the goal
path(State, State, [], _).

% Recursive case: Find a path through valid moves
path(State, Goal, [Move|Moves], Visited) :-
    move(State, NextState, Move),  % Find a valid move
    \+ member(NextState, Visited),  % Avoid cycles
    path(NextState, Goal, Moves, [NextState|Visited]).

% Solve: Find a path from (0,0) to (2,Y)
solve(Path) :-
    path(state(0, 0), state(2, _), Path, [state(0, 0)]).

% Pretty-print the solution
print_solution :-
    solve(Path),
    write('Solution path:'), nl,
    print_path(Path, 1).

print_path([], _).
print_path([Move|Moves], Step) :-
    write('Step '), write(Step), write(': '), write(Move), nl,
    NextStep is Step + 1,
    print_path(Moves, NextStep).

% Query to run
:- print_solution, halt.