type expr = 
    L
  | R
  | Add
  | Sub
  | Put
  | Get
  | Loop of expr list


let rec fold l acc f = match l with
  | [] -> acc
  | h::r -> fold r (f acc h) f


let moveLeft (l, p, r) = match l with
  | [] -> ([], 0, p::r)
  | h::t -> (t, h, p::r)

let moveRight (l, p, r) = match r with
  | [] -> (p::l, 0, [])
  | h::t -> (p::l, h, t)

let add (l,p,r) = (l, (p + 1) mod 256,r)
let sub (l,p,r) = (l, (p + 255) mod 256,r)
let put (l,p,r) = output_char stdout (Char.chr p); (l,p,r)
let get (l,_,r) = (l, Char.code (input_char stdin), r)

let rec evalProg l e = try fold l e (fun acc el -> eval el acc) with _ -> e
and eval ex ((left, p, right) as env) = match ex with
  | L -> moveLeft env
  | R -> moveRight env
  | Add -> add env
  | Sub -> sub env
  | Put -> put env
  | Get -> get env
  | Loop l -> if p = 0 then env else eval ex (evalProg l env)

