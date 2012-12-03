
isThere(X,[First|Rest]):-isThere(X,Rest).
isThere(X,[X|Rest]).

isPrefix([],[]).
isPrefix([],[X|Rest]).
isPrefix([First|Rest],[First|Rest1]):-isPrefix(Rest,Rest1).

isPrefixList([First|Rest],[First1|Rest1]):-isPrefix(First1,[First|Rest]),isPrefixList([First|Rest],Rest1).
isPrefixList([First|Rest],[]).

isPrefixListE([First,Second|Rest],[First1|Rest1]):-isThere([First],[First1|Rest1]),isThere([Second],[First1|Rest1]).
