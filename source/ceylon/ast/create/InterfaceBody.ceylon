import ceylon.ast.core {
    Body,
    Declaration,
    InterfaceBody,
    Statement
}

"Converts a [[stream of declarations|content]]
 to an [[InterfaceBody]]."
throws (`class AssertionError`, "If the [[content]] is a different kind of content.")
shared InterfaceBody interfaceBody(BodyIsh content) {
    if (is Body content) {
        "Cannot implicitly convert between different kinds of Body"
        assert (is InterfaceBody content);
        return content;
    } else {
        assert (is {Declaration|Statement*} content);
        return InterfaceBody(content.collect {
                Declaration collecting(Declaration|Statement element) {
                    "Interface body cannot contain statements"
                    assert (is Declaration element);
                    return element;
                }
            });
    }
}
