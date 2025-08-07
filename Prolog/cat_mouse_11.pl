% Rule 1: Every cat chases some mouse
chases(X, Y) :-
    cat(X),
    mouse(Y),
    related(X, Y).  % Assume a known relation between cat and mouse

% Rule 2: Every mouse that squeaks is fast
fast(Y) :-
    mouse(Y),
    squeaks(Y).

% Rule 3: No cat catches a fast mouse
catches(X, Y) :-
    cat(X),
    mouse(Y),
    chases(X, Y),
    \+ fast(Y).  % Only catches if the mouse is not fast

% Rule 4: Cats that chase but don’t catch are hungry
hungry(X) :-
    cat(X),
    chases(X, Y),
    \+ catches(X, Y).

% --- Facts ---

% Define some cats and mice
cat(tom).
cat(jerry).  % For more complexity
mouse(mickey).
mouse(minnie).

% Mouse behavior
squeaks(mickey).
squeaks(minnie).  % All mice squeak

% Define known chase relations
related(tom, mickey).
related(jerry, minnie).
