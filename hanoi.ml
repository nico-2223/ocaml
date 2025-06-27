let move (ori, des) =      if ori = 1 && des = 2 then "1 -> 2    3\n"
                      else if ori = 2 && des = 1 then "1 <- 2    3\n"
                      else if ori = 1 && des = 3 then "1 ---2--> 3\n"
                      else if ori = 3 && des = 1 then "1 <--2--- 3\n"
                         else "1    2 <- 3\n";;

let otro ori des = if ori <> 3 && des <> 3 then 3 else abs (ori - des);; 

let rec hanoi n ori des = 
    (* n número de discos, 1 <= ori <= 3, 1 <= dest <= 3, ori <> des *)
    if n = 0 then "" else
    let otro = otro ori des in
    hanoi (n-1) ori otro ^ move (ori, des) ^ hanoi (n-1) otro des;;
    
let hanoi n ori des =
    if n = 0 || ori = des then "\n"
    else hanoi n ori des;;
       
let print_hanoi n ori des =
    if n < 0 || ori < 1 || ori > 3 || des < 1 || des > 3
       then print_endline  " ** ERROR ** \n"
       else print_endline (" =========== \n" ^ 
                           hanoi n ori des ^
                           " =========== \n");;

let rec nth_hanoi_move n nd ori des = 
    if nd = 1 then (ori, des)
    else
         let half_moves = (1 lsl (nd - 1)) - 1 in

         if n <= half_moves then
                nth_hanoi_move n (nd - 1) ori (otro ori des)
         else if n = half_moves + 1 then
                (ori, des)
         else
                nth_hanoi_move (n - half_moves - 1) (nd - 1) (otro ori des) des;;


let crono f x =
        let t = Sys.time () in
        let _ = f x in
        Sys.time () -. t;;

(* Tiempo para hanoi 20: 0.295606 segundos
   Tiempo para hanoi 21: 0.584827 segundos
   Tiempo para hanoi 22: 1.089889 segundos
   Tiempo para hanoi 23: 2.053251 segundos
   Tiempo para hanoi 24: 4.017443 segundos
   Tiempo para hanoi 25: 7.948710 segundos

   Se puede apreciar que lentamente se empieza a notar un crecimiento cuadratico, 
   y que a partir de 25 discos, el tiempo crece de manera desmesurada, aunque todos los tiempos
   tienden a O(n²)

 *)


(* Tiempo para nth_hanoi_move con 25 discos (movimiento 335): 0.000005 segundos
   Tiempo para nth_hanoi_move con 25 discos (movimiento 335544): 0.000006 segundos
   Tiempo para nth_hanoi_move con 25 discos (movimiento 33554435): 0.000005 segundos
   Tiempo para hanoi_nth con 25 discos (movimiento 33): 0.000006 segundos

   Como bien podemos apreciar, por mucho que variemos el n (n de movimiento que queremos saber) 
   el tiempo seguirá siendo casi constante si mantenemos el mismo nd de discos, es decir, los tiempos
   tienden a O(nd)

*)
