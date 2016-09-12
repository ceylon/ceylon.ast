import ceylon.ast.core {
    ExistsNonemptyExpression,
    Node,
    SmallerOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSmallerOp=SmallerOp
    }
}

"Converts a RedHat AST [[SmallerOp|JSmallerOp]] to a `ceylon.ast` [[SmallerOperation]]."
shared SmallerOperation smallerOperationToCeylon(JSmallerOp smallerOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ExistsNonemptyExpression left = expressionToCeylon(smallerOperation.leftTerm, update),
        is ExistsNonemptyExpression right = expressionToCeylon(smallerOperation.rightTerm, update));
    value result = SmallerOperation(left, right);
    update(smallerOperation, result);
    return result;
}

"Parses the given [[code]] for a Smaller Operation
 into a [[SmallerOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared SmallerOperation? parseSmallerOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JSmallerOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return smallerOperationToCeylon(jComparisonExpression, update);
    } else {
        return null;
    }
}
