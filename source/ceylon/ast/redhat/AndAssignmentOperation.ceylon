import ceylon.ast.core {
    AndAssignmentOperation,
    AssigningExpression,
    Node,
    ThenElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAndAssignOp=AndAssignOp
    }
}

"Converts a RedHat AST [[AndAssignOp|JAndAssignOp]] to a `ceylon.ast` [[AndAssignmentOperation]]."
shared AndAssignmentOperation andAssignmentOperationToCeylon(JAndAssignOp andAssignmentOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(andAssignmentOperation.leftTerm, update),
        is AssigningExpression right = expressionToCeylon(andAssignmentOperation.rightTerm, update));
    value result = AndAssignmentOperation(left, right);
    update(andAssignmentOperation, result);
    return result;
}

"Parses the given [[code]] for an And Assignment Operation
 into an [[AndAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared AndAssignmentOperation? parseAndAssignmentOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JAndAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return andAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
