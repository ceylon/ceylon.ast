import ceylon.ast.core {
    InOperation,
    ExistsNonemptyExpression,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JInOp=InOp
    }
}

"Converts a RedHat AST [[InOp|JInOp]] to a `ceylon.ast` [[InOperation]]."
shared InOperation inOperationToCeylon(JInOp inOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ExistsNonemptyExpression left = expressionToCeylon(inOperation.leftTerm, update),
        is ExistsNonemptyExpression right = expressionToCeylon(inOperation.rightTerm, update));
    value result = InOperation(left, right);
    update(inOperation, result);
    return result;
}

"Parses the given [[code]] for an In Operation
 into an [[InOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared InOperation? parseInOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JInOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return inOperationToCeylon(jComparisonExpression, update);
    } else {
        return null;
    }
}
