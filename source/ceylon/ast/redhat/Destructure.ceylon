import ceylon.ast.core {
    Destructure,
    EntryPattern,
    Node,
    TuplePattern
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDestructure=Destructure
    }
}

"Converts a RedHat AST [[Destructure|JDestructure]] to a `ceylon.ast` [[Destructure]]."
shared Destructure destructureToCeylon(JDestructure destructure, Anything(JNode, Node) update = noop) {
    assert (is TuplePattern|EntryPattern pattern = patternToCeylon(destructure.pattern, update));
    value specifier = specifierToCeylon(destructure.specifierExpression, update);
    value result = Destructure(pattern, specifier); // TODO #138: valueModifier argument should not be defaulted
    update(destructure, result);
    return result;
}

"Parses the given [[code]] for a Destructure
 into a [[Destructure]] using the Ceylon compiler
 (more specifically, the rule for a `destructure`)."
shared Destructure? parseDestructure(String code, Anything(JNode, Node) update = noop) {
    if (exists jDestructure = createParser(code).destructure()) {
        // TODO #138: support all kinds of destructuring statements
        assert (jDestructure.variables.size() == 1);
        assert (is JDestructure jDestructure_ = jDestructure.variables.get(0));
        return destructureToCeylon(jDestructure_, update);
    } else {
        return null;
    }
}
