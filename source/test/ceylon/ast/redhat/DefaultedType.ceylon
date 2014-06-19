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
import test.ceylon.ast.redhat {
    testCompilation,
    testConversion
}

test
shared void defaultedType()
        => testConversion(RedHatTransformer.transformDefaultedType, defaultedTypeToCeylon,
    DefaultedType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    DefaultedType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);

test
shared void compileDefaultedType()
        => testCompilation(compile,
    //"String="->DefaultedType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    "Iterable<String> ="->DefaultedType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);
