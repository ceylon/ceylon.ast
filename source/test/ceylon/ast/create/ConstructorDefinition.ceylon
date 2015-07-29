import ceylon.ast.core {
    Annotation,
    Annotations,
    ArgumentList,
    Block,
    ConstructorDefinition,
    ExtendedType,
    Extension,
    IntegerLiteral,
    LIdentifier,
    Parameters,
    PositionalArguments,
    StringLiteral,
    TypeNameWithTypeArguments,
    UIdentifier,
    ValueParameter
}
import ceylon.ast.create {
    createAnnotations=annotations,
    createBaseExpression=baseExpression,
    createBaseType=baseType,
    createConstructorDefinition=constructorDefinition,
    createExtendedType=extendedType
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void constructorDefinition() {
    assertEquals {
        actual = createConstructorDefinition {
            name = "myConstructor";
            parameters = {
                ValueParameter {
                    annotations = createAnnotations { "shared", "actual" };
                    type = createBaseType("String");
                    name = LIdentifier("string");
                }
            };
            extendedType = createExtendedType {
                "Super";
                IntegerLiteral("1"), createBaseExpression("string")
            };
            annotations = createAnnotations {
                "My constructor does something.
                 
                 It’s the most amazing constructor ever.";
                "shared"
            };
        };
        expected = ConstructorDefinition {
            name = LIdentifier("myConstructor");
            parameters = Parameters([
                    ValueParameter {
                        annotations = createAnnotations { "shared", "actual" };
                        type = createBaseType("String");
                        name = LIdentifier("string");
                    }]);
            extendedType = ExtendedType(Extension {
                    nameAndArgs = TypeNameWithTypeArguments(UIdentifier("Super"));
                    arguments = PositionalArguments(ArgumentList([IntegerLiteral("1"), createBaseExpression("string")]));
                });
            annotations = Annotations {
                StringLiteral("My constructor does something.
                               
                               It’s the most amazing constructor ever.");
                [Annotation(LIdentifier("shared"))];
            };
            block = Block([]);
        };
        message = "Constructor definition";
    };
}
