let i_prod x = List.fold_left (fun acc y -> acc * y) 1 x;;

let f_prod x = List.fold_left (fun acc y -> acc *. y) 1. x;;

let lmin x =
        match x with
        [] -> raise(Failure "min")
        | h::t -> List.fold_left (fun acc y -> min acc y) h x;;

let min_max x =
        match x with
        [] -> raise(Failure "min_max")
        | h::t -> List.fold_left (fun acc y -> min (fst acc) y , max (snd acc) y) (h, h) x;;
        
let rev x = List.fold_left (fun acc y -> y::acc) [] x;;

let rev_append x z = List.fold_left (fun acc y -> y::acc) z x;;
        
let rev_map x z =
        match z with
        [] -> raise(Failure "rev_map")
        | h::t -> List.fold_left (fun acc y -> (x y)::acc) [] z;;

let concat x = List.fold_left (fun acc y -> acc ^ y) "" x;; 

