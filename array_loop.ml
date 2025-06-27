let append a1 a2 =
        if(Array.length a1 + Array.length a2 > Sys.max_array_length) then
                raise(Invalid_argument "append")
        else
                let res = Array.init (Array.length a1 + Array.length a2) (fun a -> a1.(0)) in
                for i = 0 to (Array.length a1 - 1) do
                        res.(i) <- a1.(i);
                done;
                let x = Array.length a1 in
                for i = 0 to (Array.length a2 - 1) do
                        res.(x + i) <- a2.(i);
                done;
                res;;

let sub a1 pos len =
        if(pos < 0 || len < 0 || pos + len > Array.length a1) then
                raise(Invalid_argument "sub")
        else
                Array.init (len + 1 - pos) (fun a -> a1.(a + pos));;

let copy a1 =
        Array.init (Array.length a1) (fun a -> a1.(a));;
        
let fill a pos n e =
        if pos < 0 || n < 0 || (pos + n > Array.length a) then raise(Invalid_argument "fill")
        else for i = pos to (n - 1) do
                a.(i) <- e;
        done;;

let blit a1 pos1 ad pos2 len =
        if pos1 < 0 || pos2 < 0 || len > Array.length a1 - pos1 || len > Array.length ad - pos2 || len < 0 then raise(Invalid_argument "blit")
        else
        let p1 = ref pos1 in
        let p2 = ref pos2 in
        for i = 1 to len do
                ad.(!p2) <- a1.(!p1);
                p1 := !p1 + 1;
                p2 := !p2 + 1;
        done;;
        
let to_list a =
        let l = ref [] in
        for i = (Array.length a - 1) downto 0 do
                l := a.(i)::!l;
        done;
        !l;;

let iter (y: 'a -> unit) a =
        for i = 0 to (Array.length a -1) do
                y (a.(i));
        done;;

let fold_left e ini a =
        let acc = ref ini in
        for i = 0 to (Array.length a - 1) do
                acc := (e !acc a.(i));
        done;
        !acc;;

let for_all y a = 
        let x = ref true in
        let i = ref 0 in
        while !i < Array.length a && !x = true do
                if(y(a.(!i)) == false) then (x := false;)
                else i := !i + 1;
        done;
        !x;;
        
let exists y a =
        let x = ref false in
        let i = ref 0 in
        while !i < Array.length a && !x = false do
                if(y(a.(!i)) == true) then (x := true;)
                else i := !i + 1;
        done;
        !x;;

let find_opt y a =
        let x = ref None in
        let i = ref 0 in
        while !i < Array.length a && !x = None do
                if(y(a.(!i)) == true) then (x := Some a.(!i);)
                else i := !i + 1;
        done;
        !x;;
