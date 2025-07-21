% Facts
parent(john, mary).
parent(john, mike).
parent(mary, susan).
parent(mike, james).
female(mary).
female(susan).
male(john).
male(mike).
male(james).

% Rules
father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
