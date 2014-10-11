import ceylon.ast.core {
    LIdentifier,
    UIdentifier
}
import ceylon.ast.create {
    createIdentifier=identifier
}
import ceylon.test {
    test,
    assertEquals,
    assertFalse,
    assertTrue
}

test
shared void identifier() {
    value lid = createIdentifier("lid");
    value uid = createIdentifier("Uid");
    value lidf = createIdentifier("\\iLid");
    value uidf = createIdentifier("\\Iuid");
    value lidp = createIdentifier("\\ilid");
    value uidp = createIdentifier("\\IUid");
    
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
        assertEquals(createIdentifier(text).text, text, "text of identifier parsed from '``text``'");
        assertEquals(createIdentifier(createIdentifier(text).text), createIdentifier(text), "identifier parsed from text of identifier parsed from '``text``'");
    }
}
