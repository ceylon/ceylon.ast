import ceylon.test {
    test
}
import ceylon.ast.api {
    BaseType,
    UIdentifier,
    TypeNameWithArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    baseTypeToCeylon,
    compile=compileBaseType
}
import test.ceylon.ast.redhat {
    testCompilation,
    testConversion
}

test
shared void baseType()
        => testConversion(RedHatTransformer.transformBaseType, baseTypeToCeylon,
    BaseType(TypeNameWithArguments(UIdentifier("String"), null)),
    BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))]))
);

test
shared void compileBaseType()
        => testCompilation(compile,
    "String"->BaseType(TypeNameWithArguments(UIdentifier("String"), null)),
    "Iterable<String>"->BaseType(TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))]))
);
