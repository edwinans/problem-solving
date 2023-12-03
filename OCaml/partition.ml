(**
   Description: The partition problem is to determine whether a given set can be partitioned into two subsets such that
   the sum of elements in both subsets is the same.

   Author: Edwin ANSARI
*)

let print_array a =
  Array.iter (Printf.printf "%d ") a;
  print_newline ()

let subsets_sum s =
  let len = Array.length s in
  let max = (1 lsl len) - 1 in
  let mask = Array.make (max + 1) 0 in
  for i = 0 to len - 1 do
    mask.(1 lsl i) <- s.(i)
  done;
  let sum = ref 0 in
  for i = 0 to max do
    sum := 0;
    for j = 0 to len - 1 do
      sum := !sum + mask.((1 lsl j) land i)
    done;
    mask.(i) <- !sum;
  done;
  mask

let is_partitionable s =
  let sums = subsets_sum s in
  let len = Array.length sums in
  let sum = sums.(len - 1) in
  if sum land 1 = 1 then
    false
  else
    let half = sum / 2 in
    Array.exists ((=) half) sums


let s = [|1;5;11;5|]
let s = [|3;1;1;2;2;1|]

let () =
  print_endline @@ string_of_bool @@ is_partitionable s
