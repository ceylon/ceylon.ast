import ceylon.ast.core {
    Annotation,
    Annotations,
    Block,
    FunctionDefinition,
    LIdentifier,
    Parameters,
    StringLiteral,
    TypeParameter,
    TypeParameters,
    UIdentifier,
    ValueParameter,
    VoidModifier
}
import ceylon.ast.create {
    createAnnotations=annotations,
    createBaseType=baseType,
    createFunctionDefinition=functionDefinition,
    createInvocationStatement=invocationStatement
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void functionDefinition() {
    assertEquals {
        actual = createFunctionDefinition {
            name = "myFunction";
            type = VoidModifier();
            parameters = {
                ValueParameter {
                    type = createBaseType("String");
                    name = LIdentifier("name");
                    annotations = createAnnotations { "variable" };
                }
            };
            typeParameters = { "Element" };
            annotations = createAnnotations {
                "My function does something.
                 
                 It’s the most amazing function ever.";
                "shared", "actual", "default"
            };
            
            createInvocationStatement { invoked = "print"; StringLiteral("Hello, World!") }
        };
        expected = FunctionDefinition {
            name = LIdentifier("myFunction");
            type = VoidModifier();
            parameterLists = [Parameters([ValueParameter {
                            type = createBaseType("String");
                            name = LIdentifier("name");
                            annotations = createAnnotations { "variable" };
                        }])];
            typeParameters = TypeParameters([TypeParameter(UIdentifier("Element"))]);
            annotations = Annotations {
                StringLiteral("My function does something.
                               
                               It’s the most amazing function ever.");
                annotations = [Annotation(LIdentifier("shared")), Annotation(LIdentifier("actual")), Annotation(LIdentifier("default"))];
            };
            
            definition = Block([createInvocationStatement { invoked = "print"; StringLiteral("Hello, World!") }]);
        };
        message = "Function definition";
    };
}
