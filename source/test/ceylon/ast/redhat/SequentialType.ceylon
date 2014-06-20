import ceylon.test {
    test
}
import ceylon.ast.api {
    BaseType,
    SequentialType,
    TypeNameWithArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    sequentialTypeToCeylon,
    compile=compileSequentialType
}

test
shared void sequentialType()
        => testConversion(RedHatTransformer.transformSequentialType, sequentialTypeToCeylon,
    SequentialType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    SequentialType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);

test
shared void compileSequentialType()
        => testCompilation(compile,
    "String[]"->SequentialType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    "Iterable<String>[]"->SequentialType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);
