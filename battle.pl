:- include('map.pl').
:- include('main.pl').

:- dynamic(battle/1).
:- dynamic(enemyTokemon/1).
:- dynamic(playerTokemon/1).
:- dynamic(battle/1).
:- dynamic(health/2).
:- dynamic(sAttack/2).
:- dynamic(gagalRun/1).
:- dynamic(picked/0).

enemyTokemon(tokeyub).
playerTokemon(tokedon).

fight :-
    assert(battle(_)).

rem :-
    retract(battle(_)).

run :-
    \+battle(_),
    write('You are not in the battle right now!'), 
    nl, !, fail.

run :-
    gagalRun(_),
    write('You cannot run!'),
    nl, !, fail.

run :-
    random(0,2, X),
    X == 1, 
    write('You sucessfully escaped the Tokemon!'),
    rem,
    !, fail.

run :-
    nl,
    battle(_),
    assert(gagalRun(_)),
    fight,
    write('You failed to run!\nChoose your Tokemon!'), 
    nl.

pick(_) :-
    picked,
    write('You have picked Tokemon!'), 
    !, fail.

pick(_) :-
    \+battle(_),
    write('You are not in the battle right now!'), 
    !, fail.

pick(PT) :-
    milik(PT, X),
    ( X =:= 0 ->
        write('You don’t have that Tokemon!'), 
        !, fail
        ;
        retract(playerTokemon(_)),
        assert(playerTokemon(PT)),
        write('You : “'), 
        write(PT), 
        write(' I choose you!”\n'),
        assert(picked),
        statPlayerEnemy,
        !, fail
    ).

attack :- 
    enemyTokemon(ET),
    playerTokemon(PT),
    damage(PT, Damage),
    modifier(ET, PT, Damage, X),
    NewDamage is X,
    serang(ET, NewDamage),
    health(ET, HP),
    nl,
    ( HP =< 0 ->
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
        write(ET), nl,
        statPlayerEnemy, 
        nl,
        enemyAttack, !, fail
    ).

enemyAttack :-
    enemyTokemon(ET),
    playerTokemon(PT),
    damage(ET, Damage),    
    modifier(PT, ET, Damage, X),
    NewDamage is X,
    serang(PT, NewDamage),
    write(ET),
    write(' attacks!\nIt dealt '), 
    write(Damage), 
    write(' damage to '),
    write(PT),
    !, fail.

serang(T, Damage) :-
    health(T, HP),
    NewHP is HP - Damage,
    retract(health(T, HP)),
    assert(health(T, NewHP)),
    health(T, HP2),
    write(HP2).

% TP yang diserang, TE yang menyerang, 
% Damage = damage awal, X = damage akhir
modifier(PT, ET, Damage, X) :- 
    type(ET, TE),
    type(PT, TP),
    ( TE == fire, TP == leaves ->
            X is Damage + 0.5*Damage 
        ; 
        TE == leaves, TP == water ->
            X is Damage + 0.5*Damage 
            ;    
            TE == water, TP == fire ->
                X is Damage + 0.5*Damage 
                ;
                TE == flying, TP == ground ->
                    X is Damage + 0.5*Damage 
                    ;
                    TE == ice, TP == water ->
                        X is Damage + 0.3*Damage 
                        ;
                        TE == ground, TP == leaves ->
                            X is Damage + 0.3*Damage 
                            ;
                            TP == fire, TP == leaves ->
                                X is Damage + 0.5*Damage 
                                ; 
                                TP == leaves, TP == water ->
                                    X is Damage + 0.5*Damage 
                                    ;    
                                    TP == water, TP == fire ->
                                        X is Damage + 0.5*Damage 
                                        ;
                                        TP == flying, TP == ground ->
                                            X is Damage + 0.5*Damage 
                                            ;
                                            TP == ice, TP == water ->
                                                X is Damage + 0.3*Damage 
                                                ;
                                                TP == ground, TP == leaves ->
                                                    X is Damage + 0.3*Damage 
                                                    ;
                                                    X is Damage 
    ).

capture :-
    \+battle(_),
    write('You are not in the battle right now!'), 
    !, fail.    

capture :- 
    enemyTokemon(ET),
    health(ET, HP),
    ( \+battle(_) ->
    write('You cannot capture!. ') ;
        ( HP =< 0 ->
            write('You cannot capture!. ')
            ;
            write(ET),
            write(' is captured!. ') 
        )
    ).

specialAttack :-
    \+battle(_),
    write('You are not in the battle right now!'), 
    !, fail.    

specialAttack :-
    enemyTokemon(ET),
    playerTokemon(PT),
    \+sAttack(PT, _),
    skill(PT, Damage),
    health(ET, HP),
    type(ET, TE),
    type(PT, TP),
    modifier(TE, TP, Damage, X),
    NewDamage is X,
    NewHP is HP - NewDamage,
    (NewHP =< 0 ->
        NewHP is 0
        ;
        NewHP is NewHP
    ),
    write(PT),
    write(' uses special attack!'),nl,nl,
    write('It was super effective!'),nl,
    write('You dealt '), 
    write(NewDamage), 
    write(' damage to '),
    write(ET),
    write(NewHP),
    retract(health(ET, HP)),
    assert(health(ET, NewHP)),
    assert(sAttack(PT, _)),
    % checkvictory,
    !, fail.

specialAttack :- 
    write('Special attacks can only be used once per battle!').

% checkvictory :-
%     enemyTokemon(ET),
%     health(ET, HPE),
%     (HPE =:= 0 -> 
%         write('')
%         )

statPlayerEnemy :-
    playerTokemon(PT),
    enemyTokemon(ET),
    stat(PT),
    stat(ET).