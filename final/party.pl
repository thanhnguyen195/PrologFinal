men([tom, fred, billy, tim, frank, barry]).
women([sue, jane, betty, ellen, joan, betsy]).

funny([tom, sue, tim, ellen]).
interesting([fred, betty, frank, betsy]).


available(tom, saturday).
available(fred, saturday).
available(sue, saturday).
available(jane, saturday).
available(tom, friday).
available(billy, friday).
available(sue, friday).
available(betty, friday).
available(tim, saturday).
available(frank, saturday).
available(ellen, saturday).
available(joan, saturday).
available(tim, friday).
available(barry, friday).
available(ellen, friday).
available(betsy, friday).

democrat(tom).
democrat(sue).
democrat(tim).
democrat(ellen).

republican(fred).
republican(jane).
republican(frank).
republican(joan).

independent(billy).
independent(betty).
independent(barry).
independent(betsy).

know(tom, fred).
know(fred, tom).
know(fred, billy). 
know(billy, fred).
know(billy, betty). know(betty, billy).
know(betty, sue). know(tom, sue).
know(sue, tom). know(sue, betty).
know(sue, jane). know(jane, sue).
know(tim, frank). know(frank, tim).
know(frank, barry). know(barry, frank).
know(barry, betsy). know(betsy, barry).
know(betsy, ellen). know(tim, ellen).
know(ellen, tim). know(ellen, betsy).
know(ellen, joan). know(joan, ellen).

dislike(billy, fred).
dislike(sue, jane).
dislike(barry, frank).
dislike(ellen, joan).

checkDislikeOne(X,[First|Rest]):-not(dislike(X,First)),not(dislike(First,X)),checkDislikeOne(X,Rest).
checkDislikeOne(X,[]).

checkDislike([First|Rest]):-checkDislikeOne(First,[First|Rest]),checkDislike(Rest).
checkDislike([]).

checkAffiliationR([First|Rest]):-not(republican(First)),checkAffiliationR(Rest).
checkAffiliationR([]).

checkAffiliationD([First|Rest]):-not(democrat(First)),checkAffiliationD(Rest).
checkAffiliationD([]).

checkAffiliation(R):-checkAffiliationR(R);checkAffiliationD(R).

availableDay(G,[First|Rest]):-available(G,First);availableDay(G,Rest).
availableDay(G,[]):-not(!).

checkDay([First|Rest]):-Day=[monday,tuesday,wednesday,thursday,friday,saturday,sunday],availableDay(First,Day),checkDay(Rest).
checkDay([]).

isThere(X,[First|Rest]):- X=First;isThere(X,Rest).
isThere(X,[X|Rest]).

isMen(X):-men(M),isThere(X,M).

isWomen(X):-women(W),isThere(X,W).

isHuman(X):-isMen(X);isWomen(X).

checkGender([First|Rest]):-isHuman(First),checkGender(Rest).
checkGender([]).

isInteresting(X):-interesting(I),isThere(X,I).

checkInteresting([First|Rest]):-isInteresting(First);checkInteresting(Rest).
checkInteresting([]):-not(!).

isFunny(X):-funny(I),isThere(X,I).

checkFunny([First|Rest]):-isFunny(First);checkFunny(Rest).
checkFunny([]):-not(!).

allMen([First|Rest]):-isMen(First),allMen(Rest).
allMen([]).

allWomen([First|Rest]):-isWomen(First),allWomen(Rest).
allWomen([]).

setHere([First|Rest]):-not(isThere(First,Rest)),setHere(Rest).
setHere([]).

menByNumber(M,N):-length(M,N),allMen(M),setHere(M).

womenByNumber(W,N):-length(W,N),allWomen(W),setHere(W).

equal([M|M1],[W|W1],[M,W|G]):-equal(M1,W1,G).
equal([],[],[]).

equalGender(G,N):-menByNumber(M,N1),womenByNumber(W,N1),N is N1 + N1,equal(M,W,G).

knowOne(X,[First|Rest]):-know(X,First);knowOne(X,Rest).
knowOne(X,[]):-not(!).

checkKnow([First|Rest],L):-knowOne(First,L),checkKnow(Rest,L).
checkKnow([],L).

finalList(Gs,N):-length(Gs,N),equalGender(Gs,N),checkDislike(Gs),checkAffiliation(Gs),checkDay(Gs),checkGender(Gs),checkInteresting(Gs),checkFunny(Gs),checkKnow(Gs,Gs).
