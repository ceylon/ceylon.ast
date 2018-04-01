import ceylon.ast.core {
    Node,
    UnioningExpression,
    MultiplyingExpression,
    QuotientOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JQuotientOp=QuotientOp
    }
}

"Converts a RedHat AST [[QuotientOp|JQuotientOp]] to a `ceylon.ast` [[QuotientOperation]]."
shared QuotientOperation quotientOperationToCeylon(JQuotientOp divisionOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is MultiplyingExpression left = expressionToCeylon(divisionOperation.leftTerm, update),
        is UnioningExpression right = expressionToCeylon(divisionOperation.rightTerm, update));
    value result = QuotientOperation(left, right);
    update(divisionOperation, result);
    return result;
}

"Parses the given [[code]] for a Quotient Operation
 into a [[QuotientOperation]] using the Ceylon compiler
 (more specifically, the rule for a `multiplicativeExpression`)."
shared QuotientOperation? parseQuotientOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JQuotientOp jMultiplicativeExpression = createParser(code).multiplicativeExpression()) {
        return quotientOperationToCeylon(jMultiplicativeExpression, update);
    } else {
        return null;
    }
}
