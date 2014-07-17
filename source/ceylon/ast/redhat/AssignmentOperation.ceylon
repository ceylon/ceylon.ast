import ceylon.ast.core {
    AssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JArithmeticAssignmentOp=ArithmeticAssignmentOp,
        JAssignOp=AssignOp,
        JAssignmentOp=AssignmentOp,
        JBitwiseAssignmentOp=BitwiseAssignmentOp,
        JLogicalAssignmentOp=LogicalAssignmentOp
    }
}

"Converts a RedHat AST [[AssignmentOp|JAssignmentOp]] to a `ceylon.ast` [[AssignmentOperation]]."
shared AssignmentOperation assignmentOperationToCeylon(JAssignmentOp assignmentOperation) {
    assert (is JAssignOp|JArithmeticAssignmentOp|JBitwiseAssignmentOp|JLogicalAssignmentOp assignmentOperation);
    switch (assignmentOperation)
    case (is JAssignOp) { return assignOperationToCeylon(assignmentOperation); }
    case (is JArithmeticAssignmentOp) { return arithmeticAssignmentOperationToCeylon(assignmentOperation); }
    case (is JBitwiseAssignmentOp) { return setAssignmentOperationToCeylon(assignmentOperation); }
    case (is JLogicalAssignmentOp) { return logicalAssignmentOperationToCeylon(assignmentOperation); }
}

"Compiles the given [[code]] for an Assignment Operation
 into an [[AssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared AssignmentOperation? compileAssignmentOperation(String code) {
    if (is JAssignmentOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return assignmentOperationToCeylon(jAssignmentExpression);
    } else {
        return null;
    }
}
