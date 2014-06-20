import ceylon.test {
    test
}
import ceylon.ast.api {
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
        => testConversion(RedHatTransformer.transformOptionalType, optionalTypeToCeylon,
    OptionalType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    OptionalType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);

test
shared void compileOptionalType()
        => testCompilation(compile,
    "String?"->OptionalType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    "Iterable<String>?"->OptionalType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);
