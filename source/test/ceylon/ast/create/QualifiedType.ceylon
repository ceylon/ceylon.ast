import ceylon.ast.core {
    BaseType,
    QualifiedType,
    TypeNameWithTypeArguments,
    UIdentifier,
    TypeArgument,
    TypeArguments
}
import ceylon.ast.create {
    createBaseType=baseType,
    createQualifiedType=qualifiedType
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void qualifiedType() {
    assertEquals {
        actual = createQualifiedType("X", "Y");
        expected = QualifiedType(BaseType(TypeNameWithTypeArguments(UIdentifier("X"))), TypeNameWithTypeArguments(UIdentifier("Y")));
    };
    assertEquals {
        actual = createQualifiedType(createQualifiedType(createBaseType("X", "A"), "Y", "B"), "Z", "C");
        expected = QualifiedType {
            qualifyingType = QualifiedType {
                qualifyingType = BaseType(TypeNameWithTypeArguments(UIdentifier("X"), TypeArguments([TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("A"))))])));
                nameAndArgs = TypeNameWithTypeArguments(UIdentifier("Y"), TypeArguments([TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("B"))))]));
            };
            nameAndArgs = TypeNameWithTypeArguments(UIdentifier("Z"), TypeArguments([TypeArgument(BaseType(TypeNameWithTypeArguments(UIdentifier("C"))))]));
        };
        // this is why we SO need that function
    };
}
