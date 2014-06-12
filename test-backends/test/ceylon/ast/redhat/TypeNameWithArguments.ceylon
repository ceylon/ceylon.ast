import ceylon.test {
    test
}
import ceylon.ast.api {
    TypeNameWithArguments,
    UIdentifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeNameWithArgumentsToCeylon,
    compile=compileTypeNameWithArguments
}

test
shared void typeNameWithArguments()
        => testConversion(RedHatTransformer.transformTypeNameWithArguments, typeNameWithArgumentsToCeylon,
    TypeNameWithArguments(UIdentifier("String"), null),
    TypeNameWithArguments(UIdentifier("Iterable"), [TypeNameWithArguments(UIdentifier("String"), null)])
);

test
shared void compileTypeNameWithArguments()
        => testCompilation(compile,
    "String"->TypeNameWithArguments(UIdentifier("String"), null),
    "Iterable<String>"->TypeNameWithArguments(UIdentifier("Iterable"), [TypeNameWithArguments(UIdentifier("String"), null)])
);
