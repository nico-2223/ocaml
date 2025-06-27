let absi x = if x >= 0 then x else x * (-1);;

let rec sumto = function 0 -> 0 |
	n -> n + sumto(n-1);;

let rec exp2 = function 0 -> 1 |
	n -> 2 * exp2(n-1);;

let rec num_cifras = function n -> if 10>n && n>(-10) then 1 
	else 1+num_cifras(n/10);;

let rec sum_cifras = function n -> if 10>n && n>(-10) then abs(n) 
	else (abs(n) mod 10) + sum_cifras(n/10);;
