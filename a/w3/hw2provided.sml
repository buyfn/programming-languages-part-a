(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option (s, lst) =
    let
      fun contains tail =
	  case tail of
	      [] => false
	    | fst::rest =>
	      same_string(s, fst) orelse contains rest
      fun remove (acc, tail) =
	  case tail of
	      [] => acc
	    | fst::rest => if same_string(s, fst)
			   then remove (acc, rest)
			   else remove (acc @ [fst], rest)
    in
      if contains lst
      then SOME (remove ([], lst))
      else NONE
    end
	

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
