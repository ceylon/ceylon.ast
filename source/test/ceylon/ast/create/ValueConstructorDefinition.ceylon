import ceylon.ast.core {
    Annotation,
    Annotations,
    ArgumentList,
    Block,
    ExtendedType,
    Extension,
    IntegerLiteral,
    LIdentifier,
    PositionalArguments,
    StringLiteral,
    TypeNameWithTypeArguments,
    UIdentifier,
    ValueConstructorDefinition
}
import ceylon.ast.create {
    createAnnotations=annotations,
    createBaseExpression=baseExpression,
    createExtendedType=extendedType,
    createValueConstructorDefinition=valueConstructorDefinition
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void valueConstructorDefinition() {
    assertEquals {
        actual = createValueConstructorDefinition {
            name = "myValueConstructor";
            extendedType = createExtendedType {
                "Super";
                IntegerLiteral("1"), createBaseExpression("string")
            };
            annotations = createAnnotations {
                "My value is something.
                 
                 It’s the most amazing constructor ever.";
                "shared"
            };
        };
        expected = ValueConstructorDefinition {
            name = LIdentifier("myValueConstructor");
            extendedType = ExtendedType(Extension {
                    nameAndArgs = TypeNameWithTypeArguments(UIdentifier("Super"));
                    arguments = PositionalArguments(ArgumentList([IntegerLiteral("1"), createBaseExpression("string")]));
                });
            annotations = Annotations {
                StringLiteral("My value is something.
                               
                               It’s the most amazing constructor ever.");
                [Annotation(LIdentifier("shared"))];
            };
            block = Block([]);
        };
        message = "Constructor definition";
    };
}
