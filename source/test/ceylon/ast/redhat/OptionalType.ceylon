import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    OptionalType,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    optionalTypeToCeylon,
    compile=compileOptionalType
}

test
shared void optionalType()
        => doTest(compile, RedHatTransformer.transformOptionalType, optionalTypeToCeylon,
    "String?"->OptionalType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))),
    "Iterable<String>?"->OptionalType(BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))])))
);
