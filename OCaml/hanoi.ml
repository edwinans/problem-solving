open Stack

let hanoi n =
  let s1 = Stack.create () and s2 = Stack.create () and s3 = Stack.create () in
  let rec init n =
    if n <= 0 then ()
    else (
      push n s1;
      init (n - 1))
  in
  let print_stack s = Stack.iter (Printf.printf "%d # ") s in
  let print_state () =
    print_string "s1:";
    print_stack s1;
    print_string "\ns2:";
    print_stack s2;
    print_string "\ns3:\n";
    print_stack s3
  in
  let rec solve n =
    print_state ();
    if n = 0 then print_state ()
    else
      let p = pop s1 in
      push p s2;
      solve (n - 1);
      push 2 s3
  in
  init n;
  solve n
