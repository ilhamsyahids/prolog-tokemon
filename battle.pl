:- include('map.pl').
:- include('main.pl').

:- dynamic(battle/1).
:- dynamic(enemyTokemon/1).
:- dynamic(playerTokemon/1).
:- dynamic(battle/1).
:- dynamic(health/2).

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
    NewHP is HP - Damage,
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
    NewHP is HP - Damage,
    write(ET),
    write(' attacks!\nIt dealt '), 
    write(Damage), 
    write(' damage to '),
    write(PT),
    retract(health(PT, HP)),
    assert(health(PT, NewHP)),
    health(PT, HP2),
    write(HP2), !, fail.

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