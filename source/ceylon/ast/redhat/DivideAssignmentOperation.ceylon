import ceylon.ast.core {
    DivideAssignmentOperation,
    Node,
    ThenElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDivideAssignOp=DivideAssignOp
    }
}

"Converts a RedHat AST [[DivideAssignOp|JDivideAssignOp]] to a `ceylon.ast` [[DivideAssignmentOperation]]."
shared DivideAssignmentOperation divideAssignmentOperationToCeylon(JDivideAssignOp divideAssignmentOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(divideAssignmentOperation.leftTerm, update));
    value right = expressionToCeylon(divideAssignmentOperation.rightTerm, update);
    value result = DivideAssignmentOperation(left, right);
    update(divideAssignmentOperation, result);
    return result;
}

"Parses the given [[code]] for a Divide Assignment Operation
 into a [[DivideAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for a `assignmentExpression`)."
shared DivideAssignmentOperation? parseDivideAssignmentOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JDivideAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return divideAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
