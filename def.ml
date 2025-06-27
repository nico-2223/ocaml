let pi = 2. *. asin(1.);;

let e = exp(1.);;

let max_int_f = float_of_int(max_int);;

let per = function x -> if x >= 0. then (2. *. x *. pi) 
	else -1.;;

let area = function x -> if x >= 0. then (x *. x *. pi) 
	else -1.;;

let next_char = function x -> char_of_int(int_of_char(x) + 1);;

let absf = function x -> if x >= 0. then x 
	else x *. (-1.);;

let odd = function x -> if x mod 2 = 0 then true 
	else false;;

let next5mult = function x -> if  x < (0) then 5 * ((x / 5))  
	else 5 * ((x / 5) + 1);;

let is_letter = function x -> if x >= 'a' && x<='z' then true 
	else false;;

let string_of_bool = function x -> string_of_bool(x);;


