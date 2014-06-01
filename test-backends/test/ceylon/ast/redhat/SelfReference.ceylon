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
    selfReferenceToCeylon,
    selfReferenceFromCeylon,
    compile=compileSelfReference
}

test
shared void selfReference()
        => testConversion(selfReferenceFromCeylon, selfReferenceToCeylon,
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
