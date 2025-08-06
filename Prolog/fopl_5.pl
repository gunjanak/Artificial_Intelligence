%all mammals are warm-blooded
%all cats are mammals
%prove: all cats are warm-blooded

warm_blooded(X) :- mammal(X).
mammal(X) :- cat(X).

%fact: Assume a is a cat
cat(a).