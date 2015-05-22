"This module defines a bidirectional conversion between `ceylon.ast`
 and the RedHat compiler AST, as well as functions that directly compile code
 to `ceylon.ast` nodes using the RedHat compiler.
 
 `ceylon.ast` → RedHat AST:
 
     that.transform(RedHatTransformer(SimpleTokenFactory()))
 
 RedHat AST → `ceylon.ast`:
 
     compilationUnitToCeylon(that)
     
 Code → `ceylon.ast`:
 
     compileCompilationUnit(code)
 
 For the latter two, there are also functions for (almost) every other
 node type, e. g. [[expressionToCeylon]], [[compileType]], etc."
by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
license ("http://www.apache.org/licenses/LICENSE-2.0.html")
native ("jvm")
module ceylon.ast.redhat "1.1.1" {
    shared import ceylon.ast.core "1.1.1";
    shared import com.redhat.ceylon.typechecker "1.1.1";
    import ceylon.interop.java "1.1.1";
}
