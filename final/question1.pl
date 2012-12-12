
%isThere(X,[First|Rest]):-isThere(X,Rest).
%isThere(X,[X|Rest]).

%isPrefix([],[]).
%isPrefix([],[X|Rest]).
%isPrefix([First|Rest],[First|Rest1]):-isPrefix(Rest,Rest1).

%isPrefixList([First|Rest],[First1|Rest1]):-isPrefix(First1,[First|Rest]),isPrefixList([First|Rest],Rest1).
%isPrefixList([First|Rest],[]).

%isPrefixListE([First,Second|Rest],[First1|Rest1]):-isThere([First],[First1|Rest1]),isThere([Second],[First1|Rest1]).

%merger([X],[[First|Rest2]|Rest],[[X,First|Rest2]|Rest1]):-merger([X],Rest,Rest1).
%merger([X],[],[]).

prefixesPart([First2|Rest2],[First|Rest],[First1|Rest1]):-[First2|Rest2]=First1,combine([First2|Rest2],First,R),prefixes(R,Rest,Rest1).
prefixesPart(R,[],[[],R]).

combine([First],X,[First,X]).
combine([First|Rest],X,[First|Rest1]):-combine(Rest,X,Rest1).

prefixes([First|Rest],[First1|Rest1]):-prefixesPart([First],Rest,[First1|Rest1]).
prefixes([],[[]]).




