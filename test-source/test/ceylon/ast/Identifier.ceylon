import ceylon.test { test, assertEquals, assertNotEquals }
import ceylon.ast { LIdentifier, UIdentifier }

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
