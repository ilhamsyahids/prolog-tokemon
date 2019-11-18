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
	write('§Ñ§§§§§§§§§Ñ§ë»"""""""""""""/ÑÉÉÉÉÉÉ§§d§ÉdÉ'),nl,
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
	write('    save(Filename). -- save your game to directory data/'), nl,
	write('    load(Filename). -- load your game from directory data/'), nl,nl,

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


load(FileAwal):-
	atom_concat('data/', FileAwal, Filename),
	resetAll,
	open(Filename, read, FinalFile),
	repeat,
		read(FinalFile, In),
		asserta(In),
	at_end_of_FinalFile(FinalFile),
	close(FinalFile),
	nl, write('Loaded form!'), 
	write(FinalFile), nl, !.

load(Filename):-
	nl, write('File '), 
	write(Filename), 
	write(' no\'t found!'), 
	nl, fail.