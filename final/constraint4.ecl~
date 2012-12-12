:-lib(lists).
:-lib(fd).
:-lib(fd_search).

calculate(Eggs):-
	setup(Eggs),
	solve(Eggs),
	printC(Eggs).

setup(Eggs):-
	Eggs = [E,T1,T2,T3,T4,T5,T6],
	Eggs :: 1..10000,
	T1*2+1#=E,
	T2*3+1#=E,
	T3*4+1#=E,
	T4*5+1#=E,
	T5*6+1#=E,
	T6*7#=E.

solve(Eggs):-
	Eggs=[E,T1,T2,T3,T4,T5,T6],
	minimize(labeling(Eggs),E).

printC(Eggs):-
	Eggs = [E,T1,T2,T3,T4,T5,T6],
	printf("%3d\n",[E]).

	AC-AD #= CE-DE,
	AD-AE #= BD-BE,
	AC-BC #= AD-BD.