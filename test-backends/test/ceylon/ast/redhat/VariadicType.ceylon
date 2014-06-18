import ceylon.test {
    test
}
import ceylon.ast.api {
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
import test.ceylon.ast.redhat {
    testCompilation,
    testConversion
}

test
shared void variadicType()
        => testConversion(RedHatTransformer.transformVariadicType, variadicTypeToCeylon,
    VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    VariadicType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])), true)
);

test
shared void compileVariadicType()
        => testCompilation(compile,
    "String*"->VariadicType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    "Iterable<String>+"->VariadicType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])), true)
);
