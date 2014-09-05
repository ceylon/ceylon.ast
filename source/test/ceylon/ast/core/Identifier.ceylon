import ceylon.test {
    test,
    assertEquals,
    assertNotEquals,
    assertTrue,
    assertFalse
}
import ceylon.ast.core {
    LIdentifier=LIdentifier,
    UIdentifier,
    parseIdentifier=identifier
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
shared void identifierFunction() {
    value lid = parseIdentifier("lid");
    value uid = parseIdentifier("Uid");
    value lidf = parseIdentifier("\\iLid");
    value uidf = parseIdentifier("\\Iuid");
    value lidp = parseIdentifier("\\ilid");
    value uidp = parseIdentifier("\\IUid");
    
    assertEquals(lid, LIdentifier("lid"), "parse LIdentifier");
    assertEquals(uid, UIdentifier("Uid"), "parse UIdentifier");
    assertEquals(lidf, LIdentifier("Lid", true), "parse forced LIdentifier");
    assertEquals(uidf, UIdentifier("uid", true), "parse forced UIdentifier");
    assertEquals(lidp, LIdentifier("lid", true), "parse LIdentifier with unnecessary prefix");
    assertEquals(uidp, UIdentifier("Uid", true), "parse UIdentifier with unnecessary prefix");
    
    assertFalse(lid.usePrefix, "regular LIdentifier has no prefix");
    assertFalse(uid.usePrefix, "regular UIdentifier has no prefix");
    assertTrue(lidf.usePrefix, "forced LIdentifier has prefix");
    assertTrue(uidf.usePrefix, "forced UIdentifier has prefix");
    assertTrue(lidp.usePrefix, "LIdentifier with unnecessary prefix keeps prefix");
    assertTrue(uidp.usePrefix, "UIdentifier with unnecessary prefix keeps prefix");
    
    for (text in { "lid", "Uid", "\\iLid", "\\Iuid", "\\ilid", "\\IUid" }) {
        assertEquals(parseIdentifier(text).text, text, "text of identifier parsed from '``text``'");
        assertEquals(parseIdentifier(parseIdentifier(text).text), parseIdentifier(text), "identifier parsed from text of identifier parsed from '``text``'");
    }
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
