:- lib(lists).
:- lib(fd).
:- lib(fd_search).

calculate(Numbers,Num) :-
	setup(Numbers,Num),
	solve(Numbers,Num),
	printC(Numbers,Num).

calculateMax(Numbers,Num) :-
	setup(Numbers,Num),
	solve1(Numbers,Num),
	printC(Numbers,Num).

setup(Numbers,Num):-
	Numbers = [N2,N3,X2,Y2,Z2],
	Num = [N1,X1,Y1,Z1],
	Numbers :: 0..9,
	Num :: 1..9,
	(N1*100+N2*10+N3)*(X1*10+X2)#=(Y1*10+Y2)*(Z1*10+Z2).

solve1(Numbers,Num):-
	Numbers = [N2,N3,X2,Y2,Z2],
	Num = [N1,X1,Y1,Z1],
	Combine = [N1,N2,N3,X1,X2,Y1,Y2,Z1,Z2],
	X #= 0 - (Y1*10+Y2)*(Z1*10+Z2),
	minimize(labeling(Combine),X).

solve(Numbers,Num):-
	Numbers = [N2,N3,X2,Y2,Z2],
	Num = [N1,X1,Y1,Z1],
	X #= 0 - (Y1*10+Y2)*(Z1*10+Z2),
	labeling(Numbers),
	labeling(Num).

printC(Numbers,Num):-
	Numbers = [N2,N3,X2,Y2,Z2],
	Num = [N1,X1,Y1,Z1],
	printf("%3d%3d%3d\n",[N1,N2,N3]),
	printf("%3d%3d\n",[X1,X2]),
	printf("%3d%3d\n",[Y1,Y2]),
	printf("%3d%3d\n",[Z1,Z2]).