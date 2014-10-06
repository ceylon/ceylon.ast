import ceylon.ast.core {
    OptionalType
}
import ceylon.ast.create {
    createBaseType=baseType,
    createPrimaryType=primaryType
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void primaryType() {
    assertEquals {
        actual = createPrimaryType("String");
        expected = createBaseType("String");
        message = "Primary type from string";
    };
    assertEquals {
        actual = createPrimaryType(OptionalType(createBaseType("String")));
        expected = OptionalType(createBaseType("String"));
        message = "Primary type from optional type";
    };
}
