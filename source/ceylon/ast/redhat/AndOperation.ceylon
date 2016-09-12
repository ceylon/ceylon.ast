import ceylon.ast.core {
    AndOperation,
    NegatingExpression,
    ConjoiningExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAndOp=AndOp
    }
}

"Converts a RedHat AST [[AndOp|JAndOp]] to a `ceylon.ast` [[AndOperation]]."
shared AndOperation andOperationToCeylon(JAndOp andOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ConjoiningExpression left = expressionToCeylon(andOperation.leftTerm, update),
        is NegatingExpression right = expressionToCeylon(andOperation.rightTerm, update));
    value result = AndOperation(left, right);
    update(andOperation, result);
    return result;
}

"Parses the given [[code]] for an And Operation
 into an [[AndOperation]] using the Ceylon compiler
 (more specifically, the rule for an `conjunctionExpression`)."
shared AndOperation? parseAndOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JAndOp jConjunctionExpression = createParser(code).conjunctionExpression()) {
        return andOperationToCeylon(jConjunctionExpression, update);
    } else {
        return null;
    }
}
