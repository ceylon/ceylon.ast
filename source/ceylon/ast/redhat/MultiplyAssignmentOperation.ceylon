import ceylon.ast.core {
    MultiplyAssignmentOperation,
    Node,
    ThenElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JMultiplyAssignOp=MultiplyAssignOp
    }
}

"Converts a RedHat AST [[MultiplyAssignOp|JMultiplyAssignOp]] to a `ceylon.ast` [[MultiplyAssignmentOperation]]."
shared MultiplyAssignmentOperation multiplyAssignmentOperationToCeylon(JMultiplyAssignOp multiplyAssignmentOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(multiplyAssignmentOperation.leftTerm, update));
    value right = expressionToCeylon(multiplyAssignmentOperation.rightTerm, update);
    value result = MultiplyAssignmentOperation(left, right);
    update(multiplyAssignmentOperation, result);
    return result;
}

"Parses the given [[code]] for a Multiply Assignment Operation
 into a [[MultiplyAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared MultiplyAssignmentOperation? parseMultiplyAssignmentOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JMultiplyAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return multiplyAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
