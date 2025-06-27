type move = LtoC | LtoR | CtoL | CtoR | RtoL | RtoC

(* para que sea estable, no puede haber repetidos y ningun elemento del palo puede estar encima de uno menor *)

let rec ordenado x =
    match x with
    | [] -> true
    | h::[] -> true
    | h::t -> if h < List.hd t then ordenado t
              else false;;

let repetido x =
    let rec aux seen = function
        | [] -> false
        | h::t -> 
            if List.mem h seen then true
            else aux (h::seen) t
    in aux [] x;;


let is_stable (y, z, t) =
    if y = [] && z = [] && t = [] then true
    else
        (* Verificamos que las tres listas estén ordenadas *)
        if ordenado y && ordenado z && ordenado t then
            let all_elements = y @ z @ t in
            (* Verificamos que no haya elementos repetidos *)
            if not (repetido all_elements) then
                let l = List.length all_elements in
                let expected_sum = (l * (l + 1)) / 2 in
                let actual_sum = List.fold_left (fun acc x -> acc + x) 0 all_elements in
                (* Verificamos que la suma sea la suma triangular esperada *)
                expected_sum = actual_sum
            else
                false
        else
            false;;

                        
let lista_inicial n = List.init n (fun x -> x + 1);;

let all_states x =
  let rec aux ini izq cen der acc =
    match ini with
    [] -> (List.rev izq, List.rev cen, List.rev der) :: acc (* le damos la vuelta a las listas, ya que sin usar @ salen del reves*)
    | h::t ->
        let de = aux t izq cen (h :: der) acc in
        let ce = aux t izq (h :: cen) der de in
        aux t (h :: izq) cen der ce
  in
  aux (List.init x (fun y -> y + 1)) [] [] [] [];;

    
    
let move x y =
        if (is_stable x) = false then raise(Stdlib.invalid_arg "estado inicial incorrecto")
        else
                let l, c, r = x in
                        if y = LtoC then
                                if (l <> [] && (c = [] || (List.hd l) <= (List.hd c))) then let num = List.hd l in (List.tl l, [num] @ c, r)  
                                else raise(Invalid_argument "move")
                        else if y = LtoR then 
                                if (l <> [] && (r = [] || (List.hd l) <= (List.hd r))) then let num = List.hd l in (List.tl l, c, [num] @ r)  
                                else raise(Invalid_argument "move")
                        else if y = CtoL then
                                if (c <> [] && (l = [] || (List.hd c) <= (List.hd l))) then let num = List.hd c in ([num] @ l, List.tl c, r)  
                                else raise(Invalid_argument "move")
                        else if y = CtoR then
                                if (c <> [] && (r = [] || (List.hd c) <= (List.hd r))) then let num = List.hd c in (l, List.tl c, [num] @ r)  
                                else raise(Invalid_argument "move")
                        else if y = RtoL then
                                if (r <> [] && (l = [] || (List.hd r) <= (List.hd l))) then let num = List.hd r in ([num] @ l, c, List.tl r)  
                                else raise(Invalid_argument "move")
                        else
                                if (r <> [] && (c = [] || (List.hd r) <= (List.hd c))) then let num = List.hd r in (l, [num] @ c, List.tl r)  
                                else raise(Invalid_argument "move");;

let rec move_sequence x y =
        match y with
                [] -> x
                | h::t -> try move_sequence (move x h) t
                          with 
                          Invalid_argument m -> raise (Invalid_argument "move_sequence");;



