import ceylon.test {
    test,
    assertEquals,
    assertNotEquals
}
import ceylon.ast.core {
    FloatLiteral
}

test
shared void floatLiteral() {
    value fl1 = FloatLiteral("4.2");
    value f1 = 4.2;
    value fl2 = FloatLiteral("1_138.113_800"); // TODO use 1_138.113_8 as soon as parseFloat bug is fixed
    value f2 = 1_138.113_8;
    value fl3 = FloatLiteral("0.01m");
    value f3 = 0.01m;
    value fl4 = FloatLiteral("10u");
    value f4 = 10u;
    assertEquals(fl1.float, f1, "parse regular float");
    assertEquals(fl2.float, f2, "parse grouped float");
    assertEquals(fl3.float, f3, "parse float with fractional magnitude");
    assertEquals(fl4.float, f4, "parse float with fractional digits and fractional magnitude");
    assertEquals(fl3.float, fl4.float, "two literals have same value");
    assertNotEquals(fl3, fl4, "literals with same value but different magnitudes are not equal");
}

test
shared void floatLiteralCopy() {
    value fl1 = FloatLiteral("4.2");
    value fl2 = FloatLiteral("10m");
    value c11 = fl1.copy();
    value c12 = fl1.copy { text = fl2.text; };
    value c21 = fl2.copy();
    assertEquals(c11, fl1, "clean copy equals");
    assertNotEquals(c12, fl1, "changed copy not equals");
    assertEquals(c12, fl2, "changed copy equals to other original");
    assertEquals(c12, c21, "changed copy equals to other copy");
}

test
shared void floatLiteralCeylonExpression() {
    assert (FloatLiteral("0.042k").string in { for (quotes in { "\"", "\"\"\"" }) "FloatLiteral(``quotes``0.042k``quotes``)" });
}
