"This module defines types for a Ceylon Abstract Syntax Tree (AST),
 a hierarchical and immutable data structure that represents a Ceylon program.
 Using the conversion functions defined in the `ceylon.ast.redhat` module,
 you can compile it with the Ceylon compiler or write it as code with the
 Ceylon formatter (`ceylon.formatter` module, function `format`).
 
 Every *syntactically* valid Ceylon program can be represented as an AST,
 and every AST corresponds to a syntactically valid Ceylon program.
 The AST does not care about *semantics*.
 For example, even though `[String=,String]` isn’t a legal Ceylon type
 (because there can’t be a non-defaulted type after a defaulted one in a type list),
 it has a valid AST representation, and the constructor of [[TypeList]] deliberately
 *doesn’t* check if there are non-defaulted types after defaulted ones, even though it could.
 On the other hand, the [[UIdentifier]] initializer does check that the name isn’t empty
 and only consists of valid identifier characters, because `UIdentifier(\"My Identifier\")`
 can’t be parsed, and isn’t syntactically valid.
 
 (Syntactical validity is defined after the Ceylon Language Specification’s grammar.
 The RedHat compiler’s grammar allows some more syntax so that it can produce more meaningful error messages,
 but that additional syntax is not considered valid here.)"
by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
license ("http://www.apache.org/licenses/LICENSE-2.0.html")
module ceylon.ast.core "1.1.0" {
}
