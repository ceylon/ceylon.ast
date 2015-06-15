import ceylon.ast.core {
    CompareOperation,
    ExistsNonemptyExpression,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JCompareOp=CompareOp
    }
}

"Converts a RedHat AST [[CompareOp|JCompareOp]] to a `ceylon.ast` [[CompareOperation]]."
shared CompareOperation compareOperationToCeylon(JCompareOp compareOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ExistsNonemptyExpression left = expressionToCeylon(compareOperation.leftTerm, update),
        is ExistsNonemptyExpression right = expressionToCeylon(compareOperation.rightTerm, update));
    value result = CompareOperation(left, right);
    update(compareOperation, result);
    return result;
}

"Compiles the given [[code]] for a Compare Operation
 into a [[CompareOperation]] using the Ceylon compiler
 (more specifically, the rule for a `comparisonExpression`)."
shared CompareOperation? compileCompareOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JCompareOp jComparisonExpression = createParser(code).comparisonExpression()) {
        return compareOperationToCeylon(jComparisonExpression, update);
    } else {
        return null;
    }
}
