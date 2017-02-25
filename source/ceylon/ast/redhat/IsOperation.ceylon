import ceylon.ast.core {
    IsOperation,
    ExistsNonemptyExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIsOp=IsOp,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[IsOp|JIsOp]] to a `ceylon.ast` [[IsOperation]]."
shared IsOperation isOperationToCeylon(JIsOp isOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ExistsNonemptyExpression operand = expressionToCeylon(isOperation.term, update));
    "Must be a real type"
    assert (is JStaticType type = isOperation.type);
    value result = IsOperation(operand, typeToCeylon(type, update));
    update(isOperation, result);
    return result;
}

"Parses the given [[code]] for an Is Operation
 into an [[IsOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared IsOperation? parseIsOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JIsOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return isOperationToCeylon(jComparisonExpression, update);
    } else {
        return null;
    }
}
