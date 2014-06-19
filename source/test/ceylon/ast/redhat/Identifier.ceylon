import ceylon.test {
    test
}
import ceylon.ast.api {
    LIdentifier,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    identifierToCeylon,
    compile=compileIdentifier
}

test
shared void identifier()
        => testConversion(RedHatTransformer.transformIdentifier, identifierToCeylon,
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
