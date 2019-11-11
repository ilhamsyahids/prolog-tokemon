:- dynamic(lebarpeta/1).
:- dynamic(tinggipeta/1).
:- dynamic(player/2).
:- dynamic(gym/2).
:- dynamic(tokemon/2).


mulai :-
    random(10,20,X),
    random(10,20,Y),
    random(1,X,A),
    random(1,Y,B),
    random(1,X,P),
    random(1,Y,Q),
	asserta(lebarpeta(X)),
	asserta(tinggipeta(Y)),
    asserta(player(A,B)),
	asserta(gym(P,Q)),
	tokemon,
	!.

tokemon :-
	lebarpeta(X),
	tinggipeta(Y),
	forall(between(1, 6, P), (random(1,X,C), random(1,Y,D), asserta(tokemon(C,D)))).

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
	tokemon(X,Y), !, write('T').
printpeta(X,Y) :-
	gym(X,Y), !, write('G').
printpeta(_,_) :-
	write('-').




