:-lib(lists).
:-lib(fd).
:-lib(fd_search).

calculate(Moves):-
	setup(Moves).

setup(Grid):-
	Moves = [M11,M12,M13,M14,M21,M22,M23,M24,M31,M32,M33,M34,M41,M42,M43,M44],
	Grid = [G11,G12,G13,G14,G21,G22,G23,G24,G31,G32,G33,G34,G41,G42,G43,G44],
	Token = [T11,T12,T13,T14,T21,T22,T23,T24,T31,T32,T33,T34,T41,T42,T43,T44],
	Moves :: 0..2,
	Grid :: 1..16,
	Token :: 1..16,

	G11 #= (T11/2)*2,
	G12 #= (T12/2)*2,
	G13 #= (T13/2)*2,
	G14 #= (T14/2)*2,
	G21 #= (T21/2)*2,
	G22 #= (T22/2)*2,
	G23 #= (T23/2)*2,
	G24 #= (T24/2)*2,
	G31 #= (T31/2)*2,
	G32 #= (T32/2)*2,
	G33 #= (T33/2)*2,
	G34 #= (T34/2)*2,
	G41 #= (T41/2)*2,
	G42 #= (T42/2)*2,
	G43 #= (T43/2)*2,
	G44 #= (T44/2)*2,

	G11 #= M11+M12+M13+M14+M21+M31+M41+1,
	G12 #= M11+M12+M13+M14+M22+M32+M42+1,
	G13 #= M11+M12+M13+M14+M23+M33+M43+1,
	G14 #= M11+M12+M13+M14+M24+M34+M44+1,
	G21 #= M21+M22+M23+M24+M11+M31+M41+1,
	G22 #= M21+M22+M23+M24+M12+M32+M42,
	G23 #= M21+M22+M23+M24+M13+M33+M43,
	G24 #= M21+M22+M23+M24+M14+M34+M44,
	G31 #= M31+M32+M33+M34+M11+M21+M41+1,
	G32 #= M31+M32+M33+M34+M12+M22+M42,
	G33 #= M31+M32+M33+M34+M13+M23+M43,
	G34 #= M31+M32+M33+M34+M14+M24+M44,
	G41 #= M41+M42+M43+M44+M11+M21+M31+1,
	G42 #= M41+M42+M43+M44+M12+M22+M32,
	G43 #= M41+M42+M43+M44+M13+M23+M33,
	G44 #= M41+M42+M43+M44+M14+M24+M34,
	

	Count = M11+M12+M13+M14+M21+M22+M23+M24+M31+M32+M33+M34+M41+M42+M43+M44,
		
	labeling(Token),
	labeling(Grid).
	
	