% Symptoms for different illnesses
disease(cold) :-
    has_symptom(cough),
    has_symptom(sneezing),
    has_symptom(sore_throat).

disease(flu) :-
    has_symptom(fever),
    has_symptom(body_ache),
    has_symptom(cough),
    has_symptom(fatigue).

disease(allergy) :-
    has_symptom(sneezing),
    has_symptom(runny_nose),
    has_symptom(itchy_eyes).

% Default if no match
disease(unknown) :-
    \+ disease(cold),
    \+ disease(flu),
    \+ disease(allergy).

