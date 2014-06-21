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
        => doTest(compile, RedHatTransformer.transformSequentialType, sequentialTypeToCeylon,
    "String[]"->SequentialType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    "Iterable<String>[]"->SequentialType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);
