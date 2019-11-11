% ILHAM SYAHID S 			13518028
% M Fauzan Al-G 			13518112
% Felicia Gillian T. Tuerah 13518070
% Muhammad Rizki Fonna 		13516001
:- include('map.pl').
:- include('tokemon.pl').

:- dynamic(playing/1).
:- dynamic(inventory/1).

start:-
	playing(_),
	write('You can only start the game once'),nl,!.
start:-
	write('            ▄▄▄█████▓ ▒█████   ██ ▄█▀▓█████  ███▄ ▄███▓ ▒█████   ███▄    █'),nl,
	write('            ▓  ██▒ ▓▒▒██▒  ██▒ ██▄█▒ ▓█   ▀ ▓██▒▀█▀ ██▒▒██▒  ██▒ ██ ▀█   █▒'),nl,
	write('            ▒ ▓██░ ▒░▒██░  ██▒▓███▄░ ▒███   ▓██    ▓██░▒██░  ██▒▓██  ▀█ ██▒'),nl,
	write('            ░ ▓██▓ ░ ▒██   ██░▓██ █▄ ▒▓█  ▄ ▒██    ▒██ ▒██   ██░▓██▒  ▐▌██▒'),nl,
	write('              ▒██▒ ░ ░ ████▓▒░▒██▒ █▄░▒████▒▒██▒   ░██▒░ ████▓▒░▒██░   ▓██░'),nl,
	write('               ▒ ░░   ░ ▒░▒░▒░ ▒ ▒▒ ▓▒░░ ▒░ ░░ ▒░   ░  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒'),nl,
	write('                 ░      ░ ▒ ▒░ ░ ░▒ ▒░ ░ ░  ░░  ░      ░  ░ ▒ ▒░ ░ ░░   ░ ▒░'),nl,
	write('               ░      ░ ░ ░ ▒  ░ ░░ ░    ░   ░      ░   ░ ░ ░ ▒     ░   ░ ░'),nl,
	write('                            ░ ░  ░  ░      ░  ░       ░       ░ ░           ░'),nl,nl,
	narasi, 
	help,
	mulai,
	asserta(playing(1)),
	asserta(inventory(6)),
	nl.

narasi:- 
	write(' Hello there! Welcome to the world of Tokemon!'),nl.

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
	write('    load(Filename). -- load previously saved game').

quit:- halt.

map:-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
map:-
	tinggipeta(T),
	lebarpeta(L),
	X is 0,
	Xmax is L+1,
	Y is 0,
	Ymax is T+1,
	forall(between(Y, Ymax, J), (
		forall(between(X, Xmax, I), (
			printpeta(I,J)
		)),
		nl
	)),
	write(' Legends:'), nl,
	write('    X = Pagar'), nl,
	write('    P = Player'), nl,
	write('    G = Gym'), nl,
	!.

% move
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
	write(K), nl,
	write('health : '), health(K, X), write(X), nl,
	write('type : '), type(K, Y), write(Y), nl, nl.

status :-
	write('Your Enemy : '), nl,
	tokemon(K),
	milik(K, J),
	J =:= 0,
	write(K), nl,
	write('health : '), health(K, X), write(X), nl,
	write('type : '), type(K, Y), write(Y), nl, nl.