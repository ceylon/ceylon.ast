import ceylon.ast.core {
    AddAssignmentOperation,
    Node,
    ThenElseExpression
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JAddAssignOp=AddAssignOp
    }
}

"Converts a RedHat AST [[AddAssignOp|JAddAssignOp]] to a `ceylon.ast` [[AddAssignmentOperation]]."
shared AddAssignmentOperation addAssignmentOperationToCeylon(JAddAssignOp addAssignmentOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(addAssignmentOperation.leftTerm, update));
    value right = expressionToCeylon(addAssignmentOperation.rightTerm, update);
    value result = AddAssignmentOperation(left, right);
    update(addAssignmentOperation, result);
    return result;
}

"Parses the given [[code]] for an Add Assignment Operation
 into an [[AddAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared AddAssignmentOperation? parseAddAssignmentOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JAddAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return addAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
