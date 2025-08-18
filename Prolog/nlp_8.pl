%A sentence consists of a noun phrase followed by a verb phrase.
sentence --> noun_phrase, verb_phrase.

%A noun phrase is the word "the" followed by a noun.
noun_phrase --> [the], noun.

%A verb phrase is a verb followed by a noun phrase.
verb_phrase --> verb, noun_phrase.

%A noun can be either "cat" or "dog".
noun --> [cat]; [dog].

%A verb can be either "chased" or "saw".
verb --> [chased]; [saw].

%How to make questions structure
%Did the cat chase the dog?