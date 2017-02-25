import ceylon.ast.core {
    Node,
    ThenElseExpression,
    RemainderAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JRemainderAssignOp=RemainderAssignOp
    }
}

"Converts a RedHat AST [[RemainderAssignOp|JRemainderAssignOp]] to a `ceylon.ast` [[RemainderAssignmentOperation]]."
shared RemainderAssignmentOperation remainderAssignmentOperationToCeylon(JRemainderAssignOp remainderAssignmentOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(remainderAssignmentOperation.leftTerm, update));
    value right = expressionToCeylon(remainderAssignmentOperation.rightTerm, update);
    value result = RemainderAssignmentOperation(left, right);
    update(remainderAssignmentOperation, result);
    return result;
}

"Parses the given [[code]] for a Remainder Assignment Operation
 into a [[RemainderAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for a `assignmentExpression`)."
shared RemainderAssignmentOperation? parseRemainderAssignmentOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JRemainderAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return remainderAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
