/*Queen Elizabeth II family, 4 children*/
female(queenElizabethII).
male(princePhilip).
married(queenElizabethII,princePhilip).
child(princeCharles, queenElizabethII).
child(princeCharles, princePhilip).
child(princeAndrew, queenElizabethII).
child(princeAndrew, princePhilip).
child(princessAnne, queenElizabethII).
child(princessAnne, princePhilip).
child(princeEdward, queenElizabethII).
child(princeEdward, princePhilip).
male(princeCharles).
male(princeAndrew).
female(princessAnne).
male(princeEdward).

/*Prince Charles family: 2 children, divorced once*/
female(diana).
female(camillaParkerBowles).
married(princeCharles,diana).
child(princeWilliam, princeCharles).
child(princeWilliam, diana).
child(princeHarry, princeCharles).
child(princeHarry, diana).
male(princeHarry).
male(princeWilliam).
divorced(princeCharles,diana).
married(princeCharles, camillaParkerBowles).

/*Prince Andrew family: 2 children*/
female(sarahFerguson).
married(princeAndrew, sarahFerguson).
child(princessEugenie, princeAndrew).
child(princessEugenie, sarahFerguson).
child(princessBeatrice, princeAndrew).
child(princessBeatrice, sarahFerguson).
female(princessEugenie).
female(princessBeatrice).

/*Prince William family: 3 children*/
female(kateMiddleton).
married(kateMiddleton, princeWilliam).
child(princeGeorge, kateMiddleton).
child(princeGeorge, princeWilliam).
child(princessCharlotte, kateMiddleton).
child(princessCharlotte, princeWilliam).
child(princeLouis, kateMiddleton).
child(princeLouis, princeWilliam).
male(princeGeorge).
female(princessCharlotte).
male(princeLouis).

/*Prince Harry family: 1 child*/
female(meghanMarkle).
married(princeHarry, meghanMarkle).
child(archieHarrison, princeHarry).
child(archieHarrison, meghanMarkle).
male(archieHarrison).

/*Princess Anne family: 2 children, divorced once*/
male(markPhillips).
married(princessAnne, markPhillips).
child(peterPhillips, princessAnne).
child(peterPhillips, markPhillips).
child(zaraTindall, princessAnne).
child(zaraTindall, markPhillips).
male(peterPhillips).
female(zaraTindall).
divorced(princessAnne, markPhillips).
male(timothyLaurence).
married(princessAnne, timothyLaurence).
female(autumnPhillips).
married(peterPhillips, autumnPhillips).
male(mikeTindall).
married(zaraTindall, mikeTindall).

/*Prince Edward family: 2 children*/
female(sophieRhysJones).
married(princeEdward, sophieRhysJones).
child(ladyLouiseWindsor, princeEdward).
child(ladyLouiseWindsor, sophieRhysJones).
child(jamesViscount, princeEdward).
child(jamesViscount, sophieRhysJones).
female(ladyLouiseWindsor).
male(jamesViscount).




/*Initial predicates*/
parent(Parent,Child) :- child(Child,Parent).
not(male(Person)) :- female(Person).
not(female(Person)) :- male(Person).
divorced(X,Y) :- X @< Y, divorced(Y,X).
married(X,Y) :- X @< Y, married(Y,X).


/*vo chong*/
husband(Person,Wife) :- married(Person,Wife), female(Wife), male(Person).
wife(Person,Husband) :- married(Person,Husband), male(Husband), female(Person).
spouse(Husband,Wife) :- married(Husband,Wife).

/*cha me*/
father(Parent,Child) :- parent(Parent,Child), male(Parent).
mother(Parent,Child) :- parent(Parent,Child), female(Parent).


/*ong ba*/
grandparent(GP,GC) :- parent(Parent,GC), parent(GP,Parent).
grandmother(GM,GC) :- grandparent(GM,GC), female(GM).
grandfather(GF,GC) :- grandparent(GF,GC), male(GF).
grandchild(GC,GP) :- grandparent(GP,GC).
grandson(GC,GP) :- grandparent(GP,GC), male(GC).
granddaughter(GC,GP) :- grandparent(GP,GC), female(GC).


/*con*/
son(Child,Parent) :- parent(Parent,Child), male(Child).
daughter(Child,Parent) :- parent(Parent,Child), female(Child).


/*anh chi em*/
sibling(X,Y) :- mother(Mother, X), mother(Mother, Y),
				father(Father, X), father(Father, Y), X\=Y.
brother(Person,Sibling) :- sibling(Person,Sibling), male(Person).
sister(Person,Sibling) :- sibling(Person,Sibling), female(Person).


/*dong ho: co di chu bac anh chi em ho*/
aunt(Aunt,X) :- (parent(Parent,X), sister(Aunt,Parent))
					; (parent(Parent,X), sibling(Uncle, Parent), wife(Aunt, Uncle)).
uncle(Uncle,X) :- (parent(Parent,X), brother(Uncle,Parent))
					; (parent(Parent,X), sibling(Aunt, Parent), husband(Uncle, Aunt)).
niece(Niece,X) :- sibling(Sibling,X), daughter(Niece,Sibling).
nephew(Niece,X) :- sibling(Sibling,X), son(Niece,Sibling).
firstCousin(Cousin,X) :- parent(Parent,X), sibling(Sibling,Parent), child(Cousin,Sibling).
descendant(X,Y) :- parent(X,Y).
descendant(X,Y) :- parent(X,Z), descendant(Z,Y).

