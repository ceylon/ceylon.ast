import ceylon.ast.core {
    AddAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAddAssignOp=AddAssignOp
    }
}

"Converts a RedHat AST [[AddAssignOp|JAddAssignOp]] to a `ceylon.ast` [[AddAssignmentOperation]]."
shared AddAssignmentOperation addAssignmentOperationToCeylon(JAddAssignOp addAssignmentOperation) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(addAssignmentOperation.leftTerm),
        is AssigningExpression right = expressionToCeylon(addAssignmentOperation.rightTerm));
    return AddAssignmentOperation(left, right);
}

"Compiles the given [[code]] for an Add Assignment Operation
 into an [[AddAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared AddAssignmentOperation? compileAddAssignmentOperation(String code) {
    if (is JAddAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return addAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
