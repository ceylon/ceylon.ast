import ceylon.test {
    test,
    assertEquals
}
import ceylon.ast.core {
    baseType,
    qualifiedType,
    BaseType,
    QualifiedType,
    TypeNameWithTypeArguments,
    UIdentifier,
    TypeArgument,
    TypeArguments
}

test
shared void qualifiedTypeFunction() {
    assertEquals {
        actual = qualifiedType("X", "Y");
        expected = QualifiedType(BaseType(TypeNameWithTypeArguments(UIdentifier("X"))), TypeNameWithTypeArguments(UIdentifier("Y")));
    };
    assertEquals {
        actual = qualifiedType(qualifiedType(baseType("X", "A"), "Y", "B"), "Z", "C");
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
