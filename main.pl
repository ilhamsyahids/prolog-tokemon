% ILHAM SYAHID S 			13518028
% M Fauzan Al-G 			13518112
% Felicia Gillian T. Tuerah 13518070
% Muhammad Rizki Fonna 		13516001

:- include('tokemon.pl').
:- include('player.pl').
:- include('battle.pl').

:- dynamic(playing/1).
:- dynamic(inventory/1).

start:-
	playing(_),
	write('You can only start the game once'),nl,!.
start:-
	%write('            ▄▄▄█████▓ ▒█████   ██ ▄█▀▓█████  ███▄ ▄███▓ ▒█████   ███▄    █'),nl,
	%write('            ▓  ██▒ ▓▒▒██▒  ██▒ ██▄█▒ ▓█   ▀ ▓██▒▀█▀ ██▒▒██▒  ██▒ ██ ▀█   █▒'),nl,
	%write('            ▒ ▓██░ ▒░▒██░  ██▒▓███▄░ ▒███   ▓██    ▓██░▒██░  ██▒▓██  ▀█ ██▒'),nl,
	%write('            ░ ▓██▓ ░ ▒██   ██░▓██ █▄ ▒▓█  ▄ ▒██    ▒██ ▒██   ██░▓██▒  ▐▌██▒'),nl,
	%write('              ▒██▒ ░ ░ ████▓▒░▒██▒ █▄░▒████▒▒██▒   ░██▒░ ████▓▒░▒██░   ▓██░'),nl,
	%write('               ▒ ░░   ░ ▒░▒░▒░ ▒ ▒▒ ▓▒░░ ▒░ ░░ ▒░   ░  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒'),nl,
	%write('                 ░      ░ ▒ ▒░ ░ ░▒ ▒░ ░ ░  ░░  ░      ░  ░ ▒ ▒░ ░ ░░   ░ ▒░'),nl,
	%write('               ░      ░ ░ ░ ▒  ░ ░░ ░    ░   ░      ░   ░ ░ ░ ▒     ░   ░ ░'),nl,
	%write('                            ░ ░  ░  ░      ░  ░       ░       ░ ░           ░'),nl,nl,
	narasi, 
	help,
	mulai,
	%tokemon_init,
	asserta(playing(1)),
	asserta(inventory(6)), nl,nl,
	repeat,
		write('Enter Command : '), read(X),
		do(X),
	X == quit.

do(start) :-!, start.
do(help) :-!, help.
do(quit) :-!, quit.
do(w) :-!, w.
do(a) :-!, a.
do(s) :-!, s.
do(d) :-!, d.
do(map) :-!, map.
do(status) :-!, status.
do(drop(X)) :-!, drop(X).
do(heal(X)) :-!, heal(X).
do(_) :- wronginput.

wronginput :-
	write('Command yang dimasukkan salah, silakan masukan ulang'),nl.

narasi:- 
	write(' Hello there! Welcome to the world of Tokemon!'),nl,
	write(' Temukan Key untuk membuka gerbang menuju Gym!!'),nl, nl.

help :-
	write(' Available commands:'), nl,
	write('    start. -- start the game!'), nl,
	write('    help. -- show available commands'), nl,
	write('    quit. -- quit the game'), nl,
	write('    look. -- look around you'), nl,
	write('    w. a. s. d. -- move'), nl,
	write('    map. -- look at the map'), nl,
	write('    heal. -- cure Tokemon in inventory if in gym center'), nl,
	write('    status. -- show your status'), nl,
	write('    save(Filename). -- save your game'), nl,
	write('    load(Filename). -- load previously saved game'), nl,nl,

	write(' Legends:'), nl,
	write('    X = Pagar'), nl,
	write('    P = Player'), nl,
	write('    G = Gym'), nl,
	write('    K = Key').

%move
w :-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
w :-
	player(_,Y),
	Y =:= 1,
	write('mentok cuy (nanti diperbaiki kata2nya)'),nl,!.
w :- 
	retract(player(X,Y)),
	Y > 1,
	NewY is Y - 1,
	asserta(player(X, NewY)), !.

a :-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
a :-
	player(X,_),
	X =:= 1,
	write('mentok cuy (nanti diperbaiki kata2nya)'),nl,!.
a :- 
	retract(player(X,Y)),
	NewX is X - 1,
	asserta(player(NewX, Y)), !.

s :-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
s :-
	player(_,Y),
	tinggipeta(P),
	Y =:= P,
	write('mentok cuy (nanti diperbaiki kata2nya)'),nl,!.
s :- 
	retract(player(X,Y)),
	NewY is Y + 1,
	asserta(player(X, NewY)), !.

d :-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
d :-
	player(X,_),
	lebarpeta(Q),
	X =:= Q,
	write('mentok cuy (nanti diperbaiki kata2nya)'),nl,!.
d :- 
	retract(player(X,Y)),
	NewX is X + 1,
	asserta(player(NewX, Y)), !.

%quit	
quit:- 
	/*\+quit,
	write('we're sad to see you go'),nl,
	write('come again to catch some tokemon!'),nl,*/
	halt,!.
/*quit:-
	write('you've not started any game yet'),nl,
	write('use "start." to start the Tokemon Game!'), nl, !.*/

%status
status :-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.

status :-
	write('Your Tokemon : '), nl,
	tokemon(K),
	milik(K, J),
	J =:= 1,
	stat(K), nl.

status :-
	write('Your Enemy : '), nl,
	forall(between(21,24,Val), 
		(id(K, Val),
		milik(K, 0) , jenis(K, legend),
		stat(K), nl)
	).

%heal
heal:- 
	player(I, J), 
	gym(I, J), 
	tokemon(Toke),
	milik(Toke, 1), 
	healthbase(Toke,X),
	retract(health(Toke, _)),
	asserta(health(Toke, X)),!.
heal:-
	tokemon(Toke),
	\+milik(Toke, 1),
	write('Gagal, Anda tidak memiliki pokemon tersebut'),
	nl,!.
heal:- 
	tokemon(Toke),
	milik(Toke, 1),
	player(I,J),
	\+gym(I, J),
	write('Gagal, Anda tidak sedang berada di gym'),
	nl,!.
