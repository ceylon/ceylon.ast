import ceylon.ast.core {
    IntersectAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIntersectAssignOp=IntersectAssignOp
    }
}

"Converts a RedHat AST [[IntersectAssignOp|JIntersectAssignOp]] to a `ceylon.ast` [[IntersectAssignmentOperation]]."
shared IntersectAssignmentOperation intersectAssignmentOperationToCeylon(JIntersectAssignOp intersectAssignmentOperation) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(intersectAssignmentOperation.leftTerm),
        is AssigningExpression right = expressionToCeylon(intersectAssignmentOperation.rightTerm));
    return IntersectAssignmentOperation(left, right);
}

"Compiles the given [[code]] for an Intersect Assignment Operation
 into an [[IntersectAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared IntersectAssignmentOperation? compileIntersectAssignmentOperation(String code) {
    if (is JIntersectAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return intersectAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
