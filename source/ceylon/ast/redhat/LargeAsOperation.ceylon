import ceylon.ast.core {
    LargeAsOperation,
    ExistsNonemptyExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JLargeAsOp=LargeAsOp
    }
}

"Converts a RedHat AST [[LargeAsOp|JLargeAsOp]] to a `ceylon.ast` [[LargeAsOperation]]."
shared LargeAsOperation largeAsOperationToCeylon(JLargeAsOp largeAsOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ExistsNonemptyExpression left = expressionToCeylon(largeAsOperation.leftTerm, update),
        is ExistsNonemptyExpression right = expressionToCeylon(largeAsOperation.rightTerm, update));
    value result = LargeAsOperation(left, right);
    update(largeAsOperation, result);
    return result;
}

"Parses the given [[code]] for a Large As Operation
 into a [[LargeAsOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared LargeAsOperation? parseLargeAsOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JLargeAsOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return largeAsOperationToCeylon(jComparisonExpression, update);
    } else {
        return null;
    }
}
