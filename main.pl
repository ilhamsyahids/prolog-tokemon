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
	%write('            ▄▄▄█████▓ ▒█████   ██ ▄█▀▓█████  ███▄ ▄███▓ ▒█████   ███▄    █'),nl,
	%write('            ▓  ██▒ ▓▒▒██▒  ██▒ ██▄█▒ ▓█   ▀ ▓██▒▀█▀ ██▒▒██▒  ██▒ ██ ▀█   █▒'),nl,
	%write('            ▒ ▓██░ ▒░▒██░  ██▒▓███▄░ ▒███   ▓██    ▓██░▒██░  ██▒▓██  ▀█ ██▒'),nl,
	%write('            ░ ▓██▓ ░ ▒██   ██░▓██ █▄ ▒▓█  ▄ ▒██    ▒██ ▒██   ██░▓██▒  ▐▌██▒'),nl,
	%write('              ▒██▒ ░ ░ ████▓▒░▒██▒ █▄░▒████▒▒██▒   ░██▒░ ████▓▒░▒██░   ▓██░'),nl,
	%write('               ▒ ░░   ░ ▒░▒░▒░ ▒ ▒▒ ▓▒░░ ▒░ ░░ ▒░   ░  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒'),nl,
	%write('                 ░      ░ ▒ ▒░ ░ ░▒ ▒░ ░ ░  ░░  ░      ░  ░ ▒ ▒░ ░ ░░   ░ ▒░'),nl,
	%write('               ░      ░ ░ ░ ▒  ░ ░░ ░    ░   ░      ░   ░ ░ ░ ▒     ░   ░ ░'),nl,
	%write('                            ░ ░  ░  ░      ░  ░       ░       ░ ░           ░'),nl,nl,
	write('ëëëëëëë££±±££±£±ëëëë±±ëëë±££±X£±££ë±±ë±£±ÉÉ'),nl,
	write('ëë@@@ëëëë±£±£££±±±ëëëëë±±ëë±XX±£±±ë±££±£±ÉÉ'),nl,
	write('@@@@@ë±ëëë±£X£Xo&&&&&&&&&&&&%o±±±£ëëëëëë±ÉÉ'),nl,
	write('@@@@ë@ë±±±±£X&&&&&&&&&&&&&&&&II&±@ë@ë@ëëëÉÉ'),nl,
	write('@ëëëëëë±±±£%%%%%&&&&&&&&&&&&&&&&&&ÑÑ@ë@@@§É'),nl,
	write('ëëëëëëëëëX%%%%%%%%&%&%%&&&&&&&&&&&&ëÉ§Ñ@Ñ§É'),nl,
	write('@@Ñ@@@@ë£%%%%%%%%%%&%oXo&&&&&&&&&&&&ÑÉ§ÑÑÉÉ'),nl,
	write('ÑÑÑÑÑÑÑ@%%%%%%%%%%XÉ±/~/£É££±ë@Ñ§ÉÉÉ§¶É§§ÉÉ'),nl,
	write('ÑÑÑÑÑÑÑë£±ë@§ÉÉææææ/~"""~/ÉÉÉÉÉÉÉÉÉÉÉ¶æÉÑÉÉ'),nl,
	write('ÑÑÑÑÑ§Ñ§æææææææææææ»~"""~/É£%&*?/;í~~ÑæÉ§ÉÉ'),nl,
	write('§§§ÑÑÑÑÑ@XX&*»;~^"~@ë?;»±@;"""""""""";¶§æææ'),nl,
	write('§§§§§§ÑÑ@~""""""""""""""""""""""""""^§É§§æÉ'),nl,
	write('§§§§§ÑÑ§Ñ@;""""""""""""""""""""""";æÉ§§§§ææ'),nl,
	write('§§§§§§§§§ÑÑX^""""""""""""""""""^£æÉ§§dÑ§ÑÑæ'),nl,
	write('§Ñ§§§§§§§§§Ñ§ë»""""""""""""""ÑÉÉÉÉÉÉ§§d§ÉdÉ'),nl,
	write('§§§§§§§§§§§§§§§§§ëI»~~;»=&%£É§§§§§§ÉÉÉÉÉÉææ'),nl,
	write('§§§§§§§§§§§§§§§§§§§§§§§§ÉÉ§§ÉÉÉ§ÉÉÉÉÉÉÉÉÉÉæ'),nl,
	write('§§§ÉÉÉÉ§§§§§ÉÉÉÉÉÉ§§§§§ÉÉÉ§§ÉÉÉÉÉÉÉÉÉÉÉÉÉÉ§'),nl,
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
