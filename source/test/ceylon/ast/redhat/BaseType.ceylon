import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    UIdentifier,
    TypeNameWithTypeArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    baseTypeToCeylon,
    compile=compileBaseType
}

test
shared void baseType()
        => doTest(compile, RedHatTransformer.transformBaseType, baseTypeToCeylon,
    "String"->BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null)),
    "Iterable<String>"->BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))]))
);
