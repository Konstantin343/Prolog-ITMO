concat([], Second, Second).
concat([Head | Tail], Second, [Head | Result]) :- concat(Tail, Second, Result).

map_put([], Key, Value, [(Key, Value)]).
map_put([(Key, OldValue) | Tail], Key, Value, [(Key, Value) | Tail]).  
map_put([(CurKey, CurValue) | Tail], Key, Value, Result) :- Key < CurKey, concat([(Key, Value)], [(CurKey, CurValue)], Part), concat(Part, Tail, Result).
map_put([(CurKey, CurValue) | Tail], Key, Value, Result) :- Key > CurKey, map_put(Tail, Key, Value, Part), concat([(CurKey, CurValue)], Part, Result).   

map_get([(Key, Value) | Tail], Key, Value).
map_get([(CurKey, CurValue) | Tail], Key, Value) :- Key > CurKey, map_get(Tail, Key, Value).

map_remove([], Key, []).
map_remove([(Key, CurValue) | Tail], Key, Tail).
map_remove([(CurKey, CurValue) | Tail], Key, Result) :- Key < CurKey, concat([(CurKey, CurValue)], Tail, Result).
map_remove([(CurKey, CurValue) | Tail], Key, Result) :- Key > CurKey, map_remove(Tail, Key, Part), concat([(CurKey, CurValue)], Part, Result).

map_replace([], Key, Value, []).
map_replace([(Key, OldValue) | Tail], Key, Value, [(Key, Value) | Tail]).
map_replace([(CurKey, CurValue) | Tail], Key, Value, Result) :- Key < CurKey, concat([(CurKey, CurValue)], Tail, Result).
map_replace([(CurKey, CurValue) | Tail], Key, Value, Result) :- Key > CurKey, map_replace(Tail, Key, Value, Part), concat([(CurKey, CurValue)], Part, Result).   