"Tests for the [[ceylon.ast.core module|module ceylon.ast.core]]"
by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
license ("http://www.apache.org/licenses/LICENSE-2.0.html")
module test.ceylon.ast.core "1.3.1-SNAPSHOT" {
    shared import ceylon.test "1.3.1-SNAPSHOT";
    import ceylon.ast.core "1.3.1-SNAPSHOT";
    import ceylon.ast.samples "1.3.1-SNAPSHOT";
    
    // for CeylonExpressionTransformer test
    native ("jvm")
    import ceylon.file "1.3.1-SNAPSHOT";
}
