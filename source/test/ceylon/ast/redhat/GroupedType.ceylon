import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    GroupedType,
    UIdentifier,
    TypeNameWithTypeArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    groupedTypeToCeylon,
    compile=compileGroupedType
}

test
shared void groupedType()
        => doTest(compile, RedHatTransformer.transformGroupedType, groupedTypeToCeylon,
    "<String>"->GroupedType(BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))),
    "<Iterable<String>>"->GroupedType(BaseType(TypeNameWithTypeArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))])))
);
