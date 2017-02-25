import ceylon.ast.core {
    Node,
    PrefixDecrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDecrementOp=DecrementOp,
        JPrimary=Primary
    }
}

"Converts a RedHat AST [[DecrementOp|JDecrementOp]] to a `ceylon.ast` [[PrefixDecrementOperation]]."
shared PrefixDecrementOperation prefixDecrementOperationToCeylon(JDecrementOp prefixDecrementOperation, Anything(JNode, Node) update = noop) {
    assert (is JPrimary jPrimary = prefixDecrementOperation.term);
    value result = PrefixDecrementOperation(primaryToCeylon(jPrimary, update));
    update(prefixDecrementOperation, result);
    return result;
}

"Parses the given [[code]] for a Prefix Decrement Operation
 into a [[PrefixDecrementOperation]] using the Ceylon compiler
 (more specifically, the rule for n `incrementDecrementExpression`)."
shared PrefixDecrementOperation? parsePrefixDecrementOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JDecrementOp jDecrementOp = createParser(code).incrementDecrementExpression(),
        jDecrementOp.term is JPrimary) {
        return prefixDecrementOperationToCeylon(jDecrementOp, update);
    } else {
        return null;
    }
}
