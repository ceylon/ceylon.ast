import ceylon.test {
    test
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
shared void identifier()
        => testConversion(identifierFromCeylon, identifierToCeylon,
    LIdentifier("lid"),
    UIdentifier("Uid"),
    LIdentifier("Lid"),
    UIdentifier("uid")
);

test
shared void compileIdentifier()
        => testCompilation(compile,
    "lid"->LIdentifier("lid"),
    "Uid"->UIdentifier("Uid"),
    "\\iLid"->LIdentifier("Lid"),
    "\\Iuid"->UIdentifier("uid")
);
