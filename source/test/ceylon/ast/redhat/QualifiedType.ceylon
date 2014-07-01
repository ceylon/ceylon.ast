import ceylon.test {
    test
}
import ceylon.ast.core {
    BaseType,
    GroupedType,
    QualifiedType,
    UIdentifier,
    TypeNameWithTypeArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    qualifiedTypeToCeylon,
    compile=compileQualifiedType
}

QualifiedType t = QualifiedType {
    qualifyingType = QualifiedType {
        qualifyingType = BaseType(TypeNameWithTypeArguments(UIdentifier("String")));
        nameAndArgs = TypeNameWithTypeArguments(UIdentifier("Foo"), [BaseType(TypeNameWithTypeArguments(UIdentifier("Nothing"), null))]);
    };
    nameAndArgs = TypeNameWithTypeArguments(UIdentifier("Iterable"), [BaseType(TypeNameWithTypeArguments(UIdentifier("String"), null))]);
};
QualifiedType t2 = QualifiedType {
    qualifyingType = GroupedType {
        type = t;
    };
    nameAndArgs = TypeNameWithTypeArguments(UIdentifier("Inner"));
};

test
shared void qualifiedType()
        => doTest(compile, RedHatTransformer.transformQualifiedType, qualifiedTypeToCeylon,
    "String.Foo<Nothing>.Iterable<String>"->t,
    "<String.Foo<Nothing>.Iterable<String>>.Inner"->t2
);
