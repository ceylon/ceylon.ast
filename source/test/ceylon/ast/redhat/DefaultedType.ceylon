import ceylon.test {
    test
}
import ceylon.ast.api {
    BaseType,
    DefaultedType,
    UIdentifier,
    TypeNameWithArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    defaultedTypeToCeylon,
    compile=compileDefaultedType
}

test
shared void defaultedType()
        => doTest(compile, RedHatTransformer.transformDefaultedType, defaultedTypeToCeylon,
    "String="->DefaultedType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    "Iterable<String> ="->DefaultedType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);
