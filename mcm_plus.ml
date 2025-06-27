let rec mcd' x y = if (min x y) = 0 then max x y 
                   else mcd' ((max x y) mod (min x y)) (min x y);;

let mcm' x y = 
        if x <= 0 || y <= 0 then raise (Invalid_argument "mcm': argumento invalido")
        else if x > (max_int / y) || y > (max_int / y) then raise (Invalid_argument "mcm excede max_int")
        else x / (mcd' (x mod max_int) (y mod max_int)) * y;;
