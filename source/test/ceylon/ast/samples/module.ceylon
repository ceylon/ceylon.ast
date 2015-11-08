"“Big picture” tests for [[`ceylon.ast`|module ceylon.ast.core]],
 using the [[samples|module ceylon.ast.samples]]."
native ("jvm")
module test.ceylon.ast.samples "1.2.1" {
    shared import ceylon.test "1.2.1";
    import ceylon.ast.core "1.2.1";
    import ceylon.ast.create "1.2.1";
    import ceylon.ast.redhat "1.2.1";
    import ceylon.ast.samples "1.2.1";
    import ceylon.formatter "1.2.1";
    import ceylon.collection "1.2.1";
    import ceylon.interop.java "1.2.1";
}
