import ceylon.ast.core {
    AssignOperation,
    Node,
    ThenElseExpression
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAssignOp=AssignOp
    }
}

"Converts a RedHat AST [[AssignOp|JAssignOp]] to a `ceylon.ast` [[AssignOperation]]."
shared AssignOperation assignOperationToCeylon(JAssignOp assignOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(assignOperation.leftTerm, update));
    value right = expressionToCeylon(assignOperation.rightTerm, update);
    value result = AssignOperation(left, right);
    update(assignOperation, result);
    return result;
}

"Parses the given [[code]] for an Assign Operation
 into an [[AssignOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared AssignOperation? parseAssignOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return assignOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
