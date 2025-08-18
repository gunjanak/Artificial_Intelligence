sentence --> noun_phrase,verb_phrase.
sentence --> yes_no_question.
sentence --> wh_question.

yes_no_question --> aux_verb,noun_phrase,verb_phrase.
wh_question --> wh_word,aux_verb,noun_phrase,verb.

noun_phrase --> [the],noun.
verb_phrase --> verb,noun_phrase.
verb_phrase --> verb.

noun --> [cat];[dog].
verb --> [chase];[see].
aux_verb --> [did];[does];[do].
wh_word --> [what];[who];[where].