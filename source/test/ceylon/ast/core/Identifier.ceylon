import ceylon.test {
    test,
    assertEquals,
    assertNotEquals,
    assertTrue
}
import ceylon.ast.core {
    LIdentifier,
    UIdentifier
}

test
shared void identifier() {
    assertEquals(LIdentifier("name"), LIdentifier("name"), "LIdentifier equals without prefix");
    assertEquals(UIdentifier("Name"), UIdentifier("Name"), "UIdentifier equals without prefix");
    assertEquals(LIdentifier("Name", true), LIdentifier("Name", true), "LIdentifier equals with prefix");
    assertEquals(UIdentifier("name", true), UIdentifier("name", true), "UIdentifier equals with prefix");
    assertEquals(LIdentifier("name", true), LIdentifier("name", false), "LIdentifier equals with mixed prefix");
    assertEquals(UIdentifier("Name", true), UIdentifier("Name", false), "UIdentifier equals with mixed prefix");
    assertNotEquals(LIdentifier("name"), UIdentifier("name", true), "Identifier case not equals");
    assertNotEquals(LIdentifier("name"), LIdentifier("text"), "LIdentifier name not equals");
    assertNotEquals(UIdentifier("Name"), UIdentifier("Text"), "UIdentifier name not equals");
}

test
shared void identifierCopy() {
    value lid = LIdentifier("lid");
    value uid = UIdentifier("Uid");
    value lidf = lid.copy("Lid", true);
    value uidf = uid.copy("uid", true);
    
    assertTrue(lidf.usePrefix, "uppercase LIdentifier needs prefix");
    assertTrue(uidf.usePrefix, "lowercase UIdentifier needs prefix");
}

test
shared void identifierCeylonExpression() {
    void test(LIdentifier|UIdentifier identifier) {
        String type = identifier is LIdentifier then "LIdentifier" else "UIdentifier";
        assertTrue(identifier.string in { for (name in { "\"``identifier.name``\"", "\"\"\"``identifier.name``\"\"\"" }) for (usePrefix in (identifier.usePrefix then { ", true" } else { "", ", false" })) "``type``(`` name + usePrefix ``)" }, "ceylonExpression of identifier '``identifier``'");
    }
    test(LIdentifier("lid"));
    test(UIdentifier("Uid"));
    test(LIdentifier("lid", true));
    test(UIdentifier("Uid", true));
}
