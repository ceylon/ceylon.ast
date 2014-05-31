import ceylon.test {
    test,
    ignore
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

ignore("compilation doesn’t yet work – the lexer returns LIDENTIFIER tokens instead of THIS, etc. tokens.")
test
shared void compileSelfReference()
        => testCompilation(compile,
    "this"->This(),
    "super"->Super(),
    "outer"->Outer(),
    "package"->Package()
);
