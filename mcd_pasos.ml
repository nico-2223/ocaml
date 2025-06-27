let sum1 x y = (fst y, snd x + (snd y));;

let rec mcd_pasos x y = if (min x y) = 0 then ((max x y), 1) 
			else sum1 (0, 1) (mcd_pasos((max x y) mod (min x y)) (min x y));;
