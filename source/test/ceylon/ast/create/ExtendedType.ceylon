import ceylon.ast.core {
    ArgumentList,
    ExtendedType,
    Extension,
    PositionalArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.create {
    createBaseExpression=baseExpression,
    createExtendedType=extendedType
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void extendedType() {
    assertEquals {
        actual = createExtendedType("Sup");
        expected = ExtendedType(Extension(TypeNameWithTypeArguments(UIdentifier("Sup")), PositionalArguments()));
        message = "Sup() extended type";
    };
    assertEquals {
        actual = createExtendedType {
            name = "Point";
            createBaseExpression("x"),
            createBaseExpression("y")
        };
        expected = ExtendedType(Extension {
                nameAndArgs = TypeNameWithTypeArguments(UIdentifier("Point"));
                arguments = PositionalArguments(ArgumentList([createBaseExpression("x"), createBaseExpression("y")]));
            });
        message = "Point(x, y) extended type";
    };
}
