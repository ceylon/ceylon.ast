import ceylon.ast.core {
    Node,
    ThenElseExpression,
    AssigningExpression,
    SubtractAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSubtractAssignOp=SubtractAssignOp
    }
}

"Converts a RedHat AST [[SubtractAssignOp|JSubtractAssignOp]] to a `ceylon.ast` [[SubtractAssignmentOperation]]."
shared SubtractAssignmentOperation subtractAssignmentOperationToCeylon(JSubtractAssignOp subtractAssignmentOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(subtractAssignmentOperation.leftTerm, update),
        is AssigningExpression right = expressionToCeylon(subtractAssignmentOperation.rightTerm, update));
    value result = SubtractAssignmentOperation(left, right);
    update(subtractAssignmentOperation, result);
    return result;
}

"Compiles the given [[code]] for a Subtract Assignment Operation
 into a [[SubtractAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared SubtractAssignmentOperation? compileSubtractAssignmentOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JSubtractAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return subtractAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
