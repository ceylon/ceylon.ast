"Tests for the [[ceylon.ast.core module|module ceylon.ast.core]]"
by ("Lucas Werkmeister <mail@lucaswerkmeister.de>")
license ("http://www.apache.org/licenses/LICENSE-2.0.html")
module test.ceylon.ast.core "1.2.0" {
    shared import ceylon.test "1.2.0";
    import ceylon.ast.core "1.2.0";
    import ceylon.ast.samples "1.2.0";
    
    // for CeylonExpressionTransformer test
    native ("jvm")
    import ceylon.file "1.2.0";
}
