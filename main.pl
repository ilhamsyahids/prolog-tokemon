% ILHAM SYAHID S 			13518028
% M Fauzan Al-G 			13518112
% Felicia Gillian T. Tuerah 13518070
% Muhammad Rizki Fonna 		13516001

:- include('map.pl').


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
	asserta(playing(1)).

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

%quit	
quit:- 
	halt,!.

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
