import ceylon.ast.core {
    ArgumentList,
    ClassInstantiation,
    ExtendedType,
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
        expected = ExtendedType(ClassInstantiation(TypeNameWithTypeArguments(UIdentifier("Sup")), PositionalArguments()));
        message = "Sup() extended type";
    };
    assertEquals {
        actual = createExtendedType {
            name = "Point";
            createBaseExpression("x"),
            createBaseExpression("y")
        };
        expected = ExtendedType(ClassInstantiation {
                name = TypeNameWithTypeArguments(UIdentifier("Point"));
                arguments = PositionalArguments(ArgumentList([createBaseExpression("x"), createBaseExpression("y")]));
            });
        message = "Point(x, y) extended type";
    };
}
