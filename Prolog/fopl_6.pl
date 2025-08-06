% Rule 1: All mammals are warm-blooded
warm_blooded(X) :- mammal(X).

% Rule 2: All cats are mammals
mammal(X) :- cat(X).

% Rule 3: All warm-blooded animals have high metabolism
high_metabolism(X) :- warm_blooded(X).

% Fact: a is a cat
cat(a).

% Query: Is a high metabolism?
