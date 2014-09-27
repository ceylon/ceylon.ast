import ceylon.ast.core {
    ComplementAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComplementAssignOp=ComplementAssignOp
    }
}

"Converts a RedHat AST [[ComplementAssignOp|JComplementAssignOp]] to a `ceylon.ast` [[ComplementAssignmentOperation]]."
shared ComplementAssignmentOperation complementAssignmentOperationToCeylon(JComplementAssignOp complementAssignmentOperation) {
    "Check precedence"
    assert (is ThenElseExpression left = expressionToCeylon(complementAssignmentOperation.leftTerm),
        is AssigningExpression right = expressionToCeylon(complementAssignmentOperation.rightTerm));
    return ComplementAssignmentOperation(left, right);
}

"Compiles the given [[code]] for a Complement Assignment Operation
 into a [[ComplementAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared ComplementAssignmentOperation? compileComplementAssignmentOperation(String code) {
    if (is JComplementAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return complementAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
