import ceylon.ast.core {
    Node,
    ThenElseExpression,
    UnionAssignmentOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JUnionAssignOp=UnionAssignOp
    }
}

"Converts a RedHat AST [[UnionAssignOp|JUnionAssignOp]] to a `ceylon.ast` [[UnionAssignmentOperation]]."
shared UnionAssignmentOperation unionAssignmentOperationToCeylon(JUnionAssignOp unionAssignmentOperation, Anything(JNode, Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(unionAssignmentOperation.leftTerm, update));
    value right = expressionToCeylon(unionAssignmentOperation.rightTerm, update);
    value result = UnionAssignmentOperation(left, right);
    update(unionAssignmentOperation, result);
    return result;
}

"Parses the given [[code]] for an Union Assignment Operation
 into an [[UnionAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared UnionAssignmentOperation? parseUnionAssignmentOperation(String code, Anything(JNode, Node) update = noop) {
    if (is JUnionAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return unionAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
