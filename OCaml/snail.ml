type dir = R | D | L | U

let print_array_2d (a : int array array) : unit =
  Array.iter
    (fun x ->
      Array.iter (fun y -> Printf.printf "%d " y) x;
      print_endline "")
    a

let snail (n : int) : int array array =
  let a = Array.init n (fun _ -> Array.make n 0) in
  let rec arrange i j dir min_x min_y max_x max_y ct =
    if i >= max_x && i <= min_x && j >= max_y && j <= min_y then ()
    else
      match dir with
      | R ->
          if j < max_y then (
            a.(i).(j) <- ct;
            arrange i (j + 1) dir min_x min_y max_x max_y (ct + 1))
          else arrange (i + 1) (j - 1) D (min_x + 1) min_y max_x max_y ct
      | D ->
          if i < max_x then (
            a.(i).(j) <- ct;
            arrange (i + 1) j dir min_x min_y max_x max_y (ct + 1))
          else arrange (i - 1) (j - 1) L min_x min_y max_x (max_y - 1) ct
      | L ->
          if j > min_y then (
            a.(i).(j) <- ct;
            arrange i (j - 1) dir min_x min_y max_x max_y (ct + 1))
          else arrange (i - 1) (j + 1) U min_x min_y (max_x - 1) max_y ct
      | U ->
          if i > min_x then (
            a.(i).(j) <- ct;
            arrange (i - 1) j dir min_x min_y max_x max_y (ct + 1))
          else arrange (i + 1) (j + 1) R min_x (min_y + 1) max_x max_y ct
  in
  arrange 0 0 R (-1) (-1) n n 1;
  a

let () = read_int () |> snail |> print_array_2d
