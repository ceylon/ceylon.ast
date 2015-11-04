"""This module defines a bidirectional conversion between `ceylon.ast`
   and the RedHat compiler AST, as well as functions that directly compile code
   to `ceylon.ast` nodes using the RedHat compiler.
   
   `ceylon.ast` → RedHat AST:
   
       that.transform(RedHatTransformer(SimpleTokenFactory()))
   
   RedHat AST → `ceylon.ast`:
   
       compilationUnitToCeylon(that)
       
   Code → `ceylon.ast`:
   
       compileCompilationUnit(code)
   
   For the latter two, there are also functions for (almost) every other
   node type, e. g. [[expressionToCeylon]], [[compileType]], etc.
   
   All `XToCeylon` and `compileX` functions also take a second parameter:
   
       Anything(JNode,Node) update = noop
   
   This function is invoked once for every [[ceylon.ast.core::Node]] created
   with the original RedHat AST node (above aliased to `JNode`)
   and the new `ceylon.ast` Node as arguments.
   It can be used to copy information from the old AST to the new one, for example:
  
       Key<Token[]> tokensKey = ScopedKey<Token[]>(`module`, "tokens");
       value cu = compileCompilationUnit {
           code;
           void update(JNode orig, Node res) {
               res.set(tokensKey, [orig.mainToken, orig.mainEndToken].coalesced);
           }
       };
       // later
       assert (exists tokens = cu.get(tokensKey));
   
   The default is [[noop]], i. e., to do nothing.
   Another useful argument provided by this module is [[attachOriginalNode]],
   which allows you to later retrieve the original node from [[originalNodeKey]]:
   
       value cu = compileCompilationUnit {
           code;
           update = attachOriginalNode;
       };
       // later
       assert (exists orig = cu.get(originalNodeKey));
       value tokens = [orig.mainToken, orig.mainEndToken].coalesced;"""
by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
license ("http://www.apache.org/licenses/LICENSE-2.0.html")
native ("jvm")
module ceylon.ast.redhat "1.2.0" {
    shared import ceylon.ast.core "1.2.0";
    shared import com.redhat.ceylon.typechecker "1.2.0";
    import ceylon.interop.java "1.2.0";
}
