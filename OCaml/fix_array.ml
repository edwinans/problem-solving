
module Array_n (N: sig val len: int end) :
sig
  type t

  val mk_array: unit -> t
  val get: t -> int -> int
  val set: t -> int -> int -> unit
end
=
struct
  type t = int array

  let mk_array () = Array.make N.len 0

  let get arr i = arr.(i)

  let set arr i x = arr.(i) <- x
end

let () =
  let module A5 = Array_n(struct let len = 5 end) in
  let a5 = A5.mk_array () in
  Printf.printf "(2) -> %d\n" (A5.get a5 2);
  (* let x = A5.get [|1;1;1;1|] 2 -> compile error *)
