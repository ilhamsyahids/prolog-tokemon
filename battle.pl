:- include('player.pl').

:- dynamic(battle/1).
:- dynamic(enemyTokemon/1).
:- dynamic(playerTokemonBattle/1).
:- dynamic(battle/1).
:- dynamic(sAttack/1).
:- dynamic(gagalRun/1).
:- dynamic(picked/0).
:- dynamic(pilih/1).

:- discontiguous(decide/0).
:- discontiguous(fight/0).
:- discontiguous(remove/0).
:- discontiguous(run/0).
:- discontiguous(pick/1).
:- discontiguous(enemyAttack/0).
:- discontiguous(serang/2).
:- discontiguous(attack/0).
:- discontiguous(specialAttack/0).
:- discontiguous(checklose/0).
:- discontiguous(checkvictory/0).
:- discontiguous(modifier/4).
:- discontiguous(capture/0).
:- discontiguous(exit/0).
:- discontiguous(statPlayerEnemy/0).

% enemyTokemon(tokeyub).
% playerTokemonBattle(tokedo).

randomenemy :-
    repeat,
        random(1, 24, Nomer),
        id(Toke, Nomer),
        milik(Toke, Siapa),
        Siapa =:= 0,
        retractall(enemyTokemon(_)),
        asserta(enemyTokemon(Toke)), !.

decide :-
    write('tokemon liar muncul'), nl,
    write('fight atau run'), nl,
    asserta(pilih(1)).

    % milik(Y, 0),
    % asserta(enemyTokemon(Y)),
    % write(Y),
    % write(' liar Muncul!!'), nl,
    % write('fight atau run'), nl,
    % read(X),
    % (X == run -> !, run; X == fight -> fight).

fight :-
    asserta(battle(_)),
    randomenemy,
    %asserta(enemyTokemon(tokenna)),
    write('Choose your Tokemon!\n\nAvailable Tokemons: '), 
    inventory(X),
    write(X),
    nl, !.

remove :-
    retractall(picked),
    retractall(gagalRun(_)),
    retractall(sAttack(_)),
    retractall(battle(_)),
    retractall(enemyTokemon(_)),
    retractall(playerTokemonBattle(_)),
    retractall(pilih(_)).


run :-
    random(0,2,Result),	
	(Result =:= 0 -> gagalrun; berhasilrun).
    
berhasilrun :-
    write('Kamu berhasil kabur dari serangan Tokemon!'), nl,
    remove,
    !, fail.

gagalrun :-
    write('Kamu gagal kabur dari serangan Tokemon'), nl,
    fight. 

pick(_) :-
    picked,
    write('You have picked Tokemon!'), 
    !.

pick(_) :-
    \+battle(_),
    write('You are not in the battle right now!'), 
    !.

pick(PT) :-
    milik(PT, 1),
    write('You : '), 
    write(PT), 
    write(' I choose you!\n'),
    retractall(playerTokemonBattle(_)),
    asserta(playerTokemonBattle(PT)),
    asserta(picked),
    statPlayerEnemy,
    !.

pick(_) :-
    write('You don’t have that Tokemon!'), !.

attack :- 
    enemyTokemon(ET),
    playerTokemonBattle(PT),
    damage(PT, Damage),
    modifier(ET, PT, Damage, X),
    NewDamage is X,
    serang(ET, NewDamage),
    nl,
    !,
    (\+checkvictory ->
        write('You dealt '),
        write(NewDamage),
        write(' damage to '),
        write(ET), nl,
        statPlayerEnemy,
        nl,
        !,
        enemyAttack, 
        !, fail
        ;
        !, fail
    ),
    !.

enemyAttack :-
    enemyTokemon(ET),
    playerTokemonBattle(PT),
    damage(ET, Damage),    
    modifier(PT, ET, Damage, X),
    NewDamage is X,
    serang(PT, NewDamage),
    !,
    (\+checklose ->
        write(ET),
        write(' attacks!\nIt dealt '), 
        write(NewDamage), 
        write(' damage to '),
        write(PT), nl,
        statPlayerEnemy,
        !, fail
        ;
        !, fail
    ),
    !.

serang(T, Damage) :-
    health(T, HP),
    NewHP is HP - Damage,
    (NewHP =< 0 ->
        HPP is 0
        ;
        HPP is NewHP
    ),
    retractall(health(T, HP)),
    asserta(health(T, HPP)).

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
        (X =:= 6 ->
            write('You cannot capture another Tokemon! You have to drop one first.'), nl
            ;
            capt(ET),
            tokeCountLegend(Z),
            (Z =:= 4 -> wingame),
            remove
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
    statPlayerEnemy,
    asserta(sAttack(_)),
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
    !.

checklose :-
    tokeCounter(X),
    Q is X-1,
    playerTokemonBattle(ET),
    health(ET, HPE),
    HPE =< 0,
    write(ET),
    write(' died!'),
    delForever(ET),
    retract(playerTokemonBattle(ET)),    
    retractall(picked),
    (Q =:= 0 -> losegame;
    write('Choose your Tokemon : '),
    inventory(P),
    write(P)),
    !. 

exit :- 
    enemyTokemon(Toke),
    backNormal(Toke),
    remove,
    write('You leave the carcass').

statPlayerEnemy :-
    playerTokemonBattle(PT),
    enemyTokemon(ET),
    stat(PT),
    nl,
    stat(ET).

losegame :-
    write('Anda sudah kalah :((').

wingame :-
    write('Anda menang :))').