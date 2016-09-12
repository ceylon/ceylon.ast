import ceylon.ast.core {
    AssigningExpression,
    IntersectAssignmentOperation,
    Node,
    ThenElseExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIntersectAssignOp=IntersectAssignOp
    }
}

"Converts a RedHat AST [[IntersectAssignOp|JIntersectAssignOp]] to a `ceylon.ast` [[IntersectAssignmentOperation]]."
shared IntersectAssignmentOperation intersectAssignmentOperationToCeylon(JIntersectAssignOp intersectAssignmentOperation, Anything(JNode,Node) update = noop) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(intersectAssignmentOperation.leftTerm, update),
        is AssigningExpression right = expressionToCeylon(intersectAssignmentOperation.rightTerm, update));
    value result = IntersectAssignmentOperation(left, right);
    update(intersectAssignmentOperation, result);
    return result;
}

"Parses the given [[code]] for an Intersect Assignment Operation
 into an [[IntersectAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared IntersectAssignmentOperation? parseIntersectAssignmentOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JIntersectAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return intersectAssignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
