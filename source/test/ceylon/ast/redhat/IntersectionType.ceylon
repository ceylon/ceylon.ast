import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    IntersectionType,
    TypeNameWithTypeArguments,
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
            BaseType(TypeNameWithTypeArguments(UIdentifier("Persistent"))),
            BaseType(TypeNameWithTypeArguments(UIdentifier("Printable"))),
            BaseType(TypeNameWithTypeArguments(UIdentifier("Identifiable")))
        ])
);
