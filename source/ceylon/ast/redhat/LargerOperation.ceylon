import ceylon.ast.core {
    LargerOperation,
    ExistsNonemptyExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JLargerOp=LargerOp
    }
}

"Converts a RedHat AST [[LargerOp|JLargerOp]] to a `ceylon.ast` [[LargerOperation]]."
shared LargerOperation largerOperationToCeylon(JLargerOp largerOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ExistsNonemptyExpression left = expressionToCeylon(largerOperation.leftTerm, update),
        is ExistsNonemptyExpression right = expressionToCeylon(largerOperation.rightTerm, update));
    value result = LargerOperation(left, right);
    update(largerOperation, result);
    return result;
}

"Parses the given [[code]] for a Larger Operation
 into a [[LargerOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared LargerOperation? parseLargerOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JLargerOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return largerOperationToCeylon(jComparisonExpression, update);
    } else {
        return null;
    }
}
