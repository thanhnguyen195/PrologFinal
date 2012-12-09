:-lib(lists).
:-lib(fd).
:-lib(fd_search).

calculate(Moves):-
	setup(Moves),
	solve(Moves).

move([M],[M|Rgrid],R):-move([],Rgrid,R).
move([M],[Fgrid|Rgrid],[Fgrid|Rnewgrid]):-move([M],Rgrid,Rnewgrid).
move([M],[],[M]).
move([],[],[]).
move([],R,R).

checkMoves([Fmove|Rmove],Grid):-Fmove = [],checkMoves(Rmove,Grid).	
checkMoves([Fmove|Rmove],Grid):-
	Fmove = [X,Y],
	move([[1,Y]],Grid,Grid1),
	move([[2,Y]],Grid1,Grid2),
	move([[3,Y]],Grid2,Grid3),
	move([[4,Y]],Grid3,Grid4),
	move([[X,1]],Grid4,Grid5),
	move([[X,2]],Grid5,Grid6),
	move([[X,3]],Grid6,Grid7),
	move([[X,4]],Grid7,Grid8),
	move([[X,Y]],Grid8,Newgrid),
	checkMoves(Rmove,Newgrid).
checkMoves([],[]).

setup(Moves):-
	Moves = [M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,M16],
	Moves :: [[],[1,1],[1,2],[1,3],[1,4],[2,1],[2,2],[2,3],[2,4],[3,1],[3,2],[3,3],[3,4],[4,1],[4,2],[4,3],[4,4]].


solve(Moves):-
	Grid = [[1,1],[1,2],[1,3],[1,4],[2,1],[2,2],[2,3],[2,4],[3,1],[3,2],[3,3],[3,4],[4,1],[4,2],[4,3],[4,4]],
	checkMoves(Moves,Grid),
	labeling(Moves).
	