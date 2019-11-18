:- dynamic(tokemon/1).
:- dynamic(health/2).
:- dynamic(milik/2).
:- dynamic(jenis/2).
:- dynamic(healthbase/2).
:- dynamic(damage/2).
:- dynamic(skill/2).
:- dynamic(type/2).
:- dynamic(id/2).

:- discontiguous(spawn_tokemon/0).
:- discontiguous(spawn_health/0).
:- discontiguous(spawn_milik/0).
:- discontiguous(spawn_jenis/0).
:- discontiguous(spawn_damage/0).
:- discontiguous(spawn_healthbase/0).
:- discontiguous(spawn_skill/0).
:- discontiguous(spawn_type/0).
:- discontiguous(spawn_id/0).
:- discontiguous(spawnAll/0).


spawnAll :-
    spawn_damage,
    spawn_health,
    spawn_healthbase,
    spawn_id,
    spawn_jenis,
    spawn_milik,
    spawn_skill,
    spawn_tokemon,
    spawn_type.

/*nama tokemon*/
/* 20 tokemon normal*/
/* 4 tokemon super*/
spawn_tokemon :-
    asserta(tokemon(tokeyub)),
    asserta(tokemon(tokedon)),
    asserta(tokemon(tokecha)),
    asserta(tokemon(tokego)),
    asserta(tokemon(tokedo)),
    asserta(tokemon(tokefab)),
    asserta(tokemon(tokegun)),
    asserta(tokemon(tokepan)),
    asserta(tokemon(tokendra)),
    asserta(tokemon(tokejon)),
    asserta(tokemon(tokevin)),
    asserta(tokemon(tokenan)),
    asserta(tokemon(tokemezz)),
    asserta(tokemon(tokeat)),
    asserta(tokemon(toketir)),
    asserta(tokemon(tokekha)),
    asserta(tokemon(tokedhil)),
    asserta(tokemon(tokema)),
    asserta(tokemon(tokevan)),
    asserta(tokemon(tokeli)),
    asserta(tokemon(tokegill)),
    asserta(tokemon(tokejan)),
    asserta(tokemon(tokeham)),
    asserta(tokemon(tokenna)).

/*jenis*/
spawn_jenis :-
    asserta(jenis(tokeyub, normal)),
    asserta(jenis(tokedon, normal)),
    asserta(jenis(tokecha, normal)),
    asserta(jenis(tokego, normal)),
    asserta(jenis(tokedo, normal)),
    asserta(jenis(tokefab, normal)),
    asserta(jenis(tokegun, normal)),
    asserta(jenis(tokepan, normal)),
    asserta(jenis(tokendra, normal)),
    asserta(jenis(tokejon, normal)),
    asserta(jenis(tokevin, normal)),
    asserta(jenis(tokenan, normal)),
    asserta(jenis(tokemezz, normal)),
    asserta(jenis(tokeat, normal)),
    asserta(jenis(toketir, normal)),
    asserta(jenis(tokekha, normal)),
    asserta(jenis(tokedhil, normal)),
    asserta(jenis(tokema, normal)),
    asserta(jenis(tokevan, normal)),
    asserta(jenis(tokeli, normal)),
    asserta(jenis(tokegill, legend)),
    asserta(jenis(tokejan, legend)),
    asserta(jenis(tokeham, legend)),
    asserta(jenis(tokenna, legend)).

/*health base*/
spawn_healthbase :-
    asserta(healthbase(tokeyub, 97)), 
    asserta(healthbase(tokedon, 65)),
    asserta(healthbase(tokecha, 80)),
    asserta(healthbase(tokego, 78)),
    asserta(healthbase(tokedo, 88)),
    asserta(healthbase(tokefab, 108)),
    asserta(healthbase(tokegun, 66)),
    asserta(healthbase(tokepan, 92)),
    asserta(healthbase(tokendra, 90)),
    asserta(healthbase(tokejon, 81)),
    asserta(healthbase(tokevin, 72)),
    asserta(healthbase(tokenan, 77)),
    asserta(healthbase(tokemezz, 69)),
    asserta(healthbase(tokeat, 83)),
    asserta(healthbase(toketir, 82)),
    asserta(healthbase(tokekha, 86)),
    asserta(healthbase(tokedhil, 87)),
    asserta(healthbase(tokema, 99)),
    asserta(healthbase(tokevan, 103)),
    asserta(healthbase(tokeli, 101)),
    asserta(healthbase(tokegill, 151)),
    asserta(healthbase(tokejan, 139)),
    asserta(healthbase(tokeham, 157)),
    asserta(healthbase(tokenna, 145)).

/*health*/
spawn_health :-
    asserta(health(tokeyub, 10)), 
    asserta(health(tokedon, 65)),
    asserta(health(tokecha, 80)),
    asserta(health(tokego, 78)),
    asserta(health(tokedo, 88)),
    asserta(health(tokefab, 108)),
    asserta(health(tokegun, 66)),
    asserta(health(tokepan, 92)),
    asserta(health(tokendra, 90)),
    asserta(health(tokejon, 81)),
    asserta(health(tokevin, 72)),
    asserta(health(tokenan, 77)),
    asserta(health(tokemezz, 69)),
    asserta(health(tokeat, 83)),
    asserta(health(toketir, 82)),
    asserta(health(tokekha, 86)),
    asserta(health(tokedhil, 87)),
    asserta(health(tokema, 99)),
    asserta(health(tokevan, 103)),
    asserta(health(tokeli, 101)),
    asserta(health(tokegill, 151)),
    asserta(health(tokejan, 139)),
    asserta(health(tokeham, 157)),
    asserta(health(tokenna, 145)).

/*tipe*/
/* fire, water, leaves, ground, flying, ice*/
/* flying lebih besar 50% damagenya melawan ground */
/* fire lebih besar 50% damagenya melawan ice */
/* ice lebih besar 30% damagenya melawan water */
/* ground lebih besar 40% damagenya melawan leaves*/

spawn_type :-
    asserta(type(tokeyub, fire)),
    asserta(type(tokedon, water)),
    asserta(type(tokecha, leaves)),
    asserta(type(tokego, ground)),
    asserta(type(tokedo, flying)),
    asserta(type(tokefab, ice)),
    asserta(type(tokegun, fire)),
    asserta(type(tokepan, water)),
    asserta(type(tokendra, leaves)),
    asserta(type(tokejon, ground)),
    asserta(type(tokevin, flying)),
    asserta(type(tokenan, ice)),
    asserta(type(tokemezz, fire)),
    asserta(type(tokeat, water)),
    asserta(type(toketir, leaves)),
    asserta(type(tokekha, ground)),
    asserta(type(tokedhil, flying)),
    asserta(type(tokema, ice)),
    asserta(type(tokevan, fire)),
    asserta(type(tokeli, water)),
    asserta(type(tokegill, water)),
    asserta(type(tokejan, fire)),
    asserta(type(tokeham, leaves)),
    asserta(type(tokenna, flying)).

/*normal attack*/
spawn_damage :-
    asserta(damage(tokeyub, 25)),
    asserta(damage(tokedon, 11)),
    asserta(damage(tokecha, 19)),
    asserta(damage(tokego, 17)),
    asserta(damage(tokedo, 21)),
    asserta(damage(tokefab, 31)),
    asserta(damage(tokegun, 13)),
    asserta(damage(tokepan, 28)),
    asserta(damage(tokendra, 26)),
    asserta(damage(tokejon, 22)),
    asserta(damage(tokevin, 15)),
    asserta(damage(tokenan, 16)),
    asserta(damage(tokemezz, 9)),
    asserta(damage(tokeat, 23)),
    asserta(damage(toketir, 20)),
    asserta(damage(tokekha, 27)),
    asserta(damage(tokedhil, 24)),
    asserta(damage(tokema, 30)),
    asserta(damage(tokevan, 37)),
    asserta(damage(tokeli, 32)),
    asserta(damage(tokegill, 38)),
    asserta(damage(tokejan, 33)),
    asserta(damage(tokeham, 40)),
    asserta(damage(tokenna, 41)).

/*special attack atau skill */
spawn_skill :-
    asserta(skill(tokeyub, 63)),
    asserta(skill(tokedon, 36)),
    asserta(skill(tokecha, 54)),
    asserta(skill(tokego, 47)),
    asserta(skill(tokedo, 55)),
    asserta(skill(tokefab, 75)),
    asserta(skill(tokegun, 43)),
    asserta(skill(tokepan, 68)),
    asserta(skill(tokendra, 65)),
    asserta(skill(tokejon, 57)),
    asserta(skill(tokevin, 46)),
    asserta(skill(tokenan, 42)),
    asserta(skill(tokemezz, 49)),
    asserta(skill(tokeat, 56)),
    asserta(skill(toketir, 52)),
    asserta(skill(tokekha, 58)),
    asserta(skill(tokedhil, 59)),
    asserta(skill(tokema, 64)),
    asserta(skill(tokevan, 77)),
    asserta(skill(tokeli, 79)),
    asserta(skill(tokegill, 107)),
    asserta(skill(tokejan, 92)),
    asserta(skill(tokeham, 109)),
    asserta(skill(tokenna, 97)).

/*kepemilikan*/
spawn_milik :-
    asserta(milik(tokeyub, 0)),
    asserta(milik(tokedon, 0)),
    asserta(milik(tokecha, 0)),
    asserta(milik(tokego, 0)), 
    asserta(milik(tokedo, 0)), 
    asserta(milik(tokefab, 0)),
    asserta(milik(tokegun, 0)),
    asserta(milik(tokepan, 0)),
    asserta(milik(tokendra, 0)),   
    asserta(milik(tokejon, 0)),
    asserta(milik(tokevin, 0)),
    asserta(milik(tokenan, 0)),
    asserta(milik(tokemezz, 0)),   
    asserta(milik(tokeat, 0)), 
    asserta(milik(toketir, 0)),
    asserta(milik(tokekha, 0)),
    asserta(milik(tokedhil, 0)),   
    asserta(milik(tokema, 0)), 
    asserta(milik(tokevan, 0)),
    asserta(milik(tokeli, 0)), 
    asserta(milik(tokegill, 0)),   
    asserta(milik(tokejan, 0)),
    asserta(milik(tokeham, 0)),
    asserta(milik(tokenna, 0)).

/*id tokemon*/
spawn_id :-
    asserta(id(tokeyub, 1)),
    asserta(id(tokedon, 2)),
    asserta(id(tokecha, 3)),
    asserta(id(tokego, 4)),
    asserta(id(tokedo, 5)),
    asserta(id(tokefab, 6)),
    asserta(id(tokegun, 7)),
    asserta(id(tokepan, 8)),
    asserta(id(tokendra, 9)),
    asserta(id(tokejon, 10)),
    asserta(id(tokevin, 11)),
    asserta(id(tokenan, 12)),
    asserta(id(tokemezz, 13)),
    asserta(id(tokeat, 14)),
    asserta(id(toketir, 15)),
    asserta(id(tokekha, 16)),
    asserta(id(tokedhil, 17)),
    asserta(id(tokema, 18)),
    asserta(id(tokevan, 19)),
    asserta(id(tokeli, 20)),
    asserta(id(tokegill, 21)),
    asserta(id(tokejan, 22)),
    asserta(id(tokeham, 23)),
    asserta(id(tokenna, 24)).

/*rules*/
backNormal(Toke) :- 
    tokemon(Toke),
	healthbase(Toke, X),
	retract(health(Toke, 0)),
	asserta(health(Toke, X)),
    retractall(milik(Toke,1)),
    asserta(milik(Toke,0)).
