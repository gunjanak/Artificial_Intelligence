parent(john,alice).
parent(mary,alice).
parent(john,wasim).
parent(mary,wasim).
parent(ali,aslam).
male(ali).
male(aslam).
male(wasim).
male(john).
female(mary).
female(alice).

%Rules
%A person is a father if they are a parent and male
father(X,Y):- parent(X,Y),male(X).
%A person is a mother if they are a parent and female
mother(X,Y):- parent(X,Y),female(X).
%Two people are siblings if they have the same parent
sibling(X,Y):- parent(Z,X),parent(Z,Y),X\=Y.