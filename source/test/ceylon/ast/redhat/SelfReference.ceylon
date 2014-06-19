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
        => testConversion(RedHatTransformer.transformSelfReference, selfReferenceToCeylon,
    This(),
    Super(),
    Outer(),
    Package()
);

test
shared void compileSelfReference()
        => testCompilation(compile,
    "this"->This(),
    "super"->Super(),
    "outer"->Outer(),
    "package"->Package()
);
