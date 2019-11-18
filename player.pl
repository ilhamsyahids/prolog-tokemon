:- include('tokemon.pl').

:- dynamic(player/2).
:- dynamic(playing/0).
:- dynamic(selected/0).

:- discontiguous(select/1).
:- discontiguous(tokemon_init/0).
:- discontiguous(drop/1).
:- discontiguous(stat/1).
:- discontiguous(capt/1).
:- discontiguous(isMilik/1).
:- discontiguous(tokeCounter/1).
:- discontiguous(addToInventory/1).
:- discontiguous(inventory/1).
:- discontiguous(delFromInventory/1).

spawnPlayer :-
    asserta(player(3,2)).

/*---------- DROP ----------*/
drop(Name) :- 
    milik(Name, X), 
    (X =:= 1 ->
        delForever(Name),
        write('You have dropped '),
        write(Name), write('.'),nl,
        tokeCounter(Y),
        (Y =:= 0 -> losegame;write(''))
        ; write('You do not have '),write(Name),write(' in your inventory!'),nl ),
    !.

/* =========RULES========= */

/*random tokemon init*/
tokemon_init:- nl, nl,
    id(X, 1),
    id(Y, 2),
    id(Z, 3),
    stat(X), nl,
    stat(Y), nl,
    stat(Z), nl, 
    write('Choose your own Tokemon using rule select/1'),nl,
    !.

select(PT) :- 
    PT == tokeyub,
    \+selected,
    asserta(selected),
    ambil(PT), !.

select(PT) :- 
    PT == tokedon,
    \+selected,
    asserta(selected),
    ambil(PT), !.

select(PT) :- 
    PT == tokecha,
    \+selected,
    asserta(selected),
    ambil(PT), !.

select(_) :- 
    \+selected,
    write('You can only choose from those 3 Tokemon!'),nl, !.

ambil(PT) :-
    write(PT), 
    write(' I choose you!\n'),
    retractall(milik(PT, _)),
    asserta(milik(PT,1)),
    !.

select(_) :- 
    selected,
    write('Sudah ambil tokemon starter kan tadi? masa lupa...'),nl,!.

/*cek kepemilikan*/
isMilik(Tokemon):-
    tokemon(Tokemon),
    milik(Tokemon,X),
    X =:= 1.

isLegend(Tokemon):-
    tokemon(Tokemon),
    jenis(Tokemon,X),
    X == legend.

isBukanLiar(Tokemon):-
    isLegend(Tokemon),
    tokemon(Tokemon),
    milik(Tokemon,X),
    X =:= 1.

isBukanLiar(Tokemon):-
    isLegend(Tokemon),
    tokemon(Tokemon),
    milik(Tokemon,X),
    X =:= 2.

/*tokemon dalam inventory*/
tokeCountLegend(X) :-
    findall(A,isBukanLiar(A), ListInvent),
    length(ListInvent,X).

tokeCounter(X):-
    findall(A,isMilik(A),ListInvent),
    length(ListInvent,X).

/*inventory*/
addToInventory(Toke):-
    tokemon(Toke),
    retractall(milik(Toke,_)),
    asserta(milik(Toke,1)),
    !.

delFromInventory(Toke):-
    backNormal(Toke).

delForever(Toke):-
    tokemon(Toke),
    retractall(milik(Toke,_)),
    asserta(milik(Toke,2)),!.

inventory(LInvent):-
    findall(B,isMilik(B),LInvent).
    
stat(K) :-
	tokemon(K),
	write(K), nl,
	write('Health : '), health(K, X), write(X), nl,
	write('Type : '), type(K, Y), write(Y), nl,!.

capt(Toke) :-
    tokemon(Toke),
	addToInventory(Toke),
	healthbase(Toke, X),
	retract(health(Toke, 0)),
	asserta(health(Toke, X)),
    write(Toke),write(' is captured!'),nl,!.

resetAll :-
    retractall(selected),
    retractall(healed),
    retractall(player(_,_)),
    retractall(tokemon(_)),
    retractall(damage(_,_)),
    retractall(health(_,_)),
    retractall(healthbase(_,_)),
    retractall(id(_,_)),
    retractall(jenis(_,_)),
    retractall(milik(_,_)),
    retractall(skill(_,_)),
    retractall(type(_,_)).

