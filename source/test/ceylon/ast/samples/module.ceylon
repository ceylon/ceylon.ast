"“Big picture” tests for [[`ceylon.ast`|module ceylon.ast.core]],
 using the [[samples|module ceylon.ast.samples]]."
native ("jvm")
module test.ceylon.ast.samples "1.3.0" {
    shared import ceylon.test "1.3.0";
    import ceylon.ast.core "1.3.0";
    import ceylon.ast.create "1.3.0";
    import ceylon.ast.redhat "1.3.0";
    import ceylon.ast.samples "1.3.0";
    import ceylon.formatter "1.3.0";
    import ceylon.collection "1.3.0";
    import ceylon.interop.java "1.3.0";
}
