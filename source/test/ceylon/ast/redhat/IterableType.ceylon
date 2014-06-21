import ceylon.test {
    test
}
import ceylon.ast.api {
    BaseType,
    IterableType,
    UIdentifier,
    TypeNameWithArguments,
    VariadicType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    iterableTypeToCeylon,
    compile=compileIterableType
}

test
shared void iterableType()
        => doTest(compile, RedHatTransformer.transformIterableType, iterableTypeToCeylon,
    "{String*}"->IterableType(VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"), null)))),
    "{Iterable<String>+}"->IterableType(VariadicType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])), true)),
    "{}"->IterableType(null)
);
