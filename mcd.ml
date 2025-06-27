let rec mcd x y = if (min x y) = 0 then max x y 
                   else mcd ((max x y) - (min x y)) (min x y);;

let rec mcd' x y = if (min x y) = 0 then max x y 
                   else mcd' ((max x y) mod (min x y)) (min x y);;
