(* A naive implementation of the [merge_sort] algorithm *)
let merge_sort (l : 'a list) : 'a list =
  let merge (l : 'a list) (l' : 'a list) : 'a list =
    let rec merge_aux (l : 'a list) (l' : 'a list) (acc : 'a list) : 'a list =
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
  let split (l : 'a list) : 'a list * 'a list =
    let rec split_aux (l : 'a list) (acc : 'a list) (i : int) :
        'a list * 'a list =
      if i == 0 then (l, List.rev acc)
      else
        match l with
        | [] -> (l, List.rev acc)
        | x :: xs -> split_aux xs (x :: acc) (i - 1)
    in
    split_aux l [] (List.length l / 2)
  in
  let rec aux (l : 'a list) : 'a list =
    match l with
    | [] -> []
    | [ x ] -> [ x ]
    | _ ->
        let l1, l2 = split l in
        merge (aux l1) (aux l2)
  in
  aux l
