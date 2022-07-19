(* A naive implementation of the [merge_sort] algorithm *)
let merge_sort (l : int list) : int list =
  let merge (l : int list) (l' : int list) : int list =
    let[@coq_struct "acc"] rec merge_aux (l : int list) (l' : int list)
        (acc : int list) : int list =
      match (l, l') with
      | [], [] -> List.rev acc
      | _, [] -> List.rev acc @ l
      | [], _ -> List.rev acc @ l'
      | x :: xs, y :: ys ->
          if x = y then merge_aux xs ys (x :: y :: acc)
          else if x < y then merge_aux xs l' (x :: acc)
          else merge_aux l ys (y :: acc)
    in
    merge_aux l l' []
  in
  let split (l : int list) : int list * int list =
    let[@coq_struct "acc"] rec split_aux (l : int list) (acc : int list)
        (i : int) : int list * int list =
      if i == 0 then (l, List.rev acc)
      else
        match l with
        | [] -> (l, List.rev acc)
        | x :: xs -> split_aux xs (x :: acc) (i - 1)
    in
    split_aux l [] (List.length l / 2)
  in
  let rec aux (l : int list) : int list =
  match l with
    | [] -> []
    | [ x ] -> [ x ]
    | _ ->
        let l1, l2 = split l in
        merge (aux l1) (aux l2)
  in
  aux l
