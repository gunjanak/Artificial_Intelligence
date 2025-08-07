% Rule 1: Every engineer is a problem solver
problem_solver(X) :-
    engineer(X).

% Rule 2: Every software developer is an engineer
engineer(X) :-
    software_developer(X).

% Rule 3: Every problem solver is an analytical thinker
analytical_thinker(X) :-
    problem_solver(X).

% Rule 4: Everyone who drinks coffee is good at something
good_at(X, Y) :-
    drinks_coffee(X),
    skill(X, Y).  % Assume a known skill for coffee drinkers

% --- Facts ---

% Define people
software_developer(alice).

% Behavior
drinks_coffee(alice).

% Define skill known for coffee drinkers
skill(alice, debugging).



