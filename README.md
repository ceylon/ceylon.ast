ceylon.ast
==========

This repository will contain several modules to work with a Ceylon Abstract Syntax Tree (AST):

* `ceylon.ast.core` – the Ceylon classes that represent a Ceylon AST. Pure Ceylon (backend-independent).
* `ceylon.ast.redhat` – transforms a `ceylon.ast.core` AST from + to a RedHat compiler ([ceylon-spec](https://github.com/ceylon/ceylon-spec]) AST, and also contains functions to compile a `ceylon.ast.core` AST from a code string (using the RedHat compiler).
* `ceylon.ast.samples` – sample ASTs, to see how `ceylon.ast` is used and to test your tools that work with a `ceylon.ast` AST.
* a test module for each of these (`test.ceylon...`).

`ceylon.ast.core` allows you to construct a Ceylon AST in your program, which you can then feed into other tools (some tools require the transformed RedHat AST), like the compiler to compile it or the [`ceylon.formatter`](https://github.com/lucaswerkmeister/ceylon.formatter) to write it as code (code generation).

This is the Google Summer of Code 2014 project of Lucas Werkmeister (@lucaswerkmeister); see [the mailing list thread](https://groups.google.com/forum/#!topic/ceylon-dev/_Uo5P2AgxmA)
or the [project](https://www.google-melange.com/gsoc/project/details/google/gsoc2014/lucaswerkmeister/5741031244955648).
Contributions are of course welcome!

License
=======

The content of this repository is released under the ASL v2.0 as provided in the LICENSE file that accompanied this code.

By submitting a "pull request" or otherwise contributing to this repository, you agree to license your contribution under the license mentioned above.
