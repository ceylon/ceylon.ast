import ceylon.ast.core {
    SatisfiedTypes
}
import ceylon.ast.create {
    createBaseType=baseType,
    createSatisfiedTypes=satisfiedTypes
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void satisfiedTypes() {
    assertEquals {
        actual = createSatisfiedTypes({});
        expected = null;
        message = "Missing satisfied types";
    };
    assertEquals {
        actual = createSatisfiedTypes({ "Identifiable" });
        expected = SatisfiedTypes([createBaseType("Identifiable")]);
        message = "One satisfied type";
    };
    assertEquals {
        actual = createSatisfiedTypes({ createBaseType("Iterable", "Integer", "Null"), createBaseType("Summable", "Vector") });
        expected = SatisfiedTypes([createBaseType("Iterable", "Integer", "Null"), createBaseType("Summable", "Vector")]);
        message = "Two satisfied types";
    };
}
