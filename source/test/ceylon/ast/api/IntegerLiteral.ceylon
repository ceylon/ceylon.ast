import ceylon.test {
    test,
    assertEquals,
    assertNotEquals
}
import ceylon.ast.api {
    IntLit=IntegerLiteral
}

test
shared void integerLiteral() {
    value il1 = IntLit("42");
    value i1 = 42;
    value il2 = IntLit("1138");
    value i2 = 1138;
    value il3 = IntLit("1_138");
    value i3 = 1_138;
    value il4 = IntLit("#7EA_BABE"); // 0xCAFEBABE is the magic number of all Java class files ;-)
    value i4 = #7EA_BABE;
    value il5 = IntLit("$101010");
    value i5 = $101010;
    assertEquals(il1.integer, i1, "parse regular integer 1");
    assertEquals(il2.integer, i2, "parse regular integer 2");
    assertEquals(il3.integer, i3, "parse grouped integer");
    assertEquals(il4.integer, i4, "parse hex integer");
    assertEquals(il5.integer, i5, "parse binary integer");
    assertEquals(il2.integer, il3.integer, "two literals have the same value");
    assertNotEquals(il2, il3, "literals with the same value but different grouping are not equal");
}

test
shared void integerLiteralCopy() {
    value il1 = IntLit("42");
    value il2 = IntLit("#7EA_BABE");
    value c11 = il1.copy();
    value c12 = il1.copy { text = il2.text; };
    value c21 = il2.copy();
    assertEquals(c11, il1, "clean copy equals");
    assertNotEquals(c12, il1, "changed copy not equals");
    assertEquals(c12, il2, "changed copy equals to other original");
    assertEquals(c12, c21, "changed copy equals to other copy");
}

test
shared void integerLiteralCeylonExpression() {
    assert (IntLit("#7EA_BABE").string in { for (quotes in { "\"", "\"\"\"" }) "IntegerLiteral(``quotes``#7EA_BABE``quotes``)" });
}
