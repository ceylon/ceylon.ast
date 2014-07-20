import ceylon.ast.core {
    DivideAssignmentOperation,
    Precedence16Expression,
    Precedence18Expression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDivideAssignOp=DivideAssignOp
    }
}

"Converts a RedHat AST [[DivideAssignOp|JDivideAssignOp]] to a `ceylon.ast` [[DivideAssignmentOperation]]."
shared DivideAssignmentOperation divideAssignmentOperationToCeylon(JDivideAssignOp divideAssignmentOperation) {
    "Check precedence"
    assert (is Precedence16Expression left = expressionToCeylon(divideAssignmentOperation.leftTerm),
        is Precedence18Expression right = expressionToCeylon(divideAssignmentOperation.rightTerm));
    return DivideAssignmentOperation(left, right);
}

"Compiles the given [[code]] for a Divide Assignment Operation
 into a [[DivideAssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for a `assignmentExpression`)."
shared DivideAssignmentOperation? compileDivideAssignmentOperation(String code) {
    if (is JDivideAssignOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return divideAssignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
