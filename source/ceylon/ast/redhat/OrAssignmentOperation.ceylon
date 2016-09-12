import ceylon.ast.core {
    AssigningExpression,
    Node,
    OrAssignmentOperation,
    ThenElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JOrAssignOp=OrAssignOp
    }
}

"Converts a RedHat AST [[OrAssignOp|JOrAssignOp]] to a `ceylon.ast` [[OrAssignmentOperation]]."
shared OrAssignmentOperation orAssignmentOperationToCeylon(JOrAssignOp orAssignmentOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(orAssignmentOperation.leftTerm, update),
        is AssigningExpression right = expressionToCeylon(orAssignmentOperation.rightTerm, update));
    value result = OrAssignmentOperation(left, right);
    update(orAssignmentOperation, result);
    return result;
}

"Parses the given [[code]] for an Or Assignment Operation
 into an [[OrAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared OrAssignmentOperation? parseOrAssignmentOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JOrAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return orAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
