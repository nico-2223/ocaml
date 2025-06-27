(* valores de ejemplo *)
(* let x = 1;
let y = (-2);
let z = 5; *)

(function true -> "first is greater" |
	false -> "second is greater") (x > y);;
(* salida estimada con valores de ejemplo: "first is greater" *)

(function true -> x |
	false -> (-1)* x) ( x > 0);;
(* salida estimada con valores de ejemplo: 1 *)

(function true -> x |
	false -> (function true -> y |
		false -> 0) (y>0)) (x > 0);;
(* salida estimada con valores de ejemplo: 1 *)

(function true -> (function true -> x 
	| false -> z) (x > z) 
		| false -> (function true -> y 
			| false -> z) (y > z)) (x > y);;
(* salida estimada con valores de ejemplo: 5 *)
