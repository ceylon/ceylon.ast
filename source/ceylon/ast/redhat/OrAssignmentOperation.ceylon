import ceylon.ast.core {
    OrAssignmentOperation,
    Precedence16Expression,
    Precedence17Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOrAssignOp=OrAssignOp
    }
}

"Converts a RedHat AST [[OrAssignOp|JOrAssignOp]] to a `ceylon.ast` [[OrAssignmentOperation]]."
shared OrAssignmentOperation orAssignmentOperationToCeylon(JOrAssignOp orAssignmentOperation) {
    "Check precedence"
    assert (is Precedence16Expression left = expressionToCeylon(orAssignmentOperation.leftTerm),
        is Precedence17Expression right = expressionToCeylon(orAssignmentOperation.rightTerm));
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
