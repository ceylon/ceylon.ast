import ceylon.ast.core {
    ArgumentList,
    ClassInstantiation,
    ClassSpecifier,
    PositionalArguments,
    TypeNameWithTypeArguments,
    UIdentifier
}
import ceylon.ast.create {
    createBaseExpression=baseExpression,
    createClassSpecifier=classSpecifier
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void classSpecifier() {
    assertEquals {
        actual = createClassSpecifier("Sup");
        expected = ClassSpecifier(ClassInstantiation(TypeNameWithTypeArguments(UIdentifier("Sup")), PositionalArguments()));
        message = "Sup() class specifier";
    };
    assertEquals {
        actual = createClassSpecifier {
            name = "Point";
            createBaseExpression("y"),
            createBaseExpression("x")
        };
        expected = ClassSpecifier(ClassInstantiation {
                name = TypeNameWithTypeArguments(UIdentifier("Point"));
                arguments = PositionalArguments(ArgumentList([createBaseExpression("y"), createBaseExpression("x")]));
            });
        message = "Point(y, x) class specifier";
    };
}
