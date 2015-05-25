"Tests for the [[ceylon.ast.core module|module ceylon.ast.core]]"
by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
license ("http://www.apache.org/licenses/LICENSE-2.0.html")
module test.ceylon.ast.core "1.1.1" {
    shared import ceylon.test "1.1.1";
    import ceylon.ast.core "1.1.1";
    import ceylon.ast.samples "1.1.1";
    
    // for CeylonExpressionTransformer test
    native ("jvm")
    import ceylon.file "1.1.1";
}
