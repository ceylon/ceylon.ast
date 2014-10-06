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
        actual = createCaseTypes({});
        expected = null;
        message = "Missing case types";
    };
    assertEquals {
        actual = createCaseTypes({ createBaseType("Other") });
        expected = CaseTypes([createBaseType("Other")]);
        message = "Self case type";
    };
    assertEquals {
        actual = createCaseTypes({ createLIdentifier("true"), createLIdentifier("false") });
        expected = CaseTypes([createLIdentifier("true"), createLIdentifier("false")]);
        message = "Object case types";
    };
}
