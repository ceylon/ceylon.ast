import ceylon.ast.core {
    CaseTypes
}
import ceylon.ast.create {
    createBaseType=baseType,
    createCaseTypes=caseTypes,
    createLIdentifier=lidentifier
}
import ceylon.test {
    test,
    assertEquals
}

test
shared void caseTypes() {
    assertEquals {
        actual = createCaseTypes("Other");
        expected = CaseTypes([createBaseType("Other")]);
        message = "Self case type";
    };
    assertEquals {
        actual = createCaseTypes("true", "false");
        expected = CaseTypes([createLIdentifier("true"), createLIdentifier("false")]);
        message = "Object case types";
    };
}
