let f n = if n mod 2 = 0 then n / 2 else 3 * n + 1;;

let aux x y = (fst x + fst y, max (snd x) (snd y));;

let rec length'n'top n = if n <= 1 then (1, 1) 
			 else aux (1, n) (length'n'top (f n));;
