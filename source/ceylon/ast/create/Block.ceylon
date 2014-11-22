import ceylon.ast.core {
    Block,
    Body
}

"Converts a [[stream of declarations and statements|content]]
 to a [[Block]]."
throws (`class AssertionError`, "If the [[content]] is a different kind of content.")
shared Block block(BodyIsh content) {
    if (is Body content) {
        "Cannot implicitly convert between different kinds of Body"
        assert (is Block content);
        return content;
    } else {
        return Block(content.sequence());
    }
}
