

let _ = 
  let lexbuf = Lexing.from_channel stdin in
    let result = BrainfuckYACC.prog BrainfuckLEX.token lexbuf in
    Bfsyntax.evalProg result ([],0,[]); ();;



