import ceylon.ast.core {
    Precedence16Expression,
    Precedence18Expression,
    RemainderAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JRemainderAssignOp=RemainderAssignOp
    }
}

"Converts a RedHat AST [[RemainderAssignOp|JRemainderAssignOp]] to a `ceylon.ast` [[RemainderAssignmentOperation]]."
shared RemainderAssignmentOperation remainderAssignmentOperationToCeylon(JRemainderAssignOp remainderAssignmentOperation) {
    "Check precedence"
    assert (is Precedence16Expression left = expressionToCeylon(remainderAssignmentOperation.leftTerm),
        is Precedence18Expression right = expressionToCeylon(remainderAssignmentOperation.rightTerm));
    return RemainderAssignmentOperation(left, right);
}

"Compiles the given [[code]] for a Remainder Assignment Operation
 into a [[RemainderAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for a `assignmentExpression`)."
shared RemainderAssignmentOperation? compileRemainderAssignmentOperation(String code) {
    if (is JRemainderAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return remainderAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
