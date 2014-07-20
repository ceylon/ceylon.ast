import ceylon.ast.core {
    MultiplyAssignmentOperation,
    Precedence16Expression,
    Precedence18Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMultiplyAssignOp=MultiplyAssignOp
    }
}

"Converts a RedHat AST [[MultiplyAssignOp|JMultiplyAssignOp]] to a `ceylon.ast` [[MultiplyAssignmentOperation]]."
shared MultiplyAssignmentOperation multiplyAssignmentOperationToCeylon(JMultiplyAssignOp multiplyAssignmentOperation) {
    "Check precedence"
    assert (is Precedence16Expression left = expressionToCeylon(multiplyAssignmentOperation.leftTerm),
        is Precedence18Expression right = expressionToCeylon(multiplyAssignmentOperation.rightTerm));
    return MultiplyAssignmentOperation(left, right);
}

"Compiles the given [[code]] for a Multiply Assignment Operation
 into a [[MultiplyAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared MultiplyAssignmentOperation? compileMultiplyAssignmentOperation(String code) {
    if (is JMultiplyAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return multiplyAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
