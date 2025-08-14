% Knowledge Base: Symptoms and Conditions

% Rule 1: Fever related conditions
has_condition(Patient, flu) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, cough),
    has_symptom(Patient, body_aches),
    has_symptom(Patient, fatigue).

has_condition(Patient, common_cold) :-
    has_symptom(Patient, runny_nose),
    has_symptom(Patient, sneezing),
    has_symptom(Patient, sore_throat),
    not(has_symptom(Patient, high_fever)).

has_condition(Patient, covid19) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, dry_cough),
    has_symptom(Patient, shortness_of_breath),
    has_symptom(Patient, loss_of_taste_or_smell).

% Rule 2: Digestive issues
has_condition(Patient, food_poisoning) :-
    has_symptom(Patient, nausea),
    has_symptom(Patient, vomiting),
    has_symptom(Patient, diarrhea),
    has_symptom(Patient, stomach_pain).

has_condition(Patient, acid_reflux) :-
    has_symptom(Patient, heartburn),
    has_symptom(Patient, regurgitation),
    has_symptom(Patient, bloating).

% Rule 3: Head-related conditions
has_condition(Patient, migraine) :-
    has_symptom(Patient, severe_headache),
    has_symptom(Patient, sensitivity_to_light),
    has_symptom(Patient, nausea).

has_condition(Patient, tension_headache) :-
    has_symptom(Patient, mild_to_moderate_headache),
    has_symptom(Patient, pressure_around_forehead).

% Recommendations for each condition
recommendation(flu, 'Rest, drink fluids, take fever reducers like acetaminophen').
recommendation(common_cold, 'Rest, stay hydrated, over-the-counter cold medicine').
recommendation(covid19, 'Self-isolate, get tested, monitor symptoms, seek emergency care if breathing difficulties').
recommendation(food_poisoning, 'Stay hydrated, eat bland foods, rest, see doctor if symptoms persist').
recommendation(acid_reflux, 'Avoid spicy/fatty foods, eat smaller meals, antacids may help').
recommendation(migraine, 'Rest in dark room, pain relievers, avoid triggers like stress').
recommendation(tension_headache, 'Over-the-counter pain relievers, stress reduction techniques').

% Emergency conditions (should see doctor immediately)
emergency_condition(Patient, heart_attack) :-
    has_symptom(Patient, chest_pain),
    has_symptom(Patient, shortness_of_breath),
    has_symptom(Patient, nausea),
    has_symptom(Patient, cold_sweat).

emergency_condition(Patient, stroke) :-
    (has_symptom(Patient, face_drooping) ;
     has_symptom(Patient, arm_weakness) ;
     has_symptom(Patient, speech_difficulty)).

% Consultation interface
diagnose(Patient) :-
    emergency_condition(Patient, Condition),
    !,
    write('EMERGENCY! You may be having: '), write(Condition), nl,
    write('Seek immediate medical attention! Call emergency services.'), nl.

diagnose(Patient) :-
    has_condition(Patient, Condition),
    recommendation(Condition, Advice),
    write('You may have: '), write(Condition), nl,
    write('Recommendation: '), write(Advice), nl.

diagnose(_) :-
    write('Unable to determine condition based on symptoms.'), nl,
    write('If symptoms persist or worsen, consult a healthcare professional.').

% Helper predicate to ask questions
ask_symptom(Patient, Symptom) :-
    write('Does '), write(Patient), write(' have '), write(Symptom), write('? (yes/no)'),
    read(Response),
    (Response = yes -> assert(has_symptom(Patient, Symptom)) ; true.

% Sample consultation
start_consultation :-
    write('Welcome to the Simple Medical Expert System'), nl,
    write('Please enter patient name: '),
    read(Patient),
    retractall(has_symptom(Patient, _)), % Clear previous symptoms
    % Ask about common symptoms
    ask_symptom(Patient, fever),
    ask_symptom(Patient, cough),
    ask_symptom(Patient, body_aches),
    ask_symptom(Patient, fatigue),
    ask_symptom(Patient, runny_nose),
    ask_symptom(Patient, sore_throat),
    ask_symptom(Patient, shortness_of_breath),
    ask_symptom(Patient, nausea),
    ask_symptom(Patient, vomiting),
    ask_symptom(Patient, diarrhea),
    ask_symptom(Patient, severe_headache),
    ask_symptom(Patient, chest_pain),
    % Perform diagnosis
    nl, diagnose(Patient).