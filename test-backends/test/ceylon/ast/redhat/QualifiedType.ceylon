import ceylon.test {
    test
}
import ceylon.ast.api {
    BaseType,
    QualifiedType,
    UIdentifier,
    TypeNameWithArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    qualifiedTypeToCeylon,
    compile=compileQualifiedType
}

QualifiedType t = QualifiedType {
    qualifyingType = QualifiedType {
        qualifyingType = BaseType(TypeNameWithArguments(UIdentifier("String")));
        nameAndArgs = TypeNameWithArguments(UIdentifier("Foo"), [BaseType(TypeNameWithArguments(UIdentifier("Nothing"), null))]);
    };
    nameAndArgs = TypeNameWithArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithArguments(UIdentifier("String"), null))]);
};

test
shared void qualifiedType()
        => testConversion(RedHatTransformer.transformQualifiedType, qualifiedTypeToCeylon,
    t
);

test
shared void compileQualifiedType()
        => testCompilation(compile,
    "String.Foo<Nothing>.Iterable<String>"->t
);
