% ----------- Knowledge Base ------------
% is_a(Child, Parent) means "Child is a Parent"
is_a(robin, bird).
is_a(bird, animal).
is_a(fish, animal).
is_a(salmon, fish).

% has(Subject, Property) means "Subject has Property"
has(bird, wings).
has(animal, cells).
has(fish, fins).
has(salmon, pink_flesh).

% can(Subject, Ability) means "Subject can Ability"
can(bird, fly).
can(fish, swim).
can(animal, breathe).

% ----------- Inheritance Rules ------------
% Property/Ability inheritance using graph traversal

% Direct property/ability
inherits_property(X, Property) :- has(X, Property).
inherits_ability(X, Ability)  :- can(X, Ability).

% Inherited property (transitive via is_a)
inherits_property(X, Property) :-
    is_a(X, Parent),
    inherits_property(Parent, Property).

inherits_ability(X, Ability) :-
    is_a(X, Parent),
    inherits_ability(Parent, Ability).

% ----------- Queries for network navigation ------------
% Check if X is_a Y (transitive)
is_a_transitive(X, Y) :-
    is_a(X, Y).
is_a_transitive(X, Y) :-
    is_a(X, Z),
    is_a_transitive(Z, Y).
