int(1).
int(X):-int(Y),X is Y+1.

answer(X):-write("Answer yes or no"),myRead(Y),trans(Y,X).
myRead(X):-read(X).
trans(yes,yes):-!.
trans(no,no):-!.
trans(n,no):-!.
trans(y,yes):-!.
trans(ok,yes):-!.
trans(nope,no):-!.

trans(X,Y):-answer(Y).
