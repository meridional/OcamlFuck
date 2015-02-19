{
  open BrainfuckYACC;;
}

rule token = parse
    '>' { MoveLeft }
  | '<' { MoveRight }
  | '+' { AddOne }
  | '-' { SubtractOne }
  | '.' { PutChar }
  | ',' { ReadChar }
  | '[' { Bra }
  | ']' { Ket }
  | eof { EOF }
  | _ { token lexbuf }

