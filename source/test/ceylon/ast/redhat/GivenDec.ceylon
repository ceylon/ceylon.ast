import ceylon.test {
    test
}
import ceylon.ast.core {
    GivenDec,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    givenDecToCeylon,
    compile=compileGivenDec
}

test
shared void givenDec()
        => doTest(compile, RedHatTransformer.transformGivenDec, givenDecToCeylon,
    "`given Key`"->GivenDec(UIdentifier("Key")),
    "`given \\Ikey`"->GivenDec(UIdentifier("key"))
);
