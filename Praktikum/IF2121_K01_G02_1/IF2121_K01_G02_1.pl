% ILHAM SYAHID S 			13518028
% M Fauzan Al-G 			13518112
% Felicia Gillian T. Tuerah 13518070
% Muhammad Rizki Fonna 		13516001

start:-
	write('            ▄▄▄█████▓ ▒█████   ██ ▄█▀▓█████  ███▄ ▄███▓ ▒█████   ███▄    █  '),nl,
	write('            ▓  ██▒ ▓▒▒██▒  ██▒ ██▄█▒ ▓█   ▀ ▓██▒▀█▀ ██▒▒██▒  ██▒ ██ ▀█   █▒ '),nl,
	write('            ▒ ▓██░ ▒░▒██░  ██▒▓███▄░ ▒███   ▓██    ▓██░▒██░  ██▒▓██  ▀█ ██▒'),nl,
	write('            ░ ▓██▓ ░ ▒██   ██░▓██ █▄ ▒▓█  ▄ ▒██    ▒██ ▒██   ██░▓██▒  ▐▌██▒'),nl,
	write('              ▒██▒ ░ ░ ████▓▒░▒██▒ █▄░▒████▒▒██▒   ░██▒░ ████▓▒░▒██░   ▓██░'),nl,
	write('               ▒ ░░   ░ ▒░▒░▒░ ▒ ▒▒ ▓▒░░ ▒░ ░░ ▒░   ░  ░░ ▒░▒░▒░ ░ ▒░   ▒ ▒ '),nl,
	write('                 ░      ░ ▒ ▒░ ░ ░▒ ▒░ ░ ░  ░░  ░      ░  ░ ▒ ▒░ ░ ░░   ░ ▒░     '),nl,
	write('               ░      ░ ░ ░ ▒  ░ ░░ ░    ░   ░      ░   ░ ░ ░ ▒     ░   ░ ░ '),nl,
	write('                            ░ ░  ░  ░      ░  ░       ░       ░ ░           ░          '),nl,nl,
	narasi, 
	help,
	nl.

narasi:- 
	write(' Hello there! Welcome to the world of Tokemon!'),nl.

help :-
	write(' Available commands:                               '), nl,
	write('    start. -- start the game!                      '), nl,
	write('    help. -- show available commands               '), nl,
	write('    quit. -- quit the game                         '), nl,
	write('    look. -- look around you                       '), nl,
	write('    n. s. e. w. -- move                            '), nl,
	write('    map. -- look at the map'), nl,
	write('    heal. -- cure Tokemon in inventory if in gym center'), nl,
	write('    status. -- show your status                '), nl,
	write('    save(Filename). -- save your game                  '), nl,
	write('    load(Filename). -- load previously saved game       '), nl,
	nl,
	write(' Legends:           '), nl,
	write('    X = Pagar      '), nl,
	write('    P = Player       '), nl,
	write('    G = Gym    '), nl,
	nl.

quit:- halt.

status:- 
	nl,
	write('Your Tokemon:'), nl,
	write('Bulsabaur'), nl,
	write('Health:100'), nl,
	write('Tipe: water'), nl, nl,
	write('Your Enemy:'), nl,
	write('Icanmon'), nl,
	write('Health:999'), nl,
	write('Type: water'), nl,nl,
	write('Sangemon'), nl,
	write('Health:13517101'), nl,
	write('Type: grass'), nl.

map:-
	write('XXXXXXXXXXXXXXXXXXXXXXX'), nl,
	write('X P - - - - - - - - - X'), nl,
	write('X - - - - - - - - - - X'), nl,
	write('X - - - - - - - - - - X'), nl,
	write('X - - - x - - - G - - X'), nl,
	write('X - - - x - - - - - - X'), nl,
	write('X - - - - - - - - - - X'), nl,
	write('X - - - - - - - - - - X'), nl,
	write('X - - - - - - - - - - X'), nl,
	write('X - - - - - - - - - - X '), nl,
	write('X - - - - - - - - - - X'), nl,
	write('X - - - - - - - - - - X'), nl,
	write('XXXXXXXXXXXXXXXXXXXXXXX'), nl.

