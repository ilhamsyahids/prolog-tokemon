countElmt([],0).
countElmt([_|T],X) :- countElmt(T,N), X is N+1.

is_member(A,[B|_]) :- A == B.
is_member(A,[B|C]) :- A \== B, is_member(A,C).

addElmt(X, L, [X|L]).

delete_one(_, [], []).
delete_one(Elmt, [Elmt|Tail], Tail).
delete_one(Elmt, [Head|Tail], [Head|Result]) :-
  delete_one(Elmt, Tail, Result).

/*---------- N, S, W, E ----------*/
n :- retract(player_position(I,J)), 
	X is I-1, 
	asserta(player_position(X,J)),
	message_location.

s :- retract(player_position(I,J)), 
	X is I+1, 
	asserta(player_position(X,J)),
	message_location.

w :- retract(player_position(I,J)),
	 X is J-1, 
	asserta(player_position(I,X)),
	message_location.

e :- retract(player_position(I,J)),
	 X is J+1, 
	asserta(player_position(I,X)),
	message_location.	

/*---------- TAKE ----------*/
take(Name) :- supply(Name,I,J),
			 player_position(I,J),
			 player_inventory(L,Max), 
			 countElmt(L,X),
			 X <Max, 
			 append(L,[Name],Result),
			 retract(player_inventory(L,Max)),
			 asserta(player_inventory(Result,Max)),
			 retract(supply(Name,I,J)),
			 message_take_succeed(Name), !.

take(Name) :- supply(Name,I,J),
			player_position(I,J), 
			player_inventory(L,Max), 
			countElmt(L,X), 
			X == Max,
			message_take_inventfull, !.

take(Name) :-
			player_position(I,J),
			\+supply(Name,I,J), 
			message_take_notfound(Name).

/*---------- DROP ----------*/
drop(Name) :- player_inventory(L,Max),
			is_member(Name,L),
			delete_one(Name,L,X), 
			retract(player_inventory(L,Max)),
			asserta(player_inventory(X,Max)),
			player_position(I,J),
			asserta(supply(Name,I,J)),
			message_drop_succeed(Name), !.

drop(Name) :- player_inventory(L,_),
			\+is_member(Name,L), 
			message_drop_notfound(Name).
 

