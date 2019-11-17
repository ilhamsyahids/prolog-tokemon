:- include('main.pl').

:- dynamic(battle/1).
:- dynamic(enemyTokemon/1).
:- dynamic(playerTokemonBattle/1).
:- dynamic(battle/1).
:- dynamic(health/2).
:- dynamic(sAttack/1).
:- dynamic(gagalRun/1).
:- dynamic(picked/0).

enemyTokemon(tokeyub).
playerTokemonBattle(tokedon).

battle(1).
fight :-
    assert(battle(_)).

rem :-
    retractall(picked(_)),
    retractall(gagalRun(_)),
    retractall(sAttack(_)),
    retractall(battle(_)),
    retractall(enemyTokemon(_)),
    retractall(playerTokemonBattle(_)).

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
    write('You failed to run!\nChoose your Tokemon!\n\nAvailable Tokemons: '), 
    inventory(X),
    write(X),
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
        retract(playerTokemonBattle(_)),
        assert(playerTokemonBattle(PT)),
        write('You : “'), 
        write(PT), 
        write(' I choose you!”\n'),
        assert(picked),
        statPlayerEnemy,
        !, fail
    ).

attack :- 
    enemyTokemon(ET),
    playerTokemonBattle(PT),
    damage(PT, Damage),
    modifier(ET, PT, Damage, X),
    NewDamage is X,
    serang(ET, NewDamage),
    nl,
    (\+checkvictory ->
        write('You dealt '),
        write(NewDamage),
        write(' damage to '),
        write(ET), nl,
        statPlayerEnemy,
        nl,
        enemyAttack, 
        !, fail
    ).

enemyAttack :-
    enemyTokemon(ET),
    playerTokemonBattle(PT),
    damage(ET, Damage),    
    modifier(PT, ET, Damage, X),
    NewDamage is X,
    serang(PT, NewDamage),
    write(ET),
    write(' attacks!\nIt dealt '), 
    write(NewDamage), 
    write(' damage to '),
    write(PT), nl,
    statPlayerEnemy,
    !, fail.

serang(T, Damage) :-
    health(T, HP),
    NewHP is HP - Damage,
    (NewHP =< 0 ->
        HPP is 0
        ;
        HPP is NewHP
    ),
    retract(health(T, HP)),
    assert(health(T, HPP)).

% PT tokemon yang diserang, ET tokemon yang menyerang, 
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
                            TP == fire, TE == leaves ->
                                X is Damage - 0.5*Damage 
                                ; 
                                TP == leaves, TE == water ->
                                    X is Damage - 0.5*Damage 
                                    ;    
                                    TP == water, TE == fire ->
                                        X is Damage - 0.5*Damage 
                                        ;
                                        TP == flying, TE == ground ->
                                            X is Damage - 0.5*Damage 
                                            ;
                                            TP == ice, TE == water ->
                                                X is Damage - 0.3*Damage 
                                                ;
                                                TP == ground, TE == leaves ->
                                                    X is Damage - 0.3*Damage 
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
    ( HP > 0 ->
        write('You cannot capture!. '),
        !, fail
        ;
        tokeCounter(X),
        write(X),
        (X =:= 6 ->
            write('You cannot capture another Tokemon! You have to drop one first.'), nl
            ;
            write(ET),
            write(' is captured!. '),
            addToInventory(ET),
            random(45, 60, X),
            retract(health(ET, 0)),
            assert(health(ET, X)),
            rem
        )
    ).

specialAttack :-
    \+battle(_),
    write('You are not in the battle right now!'), nl,
    !, fail.    

specialAttack :-
    enemyTokemon(ET),
    playerTokemonBattle(PT),
    \+sAttack(_),
    skill(PT, Damage),
    modifier(ET, PT, Damage, X),
    NewDamage is X,
    serang(ET, NewDamage),
    write(PT),
    write(' uses special attack!'),nl,nl,
    write('It was super effective!'),nl,
    write('You dealt '), 
    write(NewDamage), 
    write(' damage to '),
    write(ET), nl, nl,
    assert(sAttack(_)),
    (\+checkvictory ->
        !, fail
    ).

specialAttack :- 
    write('Special attacks can only be used once per battle!'), !, fail.

checkvictory :-
    enemyTokemon(ET),
    health(ET, HPE),
    HPE =< 0,
    write(ET),
    write(' faints! Do you want to capture ') ,
    write(ET),
    write(' capture/0 to capture '), 
    write(ET),
    write(', \notherwise exit/0 to leave the carcass.'),
    !, fail.

exit :- 
    rem,
    write('You leave the carcass').

statPlayerEnemy :-
    playerTokemonBattle(PT),
    enemyTokemon(ET),
    stat(PT),
    nl,
    stat(ET).