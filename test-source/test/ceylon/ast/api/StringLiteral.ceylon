import ceylon.test {
    test,
    assertEquals,
    assertNotEquals
}
import ceylon.ast.api {
    StringLiteral
}

test
shared void stringLiteral() {
    value sl1 = StringLiteral("Hello, World!", false);
    value sl2 = StringLiteral("Hello, World!", true);
    assertEquals(sl1, sl1, "StringLiteral equal to itself");
    assertEquals(sl1.text, sl2.text, "StringLiterals have the same text");
    assertNotEquals(sl1, sl2, "StringLiterals are not equal because of different isVerbatim values");
}

test
shared void stringLiteralCopy() {
    value sl1 = StringLiteral("\{LATIN CAPITAL LETTER C}");
    value sl2 = StringLiteral("\\{LATIN CAPITAL LETTER C}");
    value s11 = sl1.copy();
    value s12 = sl1.copy { text = sl2.text; };
    value s21 = sl2.copy();
    assertEquals(s11, sl1, "clean copy equals");
    assertNotEquals(s12, sl1, "changed copy not equals");
    assertEquals(s12, sl2, "changed copy equals to other original");
    assertEquals(s12, s21, "changed copy equals to other copy");
}

test
shared void stringLiteralCeylonExpression() {
    assert (StringLiteral("c").ceylonExpression in { for (isVerbatim in { "", ", false" }) "StringLiteral(\"\"\"c\"\"\"``isVerbatim``)" });
}
