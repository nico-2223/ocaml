let length l = 
        let v = ref 0 in
        let l1 = ref l in
        while(!l1 <> []) do
                l1 := List.tl !l1;
                v := !v + 1
        done;
        !v;;

let last l =
        if(l = []) then raise(Failure "last")
        else
                let l1 = ref l in
                while(List.tl !l1 <> []) do
                        l1 := List.tl !l1
                done;
                List.hd !l1;;
                
let nth l n =
        if(n < 0) then raise(Failure "nth")
                else 
                let l1 = ref l in
                for i = 1 to n do
                        if(!l1 = []) then raise(Failure "nth")
                        else l1 := List.tl !l1
                done;
                List.hd !l1;;
        
let rev l = 
        let l1 = ref [] in
        let laux = ref l in
        while(!laux <> []) do
                l1 := (List.hd !laux)::!l1;
                laux := List.tl !laux
        done;
        !l1;;
        
let append l1 l2 =
        let res = ref [] in
        let l1aux = ref l1 in
        let l2aux = ref l2 in
        while(!l1aux <> []) do
                res := (List.hd !l1aux)::!res;
                l1aux := List.tl !l1aux
        done;
        while(!l2aux <> []) do
                res := (List.hd !l2aux)::!res;
                l2aux := List.tl !l2aux
        done;
        rev !res;;
        
let concat l =
        let laux = ref l in
        let res = ref [] in
        while(!laux <> []) do
                res := append !res (List.hd !laux);
                laux := List.tl !laux
        done;
        !res;;

let for_all y l = 
        let x = ref true in
        let l1 = ref l in
        while(!l1 != []) do
                if(y(List.hd !l1) == false) then (x := false;l1 := [])
                else l1 := List.tl !l1
        done;
        !x;;
        
let exists y l = 
        let x = ref false in
        let l1 = ref l in
        while(!l1 != []) do
                if(y(List.hd !l1) == true) then (x := true;l1 := [])
                else l1 := List.tl !l1
        done;
        !x;;

let find_opt y l =
        let x = ref None in
        let l1 = ref l in
        while(!l1 != []) do
                if(y(List.hd !l1) == true) then (x := Some (List.hd !l1);l1 := [])
                else l1 := List.tl !l1
        done;
        !x;;
        
let iter (y: 'a -> unit) l =
        let l1 = ref l in
        while(!l1 <> []) do
                y(List.hd !l1);
                l1 := List.tl !l1
        done;;

let fold_left x ini l =
        let l1 = ref l in
        let res = ref ini in
        while(!l1 <> []) do
                res := x !res (List.hd !l1);
                l1 := List.tl !l1
        done;
        !res;;

