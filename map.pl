:- include('battle.pl').

:- dynamic(playing/1).
:- dynamic(lebarpeta/1).
:- dynamic(tinggipeta/1).
:- dynamic(player/2).
:- dynamic(gym/2).
:- dynamic(tokemon/2).
:- dynamic(penghalang/2).
:- dynamic(key/2).

lebarpeta(15).
tinggipeta(17).

mulai :-
    asserta(player(3,2)),
	asserta(gym(13,16)),
	asserta(key(8,9)),
	C is 6,
	D is 1,
	forall(between(0, 3, JJ), (HH is JJ+D, asserta(penghalang(C,HH)))),
	asserta(penghalang(1,4)),
	asserta(penghalang(2,4)),
	asserta(penghalang(4,4)),
	asserta(penghalang(5,4)),

	asserta(penghalang(6,6)),
	asserta(penghalang(6,7)),
	asserta(penghalang(6,8)),
	asserta(penghalang(6,9)),
	asserta(penghalang(6,10)),
	asserta(penghalang(6,12)),

	asserta(penghalang(7,6)),
	asserta(penghalang(7,10)),
	asserta(penghalang(7,12)),

	asserta(penghalang(8,6)),
	asserta(penghalang(8,8)),
	asserta(penghalang(8,10)),
	asserta(penghalang(8,12)),

	asserta(penghalang(9,6)),
	asserta(penghalang(9,8)),
	asserta(penghalang(9,9)),
	asserta(penghalang(9,10)),
	asserta(penghalang(9,12)),

	asserta(penghalang(10,6)),
	asserta(penghalang(10,12)),

	asserta(penghalang(11,6)),
	asserta(penghalang(11,7)),
	asserta(penghalang(11,8)),
	asserta(penghalang(11,9)),
	asserta(penghalang(11,10)),
	asserta(penghalang(11,11)),
	asserta(penghalang(11,12)),

	E is 10,
	F is 14,
	forall(between(0, 5, JJ), (HH is JJ+E, asserta(penghalang(HH,F)))), 
	asserta(penghalang(10,17)),
	asserta(penghalang(10,16)),
	asserta(penghalang(10,15)),
	!.

borderatas(_,Y) :-
	Y =:= 0,!.

borderbawah(_,Y) :-
	tinggipeta(T),
	Ymax is T+1,
	Y =:= Ymax,!.

borderkiri(X,_) :-
	X =:= 0,!.

borderkanan(X,_) :-
	lebarpeta(L),
	Xmax is L+1,
	X =:= Xmax,!.

printpeta(X,Y) :-
	borderatas(X,Y), !, write('X').
printpeta(X,Y) :-
	borderbawah(X,Y), !, write('X').
printpeta(X,Y) :-
	borderkiri(X,Y), !, write('X').
printpeta(X,Y) :-
	borderkanan(X,Y), !, write('X').
printpeta(X,Y) :-
	player(X,Y), !, write('P').
printpeta(X,Y) :-
	gym(X,Y), !, write('G').
printpeta(X,Y) :-
	key(X,Y), !, write('K').
printpeta(X,Y) :-
	penghalang(X,Y), !, write('X').
printpeta(_,_) :-
	write('-').

key :-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
key :-
	key(X,Y),
	player(X,Y),
	retract(key(X,Y)),
	retract(penghalang(10,16)), 
	write('Selamat!, Anda berhasil menemukan kunci untuk keluar!'),nl,
	!.

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
	write('    K = Key'), nl, nl,
	!.


% move
w :-
	pilih(1),
	write('Perjalananmu dihalangi oleh seekor tokemon!!!'),!,nl.
w :-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
w :-
	player(_,Y),
	Y =:= 1,
	write('Anda bergerak ke utara, tetapi ternyata ada barrier yang sangat kuat dan tidak dapat ditembus'),nl,!.
w :-
	player(X,Y),
	penghalang(X,P),
	Q is P+1,
	Y =:= Q,
	write('Anda bergerak ke utara, tetapi ternyata ada barrier yang sangat kuat dan tidak dapat ditembus'),nl,!.
w :- 
	retract(player(X,Y)),
	Y > 1,
	NewY is Y - 1,
	write('Anda bergerak ke utara'), nl,
	asserta(player(X, NewY)), appear,
	!.

a :-
	pilih(1),
	write('Perjalananmu dihalangi oleh seekor tokemon!!!'),!,nl.
a :-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
a :-
	player(X,_),
	X =:= 1,
	write('Anda bergerak ke barat, tetapi ternyata ada barrier yang sangat kuat dan tidak dapat ditembus'),nl,!.
a :-
	player(X,Y),
	penghalang(P,Y),
	Q is P+1,
	X =:= Q,
	write('Anda bergerak ke barat, tetapi ternyata ada barrier yang sangat kuat dan tidak dapat ditembus'),nl,!.
a :- 
	retract(player(X,Y)),
	NewX is X - 1,
	write('Anda bergerak ke barat'), nl,
	asserta(player(NewX, Y)), appear, 
	!.

s :-
	pilih(1),
	write('Perjalananmu dihalangi oleh seekor tokemon!!!'),!,nl.
s :-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
s :-
	player(_,Y),
	tinggipeta(P),
	Y =:= P,
	write('Anda bergerak ke selatan, tetapi ternyata ada barrier yang sangat kuat dan tidak dapat ditembus'),nl,!.
s :-
	player(X,Y),
	penghalang(X,P),
	Q is P-1,
	Y =:= Q,
	write('Anda bergerak ke selatan, tetapi ternyata ada barrier yang sangat kuat dan tidak dapat ditembus'),nl,!.
s :- 
	retract(player(X,Y)),
	NewY is Y + 1,
	write('Anda bergerak ke selatan'), nl,
	asserta(player(X, NewY)),  appear, 
	!.

d :-
	pilih(1),
	write('Perjalananmu dihalangi oleh seekor tokemon!!!'),!,nl.
d :-
	\+playing(_),
	write('this command can only be used after the game starts.'), nl,
	write('use "start." to start the Tokemon Game!'), nl, !.
d :-
	player(X,_),
	lebarpeta(Q),
	X =:= Q,
	write('Anda bergerak ke timur, tetapi ternyata ada barrier yang sangat kuat dan tidak dapat ditembus'),nl,!.
d :-
	player(X,Y),
	penghalang(P,Y),
	Q is P-1,
	X =:= Q,
	write('Anda bergerak ke timur, tetapi ternyata ada barrier yang sangat kuat dan tidak dapat ditembus'),nl,!.
d :- 
	retract(player(X,Y)),
	NewX is X + 1,
	write('Anda bergerak ke timur'), nl,
	asserta(player(NewX, Y)), appear, key,
	!.

appear :-
	random(1,7,Appear),
	(Appear =:= 5 -> decide; nothing).
		
nothing :-
	write('Tidak ada apa-apa di sini'), nl,nl.
