import ceylon.test {
    test,
    assertEquals,
    assertNotEquals,
    assertTrue,
    assertFalse
}
import ceylon.ast.api {
    LIdentifier,
    UIdentifier
}
import ceylon.ast.redhat {
    identifierToCeylon,
    identifierFromCeylon,
    compile=compileIdentifier
}

test
shared void identifier() {
    value identifiers = [
        LIdentifier("lid"),
        UIdentifier("Uid"),
        LIdentifier("Lid"),
        UIdentifier("uid")
    ];
    for (identifier in identifiers) {
        assertEquals(identifierToCeylon(identifierFromCeylon(identifier, SimpleTokenFactory())), identifier, "Double parse of ``identifier.name``");
    }
}

test
shared void compileIdentifier() {
    value identifiers = [
        "lid" -> LIdentifier("lid"),
        "Uid" -> UIdentifier("Uid"),
        "\\iLid" -> LIdentifier("Lid"),
        "\\Iuid" -> UIdentifier("uid")
    ];
    for (identifier in identifiers) {
        value compiled = compile(identifier.key);
        assert (exists compiled);
        assertEquals(compiled, identifier.item, "Compile '``identifier.key``' to '``identifier.item``'");
        assertEquals(compiled.enforcePrefix, identifier.item.enforcePrefix, "Prefix detection of '``identifier.key``'");
    }
}
