(**
  https://www.codewars.com/kata/566fc12495810954b1000030
  Count the Digit
*)

let nb_dig (n : int) (d : int) : int =
  let rec count_dig a acc =
    if a mod 10 = a then acc + if d = a then 1 else 0
    else count_dig (a / 10) (acc + if a mod 10 = d then 1 else 0)
  in
  let rec count_pow n acc =
    if n < 0 then acc else count_pow (n - 1) (acc + count_dig (n * n) 0)
  in
  count_pow n 0

