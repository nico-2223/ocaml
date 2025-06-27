let hd x =
        match x with
        [] -> raise(Failure "lista hd")
        | h::t -> h;;
(* bien *)
let tl x =
        match x with
        [] -> raise(Failure "tl")
        | h::t -> t;;
(* bien *)
let rec last x =
        match x with
        [] -> raise(Failure "tl")
        | h::[] -> h
        | h::t -> last t;;
(* bien *)
let rec length x =
        match x with
        [] -> 0
        | h::t -> 1 + length t;;
(* bien *)
let length' x =
        let rec aux l acc =
                match (l,acc) with
                [],sum -> sum
                | h::t,sum -> aux t (sum + 1)
        in aux x 0;;
(* bien *)
let rec compare_lengths x y =
        match (x,y) with
        ([], []) -> 0
        | (_, []) -> 1
        | ([], _) -> -1
        | (h1::t1, h2::t2) -> compare_lengths t1 t2;;
(* bien *)
let rec append x y =
        match x with
        [] -> y
        | h::t -> h :: append t y;;
(* not tail recursive *)
(* bien *)

let rev_append x y =
        let rec aux l1 acc =
                match l1 with
                [] -> acc
                | h::t -> aux t (h::acc)
        in aux x y;;
(* tail recursive *)
(* bien *)

let rec rev x = 
        let rec aux l acc =
                match l with
                [] -> acc
                | h::t -> aux t (h::acc)
        in aux x [];;
(* tail recursive *)
(* bien *)

let rec concat x =
        match x with
        [] -> []
        | h :: t -> append h (concat t);;
(* not tail recursive *)
(*  *)
let rec flatten x =
        match x with
        [] -> []
        | h :: t -> append h (flatten t);;
(* not tail recursive *)
(* bien *)
let init x y =
        let rec aux ini f acc1 acc2 =
                if ini = acc1 then acc2
                else aux ini f (acc1 + 1) ((f acc1) :: acc2)
        in rev(aux x y 0 []);;
(* Since 4.06 *)
(* tail recursive *)
(* bien *)

let nth x n =
        if n < 0 then raise(Invalid_argument "nth")
        else 
                let rec aux l n acc =
                        match l with
                        [] -> raise (Failure "nth")
                        | h::t -> if n = acc then h
                                  else aux t n (acc + 1)
                in aux x n 0;;
(* Raises Failure if the list is too short *)
(* Raises Invalid_argument if n is negative *)
(* tail recursive *)
(* bien *)

let rec map x y =
        match y with
        [] -> []
        | h::t -> (x h) :: map x t;;
(* not tail recursive *)
(* bien *)

let rev_map x y =
        let rec aux f l acc =
                match l with
                [] -> acc
                | h::t -> aux f t ((f h) :: acc)
        in aux x y [];;
(* tail recursive *)
(* bien *)

let rec map2 x y z =
        match (y,z) with
        ([], []) -> []
        | (h1::t1, h2::t2) -> x h1 h2 :: map2 x t1 t2
        | _ -> raise (Invalid_argument "map2");;
        
(* Raises Invalid_argument if the two lists have different lengths *)
(* not tail recursive *)
(* bien *)

let rec combine x y =
        match (x,y) with
        ([], []) -> []
        | (h1::t1, h2::t2) -> (h1,h2) :: combine t1 t2
        | _ -> raise (Invalid_argument "combine");;
(* Raises Invalid_argument if the two lists have different lengths *)
(* not tail recursive *)
(* bien *)

let rec split x =
  match x with
  | [] -> ([], [])
  | (a, b) :: t ->
      let (list1, list2) = split t in
      (a :: list1, b :: list2);;

(* not tail recursive *)
(* bien *)

let find x y =
        let rec aux f l =
                match l with
                [] -> raise (Not_found)
                | h::t -> if (f h) = true then h
                          else aux f t
        in aux x y;;
(* tail recursive *)
(* bien *)

let rec filter x y =
        match y with
        [] -> []
        | h::t -> if (x h) = true then h::filter x t
                  else filter x t;;
(* not tail recursive *)
(* bien *)

let filter' x y =
        let rec aux f l acc =
                match l with
                        [] -> acc
                        | h::t -> if (x h) = true then aux f t (h :: acc)
                                  else aux f t acc
        in rev(aux x y []);;
(* tail recursive *)
(* bien *)

let rec partition x y =
        match y with
        [] -> ([], [])
        | h::t -> if (x h) = true then h::fst(partition x t), snd(partition x t)
                  else fst(partition x t), h::snd(partition x t);;
(* not tail recursive *)
(* bien *)

let partition' x y =
        let rec aux f l acc =
                match l with
                [] -> rev(fst acc), (rev(snd acc))
                | h::t -> let l1, l2 = acc in 
                                if (f h) = true then aux f t (h::l1, l2)
                                else aux f t (l1, h::l2)
        in aux x y ([], []);;
(* tail recursive *)
(* bien *)

let for_all x y =
        let rec aux f l =
                match l with
                [] -> true
                | h::t -> if (x h) = true then aux x t
                        else false
        in aux x y;;
(* tail recursive *)
(* bien *)

let exists x y =
        let rec aux f l =
                match l with
                [] -> false
                | h::t -> if (x h) = true then true
                        else aux x t
        in aux x y;;
(* tail recursive *)
(* bien *)

let mem x y =
        let rec aux f l =
                match l with
                [] -> false
                | h::t -> if h = x then true
                        else aux x t
        in aux x y;;
(* tail recursive *)
(* bien *)

let rec fold_left x y z =
        match z with
        [] -> y
        | h::t -> fold_left x (x y h) t;;

(* bien *)

let rec fold_right x y z =
        match y with
        [] -> z
        | h::t -> x h (fold_right x t z);;
(* not tail recursive *)
(* bien *)
