import ceylon.ast.core {
    Annotation,
    Annotations,
    CaseTypes,
    InterfaceBody,
    InterfaceDefinition,
    LIdentifier,
    SatisfiedTypes,
    StringLiteral,
    TypeParameter,
    TypeParameters,
    UIdentifier
}
import ceylon.ast.create {
    createAnnotations=annotations,
    createBaseType=baseType,
    createInterfaceDefinition=interfaceDefinition
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void interfaceDefinition() {
    assertEquals {
        actual = createInterfaceDefinition {
            name = "MyInterface";
            caseTypes = { "CT1", "CT2" };
            satisfiedTypes = { "Identifiable" };
            typeParameters = { "Element", "Absent" };
            annotations = createAnnotations {
                "My interface does something.
                 
                 It’s the most amazing interface ever.";
                "shared", "sealed"
            };
        };
        expected = InterfaceDefinition {
            name = UIdentifier("MyInterface");
            caseTypes = CaseTypes([createBaseType("CT1"), createBaseType("CT2")]);
            satisfiedTypes = SatisfiedTypes([createBaseType("Identifiable")]);
            typeParameters = TypeParameters([TypeParameter(UIdentifier("Element")), TypeParameter(UIdentifier("Absent"))]);
            annotations = Annotations {
                StringLiteral("My interface does something.
                               
                               It’s the most amazing interface ever.");
                [Annotation(LIdentifier("shared")), Annotation(LIdentifier("sealed"))];
            };
            body = InterfaceBody([]);
        };
        message = "Interface definition";
    };
}
