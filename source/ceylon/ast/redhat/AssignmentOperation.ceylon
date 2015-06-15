import ceylon.ast.core {
    AssignmentOperation,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JArithmeticAssignmentOp=ArithmeticAssignmentOp,
        JAssignOp=AssignOp,
        JAssignmentOp=AssignmentOp,
        JBitwiseAssignmentOp=BitwiseAssignmentOp,
        JLogicalAssignmentOp=LogicalAssignmentOp
    }
}

"Converts a RedHat AST [[AssignmentOp|JAssignmentOp]] to a `ceylon.ast` [[AssignmentOperation]]."
shared AssignmentOperation assignmentOperationToCeylon(JAssignmentOp assignmentOperation, Anything(JNode,Node) update = noop) {
    assert (is JAssignOp|JArithmeticAssignmentOp|JBitwiseAssignmentOp|JLogicalAssignmentOp assignmentOperation);
    switch (assignmentOperation)
    case (is JAssignOp) { return assignOperationToCeylon(assignmentOperation, update); }
    case (is JArithmeticAssignmentOp) { return arithmeticAssignmentOperationToCeylon(assignmentOperation, update); }
    case (is JBitwiseAssignmentOp) { return setAssignmentOperationToCeylon(assignmentOperation, update); }
    case (is JLogicalAssignmentOp) { return logicalAssignmentOperationToCeylon(assignmentOperation, update); }
}

"Compiles the given [[code]] for an Assignment Operation
 into an [[AssignmentOperation]] using the Ceylon compiler
 (more specifically, the rule for an `assignmentExpression`)."
shared AssignmentOperation? compileAssignmentOperation(String code, Anything(JNode,Node) update = noop) {
    if (is JAssignmentOp jAssignmentExpression = createParser(code).assignmentExpression()) {
        return assignmentOperationToCeylon(jAssignmentExpression, update);
    } else {
        return null;
    }
}
