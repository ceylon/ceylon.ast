import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    OptionalType,
    TypeNameWithArguments,
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
    "String?"->OptionalType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    "Iterable<String>?"->OptionalType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);
