import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    UIdentifier,
    TypeNameWithTypeArguments,
    VariadicType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    variadicTypeToCeylon,
    compile=compileVariadicType
}

test
shared void variadicType()
        => doTest(compile, RedHatTransformer.transformVariadicType, variadicTypeToCeylon,
    "String*"->VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))),
    "Iterable<String>+"->VariadicType(BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))])), true)
);
