import ceylon.ast.core {
    AssignOperation,
    Precedence16Expression,
    Precedence17Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAssignOp=AssignOp
    }
}

"Converts a RedHat AST [[AssignOp|JAssignOp]] to a `ceylon.ast` [[AssignOperation]]."
shared AssignOperation assignOperationToCeylon(JAssignOp assignOperation) {
    "Check precedence"
    assert (is Precedence16Expression left = expressionToCeylon(assignOperation.leftTerm),
        is Precedence17Expression right = expressionToCeylon(assignOperation.rightTerm));
    return AssignOperation(left, right);
}

"Compiles the given [[code]] for an Assign Operation
 into an [[AssignOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared AssignOperation? compileAssignOperation(String code) {
    if (is JAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return assignOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
