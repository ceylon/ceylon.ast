import ceylon.test {
    test
}
import ceylon.ast.api {
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
import test.ceylon.ast.redhat {
    testCompilation,
    testConversion
}

test
shared void groupedType()
        => testConversion(RedHatTransformer.transformGroupedType, groupedTypeToCeylon,
    GroupedType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    GroupedType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);

test
shared void compileGroupedType()
        => testCompilation(compile,
    "<String>"->GroupedType(BaseType(TypeNameWithArguments(UIdentifier("String"), null))),
    "<Iterable<String>>"->GroupedType(BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))])))
);
