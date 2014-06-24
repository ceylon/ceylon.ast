import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    GroupedType,
    UIdentifier,
    TypeNameWithArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    groupedTypeToCeylon,
    compile=compileGroupedType
}

test
shared void groupedType()
        => doTest(compile, RedHatTransformer.transformGroupedType, groupedTypeToCeylon,
    "<String>"->GroupedType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    "<Iterable<String>>"->GroupedType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);
