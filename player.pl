:- include('tokemon.pl').

:- discontiguous(tokemon_init/0).
:- discontiguous(drop/1).
:- discontiguous(stat/1).
:- discontiguous(capt/1).
:- discontiguous(isMilik/1).
:- discontiguous(tokeCounter/1).
:- discontiguous(addToInventory/1).
:- discontiguous(inventory/1).
:- discontiguous(delFromInventory/1).

/*---------- DROP ----------*/
drop(Name) :- 
	milik(Name, 1), 
	delFromInventory(Name), 
	!.
	
drop(Name) :-
	\+milik(Name, 1),
	write('Gagal, Anda tidak memiliki pokemon tersebut'),
	nl.

/* =========RULES========= */

/*random tokemon init*/
tokemon_init:-
    random(1,20,Id),
    id(Y,Id),
    retractall(milik(Y,_)),
    write('You have '),
    write(Y),
    asserta(milik(Y,1)), !.

/*cek kepemilikan*/
isMilik(Tokemon):-
    tokemon(Tokemon),
    milik(Tokemon,X),
    X =:= 1,!.

/*tokemon dalam inventory*/
tokeCounter(X):-
    findall(A,isMilik(A),ListInvent),
    length(ListInvent,X).

/*inventory*/
addToInventory(Toke):-
    tokemon(Toke),
    asserta(milik(Toke,1)),
    retract(milik(Toke,0)),!.

delFromInventory(Toke):-
    tokemon(Toke),
    retractall(milik(Toke,1)),
    assert(milik(Toke,0)),!.

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
	assert(health(Toke, X)),
    write(Toke),write(' is captured!'),!.
