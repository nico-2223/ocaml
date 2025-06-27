(* error de ejecucion = exceptium *)
let maximo = max_int;;
(* val maximo : int = 4611686018427387903 *)

let minimo = min_int;;
(* val minimo : int = -4611686018427387904 *)

minimo + maximo;;
(* - : int = -1 *)

minimo + maximo + 1;;
(* - : int = 0 *)

maximo + 1;;
(* - : int = -4611686018427387904 *)

minimo = maximo + 1;;
(* - : bool = true *)

2 * minimo;;
(* - : int = 0 *)

minimo - 1 = maximo;;
(* - : bool = true *)

2 * maximo;;
(* - : int = -2 *)

let maximo = 1./.0.;;
(* val maximo : float = infinity *)

let minimo = -1.0/.0.;;
(* val minimo : float = neg_infinity *)

1./. maximo;;
(* - : float = 0. *)

1./. minimo;;
(* - : float = -0. *)

1./. maximo = 1./. minimo;;
(* - : bool = true *)

0./.0.;;
(* - : float = nan *)

maximo +. maximo;;
(* - : float = infinity *)

maximo -. maximo;;
(* - : float = nan *)

-. maximo = minimo;;
(* - : bool = true *)

maximo +. minimo;;
(* - : float = nan *)

not (minimo < maximo);;
(* - : bool = false *)

let not = "no";;
(* val not : string = "no" *)

(* not (minimo < maximo);; *)
(* Error de tipos, not es un string y maximo y minimo son floats *)

Stdlib.not (minimo < maximo);;
(* - : bool = false *)

not^not;;
(* - : string = "nono" *)

let x = 1;;
(* val x : int = 1 *)

let x = 2 in x + x * x;;
(* - : int = 6 *)

1 + let x = 2 in x + x * x;;
(* - : int = 7 *)

x + let x = 2 in x * x;;
(* - : int = 5 *)

let y = x + let x = 2 in x * x;;
(* val y : int = 5 *)

let x = x + 1 in let x = 3 * x in x * x;;

(* - : int = 36 *)

(function x -> 2 * x);;
(* - : int -> int = <fun> *)

(function x -> 2 * x) (2 + 1);;
(* - : int = 6 *)

(function x -> 2 * x) 2 + 1;;
(* - : int = 5 *)

(function y -> 2 * y) ((function y -> 2 * y) 3);;
(* - : int = 12 *)

let doble = function z -> 2 * z;;
(* val doble : int -> int <fun> *)

doble 2 + 1;;
(* - : int = 5 *)

doble (doble 3);;
(* - : int = 12 *)

(* doble doble 3;; *)
(* Error de tipos, ya que sin paréntesis se rompe la prioridad y la funcion doble actua sobre otra funcion en vez de un entero *)

abs (1 - 2);;
(* - : int = 1 *)

abs 1;;
(* - : int = 1 *)

(* abs -1;; *)
(* Error de tipos ya que un numero negativo debe llevar paréntesis en una expresión similar *)

let abs = function x -> if x >= 0. then x else -.x;;
(* val abs : float -> float <fun> *)

(* abs 1;; *)
(* Error de tipos, ya que la función espera un float y le pasas un int *)

abs 1.5;;
(* - : float = 1.5 *)

Stdlib.abs 1;;
(* - : int = 1 *)

let suma = function (x,y) -> x + y;;
(* val suma : int * int -> int <fun> *)

2 * suma (2,3) - suma(1,1);;
(* - : int = 8 *)

let suma' = function x -> (function y -> x + y);;
(* val suma' : int -> int -> int = <fun> *)

suma' 3;;
(* - : int -> int = <fun> *)

(suma' 3) 2;;
(* - : int = 5 *)

suma' 3 2;;
(* - : int = 5 *)

suma (3,2) = suma' 3 2;;
(* - : bool = true *)

(* suma 3;; *)
(* Error de tipos ya que 3 es un int y esperaba un int * int *)

let suma3 = suma' 3;;
(* val suma3 : int -> int = <fun> *)

suma3 10;;
(* - : int = 13 *)

suma3 2 + 1;;
(* - : int = 6 *)

suma3 (suma3 10);;
(* - : int = 16 *)

(* suma3 suma3 10;; *)
(* Error de tipos, ya que la función suma3 espera un int, pero recibe una función de int a int *)


































































