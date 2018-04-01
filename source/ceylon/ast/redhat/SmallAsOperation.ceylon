import ceylon.ast.core {
    ExistsNonemptyExpression,
    Node,
    SmallAsOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSmallAsOp=SmallAsOp
    }
}

"Converts a RedHat AST [[SmallAsOp|JSmallAsOp]] to a `ceylon.ast` [[SmallAsOperation]]."
shared SmallAsOperation smallAsOperationToCeylon(JSmallAsOp smallAsOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ExistsNonemptyExpression left = expressionToCeylon(smallAsOperation.leftTerm, update),
        is ExistsNonemptyExpression right = expressionToCeylon(smallAsOperation.rightTerm, update));
    value result = SmallAsOperation(left, right);
    update(smallAsOperation, result);
    return result;
}

"Parses the given [[code]] for a Small As Operation
 into a [[SmallAsOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared SmallAsOperation? parseSmallAsOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JSmallAsOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return smallAsOperationToCeylon(jComparisonExpression, update);
    } else {
        return null;
    }
}
