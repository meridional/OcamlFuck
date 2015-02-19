%{(* header *)
%}

%token MoveLeft MoveRight AddOne SubtractOne 
%token PutChar ReadChar
%token Bra Ket
%token EOF

%start prog
%type <Bfsyntax.expr list> prog
%type <Bfsyntax.expr list> cmdlist
%type <Bfsyntax.expr> cmd
%type <Bfsyntax.expr> single

%%

prog:
  cmd prog  {$1::$2}
  | EOF { [] }
  ;

cmdlist:
    cmd { [$1] }
  | cmd cmdlist  { $1::$2}
  ;

cmd:
    single {$1}
  | Bra cmdlist Ket { Bfsyntax.Loop $2}
  | Bra Ket {Bfsyntax.Loop [] }
  ;

single:
  MoveLeft { Bfsyntax.L }
  | MoveRight { Bfsyntax.R }
  | AddOne { Bfsyntax.Add}
  | SubtractOne { Bfsyntax.Sub}
  | PutChar { Bfsyntax.Put}
  | ReadChar { Bfsyntax.Get}
  ;

