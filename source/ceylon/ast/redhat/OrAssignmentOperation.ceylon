import ceylon.ast.core {
    OrAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOrAssignOp=OrAssignOp
    }
}

"Converts a RedHat AST [[OrAssignOp|JOrAssignOp]] to a `ceylon.ast` [[OrAssignmentOperation]]."
shared OrAssignmentOperation orAssignmentOperationToCeylon(JOrAssignOp orAssignmentOperation) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(orAssignmentOperation.leftTerm),
        is AssigningExpression right = expressionToCeylon(orAssignmentOperation.rightTerm));
    return OrAssignmentOperation(left, right);
}

"Compiles the given [[code]] for an Or Assignment Operation
 into an [[OrAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared OrAssignmentOperation? compileOrAssignmentOperation(String code) {
    if (is JOrAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return orAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
