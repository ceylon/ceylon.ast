import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    IterableType,
    UIdentifier,
    TypeNameWithTypeArguments,
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
    "{String*}"->IterableType(VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null)))),
    "{Iterable<String>+}"->IterableType(VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))])), true)),
    "{}"->IterableType(null)
);
