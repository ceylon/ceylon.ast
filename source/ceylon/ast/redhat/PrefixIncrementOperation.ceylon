import ceylon.ast.core {
    Node,
    PrefixIncrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIncrementOp=IncrementOp,
        JPrimary=Primary
    }
}

"Converts a RedHat AST [[IncrementOp|JIncrementOp]] to a `ceylon.ast` [[PrefixIncrementOperation]]."
shared PrefixIncrementOperation prefixIncrementOperationToCeylon(JIncrementOp prefixIncrementOperation, Anything(JNode, Node) update = noop) {
    assert (is JPrimary jPrimary = prefixIncrementOperation.term);
    value result = PrefixIncrementOperation(primaryToCeylon(jPrimary, update));
    update(prefixIncrementOperation, result);
    return result;
}

"Parses the given [[code]] for a Prefix Increment Operation
 into a [[PrefixIncrementOperation]] using the Ceylon compiler
 (more specifically, the rule for an `incrementDecrementExpression`)."
shared PrefixIncrementOperation? parsePrefixIncrementOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JIncrementOp jPrefixIncrementOperation = createParser(code).incrementDecrementExpression(),
        jPrefixIncrementOperation.term is JPrimary) {
        return prefixIncrementOperationToCeylon(jPrefixIncrementOperation, update);
    } else {
        return null;
    }
}
