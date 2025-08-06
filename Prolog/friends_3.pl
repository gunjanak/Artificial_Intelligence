likes(john,pizza).
likes(mary,ice_cream).
likes(bob,pizza).
likes(alice,ice_cream).
likes(van,tea).
likes(amir,tea).
likes(wasim,pizza).

%Rule: Two people are friends if they like the same thing
friend(X,Y):-
    likes(X,Z),likes(Y,Z),X\=Y.