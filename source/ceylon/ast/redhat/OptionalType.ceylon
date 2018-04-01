import ceylon.ast.core {
    Node,
    OptionalType,
    PrimaryType
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JOptionalType=OptionalType
    }
}

"Converts a RedHat AST [[OptionalType|JOptionalType]] to a `ceylon.ast` [[OptionalType]]."
shared OptionalType optionalTypeToCeylon(JOptionalType optionalType, Anything(JNode, Node) update = noop) {
    assert (is PrimaryType definite = typeToCeylon(optionalType.definiteType, update));
    value result = OptionalType(definite);
    update(optionalType, result);
    return result;
}

"Parses the given [[code]] for an Optional Type
 into an [[OptionalType]] using the Ceylon compiler
 (more specifically, the rule for an `primaryType`)."
shared OptionalType? parseOptionalType(String code, Anything(JNode, Node) update = noop) {
    if (is JOptionalType jOptionalType = createParser(code).primaryType()) {
        return optionalTypeToCeylon(jOptionalType, update);
    } else {
        return null;
    }
}
