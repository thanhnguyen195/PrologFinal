merger([X],[[First|Rest2]|Rest],[[X,First|Rest2],[First|Rest2]|Rest1]):-merger([X],Rest,Rest1).
merger([X],[[]],[[X],[]]).

powerset([First|Rest],[First1|Rest1]):-powerset(Rest,[First2|Rest2]),merger([First],[First2|Rest2],[First1|Rest1]).
powerset([],[[]]).
