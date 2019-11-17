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
	tokemon_init,
	asserta(playing(1)),
	asserta(inventory(6)), nl,nl,
	repeat,
		map,
		write('Enter Command : '), read(X),
		do(X),
		X == quit.

do(start) :- start.
do(help) :- help.
do(quit) :- quit.
do(w) :- w.
do(a) :- a.
do(s) :- s.
do(d) :- d.
do(map) :- map.
do(status) :- status.
do(drop(X)) :- drop(X).

narasi:- 
	write(' Hello there! Welcome to the world of Tokemon!'),nl,
	write(' Anda terkunci di dalam barrier, temukan kunci untuk keluar!'),nl.

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