"“Big picture” tests for [[`ceylon.ast`|module ceylon.ast.core]],
 using the [[samples|module ceylon.ast.samples]]."
native ("jvm") module test.ceylon.ast.samples "1.3.4-SNAPSHOT" {
    shared import ceylon.test "1.3.4-SNAPSHOT";
    import ceylon.ast.core "1.3.4-SNAPSHOT";
    import ceylon.ast.create "1.3.4-SNAPSHOT";
    import ceylon.ast.redhat "1.3.4-SNAPSHOT";
    import ceylon.ast.samples "1.3.4-SNAPSHOT";
    import ceylon.formatter "1.3.4-SNAPSHOT";
    import ceylon.collection "1.3.4-SNAPSHOT";
    import ceylon.interop.java "1.3.4-SNAPSHOT";
}
