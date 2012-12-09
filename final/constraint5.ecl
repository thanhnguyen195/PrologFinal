:-lib(lists).
:-lib(fd).
:-lib(fd_search).

calculate(Hays,Hayscombine):-
	setup(Hays,Hayscombine),
	solve(Hays,Hayscombine),
	printc(Hays,Hayscombine).

setup(Hays,Hayscombine):-
	Hays = [A,B,C,D,E],
	Hays :: 1..1000,
	Hayscombine = [Ab,Ac,Ad,Ae,Bc,Bd,Be,Cd,Ce,De],
	Hayscombine :: [110,112,113,114,115,116,117,118,120,121],
	A + B #= Ab,
	A + C #= Ac,
	A + D #= Ad,
	A + E #= Ae,
	B + C #= Bc,
	B + D #= Bd,
	B + E #= Be,
	C + D #= Cd,
	C + E #= Ce,
	D + E #= De.


solve(Hays,Hayscombine):-
	alldifferent(Hayscombine),
	labeling(Hayscombine),
	labeling(Hays).

printc(Hays,HaysCombine):-
	Hayscombine = [Ab,Ac,Ad,Ae,Bc,Bd,Be,Cd,Ce,De],
	Hays = [A,B,C,D,E],
	printf("%3d%3d%3d%3d%3d",[A,B,C,D,E] ).

