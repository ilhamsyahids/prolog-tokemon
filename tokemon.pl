/*nama tokemon*/
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

tokemon(tokegill).
tokemon(tokejan).
tokemon(tokeham).
tokemon(tokenna).

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
health(tokejon, 60).

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

damage(tokegill, 48).
damage(tokejan, 42).
damage(tokeham, 50).
damage(tokenna, 40).

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

skill(tokegill, 107).
skill(tokejan, 92).
skill(tokeham, 109).
skill(tokenna, 97).

/*kepemilikan*/
milik(tokeyub, 0).
milik(tokedon, 1).
milik(tokecha, 0).
milik(tokego, 0).
milik(tokedo, 0).
milik(tokefab, 0).
milik(tokegun, 0).
milik(tokepan, 0).
milik(tokendra, 0).
milik(tokejon, 0).

milik(tokegill, 0).
milik(tokejan, 0).
milik(tokeham, 0).
milik(tokenna, 0).



