% ILHAM SYAHID S 			13518028
% M Fauzan Al-G 			13518112
% Felicia Gillian T. Tuerah 13518070
% Muhammad Rizki Fonna 		13516001

:- include('map.pl').
:- dynamic(healed/0).


start:-
	playing(_),
	write('You can only start the game once'),nl,!.
start:-
	spawnAll,
	write('  /$$$$$$$$        /$$'), nl,
	write(' |__  $$__/       | $$'), nl,
	write('    | $$  /$$$$$$ | $$   /$$  /$$$$$$  /$$$$$$/$$$$   /$$$$$$  /$$$$$$$'), nl,
	write('    | $$ /$$__  $$| $$  /$$/ /$$__  $$| $$_  $$_  $$ /$$__  $$| $$__  $$'), nl,
	write('    | $$| $$  \\ $$| $$$$$$/ | $$$$$$$$| $$ \\ $$ \\ $$| $$  \\ $$| $$  \\ $$'), nl,
	write('    | $$| $$  | $$| $$_  $$ | $$_____/| $$ | $$ | $$| $$  | $$| $$  | $$'), nl,
	write('    | $$|  $$$$$$/| $$ \\  $$|  $$$$$$$| $$ | $$ | $$|  $$$$$$/| $$  | $$'), nl,
	write('    |__/ \\______/ |__/  \\__/ \\_______/|__/ |__/ |__/ \\______/ |__/  |__/'), nl,
	write(''), nl,
	write(''), nl,
	write(''), nl,
	write('    /$$$$$$$$ /$$           /$$         /$$'), nl,
	write('    | $$_____/|__/          | $$        | $$'), nl,
	write('    | $$       /$$  /$$$$$$ | $$$$$$$  /$$$$$$'), nl,
	write('    | $$$$$   | $$ /$$__  $$| $$__  $$|_  $$_/'), nl,
	write('    | $$__/   | $$| $$  \\ $$| $$  \\ $$  | $$'), nl,
	write('    | $$      | $$| $$  | $$| $$  | $$  | $$ /$$'), nl,
	write('    | $$      | $$|  $$$$$$$| $$  | $$  |  $$$$/'), nl,
	write('    |__/      |__/ \\____  $$|__/  |__/   \\___/'), nl,
	write('                   /$$  \\ $$'), nl,
	write('                   |  $$$$$$/'), nl,
	write('                   \\______/'), nl,
	narasi, 
	help,
	mulai,
	tokemon_init,
	asserta(playing(1)).

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
	forall(between(1,25,Val), 
		(id(K, Val), milik(K, P),
		(P =:= 1 -> stat(K), nl);write(''))
	), statusenemy.

statusenemy :- nl,
	write('Your Enemy : '), nl,
	forall(between(21,25,Val), 
		(id(K, Val), milik(K, P),
		(P =:= 0 -> jenis(K, legend),stat(K), nl);write(''))
	).

%heal
heal:- 
	healed,
	write('You can only heal your tokemon once.'), nl, !.

heal:- 
	\+healed,
	inventory(X),
	healList(X), 
	asserta(healed),
	write('All your tokemon has been healed.yey.'),nl,
	!.

healList([]).

healList([H|T]) :- oneHeal(H), healList(T).

oneHeal(Toke) :-
	healthbase(Toke,X),
	retractall(health(Toke,_)),
	asserta(health(Toke, X)),!.

heal:- 
	tokemon(Toke),
	milik(Toke, 1),
	player(I,J),
	\+gym(I, J),
	write('You can only use this command when you are in the gym.'),nl,
	write('Go to the gym to heal your tokemon!'),
	nl,!.
