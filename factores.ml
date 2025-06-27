let factoriza x = if x=0 then "0" else if x=1 then "1" else if x = (-1) then "(-1)" else
	let rec aux(n, i) =
                if n < 0 then if n = min_int then "(-1) * 2 * " ^ aux(abs(min_int/2), 2)
                              else "(-1) * " ^ aux(abs x, 2)
		else
                        if i * i > n then string_of_int(n)
		        else
			        if n mod i = 0 then string_of_int(i) ^ " * " ^ aux(n / i, i)
			        else aux(n, i+1)
	in aux(x, 2);;
