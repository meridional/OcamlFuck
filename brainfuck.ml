

let _ = 
  let lexbuf = Lexing.from_channel (if Array.length Sys.argv = 1 then stdin else open_in (Array.get Sys.argv 1)) in
    let result = BrainfuckYACC.prog BrainfuckLEX.token lexbuf in
      Bfsyntax.evalProg result ([],0,[]) 


