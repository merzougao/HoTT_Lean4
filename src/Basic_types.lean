inductive unit : Type
  | base : unit

inductive prod (n : Nat) (A B : Type n): Type n
| cons (a : A) (b : B) : prod n A B

infixr:50 "*" => prod
notation:max "("a","b")" => prod.cons a b

variable (A B : Type)
#check prod 1 A B


def prodInd (n : Nat) (A B : Type n) (P : prod n A B → Type n) 
            : ((a:A) → (b:B) → P (a,b)) 
            → ((z : prod n A B) → P z) := by 
  intro f z
  cases z 
  case cons a b => exact f a b
