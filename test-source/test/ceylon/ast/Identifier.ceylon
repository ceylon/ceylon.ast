import ceylon.test { test, assertEquals, assertNotEquals, assertTrue, assertFalse }
import ceylon.ast { LIdentifier, UIdentifier, parseIdentifier=identifier }

test shared void \iIdentifier() {
    assertEquals(LIdentifier("name"), LIdentifier("name"), "LIdentifier equals without prefix");
    assertEquals(UIdentifier("name"), UIdentifier("name"), "UIdentifier equals without prefix");
    assertEquals(LIdentifier("name", true), LIdentifier("name", true), "LIdentifier equals with prefix");
    assertEquals(UIdentifier("name", true), UIdentifier("name", true), "UIdentifier equals with prefix");
    assertEquals(LIdentifier("name", true), LIdentifier("name", false), "LIdentifier equals with mixed prefix");
    assertEquals(UIdentifier("name", true), UIdentifier("name", false), "UIdentifier equals with mixed prefix");
    assertNotEquals(LIdentifier("name"), UIdentifier("name"), "Identifier case not equals");
    assertNotEquals(LIdentifier("name"), LIdentifier("text"), "LIdentifier name not equals");
    assertNotEquals(UIdentifier("name"), UIdentifier("text"), "UIdentifier name not equals");
}

test shared void identifier() {
    value lid = parseIdentifier("lid");
    value uid = parseIdentifier("Uid");
    value lidf = parseIdentifier("\\iLid");
    value uidf = parseIdentifier("\\Iuid");
    value lidp = parseIdentifier("\\ilid");
    value uidp = parseIdentifier("\\IUid");
    
    assertEquals(lid, LIdentifier("lid"), "parse LIdentifier");
    assertEquals(uid, UIdentifier("Uid"), "parse UIdentifier");
    assertEquals(lidf, LIdentifier("Lid"), "parse forced LIdentifier");
    assertEquals(uidf, UIdentifier("uid"), "parse forced UIdentifier");
    assertEquals(lidp, LIdentifier("lid"), "parse LIdentifier with unnecessary prefix");
    assertEquals(uidp, UIdentifier("Uid"), "parse UIdentifier with unnecessary prefix");
    
    assertFalse(lid.enforcePrefix, "regular LIdentifier has no prefix");
    assertFalse(uid.enforcePrefix, "regular UIdentifier has no prefix");
    assertTrue(lidf.enforcePrefix, "forced LIdentifier has prefix");
    assertTrue(uidf.enforcePrefix, "forced UIdentifier has prefix");
    assertTrue(lidp.enforcePrefix, "LIdentifier with unnecessary prefix keeps prefix");
    assertTrue(uidp.enforcePrefix, "UIdentifier with unnecessary prefix keeps prefix");
    
    for (text in { "lid", "Uid", "\\iLid", "\\Iuid", "\\ilid", "\\IUid" }) {
        assertEquals(parseIdentifier(text).string, text, "text of identifier parsed from '``text``'");
        assertEquals(parseIdentifier(parseIdentifier(text).string), parseIdentifier(text), "identifier parsed from text of identifier parsed from '``text``'");
    }
}
