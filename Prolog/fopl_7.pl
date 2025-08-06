% Rule 1: Scientists who study animals are curious
curious(X) :-
    scientist(X),
    studies(X, Y),
    animal(Y).

% Rule 2: Curious and intelligent people are good researchers
good_researcher(X) :-
    curious(X),
    intelligent(X).

% Rule 3: All cats are animals
animal(Y) :- cat(Y).

% Facts
scientist(john).
studies(john, felix).
cat(felix).
intelligent(john).

% Query: Is John a good researcher?
