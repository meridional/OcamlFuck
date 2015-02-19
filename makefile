all:
	ocamlc -c bfsyntax.ml
	ocamllex brainfuckLEX.mll
	ocamlyacc brainfuckYACC.mly
	ocamlc -c brainfuckYACC.mli
	ocamlc -c brainfuckLEX.ml
	ocamlc -c brainfuckYACC.ml
	ocamlc -c brainfuck.ml
	ocamlc -o bf bfsyntax.cmo brainfuckLEX.cmo brainfuckYACC.cmo brainfuck.cmo
