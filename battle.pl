:- include('map.pl').
:- include('main.pl').

:- dynamic(battle/1).
:- dynamic(enemyTokemon/1).
:- dynamic(playerTokemon/1).
:- dynamic(battle/1).
:- dynamic(health/2).
:- dynamic(sAttack/2).

enemyTokemon(tokeyub).
playerTokemon(tokedon).

run :-
    random(0,2, X),
    X == 1, 
    write('You sucessfully escaped the Tokemon!'), 
    !, fail.

run :-
    nl,
    assert(battle(_)),
    write('You failed to run!\nChoose your Tokemon!'), 
    nl.

attack :- 
    enemyTokemon(ET),
    playerTokemon(PT),
    health(ET, HP),
    damage(PT, Damage),
    type(ET, TE),
    type(PT, TP),
    modifier(TE, TP, Damage, X),
    NewDamage is X,
    NewHP is HP - NewDamage,
    retract(health(ET, HP)),
    assert(health(ET, NewHP)),
    health(ET, HP2),
    nl,
    ( NewHP =< 0 ->
        write(ET),
        write(' faints! Do you want to capture ') ,
        write(ET),
        write(' capture/0 to capture '), 
        write(ET),
        write(', otherwise move away.')
        ;
        write('You dealt '), 
        write(Damage), 
        write(' damage to '),
        write(ET),
        write(HP2), 
        nl,
        enemyAttack, !, fail
    ).


enemyAttack :-
    enemyTokemon(ET),
    playerTokemon(PT),
    health(PT, HP),
    damage(ET, Damage),
    type(ET, TE),
    type(PT, TP),
    modifier(TP, TE, Damage, X),
    NewDamage is X,
    NewHP is HP - NewDamage,
    write(ET),
    write(' attacks!\nIt dealt '), 
    write(Damage), 
    write(' damage to '),
    write(PT),
    retract(health(PT, HP)),
    assert(health(PT, NewHP)),
    health(PT, HP2),
    write(HP2), !, fail.

% TP yang diserang, TE yang menyerang, 
% Damage awal, X damage akhir
modifier(TP, TE, Damage, X) :- 
    ( TE == fire, TP == leaves ->
            X is Damage + 0.5*Damage 
        ; 
        TE == leaves, TP == water ->
            X is Damage + 0.5*Damage 
            ;    
            TE == water, TP == fire ->
                X is Damage + 0.5*Damage 
                ;
                    TE == leaves, TP == fire ->
                        X is Damage - 0.5*Damage 
                    ; 
                    TE == water, TP == leaves ->
                        X is Damage - 0.5*Damage 
                        ;    
                        TE == fire, TP == water ->
                            X is Damage - 0.5*Damage 
                            ;
                            X is Damage
    ).

capture :- 
    enemyTokemon(ET),
    health(ET, HP),
    ( \+battle(_) ->
    write('You cannot capture!. ') ;
        ( HP =< 0 ->
            write(ET),
            write('You cannot capture!. ')
            ;
            write('Captured!. ') 
        )
    ).

specialAttack :-
    \+sAttack(PT, _),
    enemyTokemon(ET),
    playerTokemon(PT),
    skill(PT, Damage),
    health(ET, HP),
    type(ET, TE),
    type(PT, TP),
    modifier(TE, TP, Damage, X),
    NewDamage is X,
    NewHP is HP - NewDamage,
    write(PT),
    write('uses leaf blade!'),nl,
    write('It was super effective!'),nl,
    write('You dealt '), 
    write(NewDamage), 
    write(' damage to '),
    write(ET),
    write(NewHP),
    retract(health(ET, HP)),
    assert(health(ET, NewHP)),
    assert(sAttack(PT, _)).

specialAttack :- 
    write('Special attacks can only be used once per battle!').