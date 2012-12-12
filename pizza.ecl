:-lib(lists).
:-lib(fd).
:-lib(fd_search).

prefs(peter,[PV,PM,PB,PS,PT,PG,PC,PA]):-
	PV+PM+PB+PS+PT+PG+PC #= PA,
	PA #<=5,
	PA #>=4,
	PV#>=1,
	PV#<=2,
	PB#=1,
	PS#= 0,
	PG#>=1.

prefs(roland,[PV,PM,PB,PS,PT,PG,PC,PA]):-
	PV+PM+PB+PS+PT+PG+PC #=PA,
	PA #<=5,
	PA #>=4,
	PV#<=1,
	PM#<=1,
	PB#<=1,
	PS#<=1,
	PT#<=1,
	PC#<=1.

prefs(thomas,[PV,PM,PB,PS,PT,PG,PC,PA]):-
	PV+PM+PB+PS+PT+PG+PC #=PA,
	PA #<=4,
	PA #>=3,
	PV#>=1,
	PB#=1,
	PS#=0,
	PM#=0,
	PC#=0,
	PG#<=1.

prefs(david,[PV,PM,PB,PS,PT,PG,PC,PA]):-
	PV+PM+PB+PS+PT+PG+PC #=PA,
	PA#<=3,
	PA#>=2,
	PV#=0,
	PT#=0,
	PM#<=2,
	PB#<=2,
	PS#<=2,
	PG#<=2,
	PC#<=2.

prefs(tim,[PV,PM,PB,PS,PT,PG,PC,PA]):-
	PV+PM+PB+PS+PT+PG+PC #=PA,
	PA #<=4,
	PA #>=3,
	PB#>=1,
	PG#=0,
	PV#=0,
	PT#=0,
	PC#=0.

prefs(ashley,[PV,PM,PB,PS,PT,PG,PC,PA]):-
	PV+PM+PB+PS+PT+PG+PC #=PA,
	PA #=3,
	PG#=1,
	PB#=1,
	PM#=1.	

prefs(sandy,[PV,PM,PB,PS,PT,PG,PC,PA]):-
	PV+PM+PB+PS+PT+PG+PC #=PA,
	PA #<= 4,
	PA #>= 0,
	PB#=0,
	PS#=0,
	PT#=0,
	PC#=0.	

pizza([C|Cs],Vars,A):-
	prefs(C,CP),print("Prefs for "),print(C),nl,
	CP::0..100,
	append([CP],A,A1),
	pizza(Cs,Vars,A1).
pizza([],V,V):-
	checkEven(V,V,[0,0,0,0,0,0,0,0]).	


checkEven(V,[First|Rest],Check):-
	First = [PV,PM,PB,PS,PT,PG,PC,PA],
	Check = [PV1,PM1,PB1,PS1,PT1,PG1,PC1,PA1],
	PV2 #= PV1+PV,PM2 #=PM+PM1,PB2#=PB+PB1,PS2#=PS1+PS,PT2#=PT+PT1,PG2#=PG+PG1,PC2#=PC+PC1,PA2 #=PA1+PA,
	Check1 = [PV2,PM2,PB2,PS2,PT2,PG2,PC2,PA2],
	checkEven(V,Rest,Check1).
checkEven(V,[],Check):-
	Check = [PV,PM,PB,PS,PT,PG,PC,PA],print(Check),nl,
	Half = [PHL,PHM,PVL,PVM,PML,PMM,PBL,PBM,PSL,PSM,PTL,PTM,PGL,PGM,PCL,PCM],
	Half :: 0..100,
	PV #= PVL*4+PVM*3,
	PM #= PML*4+PMM*3,
	PB #= PBL*4+PBM*3,
	PS #= PSL*4+PSM*3,
	PT #= PTL*4+PTM*3,
	PG #= PGL*4+PGM*3,
	PC #= PCL*4+PCM*3,
	PV+PM+PB+PS+PT+PG+PC #=PA,

	PHL*2 #=PVL+PML+PBL+PSL+PTL+PGL+PCL,
	PHM*2 #=PVM+PMM+PBM+PSM+PTM+PGM+PCM,
	labeling(V),print(V),nl,
	labeling(Half),print(Half),nl,
	labeling(Check),print(Check).
	
	
	

	