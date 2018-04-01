import ceylon.ast.core {
    Node,
    ThenOperation,
    DisjoiningExpression,
    ThenElseExpression
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JThenOp=ThenOp
    }
}

"Converts a RedHat AST [[ThenOp|JThenOp]] to a `ceylon.ast` [[ThenOperation]]."
shared ThenOperation thenOperationToCeylon(JThenOp thenOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(thenOperation.leftTerm, update),
        is DisjoiningExpression right = expressionToCeylon(thenOperation.rightTerm, update));
    value result = ThenOperation(left, right);
    update(thenOperation, result);
    return result;
}

"Parses the given [[code]] for a Then Operation
 into a [[ThenOperation]] using the Ceylon compiler
 (more specifically, the rule for a `thenElseExpression`)."
shared ThenOperation? parseThenOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JThenOp jThenElseExpression = createParser(code).thenElseExpression()) {
        return thenOperationToCeylon(jThenElseExpression, update);
    } else {
        return null;
    }
}
