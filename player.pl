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
    asserta(player(7,9)).

/*---------- DROP ----------*/
drop(Name) :- 
    milik(Name, X), 
    (X =:= 1 ->
        delForever(Name),
        write('You have dropped '),
        write(Name), write('.')
        ;
        write('You do not have '),write(Name),write(' in your inventory!'),nl
    ),
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
    write('Choose your own Tokemon using rule select/1'),
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
    write('hanya bisa memilih 3 tokemon di atas'), !.

ambil(PT) :-
    write(PT), 
    write(' I choose you!\n'),
    retractall(milik(PT, _)),
    asserta(milik(PT,1)),
    !.

select(_) :- 
    selected,
    write('Sudah ambil tokemon starter kan tadi? masa lupa').

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

save(_):-
	battle(_),
	write('You can\'t save while battle'),!.

save(FileAwal) :-
    atom_concat('data/', FileAwal, Filename),
	open(Filename, write, FinalFile),
	facts(FinalFile),
	close(FinalFile),
	write('Saved to '),
	write(Filename), nl.

facts(FinalFile) :- save_data(FinalFile).
facts(_) :- !.

save_data(FinalFile) :-
	tokemon(Toke), write(FinalFile, tokemon(Toke)), write(FinalFile, '.'), nl(FinalFile),
	jenis(Toke, Jenis), write(FinalFile, jenis(Toke, Jenis)), write(FinalFile, '.'), nl(FinalFile),
	healthbase(Toke, Healthbase), write(FinalFile, healthbase(Toke, Healthbase)), write(FinalFile, '.'), nl(FinalFile),
	health(Toke, Health), write(FinalFile, health(Toke, Health)), write(FinalFile, '.'), nl(FinalFile),
	type(Toke, Type), write(FinalFile, type(Toke, Type)), write(FinalFile, '.'), nl(FinalFile),
	damage(Toke, Damage), write(FinalFile, damage(Toke, Damage)), write(FinalFile, '.'), nl(FinalFile),
	skill(Toke, Skill), write(FinalFile, skill(Toke, Skill)), write(FinalFile, '.'), nl(FinalFile),
	milik(Toke, Milik), write(FinalFile, milik(Toke, Milik)), write(FinalFile, '.'), nl(FinalFile),
	id(Toke, Id), write(FinalFile, id(Toke, Id)), write(FinalFile, '.'), nl(FinalFile),
	player(X, Y), write(FinalFile, player(X, Y)), write(FinalFile, '.'), nl(FinalFile),
    fail.

load(_):-
	battle(_),
	write('You can\'t load while battle'),!.

loads(FileAwal):-
	atom_concat('data/', FileAwal, Filename),
	resetAll,
	open(Filename, read, FinalFile),
	repeat,
		read(FinalFile, In),
		asserta(In),
	at_end_of_stream(FinalFile),
	close(FinalFile),
	nl, write('Loaded form!'), 
	write(FinalFile), nl, !.

load(Filename):-
	nl, write('File '), 
	write(Filename), 
	write(' no\'t found!'), 
	nl, fail.
