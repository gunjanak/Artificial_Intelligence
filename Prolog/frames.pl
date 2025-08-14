% ---------- frame.pl ----------
% Simple frame/class system in Prolog
% - class(Class, Super).           % class relationship (single inheritance)
% - slot(Class, Slot, Default).   % slot declared on a class with a default value
% - instance(Instance, Class).    % instance belongs to a class
% - value(Instance, Slot, Val).   % dynamic per-instance slot value (overrides class defaults)

:- dynamic class/2, slot/3, instance/2, value/3.

% ---------- examples / helpers ----------
% root of class hierarchy
class(object, none).

% Add a subclass
add_class(Sub, Super) :-
    \+ class(Sub, _),
    assertz(class(Sub, Super)).

% Add a slot (with default) to a class
add_slot(Class, Slot, Default) :-
    assertz(slot(Class, Slot, Default)).

% Create an instance of a class
create_instance(Name, Class) :-
    class(Class, _),        % class must exist
    assertz(instance(Name, Class)).

% Set / update an instance slot (overrides class defaults)
set_slot(Inst, Slot, Val) :-
    ( retract(value(Inst, Slot, _)) -> true ; true ),
    assertz(value(Inst, Slot, Val)).

% Remove instance-specific slot value (revert to class/default resolution)
clear_slot(Inst, Slot) :-
    retractall(value(Inst, Slot, _)).

% ---------- slot lookup with inheritance ----------
% get_slot(+InstanceOrClass, +Slot, -Value)
% If first arg is an instance, check instance-specific value then class hierarchy.
% If first arg is a class, search class and superclasses for slot.
get_slot(Inst, Slot, Val) :-
    instance(Inst, Class),            % it's an instance
    ( value(Inst, Slot, Val) -> true  % instance override
    ; class_slot_lookup(Class, Slot, Val)
    ).

% class_slot_lookup(+Class, +Slot, -Value)
% Walks up inheritance chain until finds slot(Class, Slot, Default)
class_slot_lookup(Class, Slot, Val) :-
    class_slot_lookup_helper(Class, Slot, Val).

class_slot_lookup_helper(none, _, _) :- 
    fail.
class_slot_lookup_helper(Class, Slot, Val) :-
    slot(Class, Slot, Val), !.
class_slot_lookup_helper(Class, Slot, Val) :-
    class(Class, Super),
    class_slot_lookup_helper(Super, Slot, Val).

% ---------- list all slots visible for a class (including inherited) ----------
% class_slots(+Class, -ListOfSlot-DefaultPairs)
class_slots(Class, Slots) :-
    class_slots_helper(Class, [], Pairs),
    % remove duplicates keeping nearest (child) values first
    foldl(keep_first, Pairs, [], RevFiltered),
    reverse(RevFiltered, Slots).

class_slots_helper(none, Acc, Acc).
class_slots_helper(Class, Acc, Out) :-
    class(Class, Super),
    findall(S-D, slot(Class, S, D), PairsHere),
    append(PairsHere, Acc, NewAcc),
    class_slots_helper(Super, NewAcc, Out).

keep_first(S-D, Acc, Acc) :- memberchk(S-_, Acc), !.
keep_first(S-D, Acc, [S-D|Acc]).

% ---------- example data ----------
% define some classes and slots as demo
init_demo :-
    retractall(class(_, _)),
    retractall(slot(_, _, _)),
    retractall(instance(_, _)),
    retractall(value(_, _, _)),

    % base
    assertz(class(object, none)),
    add_class(vehicle, object),
    add_slot(vehicle, color, unknown),
    add_slot(vehicle, wheels, 4),

    add_class(car, vehicle),
    add_slot(car, doors, 4),
    add_slot(car, make, unspecified),

    add_class(bike, vehicle),
    add_slot(bike, wheels, 2),    % override default for bikes

    % instances
    create_instance(mycar, car),
    create_instance(bobs_bike, bike),

    % instance-specific values
    set_slot(mycar, color, red),
    set_slot(mycar, make, toyota),
    set_slot(bobs_bike, color, blue).
% -------------------------------
