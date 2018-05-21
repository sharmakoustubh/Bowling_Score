-module(bowling).
-export([compute_score/2]).
-compile(export_all).

compute_score(Throws)->
    compute_score(Throws, 0).

compute_score([], Result)->
    Result;

compute_score([_,$/,V1|T], Result) ->
    compute_score([V1|T], Result + 10 + points(V1));

compute_score([$X,V1,$/|T], Result) ->
    compute_score([V1,$/|T], Result + 20);

compute_score([$X,V1,V2|T], Result) ->
    compute_score([V1,V2|T], Result + 10 + points(V1) + points(V2));

compute_score([H|T],Result) ->
    compute_score( T, Result + points(H)).

points($X) ->
    10;
points($-) ->
    0;
points(X)->
    list_to_integer([X]).
  
