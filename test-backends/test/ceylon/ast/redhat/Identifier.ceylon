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
    identifierFromCeylon
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
