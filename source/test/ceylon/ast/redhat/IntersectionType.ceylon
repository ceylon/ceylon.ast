import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    IntersectionType,
    TypeNameWithArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    intersectionTypeToCeylon,
    compile=compileIntersectionType
}

test
shared void intersectionType()
        => doTest(compile, RedHatTransformer.transformIntersectionType, intersectionTypeToCeylon,
    "Persistent&Printable&Identifiable"->IntersectionType([
            BaseType(TypeNameWithArguments(UIdentifier("Persistent"))),
            BaseType(TypeNameWithArguments(UIdentifier("Printable"))),
            BaseType(TypeNameWithArguments(UIdentifier("Identifiable")))
        ])
);
