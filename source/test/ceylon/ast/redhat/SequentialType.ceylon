import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    SequentialType,
    TypeNameWithTypeArguments,
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
    "String[]"->SequentialType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))),
    "Iterable<String>[]"->SequentialType(BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))])))
);
