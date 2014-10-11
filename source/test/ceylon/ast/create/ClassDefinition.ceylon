import ceylon.ast.core {
    Annotation,
    Annotations,
    CaseTypes,
    ClassBody,
    ClassDefinition,
    IntegerLiteral,
    LIdentifier,
    Parameters,
    SatisfiedTypes,
    StringLiteral,
    TypeParameter,
    TypeParameters,
    UIdentifier,
    ValueParameter,
    ExtendedType,
    ClassInstantiation,
    TypeNameWithTypeArguments,
    PositionalArguments,
    ArgumentList
}
import ceylon.ast.create {
    createAnnotations=annotations,
    createBaseExpression=baseExpression,
    createBaseType=baseType,
    createClassDefinition=classDefinition,
    createExtendedType=extendedType
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void classDefinition() {
    assertEquals {
        actual = createClassDefinition {
            name = "MyClass";
            parameters = {
                ValueParameter {
                    annotations = createAnnotations { "shared", "actual" };
                    type = createBaseType("String");
                    name = LIdentifier("string");
                }
            };
            caseTypes = { "CT1", "CT2" };
            extendedType = createExtendedType {
                "Super";
                IntegerLiteral("1"), createBaseExpression("string")
            };
            satisfiedTypes = { "Identifiable" };
            typeParameters = { "Element", "Absent" };
            annotations = createAnnotations {
                "My class does something.
                 
                 It’s the most amazing class ever.";
                "shared"
            };
        };
        expected = ClassDefinition {
            name = UIdentifier("MyClass");
            parameters = Parameters([
                    ValueParameter {
                        annotations = createAnnotations { "shared", "actual" };
                        type = createBaseType("String");
                        name = LIdentifier("string");
                    }]);
            caseTypes = CaseTypes([createBaseType("CT1"), createBaseType("CT2")]);
            extendedType = ExtendedType(ClassInstantiation {
                    name = TypeNameWithTypeArguments(UIdentifier("Super"));
                    arguments = PositionalArguments(ArgumentList([IntegerLiteral("1"), createBaseExpression("string")]));
                });
            satisfiedTypes = SatisfiedTypes([createBaseType("Identifiable")]);
            typeParameters = TypeParameters([TypeParameter(UIdentifier("Element")), TypeParameter(UIdentifier("Absent"))]);
            annotations = Annotations {
                StringLiteral("My class does something.
                               
                               It’s the most amazing class ever.");
                [Annotation(LIdentifier("shared"))];
            };
            body = ClassBody([]);
        };
        message = "Class definition";
    };
}
