import ceylon.test {
    test,
    assertEquals,
    assertNotEquals
}
import ceylon.ast.api {
    CharacterLiteral
}

test
shared void characterLiteralCopy() {
    value cl1 = CharacterLiteral("\{LATIN CAPITAL LETTER C}");
    value cl2 = CharacterLiteral("\\{LATIN CAPITAL LETTER C}");
    value c11 = cl1.copy();
    value c12 = cl1.copy { text = cl2.text; };
    value c21 = cl2.copy();
    assertEquals(c11, cl1, "clean copy equals");
    assertNotEquals(c12, cl1, "changed copy not equals");
    assertEquals(c12, cl2, "changed copy equals to other original");
    assertEquals(c12, c21, "changed copy equals to other copy");
}

test
shared void characterLiteralCeylonExpression() {
    assert (CharacterLiteral("c").ceylonExpression == "CharacterLiteral(\"\"\"c\"\"\")");
}
