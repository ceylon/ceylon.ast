import ceylon.test {
    test
}
import ceylon.ast.api {
    This,
    Super,
    Outer,
    Package
}
import ceylon.ast.redhat {
    RedHatTransformer,
    selfReferenceToCeylon,
    compile=compileSelfReference
}

test
shared void selfReference()
        => doTest(compile, RedHatTransformer.transformSelfReference, selfReferenceToCeylon,
    "this"->This(),
    "super"->Super(),
    "outer"->Outer(),
    "package"->Package()
);
