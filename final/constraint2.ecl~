:-lib(lists).
:-lib(fd).
:-lib(fd_search).

calculate(Alcohol):-
	setup(Alcohol),
	solve(Alcohol),
	printC(Alcohol).

setup(Alcohol):-
	Alcohol = [B,W1,W2,W3,W4,W5],
	Alcohol :: [15,31,19,20,16,18],
	B + ((W1+W2+W3+W4+W5)/3)*3 #= 119.

solve(Alcohol):-
	alldifferent(Alcohol),
	labeling(Alcohol).

printC(Alcohol):-
	Alcohol = [B,W1,W2,W3,W4,W5],
	printf("%3d\n", [B]). 