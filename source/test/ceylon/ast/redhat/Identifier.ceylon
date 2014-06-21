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
        => doTest(compile, RedHatTransformer.transformIdentifier, identifierToCeylon,
    "lid"->LIdentifier("lid"),
    "Uid"->UIdentifier("Uid"),
    "\\iLid"->LIdentifier("Lid"),
    "\\Iuid"->UIdentifier("uid")
);
