proper_list([]).
proper_list([_Head|Tail]) :-
    proper_list(Tail).

append([], C, C).
append([A|B], C, [A|BC]) :-
    append(B, C, BC).

take(N, List, Front) :-
    length(Front, N),
    append(Front, _, List).

member(Elt, List) :-
    append(_, [Elt|_], List).

member2(Elt, [Elt|_]).
member2(Elt, [_|Rest]) :-
    member2(Elt, Rest).

rev1([], []).
rev1([A|BC], CBA) :-
    rev1(BC, CB),
    append(CB, [A], CBA).
    
rev3(ABC, CBA) :-
    samelength(ABC, CBA),
    rev1(ABC, CBA).

same([], []).
samelength([_|Xs], [_|Ys]) :-
    samelength(Xs, Ys).

fact(0, 1).
fact(N, Fact) :-
    N > 0,
    N1 is N-1,
    fact(N1, F1),
    Fact is N * F1.

