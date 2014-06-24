import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    UIdentifier,
    TypeNameWithArguments,
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
    "String*"->VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    "Iterable<String>+"->VariadicType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])), true)
);
