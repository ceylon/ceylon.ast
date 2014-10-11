import ceylon.ast.core {
    OutModifier,
    TypeParameter,
    TypeParameters,
    UIdentifier
}
import ceylon.ast.create {
    createBaseType=baseType,
    createTypeParameters=typeParameters
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void typeParameters() {
    assertEquals {
        actual = createTypeParameters("Other");
        expected = TypeParameters([TypeParameter(UIdentifier("Other"))]);
        message = "Self type parameters";
    };
    assertEquals {
        actual = createTypeParameters(
            TypeParameter(UIdentifier("Element"), OutModifier()),
            TypeParameter(UIdentifier("Absent"), OutModifier(), createBaseType("Null"))
        );
        expected = TypeParameters([
                TypeParameter(UIdentifier("Element"), OutModifier()),
                TypeParameter(UIdentifier("Absent"), OutModifier(), createBaseType("Null"))
            ]);
        message = "Iterable type parameters";
    };
}
