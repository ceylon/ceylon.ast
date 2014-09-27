import ceylon.ast.core {
    AndAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAndAssignOp=AndAssignOp
    }
}

"Converts a RedHat AST [[AndAssignOp|JAndAssignOp]] to a `ceylon.ast` [[AndAssignmentOperation]]."
shared AndAssignmentOperation andAssignmentOperationToCeylon(JAndAssignOp andAssignmentOperation) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(andAssignmentOperation.leftTerm),
        is AssigningExpression right = expressionToCeylon(andAssignmentOperation.rightTerm));
    return AndAssignmentOperation(left, right);
}

"Compiles the given [[code]] for an And Assignment Operation
 into an [[AndAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared AndAssignmentOperation? compileAndAssignmentOperation(String code) {
    if (is JAndAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return andAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
