Require Import Arith.
Set Implicit Arguments.

(**
By starting from the number 1 and repeatedly either adding 5 or multiplying by
3, an infinite set of numbers can be produced. How would you write a function
that, given a number, tries to find a sequence of such additions and
multiplications that produces that number?

For example, the number 13 could be reached by first multiplying by 3 and then
adding 5 twice, whereas the number 15 cannot be reached at all.
*)

Inductive Times3Plus5 : nat -> Prop :=
  Start    : Times3Plus5 1
| Times3 n : Times3Plus5 n -> Times3Plus5 (3 * n)
| Plus5  n : Times3Plus5 n -> Times3Plus5 (5 + n).

Definition decide n : bool :=
  match n mod 5 with
  | 0 => false
  | 2 => 27 <=? n
  | 4 => 9 <=? n
  | _ => true
  end.

Lemma add_mod_mod : forall (a n : nat), (n + a) mod n = a mod n.
Proof.
  induction n.
  trivial.
  rewrite Nat.add_mod.
  rewrite Nat.mod_same.
  rewrite (Nat.add_comm 0 (a mod S n)).
  rewrite (Nat.add_mod_idemp_l a 0 (S n)).
  auto. auto. auto. auto.
Qed.

Theorem decide_works n : Times3Plus5 n <-> decide n = true.
Proof.
  split.
  + intro H.
    induction H.
    ++ reflexivity.
    ++ admit.
    ++ unfold decide. rewrite add_mod_mod.
      admit.
  + intro H.
    case_eq (n mod 5).
    ++ intro H0. unfold decide in H. rewrite H0 in H. discriminate H.
    ++ intro n0. case (n0).
    +++ intro H0.
Admitted.