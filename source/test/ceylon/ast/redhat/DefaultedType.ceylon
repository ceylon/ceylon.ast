import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    DefaultedType,
    UIdentifier,
    TypeNameWithTypeArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    defaultedTypeToCeylon,
    compile=compileDefaultedType
}

test
shared void defaultedType()
        => doTest(compile, RedHatTransformer.transformDefaultedType, defaultedTypeToCeylon,
    "String="->DefaultedType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))),
    "Iterable<String> ="->DefaultedType(BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))])))
);
