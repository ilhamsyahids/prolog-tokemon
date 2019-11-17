:- dynamic(health/2).
:- dynamic(milik/2).
:- dynamic(inventory/1).

/*nama tokemon*/
/* 20 tokemon normal*/
/* 4 tokemon super*/
tokemon(tokeyub).
tokemon(tokedon).
tokemon(tokecha).
tokemon(tokego).
tokemon(tokedo).
tokemon(tokefab).
tokemon(tokegun).
tokemon(tokepan).
tokemon(tokendra).
tokemon(tokejon).
tokemon(tokevin).
tokemon(tokenan).
tokemon(tokemezz).
tokemon(tokeat).
tokemon(toketir).
tokemon(tokekha).
tokemon(tokedhil).
tokemon(tokema).
tokemon(tokevan).
tokemon(tokeli).

tokemon(tokegill).
tokemon(tokejan).
tokemon(tokeham).
tokemon(tokenna).

/*jenis*/
jenis(tokeyub, normal).
jenis(tokedon, normal).
jenis(tokecha, normal).
jenis(tokego, normal).
jenis(tokedo, normal).
jenis(tokefab, normal).
jenis(tokegun, normal).
jenis(tokepan, normal).
jenis(tokendra, normal).
jenis(tokejon, normal).
jenis(tokevin, normal).
jenis(tokenan, normal).
jenis(tokemezz, normal).
jenis(tokeat, normal).
jenis(toketir, normal).
jenis(tokekha, normal).
jenis(tokedhil, normal).
jenis(tokema, normal).
jenis(tokevan, normal).
jenis(tokeli, normal).

jenis(tokegill, legend).
jenis(tokejan, legend).
jenis(tokeham, legend).
jenis(tokenna, legend).

/*health*/
/*maks 200*/
health(tokeyub, 77). 
health(tokedon, 45).
health(tokecha, 60).
health(tokego, 58).
health(tokedo, 68).
health(tokefab, 88).
health(tokegun, 46).
health(tokepan, 72).
health(tokendra, 70).
health(tokejon, 61).
health(tokevin, 52).
health(tokenan, 57).
health(tokemezz, 49).
health(tokeat, 63).
health(toketir, 62).
health(tokekha, 66).
health(tokedhil, 67).
health(tokema, 79).
health(tokevan, 83).
health(tokeli, 81).

health(tokegill, 131).
health(tokejan, 119).
health(tokeham, 137).
health(tokenna, 125).

/*tipe*/
/* fire, water, leaves, ground, flying, ice*/
/* flying lebih besar 50% damagenya melawan ground */
/* fire lebih besar 50% damagenya melawan ice */
/* ice lebih besar 30% damagenya melawan water */
/* ground lebih besar 40% damagenya melawan leaves*/

type(tokeyub, fire).
type(tokedon, water).
type(tokecha, leaves).
type(tokego, ground).
type(tokedo, flying).
type(tokefab, ice).
type(tokegun, fire).
type(tokepan, water).
type(tokendra, leaves).
type(tokejon, ground).
type(tokevin, flying).
type(tokenan, ice).
type(tokemezz, fire).
type(tokeat, water).
type(toketir, leaves).
type(tokekha, ground).
type(tokedhil, flying).
type(tokema, ice).
type(tokevan, fire).
type(tokeli, water).

type(tokegill, water).
type(tokejan, fire).
type(tokeham, leaves).
type(tokenna, flying).

/*normal attack*/
damage(tokeyub, 35).
damage(tokedon, 21).
damage(tokecha, 29).
damage(tokego, 27).
damage(tokedo, 31).
damage(tokefab, 41).
damage(tokegun, 23).
damage(tokepan, 38).
damage(tokendra, 36).
damage(tokejon, 32).
damage(tokevin, 25).
damage(tokenan, 26).
damage(tokemezz, 19).
damage(tokeat, 33).
damage(toketir, 30).
damage(tokekha, 37).
damage(tokedhil, 34).
damage(tokema, 40).
damage(tokevan, 47).
damage(tokeli, 42).

damage(tokegill, 48).
damage(tokejan, 43).
damage(tokeham, 50).
damage(tokenna, 51).

/*special attack atau skill */
skill(tokeyub, 63).
skill(tokedon, 36).
skill(tokecha, 54).
skill(tokego, 47).
skill(tokedo, 55).
skill(tokefab, 75).
skill(tokegun, 43).
skill(tokepan, 68).
skill(tokendra, 65).
skill(tokejon, 57).
skill(tokevin, 46).
skill(tokenan, 42).
skill(tokemezz, 49).
skill(tokeat, 56).
skill(toketir, 52).
skill(tokekha, 58).
skill(tokedhil, 59).
skill(tokema, 64).
skill(tokevan, 77).
skill(tokeli, 79).

skill(tokegill, 107).
skill(tokejan, 92).
skill(tokeham, 109).
skill(tokenna, 97).

/*kepemilikan*/
milik(tokeyub, 0).
milik(tokedon, 1).
milik(tokecha, 0).
milik(tokego, 1).
milik(tokedo, 0).
milik(tokefab, 0).
milik(tokegun, 0).
milik(tokepan, 1).
milik(tokendra, 0).
milik(tokejon, 0).
milik(tokevin, 0).
milik(tokenan, 0).
milik(tokemezz, 1).
milik(tokeat, 0).
milik(toketir, 0).
milik(tokekha, 0).
milik(tokedhil, 0).
milik(tokema, 0).
milik(tokevan, 0).
milik(tokeli, 0).

milik(tokegill, 0).
milik(tokejan, 0).
milik(tokeham, 0).
milik(tokenna, 0).
milik(_, 0).

/*id tokemon*/
id(tokeyub, 1).
id(tokedon, 2).
id(tokecha, 3).
id(tokego, 4).
id(tokedo, 5).
id(tokefab, 6).
id(tokegun, 7).
id(tokepan, 8).
id(tokendra, 9).
id(tokejon, 10).
id(tokevin, 11).
id(tokenan, 12).
id(tokemezz, 13).
id(tokeat, 14).
id(toketir, 15).
id(tokekha, 16).
id(tokedhil, 17).
id(tokema, 18).
id(tokevan, 19).
id(tokeli, 20).

id(tokegill, 21).
id(tokejan, 22).
id(tokeham, 23).
id(tokenna, 24).

/* =========RULES========= */

/*random tokemon init*/
tokemon_init:-
    random(1,20,Id),
    id(Y,Id),
    retractall(milik(Y,0)),
    asserta(milik(Y,1)).

/*cek kepemilikan*/
isMilik(Tokemon):-
    milik(Tokemon,X),
    X=:=1.

/*tokemon dalam inventory*/
tokeCounter(X):-
    findall(A,isMilik(A),ListInvent),
    length(ListInvent,X).

/*inventory*/
addToInventory(Toke):-
    tokemon(Toke),
    asserta(milik(Toke,1)),!.

delFromInventory(Toke):-
    tokemon(Toke),
    asserta(milik(Toke,0)),!.

inventory(LInvent):-
    findall(B,isMilik(B),LInvent).
    
stat(K) :-
	tokemon(K),
	write(K), nl,
	write('Health : '), health(K, X), write(X), nl,
	write('Type : '), type(K, Y), write(Y), nl,!.

capt(Toke) :-
    tokemon(Toke),
    addToInventory(Toke),
    write(Toke),write(' is captured!'),!.

noMilik:-
    tokemon(_),
    asserta(milik(_,0)).