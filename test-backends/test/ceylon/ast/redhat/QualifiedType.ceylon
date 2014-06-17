import ceylon.test {
    test
}
import ceylon.ast.api {
    BaseType,
    GroupedType,
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
QualifiedType t2 = QualifiedType {
    qualifyingType = GroupedType {
        type = t;
    };
    nameAndArgs = TypeNameWithArguments(UIdentifier("Inner"));
};

test
shared void qualifiedType()
        => testConversion(RedHatTransformer.transformQualifiedType, qualifiedTypeToCeylon,
    t,
    t2
);

test
shared void compileQualifiedType()
        => testCompilation(compile,
    "String.Foo<Nothing>.Iterable<String>"->t,
    "<String.Foo<Nothing>.Iterable<String>>.Inner"->t2
);
