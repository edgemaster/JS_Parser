FLAGS=-use-ocamlfind -verbose 1

build: src/*
	ocamlbuild ${FLAGS} src/JS_Parser.cma src/JS_Parser.cmxa

build_test: src/* test/*
	ocamlbuild ${FLAGS} test/parser_tests.byte test/parser_tests.native

clean:
	ocamlbuild ${FLAGS} -clean

test_byte: build_test
	./parser_tests.byte

test_json: build_test
	./parser_tests.byte -json true

test_native: build_test
	./parser_tests.native

test_json_native: build_test
	./parser_tests.native -json true

test_all: test test_native test_json_native
test: test_byte test_json

.PHONY: build clean
.PHONY: test test_all test_byte test_native test_json test_json_native
