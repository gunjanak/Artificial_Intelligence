% Rule: Sushma likes all practical courses
likes(sushma, X) :- practical(X).

% Rule: Any subject anyone practices is practical
practical(X) :- practices(_, X).

% Given facts
practical(ai).
practical(dbms).
practices(ruby, php).
practices(rita, X) :- practices(ruby, X).

