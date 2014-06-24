import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    UIdentifier,
    TypeNameWithArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    baseTypeToCeylon,
    compile=compileBaseType
}

test
shared void baseType()
        => doTest(compile, RedHatTransformer.transformBaseType, baseTypeToCeylon,
    "String"->BaseType(TypeNameWithArguments(UIdentifier("String"), null)),
    "Iterable<String>"->BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))]))
);
