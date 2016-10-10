import ceylon.ast.core {
    ComplementAssignmentOperation,
    Node,
    ThenElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JComplementAssignOp=ComplementAssignOp
    }
}

"Converts a RedHat AST [[ComplementAssignOp|JComplementAssignOp]] to a `ceylon.ast` [[ComplementAssignmentOperation]]."
shared ComplementAssignmentOperation complementAssignmentOperationToCeylon(JComplementAssignOp complementAssignmentOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(complementAssignmentOperation.leftTerm, update));
    value right = expressionToCeylon(complementAssignmentOperation.rightTerm, update);
    value result = ComplementAssignmentOperation(left, right);
    update(complementAssignmentOperation, result);
    return result;
}

"Parses the given [[code]] for a Complement Assignment Operation
 into a [[ComplementAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared ComplementAssignmentOperation? parseComplementAssignmentOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JComplementAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return complementAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
