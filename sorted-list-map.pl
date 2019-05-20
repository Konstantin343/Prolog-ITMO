concat([], B, B).
concat([H | T], B, [H | R]) :- concat(T, B, R).

map_put([], K, V, [(K, V)]).
map_put([(K, OV) | T], K, V, [(K, V) | T]).  
map_put([(CK, CV) | T], K, V, R) :- K < CK, concat([(K, V)], [(CK, CV)], R1), concat(R1, T, R).
map_put([(CK, CV) | T], K, V, R) :- K > CK, map_put(T, K, V, R1), concat([(CK, CV)], R1, R).   

map_get([(K, V) | T], K, V).
map_get([(CK, CV) | T], K, V) :- K > CK, map_get(T, K, V).

map_remove([], K, []).
map_remove([(K, CV) | T], K, T).
map_remove([(CK, CV) | T], K, R) :- K < CK, concat([(CK, CV)], T, R).
map_remove([(CK, CV) | T], K, R) :- K > CK, map_remove(T, K, R1), concat([(CK, CV)], R1, R).

map_replace([], K, V, []).
map_replace([(K, OV) | T], K, V, [(K, V) | T]).
map_replace([(CK, CV) | T], K, V, R) :- K < CK, concat([(CK, CV)], T, R).
map_replace([(CK, CV) | T], K, V, R) :- K > CK, map_replace(T, K, V, R1), concat([(CK, CV)], R1, R).   